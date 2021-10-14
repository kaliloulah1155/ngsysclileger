<?php
/*
 * Affichage de la liste des profils de liste resumee
 * 
 */

$t->set_block("lr", "BLOC_CHOIX_PROFIL", "bloc_choix_profil");
if(isset($iNombreReponse) && $iNombreReponse > 0)
{
    $isProfil = false;
    if (strcmp(CST_AFFICHER_CHOIX_PROFIL,"1") == 0)
    {
    	//Récupération des profils publics et privés
    	$tabStruCodeLibAllLrd = getall_profils($jeton, 1);
    
    	if ($retour)
    	{	
    		for($i=0;$i<count($tabStruCodeLibAllLrd);$i++)
    		{
    			if(strcmp($tabStruCodeLibAllLrd[$i]->szCode,$szCodeTypeDocLR) == 0 || 
    				strcmp($tabStruCodeLibAllLrd[$i]->szCode, "000") == 0)
    			{
    				$isProfil = true;
    				$t->set_var("SELECTED", (strcmp($tabStruCodeLibAllLrd[$i]->szLibelle, $szProfilLR) == 0) ? "SELECTED" : "");
    				$t->set_var("POS_LIB_CHOIX_PROFIL", $tabStruCodeLibAllLrd[$i]->szLibelle);
    				$t->parse("bloc_choix_profil", "BLOC_CHOIX_PROFIL", true);
    			}
    		}
    	}
    	else
    		debug($jeton);
    }
    $t->set_var("LIB_CHOIX_LISTE_RESUMEE", CST_LIBELLE_CHOIX_LISTE_RESUMEE);
	if ($isProfil)
		$t->set_var("DISPLAY_CHOIX_PROFIL", "");
	else {
        // met à jour le profil courant pour le memoriser (cas des bals avec profil specifié)
        $t->set_var("POS_LIB_CHOIX_PROFIL", $szProfilLR);
        $t->parse("bloc_choix_profil", "BLOC_CHOIX_PROFIL", true);
        $t->set_var("DISPLAY_CHOIX_PROFIL", "none");
	}
}
else
{
	$t->set_var("bloc_choix_profil", "");
	$t->set_var("DISPLAY_CHOIX_PROFIL", "none");
}
 
?>
