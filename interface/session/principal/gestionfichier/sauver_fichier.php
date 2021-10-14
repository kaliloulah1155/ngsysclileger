<?php
/*
 * Sauvegarde d'un fichier de l'application
 * POS_NUM_DOC : numero de document Poseidon
 * POS_NUM_PAGE : numero de fichier
 * POS_NUM_SSPAGE : numero du sous-fichier
 * 
 * Modifications : 
 * 13.12.2004 GG : passage v 10.0.03.001.001
 * 
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");

$retour = connexion($jeton);

$page = isset($_REQUEST["POS_NUM_PAGE"]) ? $_REQUEST["POS_NUM_PAGE"] : 1;
$souspage = isset($_REQUEST["POS_NUM_SSPAGE"]) ? $_REQUEST["POS_NUM_SSPAGE"] : 0;
$iNumDoc = $_REQUEST["POS_NUM_DOC"];
$cheminRepdav = getRepDavSession(session_id());

if ($retour)
{
	// recuperation des informations du fichier pour pouvoir reenregistrer
	$retour = pos_getinfopage($jeton, $iNumDoc, $page,  $souspage, /*pref*/$objPage);

	if(!$retour)
		debug ($jeton);
	else
	{
		$fileNameExt = "POS".$iNumDoc."_".$page."_".$souspage.".".$objPage->szExtension;
		$fileName = $cheminRepdav.$fileNameExt;

		$retour = pos_remplacepagenumdoc($jeton, $iNumDoc, 
								$page, 
								$souspage, 
								$objPage->wIndConf, 
								$objPage->wNivConf, 
								$objPage->szCloison, 
								$objPage->szNature, 
								$objPage->szFondPage,  
								$objPage->szNomFichierOriginal, 
								$fileName);
		
		if(!$retour)
			debug ($jeton);
	}
                        	                           
	pos_disconnect($jeton);

	//suppression du fichier
	unlink($fileName);
    $iTypeLancementAppl = getTypeLancementAppl();
    if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
                                $iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS)
    {
        $jnlpFile = getFileNameJnlp($iNumDoc, $page, $souspage);
        unlink($cheminRepdav.$jnlpFile);
    }
    
	$t = new Template(REP_TEMPLATE_APPLICATIF."fichier/");
	$t->set_File("ferme", "ferme.tpl");
	$t->set_var("URL_SITE", URL_SITE);
	$t->parse("MyOutput", "ferme");
	$t->p("MyOutput");
}
else
{
	$szFileName = $_REQUEST["POS_NOMFICHIER"];
	if (strlen($szFileName) > 0)
	{
		$today = getdate();
		$szDateAffichee = sprintf("%d%02d%02d_%02d%02d", $today["year"],$today["mon"],$today["mday"], $today["hours"], $today["minutes"]);
		
		$szNewName = "sauv_".$szDateAffichee."_".$_SESSION["sess_user_name"]."_".$szFileName;
		$szNomCompletFichier = $cheminRepdav.$szFileName;
		$szNomCompletNvFichier = getRepDavSauvegarde().$szNewName;
		copy($szNomCompletFichier, $szNomCompletNvFichier);
		
		$szMessage = "<div class=labelPS>Votre session a expiré : votre fichier ne peut pas être sauvegardé dans la base.<BR>";
		$szMessage .= "Une copie du fichier avec vos modifications est conservé sour le nom <b>$szNewName</b> <BR>";
		$szMessage .= "Veuillez contacter votre administrateur pour que la mise à jour soit effectuée.<BR></div>";
		afficheMsg($szMessage);
	}
	else
	{
		debug($jeton);
		echec_connexion();
		
		$t = new Template(REP_TEMPLATE_APPLICATIF."fichier/");
		$t->set_File("ferme", "ferme.tpl");
		$t->set_var("URL_SITE", URL_SITE);
		$t->parse("MyOutput", "ferme");
		$t->p("MyOutput");
	}
}

?>