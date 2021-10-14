<?php
//add by ibson
// connexion
if (!isset($_SESSION))
session_start();
include ("../include/debug.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../include/get_template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
//le type de document n'est pas sélectionné
include ("../../../../configuration_w/mabd.php"); //add by ibson

if (!isset($_REQUEST["POS_TYPEDOC"]))
{
	afficheMsg(CST_LIBELLE_SEARCH_CLE_CHOOSE_DOC);
	exit;
}

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{   
	//declaration du template
	$file_tpl = REP_TEMPLATE_APPLICATIF."recherche/recherchesimple.tpl"; 
	$sTypeDoc = $_REQUEST["POS_TYPEDOC"];
	$t = new Template(".");
	$t->set_File("recherche", $file_tpl);
	//Fin declaration du template
	
	// echo 'je suis la question simple  ' .$_SESSION["sess_user_name"];
	
	
	
	
	
	
	//affichage du template dans la partie web
	$t->pparse("MyOutput", "recherche");
	// Déconnexion poseidon.
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>