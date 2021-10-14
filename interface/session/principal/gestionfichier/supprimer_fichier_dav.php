<?php
/*
 * Suppression d'un fichier du répertoire WebDav
 * POS_NUM_DOC : numero de document Poseidon
 * POS_NUM_PAGE : numero de fichier
 * POS_NUM_SSPAGE : numero du sous-fichier
 * 
 * Modifications
 * 19.12.2003 GG récupération de la racine du répertoire http
 * 			(au lieu de passer en dur l'url)
 * 13.12.2004 GG : passage v 10.0.03.001.001
 * 
 */
//if (isset($_REQUEST["PHPSESSID"]) && strlen($_REQUEST["PHPSESSID"]))
//    session_id($_REQUEST["PHPSESSID"]);
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");

$retour = connexion($jeton);

if ($retour)
{
	$page = isset($_REQUEST["POS_NUM_PAGE"]) ? $_REQUEST["POS_NUM_PAGE"] : 1;
    $souspage = isset($_REQUEST["POS_NUM_SSPAGE"]) ? $_REQUEST["POS_NUM_SSPAGE"] : 0;
	$iNumDoc = $_REQUEST["POS_NUM_DOC"];
	
	$cheminRepdav = getRepDavSession(session_id());

	// recuperation des informations du fichier pour pouvoir reenregistrer
	$retour = pos_getinfopage($jeton, $iNumDoc, $page,  $souspage, /*pref*/$objPage);

	if(!$retour)
		debug ($jeton);
	else
	{
		$fileNameExt = "POS".$iNumDoc."_".$page."_".$souspage.".".$objPage->szExtension;
		$fileName = $cheminRepdav.$fileNameExt;
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
    if (isset($_REQUEST["MODE_SIGNATURE"]) && $_REQUEST["MODE_SIGNATURE"] == "1") {
        storeStateSignFile($iNumDoc, $page, $souspage, 0);
    }
}
else
{
	debug($jeton);
	echec_connexion();
}

$t = new Template(REP_TEMPLATE_APPLICATIF."fichier/");
$t->set_File("ferme", "ferme.tpl");
$t->set_var("URL_SITE", URL_SITE);
$t->parse("MyOutput", "ferme");
$t->p("MyOutput");

?>