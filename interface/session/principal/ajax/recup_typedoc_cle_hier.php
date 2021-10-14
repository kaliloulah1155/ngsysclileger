<?php
/*
 * DESCRIPTION : Récupération des informations
 * liées à la clé hiérarchique du type de document
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 05/09/2011
 *
 *
 *------------------------------------------------------------------
 * 
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
$objRetour["CleHier"] = array();

$szTypeDoc = $_REQUEST['TYPEDOC'];
$retour = connexion($jeton);
if (!$retour)
{
    $objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
else
{	
		$retour = pos_gettype($jeton, $szTypeDoc, /*pref*/$tabLstDoc);
		
		if($retour)
		{				
			array_push($objRetour["CleHier"], $tabLstDoc[0]->wHierarchie);
			if ($tabLstDoc[0]->wHierarchie != 0)
			{	
				array_push($objRetour["CleHier"], $tabLstDoc[0]->wHierNbZone);
				array_push($objRetour["CleHier"], $tabLstDoc[0]->stKeyHier);
			}
		}
		else
		{
			$objRetour["code_retour"] = 0;
			$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
		}		
}
pos_disconnect($jeton);

$output = $json->encode($objRetour);
print($output);
?>
