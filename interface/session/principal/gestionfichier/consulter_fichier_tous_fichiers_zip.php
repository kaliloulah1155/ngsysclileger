<?php
/*
 * Affichage d'un fichier ZIP contenant tous les fichiers du document
 * POS_NUM_DOC : numero de document Poseidon
 * AVEC_SOUSFICHIERS : 0/1
 * 
 * Modifications
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/fonction_util_zip.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$retour = connexion($jeton);
$tabStruListePage = array();
$szZipFileName = "";
$szDirZipFileName = "";
if ($retour)
{
	$retour = pos_getlisteinfopage($jeton, $_REQUEST["POS_NUM_DOC"], 0, /*pref*/$tabStruListePage);
    if ($retour)
    {	
    	if(count($tabStruListePage) == 0)
    	{
            debug_code(array("Il n'y a pas de fichier lié à cette fiche d'\index."));
            echo "<script>history.back();</script>";
    	}
    	else
    	{
    	   $szZipFileName = sprintf($_SESSION["sess_application"]."_doc_%d.%s", $_REQUEST["POS_NUM_DOC"], "zip");
    	   $szDirZipFileName = sprintf("%s%s", getRepTmpSession(session_id()), $szZipFileName);
    	   if (class_exists("ZipArchive"))
    	   {
    	       	$zip = new ZipArchive;
                if ($zip->open($szDirZipFileName, ZipArchive::CREATE) === TRUE) 
                {
                    $bAjouteFichier = true;
                    $bAjouteSousFichier = (isset($_REQUEST["AVEC_SOUSFICHIERS"]) && strcmp($_REQUEST["AVEC_SOUSFICHIERS"], "1") == 0) ? true : false;
                    $tabNumPage = array();
                    if (isset($_REQUEST["POS_LISTE_NUM_PAGE"]))
                        $tabNumPage = explode (";", $_REQUEST["POS_LISTE_NUM_PAGE"]);
                    ajouteFichiersDocumentToZipFile($jeton, $zip, $_REQUEST["POS_NUM_DOC"], $tabNumPage, $bAjouteFichier, $bAjouteSousFichier);
                    $zip->close();
                    delRepZip(session_id());
                }
                else {
                    echo 'échec, code:' . $res;
                }
           }
           else
           {
              debug_code(array("La librairie php_zip n\'est pas disponible sur cette version de php."));
              echo "<script>history.back();</script>";
           }
        }
    }	
    
	if (!$retour)
		debug($jeton);
			
	pos_disconnect($jeton);
  
	if ($retour)
	{
		//vérification de l'existence du fichier
		if (file_exists($szDirZipFileName))
		{ 	
			$fp = fopen($szDirZipFileName, "rb");
			header("Cache-Control: ");// leave blank to avoid IE errors
			header("Pragma: ");// leave blank to avoid IE errors
			header("Content-Type: application/x-gzip");
			header("Content-Length: ".filesize($szDirZipFileName)."");
			if(true)
			    header("Content-Disposition: attachment; filename=".$szZipFileName.";");
			else
				header("Content-Disposition: inline; filename=".$szZipFileName.";");
			    
			fpassthru($fp);
			flush();
			fclose($fp);
			
	        unlink($szDirZipFileName);
		}
	}
}
else
{
	debug($jeton);
	echec_connexion();
}

?>