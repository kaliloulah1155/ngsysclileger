<?php
if (!defined("QUESTION_INC"))
{
    define("QUESTION_INC",1);
    
	include ("../../../../configuration_w/constantesPHP.conf.php");
	include ("../include/libelle_operateur.inc.php");
	include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
	
	/*
	 * DESCRIPTION : librairie permettant les affichages des questions
	 *
	 *  AUTEUR : Fleury
	 *  DATE de CREATION : 30/06/2001
	 *
	 * Donnees en entree : 
	 *  
	 * Ajout :
	 * 16.11.01 Marc :  affiche_locutions() 
	 * 03.12.2001 Gaby : Mise en commun des fonctions utilisées par l'historique
	 * et par l'affichage des questions. Prise en compte du code "N D" pour le numéro de document
	 * 
	 */ 
	
	function affiche_locutions($jeton,  $afficheType, $iNumeroQuestion, $tabLstTypes)
	{
		// declaration de la chaine retournee
		$locutions = "";
		//for ($b=0; $b<count ($_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion]); $b++)
		for ($b=0; $b<count ($_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion]) && $b<3; $b++)
		{
			if ($b)
				$loc = affiche_une_locution($jeton, 1, $afficheType, $iNumeroQuestion, $b, $tabLstTypes);
			else
				$loc = affiche_une_locution($jeton, 0, $afficheType, $iNumeroQuestion, $b, $tabLstTypes);
			
			$locutions = $locutions.$loc;
	
			if ($b != 2 && $b != (count ($_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion])-1))
			    //$locutions = $locutions."<br>";
			    $locutions = $locutions." ";
			else if($b == 2 && (count ($_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion])-1)>2)
			    $locutions .= " ..."; 
	
	   	}
		return $locutions;
	}
	
	/*
	 * Recupère les locutions composant une question de l'historique dont le numéro est passé en paramètre
	 * et le code du type de document
	 */
	function affiche_une_locution($jeton, $afficheLien, $afficheType, $iNumeroQuestion, $iNumLocution, $tabLstTypes)
	{
		// declaration d'un tableau associatif
		$locution = "";
		if ($afficheLien)
		{
			//on n'affiche le lien, sauf pour la premiere locution
			if ($_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion][$iNumLocution]->wTypeLien == 1)
			     $locution .= CST_LIBELLE_LIEN_OU." ";
			else if ($_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion][$iNumLocution]->wTypeLien == 2)
                 $locution .= CST_LIBELLE_LIEN_ET." ";
		}
	
		// on recupere le code de la rubrique et la liste des types de doc
		$code = $_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion][$iNumLocution]->szCodeRub;
	
	    // on recupere le type de doc
		if ($afficheType)
		{
       		$szCodeType = $_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion][$iNumLocution]->szCodeType;
       		if(strcmp($szCodeType,"000") == 0)
       			$locution = CST_LIBELLE_TOUS_TYPES."&nbsp;|&nbsp;";
       		else
	       		$locution = $locution.$tabLstTypes[$szCodeType]."&nbsp;|&nbsp;";  
		}
	
	    // si le code rubrique est un champs special
	    $szLibelleRub = getLibelleChampsSpeciaux($code);
		if (strlen($szLibelleRub) == 0)
		{	
			$iRetour = pos_getrubrique($jeton, $code, /*pref*/$tabObjInfoRub);
			if ($iRetour)
				$szLibelleRub = $tabObjInfoRub[0]->szNomRub;
		}
		$locution = $locution.$szLibelleRub."&nbsp;";
		
		$locution = $locution.$_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion][$iNumLocution]->cOperateur."&nbsp;";
        include ("../include/form_values.inc.php");
		$locution = $locution.htmlentities_currentcharset(str_replace(array("\n", "\r"), array(" ", ""), $_SESSION["sess_tabHistQuest"][0][$iNumeroQuestion][$iNumLocution]->szValeur1), null);
			
		return $locution;
	}
}
?>
