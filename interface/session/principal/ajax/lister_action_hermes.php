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
$objRetour["liste_action"] = array();

$iNumDoc = $_REQUEST["POS_NUM_DOC"];

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
    $tabActionHermes = array();
    $retour = pos_hermes_rempliraction($jeton, $iNumDoc, /*pref*/$tabActionHermes);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}

if ($retour)
{
	$tabActionHermesAff = array();
	for ($i=0;$i<count($tabActionHermes); $i++)
	{
		if ($tabActionHermes[$i]->action_code[0] != 'X')
			$tabActionHermesAff[] = $tabActionHermes[$i];
	}
	asort($tabActionHermesAff);
	
	pos_disconnect($jeton);
}
else
{
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}

if ($retour)
{
	$tabListeAction = array();
	for ($i=0; $i<count($tabActionHermesAff); $i++)
	{
	   $tabListeAction[$i]['code'] = $tabActionHermesAff[$i]->action_code;
	   $tabListeAction[$i]['libelle'] = $tabActionHermesAff[$i]->action_libelle;
	}
	$objRetour["liste_action"] = $tabListeAction;
}
$output = $json->encode($objRetour);
print($output);
?>
