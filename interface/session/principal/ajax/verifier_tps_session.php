<?php
/*************************************************************************
* DESCRIPTION : Vérification temps restant session
* AUTEUR: GG
* DATE DE CREATION: 01/04/2014
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
session_write_close();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration_w/constantesPHP.conf.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$tpsInactivite = time() - $_SESSION['decotime']; 
$objRetour["tps_restant"] = TIME_OUT_SESSION - $tpsInactivite;

// trop tard
if ($objRetour["tps_restant"] < 0)
{
    $objRetour["code_retour"] = -1;
}
else if ($objRetour["tps_restant"] <= TIME_REMAINING_ALERT_USER )
{
    $objRetour["msg_erreur"] = sprintf(CST_TEMPS_RESTANT_SESSION, $objRetour["tps_restant"]);
    $objRetour["tps_prochaine_requete"] = (TIME_OUT_SESSION - TIME_REMAINING_ALERT_USER) * 1000;
}
else
{
    $objRetour["tps_prochaine_requete"] = ($objRetour["tps_restant"] - TIME_REMAINING_ALERT_USER) * 1000;
}

$output = $json->encode($objRetour);
print($output);
?>
