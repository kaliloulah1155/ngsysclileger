<?php

	/**
 	 * DESCRIPTION : Récupères les profils publics et privés
 	 * Concatène les deux dans un tableau
	 *	
	 * AUTEUR : Frédéric Tramarin
	 * DATE de CREATION : 05/02/2003
  	 * 
	 * $jeton : jeton de connexion
	 * $tri   : 1 : trier,  0 : ne pas trier
	 * 23.01.2007 : GG :remise en place chargement des profils via les requetes pos_getlistlrd..
	 * reprise version 10.0.3.004.003 car avec l'ancienne requete pos_configlr les profils automatique ne s'affiche pas
	 * si l'utilisateur n'est pas admin.
	 */

	function getall_profils($jeton, $tri)
	{
	
		// recherche des profils publics
		$retour = pos_getlistlrdpublic($jeton, /*pref*/$tabStruCodeLibLrdPublic);
		
		// recherche des profils prives
		if ($retour)
		{
			$retour = pos_getlistlrdprive($jeton, /*pref*/$tabStruCodeLibLrdPrive);	

		}
		else
		{
			debug($jeton);
		}
			
		if($retour)
		{
			$tabStruCodeLibAllLrd = $tabStruCodeLibLrdPublic ;
			
			$iNbProfilPrive = count($tabStruCodeLibLrdPrive);
			$iNbProfilPublic = count($tabStruCodeLibLrdPublic);	
			
			for($i = 0; $i < $iNbProfilPrive; $i++)
			{
				$tabStruCodeLibAllLrd[$i+$iNbProfilPublic] = $tabStruCodeLibLrdPrive[$i];
			}	
		}
		else
		{
			debug($jeton);		
		}

		if($tri)
		{
			//Tri en utilisant la fonction cmp_profil		
			usort($tabStruCodeLibAllLrd, "cmp_profil");
		}
		
		return $tabStruCodeLibAllLrd;
		
	}
	
	/**
	 * Fonction de comparaison de profil par libellé
	 */
	function cmp_profil($profil1, $profil2)
	{
		//On met en minuscule pour ne pas avoir de problème ....
		$lib1 = strtolower($profil1->szLibelle);
		$lib2 = strtolower($profil2->szLibelle);		

		return  strcmp ($lib1,$lib2);
	}
?>