<?php
/*************************************************************************
* DESCRIPTION : 
* 
* AUTEUR: GG
* DATE DE CREATION: 28/05/2009
* Données en entrées 
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["contenu_menu"] = "";

include ("../redaction_web/fonction_edition.php");
include ("../toolbar/afficher_toolbar.php");
include ("../include/template.inc.php");
$tToolbar = new template("../../../../configuration");
$szFichierMenu = get_nom_toolbar($_SESSION["sess_application"], $_SESSION["sess_user_name"], 
                    $_SESSION["sess_service"], $_SESSION["sess_fonction"], $_SESSION["sess_profil"]);
$tToolbar->set_file("toolbar", $szFichierMenu);
$tabParam = array();
$objRetour["contenu_menu"] = genererTransformationXsltFromSource(parseXmlToolbar($tToolbar), "../../../../xsl/transform-menu.xsl", $tabParam);

$output = $json->encode($objRetour);
print($output);
?>
