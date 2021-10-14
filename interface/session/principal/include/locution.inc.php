<?php
/*
 * 17.07.2002 GG suppression des constructeurs inutiles - 
 *					ajout d'un constructeur qui gere les parentheses
 * 10.03.2003 GG suppresion d'un des constructeurs devenu inutile.
 * 28.03.2003 GG ajout des methodes copyLocution et copyTabLocution
 */
if (!defined("LOCUTION"))
{
	define("LOCUTION",1);
    
	// Nombre et différents liens d'une locution    
	define ("NB_LIENS", 3);
	define ("LIEN_OU", 1);
	define ("LIEN_ET", 2);
	define ("LIEN_SAUF", 3);

	// Define pour la variable wTypeLoc
	define ("TYPE_LOC_NORMAL", 0);
	define ("TYPE_LOC_CRITSEC", 1);
	define ("TYPE_LOC_AUTO", 2);

	class Locution {

		var $wTypeLien;
	 	var $wCodeThesaurus, $wProfondeur, $szDateThe;
	 	var $wNbParDeb, $wNbParFin, $wLier;
	 	var $szCodeType, $szCodeRub, $cOperateur, $szCodeTypeLie, $szCodeRubLie;
	 	var $szValeur1, $szValeur2;
		var $wTypeLienMulti;
	
		// Constructeur 
		function __construct($wTypeLien, $szCodeType,
								 $szCodeRub, $cOperateur, $szValeur1, $wNbParDeb = 0, $wNbParFin = 0) 
		{
			$this->wTypeLien = $wTypeLien;
			$this->wCodeThesaurus = 0;
			$this->wProfondeur = 0;
			$this->szDateThe = "";
			$this->wNbParDeb = $wNbParDeb;
			$this->wNbParFin = $wNbParFin;
			$this->wLier = 0;
			$this->szCodeType = $szCodeType;
			$this->szCodeRub = $szCodeRub;  
			$this->cOperateur = $cOperateur; 
			$this->szCodeTypeLie = "";
			$this->szCodeRubLie = "";
			$this->szValeur1 = $szValeur1; 
			$this->szValeur2 = ""; 
			$this->wTypeLienMulti = 2;
			$this->wTypeLoc = TYPE_LOC_NORMAL;
		}
	}
	
	function copyLocution($locSrc, &$locDest)
	{
		$locDest = new Locution($locSrc->wTypeLien, $locSrc->szCodeType,
								 $locSrc->szCodeRub, $locSrc->cOperateur, $locSrc->szValeur1, 
								 $locSrc->wNbParDeb, $locSrc->wNbParFin);
		
		$locDest->wCodeThesaurus = $locSrc->wCodeThesaurus;
		$locDest->wProfondeur = $locSrc->wProfondeur;
		$locDest->szDateThe = 	$locSrc->szDateThe;
		$locDest->wLier = $locSrc->wLier;
		$locDest->szCodeTypeLie = $locSrc->szCodeTypeLie;
		$locDest->szCodeRubLie = $locSrc->szCodeRubLie;
		$locDest->szValeur2 = $locSrc->szValeur2; 
		$locDest->wTypeLienMulti = $locSrc->wTypeLienMulti;
		$locDest->wTypeLoc = $locSrc->wTypeLoc;
	}
	
	function copyLocutionBibToLocutionPhp($locSrcBib, &$locDest)
	{
		$locDest = new Locution($locSrcBib->lien, $locSrcBib->code_typ,
								 $locSrcBib->code_rub, $locSrcBib->code_ope, $locSrcBib->valeur1, 
								 $locSrcBib->nbpar_deb, $locSrcBib->nbpar_fin);
			
		$locDest->szValeur2 = $locSrcBib->valeur2;
		$locDest->wCodeThesaurus = $locSrcBib->thes_code;
		$locDest->wProfondeur = $locSrcBib->thes_prof;
		$locDest->szCodeTypeLie = $locSrcBib->code_typlie;
		$locDest->szCodeRubLie = $locSrcBib->code_rublie;
		$locDest->wTypeLienMulti = $locSrcBib->wTypeLienMulti;
	}

	function copyTabLocution($tabLocSrc, &$tabLocDest)
	{
		$iNbLoc = count($tabLocSrc);
		$tabLocDest = array();
		for($i = 0; $i < $iNbLoc; $i++)
		{
			copyLocution($tabLocSrc[$i], /*pref*/$tabLocDest[$i]);
		}
	}
	
	function remplaceVarTabLocutionQuestionBib($tabValVar, $tabLocSrcBib, &$tabLocDest)
	{
		$tabLocDest = array();
		// parcourt des locutions de la question pour rechercher des codes à remplacer
		for($i=0;$i<count($tabLocSrcBib);$i++)
		{
			$tabLocDest[$i] = new Locution($tabLocSrcBib[$i]->lien, $tabLocSrcBib[$i]->code_typ,
								 $tabLocSrcBib[$i]->code_rub, $tabLocSrcBib[$i]->code_ope, $tabLocSrcBib[$i]->valeur1, 
								 $tabLocSrcBib[$i]->nbpar_deb, $tabLocSrcBib[$i]->nbpar_fin);
			
			$tabLocDest[$i]->szValeur2 = $tabLocSrcBib[$i]->valeur2;
			$tabLocDest[$i]->wCodeThesaurus = $tabLocSrcBib[$i]->thes_code;
			$tabLocDest[$i]->wProfondeur = $tabLocSrcBib[$i]->thes_prof;
			$tabLocDest[$i]->szCodeTypeLie = $tabLocSrcBib[$i]->code_typlie;
			$tabLocDest[$i]->szCodeRubLie = $tabLocSrcBib[$i]->code_rublie;
			$tabLocDest[$i]->wTypeLienMulti = $tabLocSrcBib[$i]->wTypeLienMulti;
			
			if (strstr($tabLocSrcBib[$i]->valeur1, "#?"))
				$tabLocDest[$i]->szValeur1 = $tabValVar[$tabLocSrcBib[$i]->valeur1];
			
			if (strstr($tabLocSrcBib[$i]->valeur2, "#?"))
				$tabLocDest[$i]->szValeur2 = $tabValVar[$tabLocSrcBib[$i]->valeur2];
		}
	}

	function equalsLocution($loc1,  $loc2)
	{
		if (
			$loc1->szValeur1==$loc2->szValeur1&&
			$loc1->szValeur2==$loc2->szValeur2&&
			$loc1->cOperateur==$loc2->cOperateur&&
			$loc1->wTypeLien==$loc2->wTypeLien&&
			$loc1->szCodeRub==$loc2->szCodeRub&&
			$loc1->szCodeType==$loc2->szCodeType
			)
			return true;  
		 else
			  return false;
	}

	function equalsTabLocution($tabLoc1, $tabLoc2)
	{
		$bEqual = true;
		if (count ($tabLoc1) == count($tabLoc2))
		{									
			//pour chaque question, on lit chaque locution
			for ($i=0; $i < count($tabLoc1); $i++)
                   	{					
				//on compare les locutions
				if (equalsLocution($tabLoc1[$i], $tabLoc2[$i]) == false )
				{
					$bEqual = false;
					break;
                        	}
			}
		}
        	else
			$bEqual = false;
		
		return $bEqual;
	}
}
	
?>
