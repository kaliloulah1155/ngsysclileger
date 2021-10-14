<?php
/*
 * DESCRIPTION : Récupération des rubriques mères des listes hiérarchiques
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 13/07/2011
 *
 *
 *------------------------------------------------------------------
 */

session_start();
require("../ajax/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");

writeHeadersNoCache();

$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["ListeRub"] = array();

$szTypeDoc = $_REQUEST['TYPEDOC'];
$szListHier = $_REQUEST['LISTHIER'];
$retour = connexion($jeton);
if (!$retour)
{
    $objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
else
{	
	$retour = pos_getrubriquetype($jeton,$szTypeDoc, /*pref*/$tabLstRub);
			
	if ($retour)
	{		
		array_unshift($objRetour["ListeRub"], "");			
		for($i=0; $i <count($tabLstRub); $i++)
		{
			if(strcmp($tabLstRub[$i]->szCodeListeHier, $szListHier) == 0)
                array_push($objRetour["ListeRub"], $tabLstRub[$i]->szRubrique);		
		}		
	}
	else
	{
		$objRetour["code_retour"] = 0;
		$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
	}		
}
pos_disconnect($jeton);
//error_log(print_r($objRetour, true));
$output = $json->encode($objRetour);
print($output);
?>
