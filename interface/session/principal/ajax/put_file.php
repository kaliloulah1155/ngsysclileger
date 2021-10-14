<?php
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/posdav.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();

$iNumDoc = $_REQUEST["POS_NUM_DOC"];
$iNumPage = $_REQUEST["POS_NUM_PAGE"];
$iNumSsPage = $_REQUEST["POS_NUM_SSPAGE"];
$file_content = $_REQUEST["file_content"];

$retour = connexion($jeton);
if ($retour)
{
    $fileName = tempnam(getRepTmpSession(session_id()), "POS_");
    file_put_contents ($fileName, base64_decode($file_content));
    $retour = pos_getinfopage($jeton, $iNumDoc, $iNumPage,  $iNumSsPage, /*pref*/$objPage);
	if($retour)
	{
		$retour = pos_remplacepagenumdoc($jeton, $iNumDoc, 
								$iNumPage, 
								$iNumSsPage, 
								$objPage->wIndConf, $objPage->wNivConf, $objPage->szCloison, 
								$objPage->szNature, $objPage->szFondPage,  
								$objPage->szNomFichierOriginal, 
								$fileName);
    }
    unlink($fileName);
    pos_disconnect($jeton);
}
if ($retour)
{
    $objRetour["code_retour"] = 1;
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
$output = $json->encode($objRetour);
print($output);
?>
