<?php
/*************************************************************************
* DESCRIPTION : Pour un fichier dont la signature a ete lance par JavaWebStart
*   Recupere l'etat de la signature (1 : signe, 0: non signe, -1:en cours, -2 : fichier n'est pas en signature)
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/posdav.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = getStateSignFile($_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $_REQUEST["POS_NUM_SSPAGE"]);
$objRetour["msg_erreur"] = "";
$output = $json->encode($objRetour);
print($output);
?>