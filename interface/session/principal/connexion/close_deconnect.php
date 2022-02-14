<?php
/*
Description: fermeture de la session et destruction des variables de session
Todo: le numéro de session n'est pas réinitialisé lors d'une nouvelle ouverture 
quand on utilise les cookies
si on utilise pas les cookies-> plus de variables de session
*/

session_start();
require("../include/connexion.inc.php");
require("../include/debug.inc.php");
require("../include/pos_dmdmodifdoc.inc.php");
require("../include/fonction_util.inc.php");
require("../include/posdav.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
require("fonction_deconnect.inc.php");

$retour = actionOnDeconnexion();

if (isset($_REQUEST["EXTERNALWIN"]) && strcmp($_REQUEST["EXTERNALWIN"], "1") == 0)
{
	echo "<HTML>";
	echo "<BODY>";
	echo "<SCRIPT language=javascript>";
	echo "close();";
	echo "</SCRIPT>";
	echo "</BODY>";
	echo "</HTML>";
}
else
{
    echo "<SCRIPT language=javascript>";
    echo "document.location.href='".URL_SITE."/index.php';";
    echo "</SCRIPT>";
}
?>