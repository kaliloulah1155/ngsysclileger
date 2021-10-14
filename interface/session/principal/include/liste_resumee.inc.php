<?php

if (!defined("LISTE_RESUMEE"))
{
	define("LISTE_RESUMEE",1);

	// Les types de tri sur une LR 
	define("AUCUN", 0);
	define("CROISSANT", 1);
	define("DECROISSANT", 2);
	
	// ---------------------------------------------------------------
	// marc, gaby 
	// Description : Extraction des champs de la liste resumee 
	// Donnees en entree :
	// $lr -> Liste resumee
	// $separateur -> separateur
	// return : champs extrait de la liste resumee
	// ---------------------------------------------------------------
	function extraireChampsLR($lr, $separateur){
	
		$offset=0;
		$champs=array();
		while($offset<strlen($lr))
		{
			$pos = strpos($lr, $separateur, $offset);
			if ($pos === false) 
			{
				if (strlen($lr) - $offset > 0)
					$champs[] = substr($lr,$offset);
				break;
			}
			else
			{
				$champs[] = substr($lr,$offset,$pos-$offset);
				$offset=$pos+1;
			}
		}
		return $champs;
	}
	
	function afficheEnteteTableau($jeton, $profilLR, $nomBlocMajus, &$t)
    {
		$retour = pos_gestplr($jeton, $profilLR, /*pref*/$objLR, /*pref*/$tabZoneLR);
    	// on boucle sur toutes les zones de la liste resume
		// pour afficher les entetes des colonnes du tableau.
        if ($retour)
        {
            for ($i=0;$i<count($tabZoneLR);$i++) 
    		{
    			$t->set_var("TITRE_COLONNE", $tabZoneLR[$i]->zone_titre_col);
    			$t->parse(strtolower($nomBlocMajus), $nomBlocMajus, true);
    		}
        }	
		return $retour;
	}
    
    function verifierExistenceColonne($tableau, $zone_type, $libelles){
		
        for ($i=0; $i<count($tableau); $i++){
			$champs = $tableau[$i];
			if($champs->zone_type === $zone_type && 
                (strrpos ($libelles, $champs->zone_titre_col.";")  !== false || substr_compare($libelles, $champs->zone_titre_col, -strlen($champs->zone_titre_col)) === 0))
				return $i;
		}
		return -1;
	}
	//END FONCTION
	// ---------------------------------------------------------------
	// ---------------------------------------------------------------
}
	
?>
