<?php
/*
 * DESCRIPTION : Récupération des associations
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 27/07/2011
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
$objRetour["LstRubValAsso"] = array();
$szTypeDocCible = $_REQUEST['TYPEDOC'];
$szCodeRubSource = $_REQUEST['CODERUB'];

$retour = connexion($jeton);
if (!$retour)
{
    $objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
else
{	
	$retour = pos_getassociation($jeton, $szTypeDocCible, $szCodeRubSource, /*pref*/$tabAsso);
 	  
	if ($retour)
	{		
		for($i=0;$i<count($tabAsso);$i++)
		{
			$szRubInit = $tabAsso[$i]->szRubInit;
			$szRubTypeCible = $tabAsso[$i]->szRubTypeCible;
			$tabRubSourceRubCible = array ($szRubInit => $szRubTypeCible);
			array_push($objRetour["LstRubValAsso"], $tabRubSourceRubCible);
		
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
