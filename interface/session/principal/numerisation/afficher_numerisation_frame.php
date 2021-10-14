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

$t = new template(".");
$t->set_file("numerisation", REP_TEMPLATE_APPLICATIF."general/frame_modale.tpl");
$t->set_var("TITLE", "Numériser");
$t->set_var("FRAME_NAME", "afficher_numerisation");
$t->set_var("FRAME_URL", URL_SITE."/interface/session/principal/numerisation/afficher_numerisation.php?".$_SERVER["QUERY_STRING"]);
$t->parse("Output", "numerisation");
$t->p("Output");
?>
