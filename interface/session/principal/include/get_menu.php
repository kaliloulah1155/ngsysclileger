<?php

if (!defined("GET_MENU"))
{
	define("GET_MENU",1);
    
    /*
     * Recherche la chaine donne dans les valeurs d'un tableau
     * indexé 
     * retourne -1 si non trouvé
     * retourne le numero de ligne sinon
     */
    function rechercher($fcontent, $szChaine)
    {
    	$bTrouve = -1;
    
    	reset($fcontent);
    	foreach($fcontent as $numLigne => $szLigne)
    	{
    		// on evite les commentaires
    		if ($szLigne[0] != "#" && 
                (strpos($szLigne, $szChaine.",") !== false || strpos($szLigne, $szChaine) === (strlen(trim($szLigne)) -  strlen($szChaine))) )
    		{
    			$bTrouve = $numLigne;
    			break;
    		}
    	}
    	return $bTrouve;
    }
    
    function get_nom_menu($szApplication, $szUserName, $szService, $szFonction, $szProfil)
	{
	    $menu = "";
        // verification de la configuration
        $numLigne = -1;
        $nomFichier = "../../../../configuration/menu_".$szApplication.".conf";
        
        if (!file_exists($nomFichier))
        	$nomFichier = "../../../../configuration/menu.conf";
        
        if (file_exists($nomFichier))
        {
        	$fcontent = file($nomFichier);
            $numLigne = getNumLigne($fcontent, $szUserName, $szService, $szFonction, $szProfil);
        }
        
        if ($numLigne >= 0)
        {
        	// reaffectation de la variable $menu
        	$pos = strpos($fcontent[$numLigne], "=");
        	$menu = substr($fcontent[$numLigne], 0, $pos);
        }
        else
        {
        	// menu par defaut
        	$menu = "menu_util_$szApplication.html";
        }
        
        return $menu;
	}
	
    function get_nom_toolbar($szApplication, $szUserName, $szService, $szFonction, $szProfil)
	{
	    $menu = "";
        // verification de la configuration
        $numLigne = -1;
        $nomFichier = "../../../../configuration/toolbar_".$szApplication.".conf";
        if (!file_exists($nomFichier))
        	$nomFichier = "../../../../configuration/toolbar.conf";
            
        if (file_exists($nomFichier))
        {
        	$fcontent = file($nomFichier);
        	$numLigne = getNumLigne($fcontent, $szUserName, $szService, $szFonction, $szProfil);
        }
        
        if ($numLigne >= 0)
        {
        	// reaffectation de la variable $menu
        	$pos = strpos($fcontent[$numLigne], "=");
        	$menu = substr($fcontent[$numLigne], 0, $pos);
        }
        else
        {
        	// menu par defaut
        	$nomFichierMenu = "../../../../configuration/menu_".$szApplication.".xml";
            if (file_exists($nomFichierMenu))
            	$menu = "menu_$szApplication.xml";
            else
        	   $menu = "menu.xml";
        }
        
        return $menu;
	}


    function get_nom_fic_planclassement($szApplication, $szUserName, $szService, $szFonction, $szProfil)
	{
	    $menu = "";
        // verification de la configuration
        $numLigne = -1;
        $nomFichier = "../../../../configuration/affect_plan_classement_".$szApplication.".conf";
        if (!file_exists($nomFichier))
        	$nomFichier = "../../../../configuration/affect_plan_classement.conf";
        
        if (file_exists($nomFichier))
        {
        	$fcontent = file($nomFichier);
            $numLigne = getNumLigne($fcontent, $szUserName, $szService, $szFonction, $szProfil);
        }
        
        if ($numLigne >= 0)
        {
        	// reaffectation de la variable $menu
        	$pos = strpos($fcontent[$numLigne], "=");
        	$menu = substr($fcontent[$numLigne], 0, $pos);
        }
        else
        {
        	// menu par defaut
        	$nomFichierMenu = "../../../../configuration/plan_classement_".$szApplication.".conf";
            if (file_exists($nomFichierMenu))
            	$menu = "plan_classement_$szApplication.conf";
            else
        	   $menu = "plan_classement.conf";
        }
        return $menu;
	}
    
    function getNumLigne($fcontent, $szUserName, $szService, $szFonction, $szProfil)
    {
        $numLigne = -1;
            
        // recherche du nom de l'utilisateur dans le fichier
    	$szTagUserName="U:$szUserName";
    	$numLigne = rechercher($fcontent, $szTagUserName);
    
    	// l'utilisateur n'a pas ete trouve
    	if ($numLigne < 0)
    	{
    		$szTagService = "S:$szService";
    		$numLigne = rechercher($fcontent, $szTagService);
    	}	
		// le service n'a pas ete trouve
		if ($numLigne < 0)
		{
			$szTagFonction = "F:$szFonction";
			$numLigne = rechercher($fcontent, $szTagFonction);
		}
		// le service n'a pas ete trouve
		if ($numLigne < 0)
		{
			$szTagProfil = "P:$szProfil";
			$numLigne = rechercher($fcontent, $szTagProfil);
		}
        // unite
        if ($numLigne < 0)
		{
			$szTag = "UN:".$_SESSION["sess_unite"];
			$numLigne = rechercher($fcontent, $szTag);
		}
        
        if ($numLigne < 0)
		{
			$szTag = "O:".$_SESSION["sess_organisation"];
			$numLigne = rechercher($fcontent, $szTag);
		}
        return $numLigne;
    }
}

?>
