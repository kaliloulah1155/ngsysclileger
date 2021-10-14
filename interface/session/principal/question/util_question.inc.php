<?php
include ("../include/form_values.inc.php");
// afficheBalTpl
// affichage d'une bal dans le template � partir de l'objet objBal
function afficheBalTpl($objBal, $iCptGroup, $blocAParserUpper, &$iCptBal, &$tpl)
{
    $tpl->set_var("SZ_CODE_BAL", $objBal->szCode);
    $tpl->set_var("SZ_CODE_BAL_HTML_ENCODE", htmlentities_currentcharset($objBal->szCode, ENT_NOQUOTES));
    $tpl->set_var("BAL_OPEN", $objBal->bOpen);
    $tpl->set_var("ICONE_BAL", $objBal->szIcone);
    $tpl->parse("bloc_nom_bal","BLOC_NOM_BAL",true);
                                                     
    $tpl->set_var("ICPTBAL", $iCptBal++);
    
                                                     
	// la bal est ouverte
    if($objBal->bOpen && strlen($objBal->szCode)>0)
    {
		if($objBal->bVariable)
    		// si variable : marque d'un x le nombre de reponse
			$tpl->set_var("POS_BAL_NB_REP", "x");
		else
		{
			// chargement dynamique des BAL, on ne cherhce pas le nb de r�ponses ... dans la valeur.
			$iNbReponses = "...";
    	    $tpl->set_var("POS_BAL_NB_REP", $iNbReponses);
        }
	}
	// la bal est ferm�e
	else
	{
    	// si ferm� : marque d'un ? le nb de r�ponses
		$tpl->set_var("POS_BAL_NB_REP", "?");	
	}
	
	//test si un profil r�sum�
	if (strlen($objBal->szProfilLr) == 0) 
		$linkBal = sprintf(URL_PARAM_QUESTION_RESULTAT_AVEC_ATTENTE, "RECHERCHE_BAL", addslashes($objBal->szCode), 1);
	else 
		$linkBal = sprintf(URL_PARAM_QUESTION_PROFIL_RESULTAT_AVEC_ATTENTE, "RECHERCHE_BAL", addslashes($objBal->szCode), 1, addslashes($objBal->szProfilLr));
	
    $tpl->set_var("POS_BAL_LIEN", $linkBal);
    $tpl->set_var("POS_BAL_LIBELLE", $objBal->szLibelle);
    $tpl->set_var("POS_BAL_LIBELLE_COMMENT", $objBal->szLibelleComment);
    if ($blocAParserUpper == "BAL")        	
        $tpl->set_var("STYLE_BAL", $objBal->szStyle);
    else
        $tpl->set_var("STYLE_BAL_GROUP", $objBal->szStyle);
    $tpl->parse(strtolower($blocAParserUpper), $blocAParserUpper, true);
}

