<?php
/*
*
*/

include ("../include/locution.inc.php");
session_start();

include ("../include/connexion.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/posdav.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");

$szCheminFichier = getRepDav().session_id()."/";
$szUrlFichier = getUrlDav().session_id()."/";
$szUrlProgramme = getUrlDav();

// suivant les serveurs il faut ou non mettre une extension
$szNomProgramme = "posprint";

if (!file_exists($szCheminFichier))
	mkdir($szCheminFichier);

$tabListeFichiers = array();

$retour = connexion($jeton);
if($retour)
{
	$tabNumsDoc = explode(" ", $_REQUEST["SZ_POS_NUMDOC"]);

	for($iNumInfos=0;$iNumInfos<count($tabNumsDoc);$iNumInfos++)
	{
		$iNumDoc=$tabNumsDoc[$iNumInfos];

		switch($choiximp)
	{
			case 'DEL':
				
				$tabStruListePage = array();
				// verification, recuperation du nombre de fichiers attaches
				$retour = pos_getlisteinfopage($jeton, $iNumDoc, 0, /*pref*/$tabStruListePage);
		$iNbPages = count($tabStruListePage);
				
				if ($iNbPages > 0)
			{
					$iNumPageTab = $iNbPages - 1;
				// creation du fichier dans le repertoire d'impression
					$szFileNameExt = "POS".$iNumDoc."_1_0.".$tabStruListePage[0]->szExtension;

				$szFilePath = $szCheminFichier.$szFileNameExt;
					$retour = pos_dmdpagenumdoc($jeton, $iNumDoc, 1, 0, $szFilePath, /*pref*/$objInfoPage);

				if ($retour)
					$tabListeFichiers[] = $szUrlFichier.$szFileNameExt;
				else
					debug($jeton);
			}
			
				break;
                
			case 'DEL_ANN':
	                        
	                        $tabStruListePage = array();
	                        // verification, recuperation du nombre de fichiers attaches
	                	    $retour = pos_getlisteinfopage($jeton, $iNumDoc, 0, /*pref*/$tabStruListePage);
	                	    	$iNbPages = count($tabStruListePage);
	                          
				for($i=1; $i<$iNbPages+1; $i++)
	                			{
	                				// creation du fichier dans le repertoire d'impression
	                				$iNumPageTab = $i - 1;
	                				$szFileNameExt = "POS".$iNumDoc."_".$i."_0.".$tabStruListePage[$iNumPageTab]->szExtension;
	                
	                				$szFilePath = $szCheminFichier.$szFileNameExt;
	                				$retour = pos_dmdpagenumdoc($jeton, $iNumDoc, $i, 0, $szFilePath, /*pref*/$objInfoPage);
	                
	                				if ($retour)
	                					$tabListeFichiers[] = $szUrlFichier.$szFileNameExt;
	                				else
	                					debug($jeton);
			}
			
				break;
		}
	}
	else
		debug($jeton);
	pos_disconnect($jeton);
}
else
	debug($jeton);

if ($retour)
{	
	$file_tpl = REP_TEMPLATE_APPLICATIF."impression/act_imprimer_fichiers.tpl";
	$t = new Template(".");
	$t->set_file("impression", $file_tpl);
	$t->set_block("impression", "BLOC_FICHIERS", "bloc_fichiers");
	
	$szServeurEtPort = "http://".$_SERVER["SERVER_NAME"];
	if (strcmp($_SERVER["SERVER_PORT"], "80") != 0)
		$szServeurEtPort .= ":".$_SERVER["SERVER_PORT"];

	for($i=0; $i<count($tabListeFichiers); $i++)
	{
		$t->set_var("NUM_FICHIER", $i);
		$t->set_var("URL_FICHIER", $tabListeFichiers[$i]);
		$t->parse("bloc_fichiers", "BLOC_FICHIERS", true);
	}
	
	$t->set_var("URL_JAR", URL_APPLET_JAR);
	$t->set_var("URL_PROGRAMME", $szUrlProgramme.$szNomProgramme);
	$t->set_var("POS_URL_SERVEUR", $szServeurEtPort);
	$t->set_var("NB_FICHIERS", count($tabListeFichiers));
	$t->pparse("MyOutput", "impression");
}
else
{
	echo "<SCRIPT>";
	// echo "window.close()";
	echo "</SCRIPT>";
}
?>