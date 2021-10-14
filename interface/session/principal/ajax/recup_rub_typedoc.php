<?php
/*
 * DESCRIPTION : Récupération des rubrique du type de document
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 11/07/2011
 *
 *
 *------------------------------------------------------------------
 * 
 */

session_start();
require("../ajax/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
include ("../include/get_infoparam.php");

writeHeadersNoCache();

$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["ListeRub"] = array();

define("ALPHA", "0");
define("ENTIER", "1");
define("DATE", "2");
define("TABLEAU", "3");
define("DECIMAL", "4");

$tabTypeSourceCible = array(
	ENTIER => array(ALPHA, ENTIER, DATE, DECIMAL),
	ALPHA => array(ALPHA, ENTIER, DATE, DECIMAL),
	DATE => array(ALPHA, DATE, DECIMAL),
	TABLEAU => array(ENTIER),
	DECIMAL => array(DECIMAL)
);

$szTypeDoc = $_REQUEST['TYPEDOC'];
$iRubTypeCourant = $_REQUEST['TYPERUB'];
$bAvecKH = (isset($_REQUEST['AVECKH']) && $_REQUEST['AVECKH'] == "1") ? 1 : 0;

$retour = connexion($jeton);
if (!$retour)
{
    $objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
else
{
    if(strcmp($szTypeDoc, "000") != 0)
        $retour = pos_gettype($jeton, $szTypeDoc, /*pref*/$tabLstDoc);
    $objType = $tabLstDoc[0];
    
    if ($retour)
	{	
    	if(strcmp($szTypeDoc, "000") == 0)
    		$retour = pos_getrubrique($jeton, "", /*pref*/$tabLstRubTypeDoc);
    	else	
    		$retour = pos_getrubriquetype($jeton,$szTypeDoc, /*pref*/$tabLstRubTypeDoc);
    }
    		
	// Requête de récupération des rubriques du TYPEDOC	
	if ($retour)
	{			
		for($i=0; $i<count($tabLstRubTypeDoc); $i++)
		{
			if(strcmp($szTypeDoc, "000") == 0)
			{
				$iRubTypeDataCible = $tabLstRubTypeDoc[$i]->wTypeRub;
				$szCodeRubCible = $tabLstRubTypeDoc[$i]->szRubrique;				
			}
			else
			{
				$retour = pos_getrubrique($jeton, $tabLstRubTypeDoc[$i]->szRubrique, /*pref*/$tabLstRub);
				if ($retour)
				{							
					$iRubTypeDataCible = $tabLstRub[0]->wTypeRub;
					$szCodeRubCible = $tabLstRub[0]->szRubrique;											
				}
				else
				{
					$objRetour["code_retour"] = 0;
					$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
				}
			}	
			
			for ($j=0; $j<count($tabTypeSourceCible[$iRubTypeCourant]);$j++)
			{
				// pas de test sur les liens
                //if ($iRubTypeDataCible == $tabTypeSourceCible[$iRubTypeCourant][$j])
				{
					array_push($objRetour["ListeRub"], $szCodeRubCible);
					break;
				}
			}					
		}
        if ($bAvecKH == 1 && $objType->wHierarchie > 0)
        {
            array_push($objRetour["ListeRub"], "K H");
        }		
	}
	else
	{
		$objRetour["code_retour"] = 0;
		$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
	}	
}
pos_disconnect($jeton);
sort($objRetour["ListeRub"]);
//error_log(print_r($objRetour, true));
$output = $json->encode($objRetour);
print($output);
?>
