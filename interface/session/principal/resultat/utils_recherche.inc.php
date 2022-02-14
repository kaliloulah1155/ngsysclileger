<?php
if (!defined("POS_UTIL_RECH"))
{
    define("POS_UTIL_RECH",1);

/*
 * Liste de fonctions nécessaires pour la construction de 
 * la page de resultats
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 24/03/2003
 *
 */
 /*
* Construction du lien pour l'affichage des pages de resultats suite à
* une recherche full text 
*/
    function ConstruitLienQuestionFtx($szQuestion,$iNumPage, $iTri, $iNbRepMax, $szChoixLib, $szTypeChoixRub)
     {
     	$szQuestion = urlencode($szQuestion);
     	$szLien = "../../../../interface/session/principal/ftx/recherche_ftx.php?POS_QUESTION=$szQuestion&POS_NUMPAGE=$iNumPage&POS_TRI=$iTri&POS_NB_REP=$iNbRepMax&POS_CHOIX_LIB=$szChoixLib&TYPE_CHOIX_RUB=$szTypeChoixRub";
    	return $szLien;
     }
     
    function afficherFonction($sArgFonction, $szLibelle, $szIcone, &$t)
    {
        $t->set_var("FONCTION", "onAction($sArgFonction)");
        $t->set_var("LIBELLE_FONCTION", $szLibelle);
        $t->set_var("ICONE", strlen($szIcone) != 0 ? $szIcone : "uniq_select.png");
        $t->parse("bouton", "BOUTON", true);
    }
    function afficherSeparateurFonction(&$t)
    {
        afficherFonction("", "<HR>", "", /*pref*/$t);
    }
    
    function afficherListePage($szTypeRecherche, $iNbReponses, &$t)
    {
        if ((isset($_REQUEST["POS_NUMDOS"]) && strlen($_REQUEST["POS_NUMDOS"]) 
            && !(defined('DOSSIER_REPONSES_PAR_PAGE') && DOSSIER_REPONSES_PAR_PAGE == 1)) || $iNbReponses == 0)
        {
            $t->set_var("page", "");
            $t->set_var("AFFICHE_PAGES_PRECEDENTES", "none");
            $t->set_var("AFFICHE_PAGES_SUIVANTES", "none");
        }
        else
        {
            // on determine le premier numero de page de la serie qui sera affichee, 
            // sachant qu'une serie est composee de NB_PAGES_AFFICHEES pages
            $iPremierNumPage = (intval(($_REQUEST["POS_NUMPAGE"] - 1) / NB_PAGES_AFFICHEES) * NB_PAGES_AFFICHEES)+1;
            
            // on determine le nb total de pages :
            // si le reste de la division du nb de reponses par le nb de pages est different de
            // zero, on ajoute une page au nb total de pages
            $iNbTotPages = intval($iNbReponses / NB_REPONSES_PAR_PAGE);
            if ($iNbReponses % NB_REPONSES_PAR_PAGE != 0 )
            	$iNbTotPages += 1;
            $t->set_var("PAGE_LIBELLE", ($iNbTotPages > 1) ? CST_LIBELLE_PAGE_RESULT_PLURIEL : CST_LIBELLE_PAGE_RESULT);
           
            // Gestion des liens pour accès aux pages précedentes et suivantes
            // pages precedentes
            $pagePrec = $iPremierNumPage - 1;
            $t->set_var("AFFICHE_PAGES_PRECEDENTES", ($_REQUEST["POS_NUMPAGE"] > NB_PAGES_AFFICHEES) ? "" : "none");
            $t->set_var("PAGE_PRECEDENTE", $pagePrec);
            $t->set_var("CST_LIBELLE_PAGE_PRECEDENTE", CST_LIBELLE_PAGE_PRECEDENTE);
            
            // pages suivantes
            $pageSuiv = $iPremierNumPage + NB_PAGES_AFFICHEES;
            $t->set_var("AFFICHE_PAGES_SUIVANTES", (($iPremierNumPage + NB_PAGES_AFFICHEES) <= $iNbTotPages) ? "" : "none");
            $t->set_var("PAGE_SUIVANTE", $pageSuiv);
            $t->set_var("CST_LIBELLE_PAGE_SUIVANTE", CST_LIBELLE_PAGE_SUIVANTE);
            
            $t->set_var("CST_LIBELLE_PAGE_NO", CST_LIBELLE_PAGE_NO);
                    
            // on boucle sur toutes les pages constituant la serie affichee
            for ($i = $iPremierNumPage; ($i < $iPremierNumPage + NB_PAGES_AFFICHEES) && ($i <= $iNbTotPages); $i++)
            {
            	// quelle page est selectionnee pour marquer l'affichage de la page en cours
            	$t->set_var("PAGE_SELECTED", ($i == $_REQUEST["POS_NUMPAGE"]) ? "Select" : "NoSelect");
                $t->set_var("NUMERO_DE_PAGE", $i);
            	$t->parse("page", "PAGE", true);
            }
            
            $t->set_var("TOTAL_PAGE", $iNbTotPages);
            $t->set_var("CURRENT_PAGE", $_REQUEST["POS_NUMPAGE"]);

        }
    }
    
    function getTabLocRechercheSimple($request, &$tabLoc)
    {
        $retour = 1;
        $tabRecherche = get_form_values_with_prefix("POS_VAL_RUB_", false);
        // aucune valeur de recherche, erreur
		if (count($tabRecherche) == 0)
		  $retour = 0;
		// au moins une valeur de recherche a été saisie
		else
		{
            $szTypeDoc = (strcmp(substr($request["POS_TYPEDOC"], 0, 2),  "00") == 0) ? "000" : $request["POS_TYPEDOC"];
        
            $tabLoc = array();
            $iCptLoc = 0;
            foreach($tabRecherche as $key => $valeur)
    		{
    			$szTagOperateur = "POS_OP_RUB_".$key;	
    			$szCodeOperateur = isset($request[$szTagOperateur]) ? $request[$szTagOperateur] : "=";
    			// la premiere locution a necessairement un lien OU et les autre un lien ET
    			$wLien = ($iCptLoc == 0) ? 1 : 2;
    
    			// Si la valeur de la rub est superieure a 3 caracteres
    			// on se trouve sur la recherche dans une fiche tableau.
    			$bFicheTab = 0;
    			if(strlen($key) > 3)
    			{
    				$tabValeurLie = explode("_",stripslashes($key));
    				$key = $tabValeurLie[0];
    				$bFicheTab = 1;
    			}
    			
    			$tabLoc[$iCptLoc]= new Locution ($wLien, $szTypeDoc, $key, $szCodeOperateur, $valeur);
    			if($bFicheTab == 1)
    			{
    				$tabLoc[$iCptLoc]->szCodeTypeLie = $tabValeurLie[1];
    				$tabLoc[$iCptLoc]->szCodeRubLie = $tabValeurLie[2];
    			}
    			$iCptLoc++;
    		}
        }
        return $retour;
    }
    
    function getTabLocRechercheHistorique($session, &$tabLoc)
    {
        $retour = 1;
        $tabLoc = array();
        for($i=0;$i<count($session["sess_tab_doc_historique"]);$i++)
        {
            list ($iNumDoc, $szTypeDoc) = explode("|", $session["sess_tab_doc_historique"][$i]);

            if(strlen($szTypeDoc) == 0)
            	$szTypeDoc = "000";
            
            // Création de la locution.
		   	$tabLoc[$i] = new Locution(1, $szTypeDoc, "N D", "=", $iNumDoc);
        }
        return $retour;
    }
    
    /**
     * Arguments en entree
     * POS_NUMLOC : nombre de locutions maximal
     * POS_TYPEDOC : type de document de toutes les locutions
     * 
     * Pour chaque locution
     * VAL1_LOC_NUM_<i> : champ valeur1 de la locution numero <i>
     * LIEN_LOC_NUM_<i> : lien de la locution numero <i>
     * RUB_LOC_NUM_<i> : code rubrique  de la locution numero <i>
     * OPE_LOC_NUM_<i> : operateur de la locution numero <i>
     * POS_NB_PAR_OUV_<i> : nombre de parentheses ouvrantes de la locution numero <i> (par defaut 0)
     * POS_NB_PAR_FER_<i> : nombre de parentheses fermantes de la locution numero <i> (par defaut 0)
     * 
     * RECHERCHE_THESAURUS
     * CODE_THES_LOC_NUM_<i> : code du thesaurus (Aucun, Pere, Fils, TA)
     * PFD_THES_LOC_NUM_<i> : profondeur du thesaurus
     * SYN_THES_LOC_NUM_<i> : si la recherche doit se faire avec des synonymes
     */
    function getTabLocRechercheElaboree($request, &$tabLoc)
    {
        $retour = 1;
        $tabLoc = array();
        $iCptLoc = 0;

		$iNbLocMax = isset($request["POS_NUMLOC"]) ? $request["POS_NUMLOC"] : 5;
		// on boucle sur le nombre de locutions
		for ($iLoc = 0; $iLoc<$iNbLocMax; $iLoc++)
		{
			$bFicheTab = 0;
			
			//On affecte des variables avec les  noms des rubriques précédentes 
			//puis on va récupérer les valeurs de ses variables ($$)
			$szTagValeur1 = "VAL1_LOC_NUM_".$iLoc;
			$szTagValeur2 = "VAL2_LOC_NUM_".$iLoc;
			$szTagOperateur = "OPE_LOC_NUM_".$iLoc;
			
			// pas de traitement des locutions avec un champ vide
			if ((isset($request[$szTagValeur1]) && strlen($request[$szTagValeur1]) != 0)
                || (isset($request[$szTagOperateur]) && (strcmp($request[$szTagOperateur], "0") == 0 || strcmp($request[$szTagOperateur], "#") == 0)))
			{
				// on recupère alors les autres champs utiles à la recherche
				$szTagTypeLien = "LIEN_LOC_NUM_".$iLoc;
				$szTagCodeRub = "RUB_LOC_NUM_".$iLoc;
				$szTagTypeLienMulti = "LIEN_TYPE_MULTI_LOC_NUM_".$iLoc;

                $szTagRubLie = "RUB_LIE_".$iLoc;

				// Si la valeur de la rub liée n'est pas vide
				// on se trouve sur la recherche dans une fiche tableau ou fiche liée.
				$tabValeurLie = array();
				if (isset($request[$szTagRubLie]) && strlen($request[$szTagRubLie]) != 0)
				{
					$tabValeurLie = explode("#", $request[$szTagRubLie]);
					$bFicheTab = 1;
				}

				$szTagNbParOuv = "POS_NB_PAR_OUV_".$iLoc;
				$iNbParDeb = (isset($request[$szTagNbParOuv]) && strlen($request[$szTagNbParOuv]) != 0) ? $request[$szTagNbParOuv] : 0;
				$szTagParFer = "POS_NB_PAR_FER_".$iLoc;
				$iNbParFin = (isset($request[$szTagParFer]) && strlen($request[$szTagParFer]) != 0) ? $request[$szTagParFer] : 0;
                
				if(strcmp($request[$szTagOperateur],"*") == 0) 
					$valeur = strtoupper($request[$szTagValeur1]);
                else 	   
					$valeur = $request[$szTagValeur1];
                                 
				$tabLoc[$iCptLoc] = new Locution ($request[$szTagTypeLien], $request["POS_TYPEDOC"],
                                                $request[$szTagCodeRub], $request[$szTagOperateur], $valeur, $iNbParDeb, $iNbParFin);
                
                if (isset($request[$szTagValeur2]) && strlen($request[$szTagValeur2]) != 0)
                	$tabLoc[$iCptLoc]->szValeur2 = stripslashes($request[$szTagValeur2]);
                
                if (isset($request[$szTagTypeLienMulti]) && strlen($request[$szTagTypeLienMulti]) != 0)
                	$tabLoc[$iCptLoc]->wTypeLienMulti = $request[$szTagTypeLienMulti];

				if($bFicheTab)
				{
					$tabLoc[$iCptLoc]->szCodeTypeLie = $tabValeurLie[0];
					$tabLoc[$iCptLoc]->szCodeRubLie = $tabValeurLie[1];
				}
				
				//les options pour la recherche thesaurus
				$szTagCodeThesaurus = "CODE_THES_LOC_NUM_".$iLoc;
				$szTagProfondeur = "PFD_THES_LOC_NUM_".$iLoc;
           	
					// si la checkbox "Synonyme" de la ième locution a été cochée
					// on incremente de 10 la valeur du code thesaurus
				$szTagSynonyme = "SYN_THES_LOC_NUM_".$iLoc;
				$wCodeThesaurus = isset($request[$szTagCodeThesaurus]) ? $request[$szTagCodeThesaurus] : 0;
				if (isset($request[$szTagSynonyme]) && strlen($request[$szTagSynonyme]) != 0)
				$wCodeThesaurus = $request[$szTagCodeThesaurus] + 10;
						
				if (isset($$wCodeThesaurus))
				    $tabLoc[$iCptLoc]->wCodeThesaurus = $wCodeThesaurus;
					
				if (isset($$wProfondeur))
				    $tabLoc[$iCptLoc]->wProfondeur = $request[$szTagProfondeur];

				// on incremente le compteur du tab des locutions
				$iCptLoc++;
			}
		}//for		    
        return $retour;
    }
    
    function getTabLocRechercheFiltre($jeton, $iNumQuest, $request, $session, &$tabLoc)
    {
        $retour = 1;
        $tabLoc = array();

        if ($iNumQuest >= 0)
        {
            copyTabLocution(array_slice($session["sess_tabHistQuest"][0][$iNumQuest], 0, 
                                        count($session["sess_tabHistQuest"][0][$iNumQuest])), /*pref*/$tabLoc);
            if (count($tabLoc) > 1)
            {
                $tabLoc[0]->wNbParDeb++;
                $tabLoc[count($tabLoc) - 1]->wNbParFin++;
            }
        }
        else
        {
            if (isset($request["POS_NUMDOS"]) && strlen($request["POS_NUMDOS"]) != 0)
            {
                $tabLoc[0] = new Locution(1, "000", "NuP", "=", $request["POS_NUMDOS"]);
                unset($request["POS_NUMDOS"]);
                unset($request["POS_TITREDOS"]);
            }
        }
        $szCodeRubriqueFiltre = $request["RUB_FILTRE"];
        $szValeurFiltre = $request["VALEUR_FILTRE"];
        
        // si un autre opérateur par défaut et que la rubrique est alpha
        $szOperateurFiltre = "=";
        if (defined('DEFAUT_OPERATEUR_FILTRE_LR'))
        {
            $retour = pos_getinforub($jeton, $szCodeRubriqueFiltre, /*pref*/$stInfoRub);
            if (isset($stInfoRub->typerub) && $stInfoRub->typerub == RUB_ALPHA)
                $szOperateurFiltre = DEFAUT_OPERATEUR_FILTRE_LR;
        }
        
        // le filtre se termine par une * : operateur commence par
        if (strrpos($request["VALEUR_FILTRE"], "*") === strlen($request["VALEUR_FILTRE"])-strlen("*"))
        {
            $szValeurFiltre = substr($request["VALEUR_FILTRE"], 0, strlen($request["VALEUR_FILTRE"]) -1);
            $szOperateurFiltre = ":";
        }
        
        if (strcmp($szCodeRubriqueFiltre, "N_D") == 0)
        {
            $szCodeRubriqueFiltre = "N D";
            $szOperateurFiltre = "=";
        }
        
        if (strcmp($szCodeRubriqueFiltre, "N_P") == 0)
        {
            $szCodeRubriqueFiltre = "N P";
            $szOperateurFiltre = "=";
        }
        
        $tabLoc[] = new Locution(2, $request["POS_TYPEDOC"], $szCodeRubriqueFiltre, $szOperateurFiltre, $szValeurFiltre);
        
        return $retour;
    }
}

?>