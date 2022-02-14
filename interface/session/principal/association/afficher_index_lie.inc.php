<?php
/*
 * Fonction sert pour lancer une question qui contient une valeur ($[#XXX])
 * appelée par get_tabLocQuestion.
 *
 * Entrée 
 *  $valeur : valeur de la locution valeur 1 ou 2
 *  $tabcodevalrub : tableau de code/valeur des rubriques de la fiche.
 *
 */
function get_valeurLoc($valeur,$tabcodevalrub)
{
    if (strstr($valeur, "$[#"))
    {
        $pos1=strpos($valeur, "[") + 2;
    	$pos2=strpos($valeur, "]");
    	$coderub = substr($valeur, $pos1, ($pos2 - $pos1));
    	
    	if(isset($tabcodevalrub[$coderub]))
	        $valeurLoc = stripslashes($tabcodevalrub[$coderub]);
	}
	else
	    $valeurLoc = $valeur;
	
	return $valeurLoc;
}

/*
 * Fonction qui prend le tableau de locution d'une question et qui en sortie 
 * donne une tableau de locution avec les valeurs changées.
 *
 * Entrée 
 *  $tabLocBib : tableau de locution d'une question
 *  $tabcodevalrub : tableau de code/valeur des rubriques de la fiche.
 * Sortie
 *  $tabLoc : New tableau de locution modifié
 *
 */
function get_tabLocQuestion($tabLocBib,$tabcodevalrub)
{
    $tabLoc = array();
	for($i=0;$i<count($tabLocBib);$i++)
	{
        copyLocutionBibToLocutionPhp($tabLocBib[$i], /*pref*/$tabLoc[$i]);
        $tabLoc[$i]->szValeur1 = get_valeurLoc($tabLocBib[$i]->valeur1,$tabcodevalrub);
        $tabLoc[$i]->szValeur2 = get_valeurLoc($tabLocBib[$i]->valeur2,$tabcodevalrub);
	}
	
	return $tabLoc;
}

/*
 * Fonction qui retourne un tableau de locution en fonction de la valeur d'une rubrique
 * Sert pour les rubriques multi-critères, elle découpe la valeur sur le retour chariot
 * et fait une locution par valeur.
 * 
 * Entrée 
 *  $sValeurRub : valeur de la rubrique
 *  $szCodeRub : code de la rubrique 
 *  $szCodeType : code du type de doc
 * Sortie
 *  $tabLoc : tableau de locution
 *
 */
function get_tabLocWithValeur($sValeurRub, $szCodeRub,$szCodeType)
{
    $szValeurRubTrim = trim(stripslashes($sValeurRub));
	$listeValeurLoc = explode("\n", $szValeurRubTrim);
	
	$tabLoc = array();
	for($k=0;$k<count($listeValeurLoc);$k++)
	{
		$tabLoc[$k]=new Locution (1, $szCodeType, $szCodeRub, "=", trim($listeValeurLoc[$k]));
	}
	
	return $tabLoc;
}

?>