function afficherResultatAccueil($jeton, $tabInfoQuestion, &$t)
{
    $t->set_var("CST_LIBELLE_CONSULT", CST_LIBELLE_CONSULT);
    $t->set_var("LIBELLE_BASCULER_LISTE_RESULTAT", CST_LIBELLE_BASCULER_LISTE_RESULTAT);
    
	// Cr�ation de la locution.
	$szNomQuestion = $tabInfoQuestion["QUESTION_0"]["NOM"];
	$szTitreQuestion = isset($tabInfoQuestion["QUESTION_0"]["TITRE_QUESTION"]) ? $tabInfoQuestion["QUESTION_0"]["TITRE_QUESTION"] : "";
	$tabLocBib = array();
	$retour = pos_bib_getlocutionsquest($jeton, $szNomQuestion, 1, /*pref*/$tabLocBib);
	if ($retour && count($tabLocBib) > 0)
	{
    	$tabLocAsso = array();
        for($i=0;$i<count($tabLocBib);$i++)
        {
            copyLocutionBibToLocutionPhp($tabLocBib[$i], /*pref*/$tabLocAsso[$i]);
        }
    	// R�cup�ration des r�ponses.
    	$retour = pos_searchdoc($jeton,count($tabLocAsso),$tabLocAsso,
    						/*pref*/$dwNbReponsesAsso, /*pref*/$dwAdrPremiereReponseAsso);
    	if($retour)
    	{
    		$t->set_var("NB_REPONSE", $dwNbReponsesAsso);
    		$t->set_var("CODE_QUESTION", addslashes($szNomQuestion));
    		$t->set_var("TITRE_QUESTION", $szTitreQuestion);
    		
    		if($dwNbReponsesAsso != 0)
    		{
    			$szProfilLR = (isset($tabInfoQuestion["QUESTION_0"]["PROFIL_LR"])) ? $tabInfoQuestion["QUESTION_0"]["PROFIL_LR"] : "";
    			$tabReponseLR = "";
    			$iTypeTri = (isset($tabInfoQuestion["QUESTION_0"]["TYPE_TRI"])) ? $tabInfoQuestion["QUESTION_0"]["TYPE_TRI"] : "1";
    			$iColonneTri = (isset($tabInfoQuestion["QUESTION_0"]["COLONNE_TRI"])) ? $tabInfoQuestion["QUESTION_0"]["COLONNE_TRI"] : "1";
    			
    			// recuperation de l'ensemble des listes resumees
    			$retour = pos_getreponseslrd($jeton, $dwAdrPremiereReponseAsso, 
    				$dwNbReponsesAsso, $dwNbReponsesAsso, $iColonneTri, $iTypeTri, /*pref*/$szProfilLR, /*pref*/$tabReponseLR);
    				
    			if ($retour)
    			{	
    				// profil de la liste resumee
    				$retour = afficheEntete($jeton, $szProfilLR, /*pref*/$t, /*pref*/$iNbCol, /*pref*/$tabZoneLR);
    				
    				if ($retour)
    				{		
    					$t->set_var("liste_reponses", "");
    					for ($i=0; $i<count($tabReponseLR); $i++) 
    					{
                            $t->set_var("PAIR_OU_IMPAIR",  (($i % 2) == 0) ? "pair" : "impair");
    						$t->set_var("lr_reponse", "");
    						$champs = extraireChampsLR($tabReponseLR[$i]->lr, "\x02");
    						for ($j=0; $j<count($champs); $j++)
    						{
    						    $szAlign = "left";
    							switch($tabZoneLR[$j]->zone_align_col)
                        		{
                        			case 1 : $szAlign = "center";  break;
                        			case 2 : $szAlign = "left";    break;
                        			case 3 : $szAlign = "right";   break;
                        		}
    							$t->set_var("ZONE_ALIGN_LR", $szAlign);
    						
    							if($champs[$j] != "")
    							{
    							    $t->set_var("ZONE_LR", str_replace("\n", "<br>", $champs[$j]));
    							}
    							else
    								$t->set_var("ZONE_LR", "&nbsp;");
    							
    							$t->parse("lr_reponse", "LR_REPONSE", true);
    						}
    						
    						$t->set_var("POS_NUM_DOC", $tabReponseLR[$i]->numdoc);
    						$t->parse("liste_reponses", "LISTE_REPONSES", true);
    					}
    				}
    			}
    			else
    				debug($jeton);
    		} // au moins une reponse
    	} // retour possearchdoc OK
    }
    else
    {
        if (!$retour)
            debug($jeton);
    }
    return $retour;
}

