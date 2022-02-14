<?php
/*
 */
if (!defined("PARTAGE_QUESTION"))
{
	define("PARTAGE_QUESTION",1);
    
	class PartageQuestion {

		var $iTypeProprietaire;
		var $szProprietaire;
		var $szNomQuestion; 
        var $cache;
	
		// Constructeur 
		function __construct($szNomQuestion, $iTypeProprietaire,
								 $cache, $szProprietaire) 
		{
			$this->iTypeProprietaire = $iTypeProprietaire;
			$this->szProprietaire = $szProprietaire;
			$this->szNomQuestion = $szNomQuestion;
			$this->cache = $cache;
		}
	}
}
	
?>
