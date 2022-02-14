<?php
/*
 * Suppression d'un modèle du répertoire WebDav
 * PL : 22/12/2008 
 */
session_start();
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../include/posdav.inc.php");
include ("../include/debug.inc.php");

$cheminRepdav = getRepDavSession(session_id());
$fileNameExt = $_REQUEST["POS_NOMFICHIER"];
$fileName = $cheminRepdav.$fileNameExt;
//suppression du fichier
if (!unlink($fileName))
{
    $tabMsgError = error_get_last();
    $tabError = array();
    $tabError[] = $tabMsgError["message"];
    debug_code($tabError);
}
$iTypeLancementAppl = getTypeLancementAppl();
if ($iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_SIMPLE || 
                            $iTypeLancementAppl == TYPE_LANCEMENT_APPL_JWS_JS)
{
    $jnlpFile = "jnlp_modele.jnlp";
    unlink($cheminRepdav.$jnlpFile);
}
    
$t = new template(REP_TEMPLATE_APPLICATIF."fichier");
$t->set_File("ferme", "ferme.tpl");
$t->set_var("URL_SITE", URL_SITE);
$t->parse("MyOutput", "ferme");
$t->p("MyOutput");
?>