// ---------------------------------------------------------
// Affichage des bo�tes aux lettres
// ---------------------------------------------------------
function afficherListeBal(&$t)
{
    $t->set_block("question", "BAL", "bal");
    $t->set_block("question", "BAL_SEULE", "bal_seule");
    $t->set_block("question", "TITRE_BAL_GROUPE", "titre_bal_groupe");
    $t->set_block("question", "TITRE_ONLY_GROUPE", "titre_only_groupe");
    $t->set_block("question", "TITRE_GROUPE", "titre_groupe");
    $t->set_block("question", "GROUPE_BAL", "groupe_bal");
    $t->set_block("question", "BLOC_BAL", "bloc_bal");
    $t->set_block("question", "BLOC_NOM_BAL", "bloc_nom_bal");
    
    //l'entete de colonne
    $t->set_var("POS_BAL_ENTETE", CST_LIBELLE_BAL);
    // affichage de la liste des objet : groupe de bal et bal
    // si la bal est de type groupe, affichage des fils
    $iCptBal = 0;
    $iCptGroup = 0;
    for($i=0;$i<count($_SESSION["sess_tab_bal"]);$i++)
    {
        if ($_SESSION["sess_tab_bal"][$i]->iType == TYPE_BAL)
        {
            $t->set_var("bal_seule", "");
            $t->set_var("POS_BAL_TITRE_GROUPE", "");
            $t->set_var("GROUP_ON", "n");
            $t->set_var("ICPTGROUP", "no");
            $t->set_var("DISPLAY_GROUPE_OUVERT", "");
            $t->set_var("titre_groupe", "");
                                                         
            afficheBalTpl($_SESSION["sess_tab_bal"][$i], $iCptGroup, "BAL_SEULE", /*pref*/$iCptBal, /*pref*/$t);
            $t->parse("groupe_bal", "GROUPE_BAL", true);
    	}
    	else
    	{
            $t->set_var("bal", "");
            $t->set_var("titre_bal_groupe", "");
            $t->set_var("titre_only_groupe", "");
            $t->set_var("ICPTGROUP", $iCptGroup);
            if (strlen($_SESSION["sess_tab_bal"][$i]->szIcone) > 0)
                $t->set_var("ICONE_GROUPE", "<img src='".URL_SITE."/images/menu/win/".$_SESSION["sess_tab_bal"][$i]->szIcone.".gif'>");
    		else
                $t->set_var("ICONE_GROUPE", "");
            $t->set_var("POS_BAL_TITRE_GROUPE", $_SESSION["sess_tab_bal"][$i]->szLibelleComment);
            $t->set_var("STYLE_BAL_GROUP", $_SESSION["sess_tab_bal"][$i]->szStyle);
            $t->set_var("GROUP_ON", "o");
            if ($_SESSION["sess_tab_bal"][$i]->bOpen)
            {
                $t->set_var("DISPLAY_GROUPE_OUVERT", "");
                $t->set_var("ICONE_ARBRE_PLUS_MOINS", "moins");
            }
            else
            {
                $t->set_var("DISPLAY_GROUPE_OUVERT", "none");
                $t->set_var("ICONE_ARBRE_PLUS_MOINS", "plus");
            }
            for($j=0;$j<count($_SESSION["sess_tab_bal"][$i]->tabListeFils);$j++)
            {
                afficheBalTpl($_SESSION["sess_tab_bal"][$i]->tabListeFils[$j], $iCptGroup, "BAL", /*pref*/$iCptBal, /*pref*/$t);
    		}
            if (strlen($_SESSION["sess_tab_bal"][$i]->szCode) == 0)
            {
                $t->parse("titre_only_groupe", "TITRE_ONLY_GROUPE", false);
                $t->set_var("titre_bal_groupe", "");
            }
            else
            {
                afficheBalTpl($_SESSION["sess_tab_bal"][$i], $iCptGroup, "TITRE_BAL_GROUPE", /*pref*/$iCptBal, /*pref*/$t);
                $t->parse("titre_bal_groupe", "TITRE_BAL_GROUPE", false);
                $t->set_var("titre_only_groupe", "");
            }
            $t->parse("titre_groupe", "TITRE_GROUPE", false);
        	$iCptGroup++;
            $t->parse("groupe_bal", "GROUPE_BAL", true);
    	}
    }
    if(count($_SESSION["sess_tab_bal"])==0)
    {
    	$t->set_var("bal", "");
    	$t->set_var("bloc_bal", "");	
    }
    else
    	$t->parse("bloc_bal","BLOC_BAL",true);
}

