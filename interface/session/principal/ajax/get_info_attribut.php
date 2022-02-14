<?php
/*************************************************************************
* DESCRIPTION : Lister les actions Hermès disponible pour 1 document
* Application du filtre "commence par X"
* 
* AUTEUR: GG
* DATE DE CREATION: 28/05/2009
* Données en entrées 
*  $_REQUEST["POS_NUM_DOC"] : le numéro de document
* ----------------------------------------------------------------------------
* MODIFICATIONS :
*************************************************************************/
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["numdoc_att"] = 0;
$objRetour["droit_att"] = 0;

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
    $retour = pos_gestattribut($jeton, $_REQUEST["POS_NUMDOS"], $_REQUEST["POS_NUM_DOC"], /*pref*/$dwNumDocAtt, /*pref*/$dwDroitModif);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}

if ($retour)
{
	$objRetour["numdoc_att"] = $dwNumDocAtt;
    $objRetour["droit_att"] = $dwDroitModif;
	
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
