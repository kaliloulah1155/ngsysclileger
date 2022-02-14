<?php
/*
 * DESCRIPTION : Récupération des attributs de rubriques dans un type de document
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 21/07/2011
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
$objRetour["ListeRubInTypeAttributs"] = array();
$objRetour["Compteur"] = "";

$szTypeDoc = $_REQUEST['TYPEDOC'];
$szCodeRubCourante = $_REQUEST['CODERUB'];
$retour = connexion($jeton);
if (!$retour)
{
    $objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
else
{	
	$retour = pos_getrubriquetype($jeton, $szTypeDoc, /*pref*/$tabLstRub);
	
	if ($retour)
	{
		$bLie = 0;
		for ($i=0;$i<count($tabLstRub); $i++)
		{
			if (strcmp($szCodeRubCourante, $tabLstRub[$i]->szRubrique)  == 0)	
			{
// 					$objRetour["ListeRubInTypeAttributs"]["szType"] = $iRubTypeCourant;
// 					$objRetour["ListeRubInTypeAttributs"]["szMonocritere"] = $iRubMonoCritere;
				$objRetour["ListeRubInTypeAttributs"]["szRubrique"] = $tabLstRub[$i]->szRubrique;
				$objRetour["ListeRubInTypeAttributs"]["szNomRub"] = $tabLstRub[$i]->szNomRub;			
				$objRetour["ListeRubInTypeAttributs"]["wOblig"] = $tabLstRub[$i]->wOblig;
				$objRetour["ListeRubInTypeAttributs"]["bIndexee"] = $tabLstRub[$i]->bIndexee;
				$objRetour["ListeRubInTypeAttributs"]["bReport"] = $tabLstRub[$i]->bReport;
				$objRetour["ListeRubInTypeAttributs"]["szDefaut"] = $tabLstRub[$i]->szDefaut;
				$objRetour["ListeRubInTypeAttributs"]["bDefaut"] = $tabLstRub[$i]->bDefaut;
				$objRetour["ListeRubInTypeAttributs"]["szMinimum"] = $tabLstRub[$i]->szMinimum;
				$objRetour["ListeRubInTypeAttributs"]["szMaximum"] = $tabLstRub[$i]->szMaximum;
				$objRetour["ListeRubInTypeAttributs"]["bMonoValeur"] = $tabLstRub[$i]->bMonoValeur;
				$objRetour["ListeRubInTypeAttributs"]["bModifiable"] = $tabLstRub[$i]->bModifiable;
				$objRetour["ListeRubInTypeAttributs"]["wReservee"] = $tabLstRub[$i]->wReservee;
				$objRetour["ListeRubInTypeAttributs"]["wNumLigne"] = $tabLstRub[$i]->wNumLigne;
				$objRetour["ListeRubInTypeAttributs"]["wDeplacement"] = $tabLstRub[$i]->wDeplacement;
				$objRetour["ListeRubInTypeAttributs"]["wNbCars"] = $tabLstRub[$i]->wNbCars;
				$objRetour["ListeRubInTypeAttributs"]["wNbLignes"] = $tabLstRub[$i]->wNbLignes;
				$objRetour["ListeRubInTypeAttributs"]["szTypeLie"] = $tabLstRub[$i]->szTypeLie;
				$objRetour["ListeRubInTypeAttributs"]["bMajuscule"] = $tabLstRub[$i]->bMajuscule;
				$objRetour["ListeRubInTypeAttributs"]["bLierDep"] = $tabLstRub[$i]->bLierDep;
				$objRetour["ListeRubInTypeAttributs"]["szCodeListeHier"] = $tabLstRub[$i]->szCodeListeHier;
				$objRetour["ListeRubInTypeAttributs"]["szCodePereHier"] = $tabLstRub[$i]->szCodePereHier;
				$objRetour["ListeRubInTypeAttributs"]["szRubLie"] = $tabLstRub[$i]->szRubLie;
				$objRetour["ListeRubInTypeAttributs"]["bRecupPageAsso"] = $tabLstRub[$i]->bRecupPageAsso;
				$objRetour["ListeRubInTypeAttributs"]["bNoControleListeHier"] = $tabLstRub[$i]->bNoControleListeHier;
				$objRetour["ListeRubInTypeAttributs"]["bFullTexte"] = $tabLstRub[$i]->bFullTexte;					
				
				// Type lié
				if ($tabLstRub[$i]->bLierDep == 1);
				{					
					$bLie = 1;
					$szTypeLie = $tabLstRub[$i]->szTypeLie;
				}
				// liste hiérarchique
				if (strcmp($tabLstRub[$i]->szCodeListeHier, "")  != 0);											
					$szListHier = $tabLstRub[$i]->szCodeListeHier;
			}
		}
		
		// récupération du compteur		
		if ($objRetour["ListeRubInTypeAttributs"]["bDefaut"] == 1)
		{
			if  ( strcmp($objRetour["ListeRubInTypeAttributs"]["szDefaut"], "AUTO") == 0 || ereg("^AUTO_RAZ_ANNEE\([0-9]+\)$", $objRetour["ListeRubInTypeAttributs"]["szDefaut"]))
			{	
				$valeurCpt = "0";
				$retour = pos_gestcompteur($jeton, $szCodeRubCourante, $szTypeDoc, PHP_VULCAIN_GET_INFO_VAL, /*pref*/$valeurCpt);
				if ($retour)
					$objRetour["Compteur"] = $valeurCpt;
                else
				{
					$objRetour["code_retour"] = 0;
					$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
				}	
			}
			else 
				$objRetour["Compteur"] = "";
		}
		else
			$objRetour["Compteur"] = "";
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