// affichage de la liste des profils
function afficherListeProfils(&$t)
{
	$t->set_var("LIBELLE_ACCES_PROFIL", CST_LIBELLE_ACCES_PROFIL);
	$t->set_var("LIBELLE_CHANGER_PROFIL", CST_LIBELLE_CHANGER_PROFIL);
	$t->set_var("LIBELLE_TITRE_ACCES_PROFIL", CST_LIBELLE_TITRE_ACCES_PROFIL);
    $tabListeProfils = $_SESSION["sess_tab_profil_util_appli"];
    $t->set_var("NB_PROFILS_UTIL", count($tabListeProfils) - 1);
    if (count($tabListeProfils) == 1)
    	$t->set_var("bloc_change_profil", "");
    else
    {
    	for($i=0;$i<count($tabListeProfils);$i++)
    	{
    		if (strcmp($tabListeProfils[$i], $_SESSION["sess_profil"]) != 0)
    		{
    			$t->set_var("CODE_PROFIL",$tabListeProfils[$i]);
    			$t->set_var("LIBELLE_PROFIL",$tabListeProfils[$i]);
    			$t->parse("liste_profil", "LISTE_PROFIL", true);
    		}
    	}
    	$t->parse("bloc_change_profil", "BLOC_CHANGE_PROFIL", true);
    }
}

// Affichage des questions de la biblioth�que
function afficherListeQuestionBib(&$t)
{
    //l'entete de colonne
    $t->set_var("POS_BIB_ENTETE_PUB", count($_SESSION["sess_tabQuestBibPub"])==0 ? "" : CST_LIBELLE_BIB_PUB);
    $t->set_var("POS_BIB_ENTETE_PRIV", count($_SESSION["sess_tabQuestBibPriv"])==0 ? "" : CST_LIBELLE_BIB_PRIV);

    $t->set_block("question","BIBLIO_PUB","biblio_pub");
    $t->set_block("question","BIBLIO_PRIV","biblio_priv");
    $t->set_block("question","BLOC_BIBLIO_PUB","bloc_biblio_pub");
	$t->set_block("question","BLOC_BIBLIO_PRIV","bloc_biblio_priv");
    $t->set_block("question","BLOC_BIBLIO","bloc_biblio");
    
    afficherListeQuestionBibPubliques(/*pref*/$t);
    afficherListeQuestionBibPrivees(/*pref*/$t);
    
    if(count($_SESSION["sess_tabQuestBibPub"])==0) {
        $t->set_var("biblio_pub", "");
        $t->set_var("bloc_biblio_pub", "");
    }
    else
        $t->parse("bloc_biblio_pub","BLOC_BIBLIO_PUB",true);
        
    if(count($_SESSION["sess_tabQuestBibPriv"])==0) {
        $t->set_var("biblio_priv", "");
        $t->set_var("bloc_biblio_priv", "");
    }
    else
        $t->parse("bloc_biblio_priv","BLOC_BIBLIO_PRIV",true);
        
    if(count($_SESSION["sess_tabQuestBibPub"])==0 && count($_SESSION["sess_tabQuestBibPriv"])==0)
	   $t->set_var("bloc_biblio", "");
	else
	   $t->parse("bloc_biblio","BLOC_BIBLIO",true);        
}

function afficherListeQuestionBibPrivees(&$t)
{
    for($i=0;$i<count($_SESSION["sess_tabQuestBibPriv"]);$i++)
    {
    	$t->set_var("POS_BIB_LIEN_PORTAIL", URL_ATTENTE."?URL=".sprintf(URL_PARAM_QUESTION_RESULTAT_AVEC_ATTENTE, "RECHERCHE_BIB", urlencode(addslashes($_SESSION["sess_tabQuestBibPriv"][$i])), 0));
    	$t->set_var("POS_BIB_LIBELLE", htmlentities_currentcharset($_SESSION["sess_tabQuestBibPriv"][$i], null));
    	$t->parse("biblio_priv","BIBLIO_PRIV",true);
    }
}

function afficherListeQuestionBibPubliques(&$t)
{
    for($i=0;$i<count($_SESSION["sess_tabQuestBibPub"]);$i++)
    {
    	$t->set_var("POS_BIB_LIEN_PORTAIL", URL_ATTENTE."?URL=".sprintf(URL_PARAM_QUESTION_RESULTAT_AVEC_ATTENTE, "RECHERCHE_BIB", urlencode(addslashes($_SESSION["sess_tabQuestBibPub"][$i])), 1));
    	$t->set_var("POS_BIB_LIBELLE", htmlentities_currentcharset($_SESSION["sess_tabQuestBibPub"][$i], null));
    	$t->parse("biblio_pub","BIBLIO_PUB",true);
    }
}
?>
