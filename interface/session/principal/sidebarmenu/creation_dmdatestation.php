<?php
if (!isset($_SESSION))
	session_start();

	include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
	include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");

// on definit le template utilisé  
$t = new template(REP_TEMPLATE_APPLICATIF."sidebarmenu");
$t->set_file("mdp", "creation_ATE_1.tpl");


	
// affichage du template
$t->parse("Output", "mdp");
$t->p("Output");

?>