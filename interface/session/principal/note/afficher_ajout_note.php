<?php
/*************************************************************************
* DESCRIPTION : liste des notes d'un fichier

* AUTEUR: Gabrielle Guy
*
* DATE DE CREATION: 07.01.2003
*
* DESCRIPTION : Affichage des notes externes d'un fichier
* 
* DONNEES EN ENTREES
* 
* POS_NUM_DOC : numero de document Poseidon
* POS_NUM_PAGE : numero de fichier
* POS_NUM_SSPAGE : numero du sous-fichier
*************************************************************************/ 
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
session_start();

// on definit le template utilisé  
$t = new template(REP_TEMPLATE_APPLICATIF."note");
$t->set_file("ajoutnote", "ajoutnote.tpl");

$wNumSsPage = isset($_REQUEST["POS_NUM_SSPAGE"]) ? $_REQUEST["POS_NUM_SSPAGE"] : 0;
$t->set_var("URL_AJOUT_NOTE", URL_AJOUTER_NOTE);
$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
$t->set_var("POS_NUM_PAGE", $_REQUEST["POS_NUM_PAGE"]);
$t->set_var("POS_NUM_SSPAGE", $wNumSsPage);
    
// affichage du template
$t->pparse("Output", "ajoutnote");
?>