<?php
/*
 * 17.07.2002 GG suppression des constructeurs inutiles - 
 *					ajout d'un constructeur qui gere les parentheses
 * 10.03.2003 GG suppresion d'un des constructeurs devenu inutile.
 * 28.03.2003 GG ajout des methodes copyLocution et copyTabLocution
 */
if (!defined("PARTAGE_BIB"))
{
	define("PARTAGE_BIB",1);

	class PartageBib {

		var $wTypeProprietaire;
	 	var $szProprietaire;
        var $szNomQuestion;
        var $bCache;
	
		// Constructeur 
		function PartageBib($wTypeProprietaire, $szProprietaire, $szNomQuestion, $bCache) 
		{
			$this->wTypeProprietaire = $wTypeProprietaire;
			$this->szProprietaire = $szProprietaire;
			$this->szNomQuestion = $szNomQuestion;
			$this->bCache = $bCache;
		}
	}
}
	
?>
