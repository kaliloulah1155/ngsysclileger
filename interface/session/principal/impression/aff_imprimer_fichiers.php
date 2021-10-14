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
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
$urlImprimerFichiers = "../../../../interface/session/principal/impression/act_imprimer_fichiers.php";
$file_tpl = REP_TEMPLATE_APPLICATIF."impression/aff_imprimer_fichiers.tpl";
$t = new Template(".");
$t->set_file("impression", $file_tpl);
$t->set_var("SZ_POS_NUMDOC", trim($_REQUEST["SZ_POS_NUMDOC"]));
$t->set_var("URL_ATTENTE", URL_ATTENTE);
$t->set_var("URL_IMPRIMER_FICHIERS", $urlImprimerFichiers);

$t->pparse("MyOutput", "impression");

?>