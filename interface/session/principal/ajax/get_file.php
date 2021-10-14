<?php
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/posdav.inc.php");
writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["file"] = array();

$iNumDoc = $_REQUEST["POS_NUM_DOC"];
$iNumPage = $_REQUEST["POS_NUM_PAGE"];
$iNumSsPage = $_REQUEST["POS_NUM_SSPAGE"];
$retour = connexion($jeton);
if ($retour)
{
    $file = tempnam(getRepTmpSession(session_id()), "POS_");
	$retour = pos_dmdpagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, $file, /*pref*/$objInfoPage);
	if ($retour)
    {
        $fileNameExt = "POS".$iNumDoc."_".$iNumPage."_".$iNumSsPage.".".$objInfoPage->szExtension;
        $objRetour["file"]["name"] = $fileNameExt;
    	$objRetour["file"]["content"] = base64_encode(file_get_contents($file));
    }
    else
    {
    	$objRetour["code_retour"] = 0;
    	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
    }
    pos_disconnect($jeton);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
$output = $json->encode($objRetour);
print($output);
?>
