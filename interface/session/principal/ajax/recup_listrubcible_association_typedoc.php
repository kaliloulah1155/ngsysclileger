<?php
/*
 * DESCRIPTION : Récupération de la liste des rubriques
 * disponibles pour l'association 
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 18/07/2011
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
$objRetour["LstRubCblAsso"] = array();

define("ALPHA", "0");
define("ENTIER", "1");
define("DATE", "2");
define("TABLEAU", "3");
define("DECIMAL", "4");

$tabTypeAssociation = array(
	ENTIER => array(ENTIER),
	ALPHA => array(ALPHA, ENTIER, DATE, DECIMAL),
	DATE => array(DATE),
	//TABLEAU => array(ENTIER),
	DECIMAL => array(DECIMAL)

);

$szTypeDocCible = $_REQUEST['TYPEDOC'];
$iRubTypeCourant = $_REQUEST['TYPERUB'];

$retour = connexion($jeton);
if (!$retour)
{
    $objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
else
{			
	if(strcmp($szTypeDocCible, "000") == 0)
		$retour = pos_getrubrique($jeton, "", /*pref*/$tabLstRubTypeDocCible);
	else			
		$retour = pos_getrubriquetype($jeton, $szTypeDocCible, /*pref*/$tabLstRubTypeDocCible);
	
	// Requête de récupération des rubriques du type cible	
	if ($retour)
	{			
		for($i=0; $i<count($tabLstRubTypeDocCible); $i++)
		{
			if(strcmp($szTypeDocCible, "000") == 0)
			{
					$iRubTypeDataCible = $tabLstRubTypeDocCible[$i]->wTypeRub;
					$szCodeRubCible = $tabLstRubTypeDocCible[$i]->szRubrique;
					$szLibelleRubCible = $tabLstRubTypeDocCible[$i]->szNomRub;				
			}
			else
			{
				$retour = pos_getrubrique($jeton, $tabLstRubTypeDocCible[$i]->szRubrique, /*pref*/$tabRubCible);
				if ($retour)
				{							
					$iRubTypeDataCible = $tabRubCible[0]->wTypeRub;
					$szCodeRubCible = $tabRubCible[0]->szRubrique;
					$szLibelleRubCible = $tabRubCible[0]->szNomRub;											
				}
				else
				{
					$objRetour["code_retour"] = 0;
					$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
				}
			}	
			$tabCodeLibelleRubCible = array ($szCodeRubCible => $szLibelleRubCible);
			
			for ($j=0; $j<count($tabTypeAssociation[$iRubTypeCourant]);$j++)
			{
					if ($iRubTypeDataCible == $tabTypeAssociation[$iRubTypeCourant][$j])
					{
						array_push($objRetour["LstRubCblAsso"], $tabCodeLibelleRubCible);
						break;
					}
			}					
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
