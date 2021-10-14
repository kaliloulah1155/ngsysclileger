<?php

define ("SEPARATEUR", "\x02");
define ("DOUBLE_SEPARATEUR","\x02\x02");

/******************************************************************
 * Description : Extraction de la liste des fils d'un descripteur
 * Donnees en entree :
 * $szListeFils -> Liste vocabulaire
/******************************************************************/
function extraireFils($szListeFils, &$tabFils)
{
	$tok = strtok($szListeFils, SEPARATEUR);

	while($tok != null && strlen(trim($tok)))
	{
		$codeFils = $tok;
		$isPere = strtok(SEPARATEUR);

		$tabFils[$codeFils] = $isPere;
		
		$tok = strtok(SEPARATEUR);
	}
	ksort($tabFils);
}

function trierFils($fils)
{
	$tok = strtok($szListeFils, SEPARATEUR);
	$nbFils = 0;
	$fils = array();

	while($tok != null && strlen(trim($tok)))
	{
		$codeFils = $tok;
		$isPere = strtok(SEPARATEUR);
			
      $fils[$nbFils]["code"] = $codeFils;
      $fils[$nbFils]["isPere"] = $isPere;
		
		$nbFils ++;
		$tok = strtok(SEPARATEUR);
	}

	return $fils;
}

function extrairePeres($szListePeres)
{
	$tableau = explode(DOUBLE_SEPARATEUR,$szListePeres);
	for($i = 0; $i < count($tableau)-1; $i++)
	{
		$chemin = explode(SEPARATEUR,$tableau[$i]);
		$tabChemins[$i]=$chemin;	
	}
	
	return $tabChemins;
}

//END FONCTION
//*************************************************************************
//*************************************************************************

?>
