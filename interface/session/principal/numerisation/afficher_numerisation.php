<?php
/*************************************************************************
* DESCRIPTION : Affiche l'écran de numérisation
* AUTEUR: Gabrielle Guy 
* DATE DE CREATION: 23/04/2008
*************************************************************************/ 
session_start();
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../include/posdav.inc.php");
include ("../include/debug.inc.php");

$iTypeLancementAppl = getTypeLancementAppl();
if(!(defined('CST_NATURE_FICHIER_JPG') && defined('CST_NATURE_FICHIER_TIFF')))
{
    $sMsg = "Numérisation impossible : les natures JPG et TIFF doivent être configurées dans votre client Web.<br> Veuillez contacter votre administrateur GED.";
	if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_APPLET)
        afficheMsg($sMsg);
    else
        debug_code(array($sMsg));
	exit;
}

if(!defined('CST_NATURE_FICHIER_PDF') && defined('NUMERISATION_PDF_CONVERSION') && 
    NUMERISATION_PDF_CONVERSION == 1)
{
    $sMsg = "Numérisation avec conversion PDF impossible : la nature PDF doit être configurée dans le client Web.<br> Veuillez contacter votre administrateur GED.";
	if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_APPLET)
        afficheMsg($sMsg);
    else
        debug_code(array($sMsg));
	exit;
}
 
$t = new template(".");
// lancement en applet
if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_APPLET) {
    $t->set_file("numerisation", REP_TEMPLATE_APPLICATIF."numerisation/postwain.tpl");
    $t->set_var("URL_JAR", URL_SITE."/interface/tpl/applicatif/numerisation/");
}
else {
    // lancement en java web start ou 2ème étape du lancement JWS
    if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
        ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS && isset($_REQUEST["OPEN_JNLP"]) && $_REQUEST["OPEN_JNLP"] == "1")) {

        header("Content-Type: application/x-java-jnlp-file");
        $t->set_file("numerisation", REP_TEMPLATE_APPLICATIF."numerisation/jnlp_num.tpl");
    }
    else {
        $t->set_File("numerisation", REP_TEMPLATE_APPLICATIF."numerisation/numerisation_js_jws.tpl");
    }
    if (strcmp($_SERVER["SERVER_PORT"], "80") == 0) 
        $szServeurEtPort = $_SERVER["SERVER_NAME"];
    else
        $szServeurEtPort = $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"];
        
    $sProtocol = (isset($_SERVER['HTTPS']) && strcmp($_SERVER['HTTPS'],'on') == 0) ? 'https://' : 'http://';
    $t->set_var("URL_SERVEUR_ET_PORT", $sProtocol.$szServeurEtPort);
}

$t->set_var("LIBELLE_TITRE_PAGE", CST_LIBELLE_FENETRE_FICHIER_APPLET);
$t->set_var("FRAME_NAME", "afficher_numerisation");
$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
$t->set_var("POS_NUM_PAGE", $_REQUEST["POS_NUM_PAGE"]);
$t->set_var("POS_NUM_SSPAGE", $_REQUEST["POS_NUM_SSPAGE"]);
$t->set_var("LANG", $_SESSION["sess_langue"]);
$t->set_var("PHPSESSID", session_id());
$t->set_var("COOKIE_SESS_NAME", "PHPSESSID");
$t->set_var("PATH_URL_DOWNLOAD_DLL_NUM_JAR", URL_SITE."/interface/tpl/applicatif/numerisation/jpostwain.zip");
$t->set_var("PATH_URLSAUVER", URL_SITE."/interface/session/principal/numerisation/attacher_fichier_numerise.php");

if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_APPLET) {

    $t->parse("Output", "numerisation");
}
else {
    // creation d'un fichier à la volée dans le repertoire "posdav" car
    // pour éviter les alertes de sécurité, le jar doit contenir le jnlp ou un template du jnlp
    // ou le jnlp doit contenir son url d'origine et il sera alors rechargé  	
    $jnlpFile = "jnlp_num_".$_REQUEST["POS_NUM_DOC"].".jnlp";
    $jnlpFilePath = getRepDavSession(session_id()).$jnlpFile;
    $t->set_var("LOCAL_HTTP_PORT", LOCAL_HTTP_PORT);
    $t->set_var("TYPE_LANCEMENT_APPL", $iTypeLancementAppl);
    $t->set_var("URL_DAV_SESSION", getUrlDavSession(session_id()));
    $t->set_var("JNLP_FILE_NAME", $jnlpFile);
    $t->parse("Output", "numerisation");
    if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
        ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS && isset($_REQUEST["OPEN_JNLP"]) && $_REQUEST["OPEN_JNLP"] == "1")) {
        $t->write("Output", $jnlpFilePath);
    }
}
$t->p("Output");

?>