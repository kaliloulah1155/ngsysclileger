<?php
/*
 * Affichage d'un fichier de l'application
 * POS_NUM_DOC : numero de document Poseidon
 * POS_NUM_PAGE : numero de fichier
 * POS_NUM_SSPAGE : numero du sous-fichier
 * 
 * Modifications
 * 20.03.2003 GG deconnexion avant l'envoi du fichier
 * 19.12.2003 GG ajout envoi de la taille avant d'envoyer le fichier
 * 29.01.2004 GG utilisation des fichiers pow (en commentaire)
 * 13.12.2004 GG : passage v 10.0.03.001.001
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");

if(!isset($_REQUEST["POS_NUM_PAGE"]) || strlen($_REQUEST["POS_NUM_PAGE"]) == 0 || 
    strcmp($_REQUEST["POS_NUM_PAGE"], "0") == 0)
{
    exit;
}

if(!isset($_REQUEST["POS_NUM_SSPAGE"]))
{
    $_REQUEST["POS_NUM_SSPAGE"] = 0;
}

$retour = connexion($jeton);
if ($retour)
{
	$fileName = tempnam(getRepTmp(), "POS_");
	$retour = pos_dmdpagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"], $fileName, /*pref*/$objInfoPage);
	pos_disconnect($jeton);

	if ($retour)
	{
	    $fileNameImagette = $fileName;
	    
		//$fileNameImagette = tempnam(getRepTmp(), "POS_");
		//resize($fileName, $fileNameImagette);
		$szNaturePage = $objInfoPage->szExtension;
	}
	if (!$retour || strcmp($szNaturePage, "JPG") != 0)
	{
		$ficInfo = (isset($_SERVER["PATH_TRANSLATED"])) ? $_SERVER["PATH_TRANSLATED"] : $_SERVER["ORIG_PATH_TRANSLATED"];
        $ficCode = preg_split("/".NOM_APPLICATION."/i", $ficInfo);
        $fileNameImagette = "../../../../images/icons/imagette.gif";
	}
	
	// on l'ouvre en lecture
	$fp = fopen($fileNameImagette, "rb");
	//définition du type MIME du fichier
	header("Cache-Control: ");// leave blank to avoid IE errors
	header("Pragma: ");// leave blank to avoid IE errors
	header("Content-Type: image/jpeg");
	header("Content-Length: ".filesize($fileNameImagette)."");
	if ($retour)
	   header("Content-Disposition: inline; filename=".$objInfoPage->szNomFichierOriginal.";");
	else
	   header("Content-Disposition: inline; filename=imagette.gif;");
			    
	//affichage du fichier, on passe l'ID du fichier
	fpassthru($fp);
	flush();

	// fermeture du fichier
	fclose($fp);

	unlink($fileName);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
