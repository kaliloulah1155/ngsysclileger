<?php
if (!isset($_SESSION))
	session_start();

	include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
	include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");

// on definit le template utilisé  
$t = new template(REP_TEMPLATE_APPLICATIF."parametrage");
$t->set_file("mdp", "changer_mdp.tpl");

$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_CHANGER_PWD);
$t->set_var("CST_LIBELLE_OLD_PWD", CST_LIBELLE_OLD_PWD);
$t->set_var("CST_LIBELLE_NEW_PWD", CST_LIBELLE_NEW_PWD);
$t->set_var("CST_LIBELLE_CONFIRM_NEW_PWD", CST_LIBELLE_CONFIRM_NEW_PWD);
$t->set_var("ACTION", URL_SITE."/interface/session/principal/parametrage/changer_pwd.php");
$t->set_var("VALIDER", CST_LIBELLE_VALIDER_PWD);
$t->set_var("ANNULER", CST_LIBELLE_ANNULER_PWD);
$t->set_var("SESS_CRYPTKEY", $_SESSION["sess_crypt_key"]);
	
// affichage du template
$t->parse("Output", "mdp");
$t->p("Output");

?>