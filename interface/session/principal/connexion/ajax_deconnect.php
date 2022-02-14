<?php
/*
Description: fermeture de la session et destruction des variables de session
Todo: le numéro de session n'est pas réinitialisé lors d'une nouvelle ouverture 
quand on utilise les cookies
si on utilise pas les cookies-> plus de variables de session
*/

session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
require("../include/pos_dmdmodifdoc.inc.php");
require("../include/fonction_util.inc.php");
require("../include/posdav.inc.php");
require("fonction_deconnect.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$retour = actionOnDeconnexion();
if (!$retour)
{
	$objRetour["code_retour"] = 0;
}

$output = $json->encode($objRetour);
print($output);    
?>