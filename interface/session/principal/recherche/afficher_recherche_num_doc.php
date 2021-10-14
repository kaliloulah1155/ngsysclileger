<?php

if(empty($_SESSION))
session_start();

include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$file_tpl = REP_TEMPLATE_APPLICATIF."recherche/rech_num_doc.tpl";

$t = new Template(".");
$t->set_File("recherche", $file_tpl);

$t->set_var("URL_ACTION_FORM", URL_RESULTAT);
$t->set_var("URL_ATTENTE", URL_ATTENTE_RECHERCHE);

$t->set_var("LIBELLE_RECHERCHER", CST_LIBELLE_RECHERCHER);
$t->set_var("LIBELLE_EFFACER", CST_LIBELLE_EFFA);
$t->set_var("LIBELLE_NUM_DOC", CST_LIBELLE_NUM_DOC);
$t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_RECH_NUM);
$t->set_var("LANGUE", $_SESSION["sess_langue"]);
$t->set_var("POS_NUM_DOC", isset($_REQUEST["POS_NUM_DOC"]) ? $_REQUEST["POS_NUM_DOC"] : "");
$t->pparse("MyOutput", "recherche");

?>