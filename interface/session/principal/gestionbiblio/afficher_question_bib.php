<?php
/*
* DESCRIPTION : Gestion des questions de la bibliothèque version 10.5
* AUTEUR: Gabrielle Guy
* DATE DE CREATION: 18/02/2006
* 
* 21.01.2008 PL les variables issues de GET et POST sont recuperees par $_REQUEST
*/ 
if (!isset($_SESSION)) 
session_start();
include ("../include/locution.inc.php");
include ("../include/question.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/form_values.inc.php");

include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("TYPE_QUESTION_BIB_NON_PARTAGEE",0);
define("TYPE_QUESTION_BIB_PROFIL",1);
define("TYPE_QUESTION_BIB_FONCTION",2);
define("TYPE_QUESTION_BIB_SERVICE",3);
define("TYPE_QUESTION_BIB_UTILISATEUR",4);
define("TYPE_QUESTION_BIB_PUBLIC",5);

$tabLibelleTypeProprietaire = array();
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_NON_PARTAGEE] = CST_LIBELLE_NON_PARTAGE;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_PROFIL] = CST_LIBELLE_BIB_PARTAGE_PROFIL;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_FONCTION] = CST_LIBELLE_BIB_PARTAGE_FONCTION;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_SERVICE] = CST_LIBELLE_BIB_PARTAGE_SERVICE;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_UTILISATEUR] = CST_LIBELLE_BIB_PARTAGE_UTIL;
$tabLibelleTypeProprietaire[TYPE_QUESTION_BIB_PUBLIC] = CST_LIBELLE_BIB_PARTAGE_PUBLIC;


//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
	$isAdmin = $_SESSION["sess_droitAdministration"] ? true : false;
    //on récupère les questions de la bib
    $retour = pos_bib_getlistequestions($jeton, /*pref*/$tabQuestBibPrive, /*pref*/$tabQuestBibPublic);
    
    if (isset($_REQUEST["MODIFPARTAGE"])) {
    
        // il y a eu un partage, on compare l'etat anterieur et le nouvel etat
        $sNomQuestPartage = stripslashes($_REQUEST["POS_NOM_QUEST"]);
        if (in_array($sNomQuestPartage, $tabQuestBibPublic)) {
            if (!in_array($sNomQuestPartage, $_SESSION["sess_tabQuestBibPub"])) 
                $B_AJOUTE_QUESTION_BIB = true;
        }
        else {
            if (in_array($sNomQuestPartage, $_SESSION["sess_tabQuestBibPub"])) 
                $B_SUPP_QUESTION_BIB = true;
        }
    }
    
    // récupération des questions => mise à jour des tableaux de la session
    $_SESSION["sess_tabQuestBibPub"] = $tabQuestBibPublic;
	$_SESSION["sess_tabQuestBibPriv"] = $tabQuestBibPrive;
    
    if (!$retour)
    	debug($jeton);
    else
    {   
    	$tabQuestBibPartagee = array();
        $tabQuestBibCountPartage = array();
        if($isAdmin)
        {
            // pour l'admin ajout des questions de la bibliothèque partageables
            $retour = pos_bib_getallassopartage($jeton, /*pref*/$tabStQuest);

	        if(!$retour)
                debug($jeton);
            else
            {  
                $szPartage = "";
                for($i=0; $i<count($tabStQuest); $i++)
                {
                	$szNomQuestionEnCours = trim($tabStQuest[$i]->szNomQuestion); 
                	if (!isset($tabQuestBibPartagee[$szNomQuestionEnCours]))
                    {
                        $szPartage = $tabLibelleTypeProprietaire[$tabStQuest[$i]->wTypeProprietaire];
                        $szPartage .= strlen($tabStQuest[$i]->szProprietaire) != 0 ? " : " : "";
                        $szPartage .= $tabStQuest[$i]->szProprietaire;
                        $tabQuestBibPartagee[$szNomQuestionEnCours] = $szPartage;
                        $tabQuestBibCountPartage[$szNomQuestionEnCours] = 0;
                    }
                    else
                       $tabQuestBibCountPartage[$szNomQuestionEnCours]++; 
                }
            } 
        }
		sort($tabQuestBibPrive); 
        
		// on definit le template utilisé  
		$t = new template(REP_TEMPLATE_APPLICATIF."bibliotheque");
		$t->set_file("bib", "gestion_bibliotheque.tpl");
		
		// bloc si on vient de la fenetre de recherche elaborée.
		$t->set_block("bib", "BLOC_CREATION_CHECKBOX", "bloc_creation_checkbox");
		$t->set_block("bib", "BLOC_CREATION", "bloc_creation");
		$t->set_block("bib", "BIBLIO_YES", "biblio_yes");
		$t->set_block("bib", "BIBLIO_NO", "biblio_no");
		
		$t->set_block("bib", "VISU_PARTAGE_YES", "visu_partage_yes");
		$t->set_block("bib", "VISU_PARTAGE_NO", "visu_partage_no");
		
		$t->set_block("bib", "NOM_BIB", "nom_bib");
		$t->set_block("bib", "TAB_IS_PUBLIC_BIB", "tab_is_public_bib");
		
		$t->set_block("bib", "MENU_PARTAGE", "menu_partage");
		

		// par défaut on ne fait pas cette action car le champ n'existe pas.
		$t->set_var("DONNE_FOCUS", "");
		$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_GEST_BIB);
		$t->set_var("POS_ADMIN", $isAdmin ? 1  : 0);
		// Ajout des infos de la question pour l'ajout ou supp dans l'arborescence
        $bQuestPublic = (isset($_REQUEST['POS_QUEST_PUBLIC']))? $_REQUEST['POS_QUEST_PUBLIC']:"";
        if (isset($_REQUEST["MODIFPARTAGE"]))
            $bQuestPublic = 1;    
        $t->set_var("POS_QUEST_PUBLIC", $bQuestPublic);
		
		$t->set_var("ACTUALISE_ARBO_ADD", (isset($B_AJOUTE_QUESTION_BIB))? "actualiseArboApresAjout();":"");
		$t->set_var("ACTUALISE_ARBO_SUPP", (isset($B_SUPP_QUESTION_BIB))? "actualiseArboApresSupp();":"");
    	$t->set_var("URL_ARBO", URL_AFFICHE_GESTION_DOSSIER);
    	$t->set_var("SZ_NOM_QUESTION", isset($_REQUEST['POS_NOM_QUEST'])? stripslashes($_REQUEST['POS_NOM_QUEST']): "");
    	$t->set_var("SZ_NOM_QUESTION_SS_QUOTE", isset($_REQUEST['POS_NOM_QUEST'])? preg_replace('/\'/', '@', $_REQUEST['POS_NOM_QUEST']):"");
			
		$t->set_var("LIBELLE_ENREG_QUEST_BIB", CST_LIBELLE_ENREG_QUEST_BIB);
		$t->set_var("LIBELLE_TITRE_QUEST_BIB", CST_LIBELLE_TITRE_QUEST);
		$t->set_var("LIBELLE_BIB_ENTETE", CST_LIBELLE_BIB);
		$t->set_var("LIBELLE_ENREGISTRER", CST_LIBELLE_ENREGISTRER);
		$t->set_var("LIBELLE_SUPPRESSION", CST_LIBELLE_SUPP);
		$t->set_var("LIBELLE_RECHERCHE", CST_LIBELLE_RECHERCHER);
		$t->set_var("LIBELLE_DETAIL", CST_LIBELLE_DETAIL_QUEST_BIB);
		$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER_QUEST_BIB);
        $t->set_var("LIBELLE_PARTAGER", CST_LIBELLE_PARTAGER_QUEST_BIB);
		$t->set_var("LIBELLE_RAPPEL", CST_LIBELLE_RAPPEL_QUEST_BIB);
		$t->set_var("LIBELLE_BIB_PARTAGEABLE", CST_LIBELLE_BIB_PARTAGEABLE);
		$t->set_var("LIBELLE_BIB_PARTAGE", CST_LIBELLE_BIB_PARTAGE);
        $t->set_var("LIBELLE_PARTAGE", CST_LIBELLE_BIB_PARTAGE);		
		$t->set_var("MESSAGE_SELECT_REP", CST_LIBELLE_SELECT_QUEST_BIB);
		$t->set_var("MESSAGE_SUPP_QUEST_BIB", CST_LIBELLE_SUPP_QUEST_BIB);
		$t->set_var("MESSAGE_NO_DROIT_SUPP_QUEST_BIB", CST_LIBELLE_NO_DROIT_SUPP_QUEST_BIB);
        $t->set_var("MESSAGE_NO_DROIT_PART_QUEST_BIB", CST_LIBELLE_NO_DROIT_PART_QUEST_BIB);
		
		$t->set_var("URL_ENREG_QUEST", URL_ENREG_QUEST);
		$t->set_var("LIBELLE_MESS_NO_NOM_QUEST", CST_LIBELLE_NO_NOM_QUEST_BIB);
		$t->set_var("LIBELLE_MESS_NOK_CHAR", CST_LIBELLE_NOK_CHAR_BIB);
		$t->set_var("LIBELLE_MESS_QUEST_EXIST_DEJA", CST_LIBELLE_QUEST_EXIST_DEJA);
		$t->set_var("LIBELLE_MESS_QUEST_EXIST_DEJA_NO_DROITS", CST_MESS_QUEST_EXIST_DEJA_NO_DROITS);
		
		$t->set_var("LIEN_ACTUALISATION", URL_AFFICHE_QUEST_BIB);
		
		if ($isAdmin)
			$t->set_var("WIDTH_TABLE", "750px");
		else
			$t->set_var("WIDTH_TABLE", "490px");
		
		if(isset($_REQUEST['POS_ENREG_QUEST']) && $_REQUEST['POS_ENREG_QUEST'])
		{
			if($isAdmin)
            	$t->parse("bloc_creation_checkbox","BLOC_CREATION_CHECKBOX",true);
            else
    			$t->set_var("bloc_creation_checkbox", "");
    
    		$t->parse("bloc_creation","BLOC_CREATION",true);
			$t->set_var("DONNE_FOCUS", "document.principal.POS_NOM_QUEST.focus();");
    		$tabLoc = getTabLocRequest($_REQUEST['POS_TYPEDOC'], $_REQUEST['POS_NUMLOC']);
			$_SESSION["sess_tab_enreg_quest_bib"] = array_slice($tabLoc, 0, count($tabLoc));
		}
		else
			$t->set_var("bloc_creation", "");
		
		if ($isAdmin)
		{
			$t->parse("menu_partage", "MENU_PARTAGE", false);
		}
		else
		{
			$t->set_var("menu_partage", "");
		}
		$cptPair=0;
		for($i=0;$i<count($tabQuestBibPrive);$i++)
		{
			$linkBib = "POS_QUEST_NOM=".urlencode(addslashes($tabQuestBibPrive[$i]))."&POS_QUEST_PUBLIC=0";
			$t->set_var("POS_PARTAGEABLE", CST_LIBELLE_NON);
            $t->set_var("POS_PARTAGE", "");
            $t->set_var("POS_INFO_STRU_QUESTION", $linkBib);
            $t->set_var("POS_BIB_LIBELLE", htmlentities_currentcharset($tabQuestBibPrive[$i], ENT_QUOTES));
			$t->set_var("PAIR_OU_IMPAIR", (($cptPair++ % 2) == 0) ? "pair" : "impair");
            
			$t->parse("biblio_yes","BIBLIO_YES",true);
			$t->parse("biblio_no","BIBLIO_NO",true);
			$t->set_var("LIBELLE_QUEST_BIB", htmlentities_currentcharset($tabQuestBibPrive[$i], ENT_QUOTES));
			$t->set_var("BIB_IS_PUBLIC", "0");
			$t->parse("tab_is_public_bib","TAB_IS_PUBLIC_BIB",true);
			$t->parse("nom_bib","NOM_BIB",true);
		}
	    
		if ($isAdmin)
		{		
			foreach($tabQuestBibPartagee as $key => $val)
			{
				$linkBib = "POS_QUEST_NOM=".urlencode(addslashes($key))."&POS_QUEST_PUBLIC=1";
				$t->set_var("POS_PARTAGEABLE", CST_LIBELLE_OUI);
                $sLibPartage = $val.(($tabQuestBibCountPartage[$key] != 0) ? "&nbsp;+(".$tabQuestBibCountPartage[$key].")" : "");
	            $t->set_var("POS_PARTAGE", $sLibPartage);
	            $t->set_var("POS_INFO_STRU_QUESTION", $linkBib);
	            $t->set_var("POS_BIB_LIBELLE", htmlentities_currentcharset($key, ENT_QUOTES));
	            $t->set_var("PAIR_OU_IMPAIR", (($cptPair++ % 2) == 0) ? "pair" : "impair");
				$t->parse("biblio_yes","BIBLIO_YES",true);
				$t->set_var("LIBELLE_QUEST_BIB", htmlentities_currentcharset($key, ENT_QUOTES));
				$t->set_var("BIB_IS_PUBLIC", "1");
			    $t->parse("tab_is_public_bib","TAB_IS_PUBLIC_BIB",true);
				$t->parse("nom_bib","NOM_BIB",true);
			}
            $t->parse("visu_partage_yes","VISU_PARTAGE_YES",true);
			$t->set_var("visu_partage_no","");
		}
		else
		{
			for($i=0;$i<count($tabQuestBibPublic);$i++)
			{
				$linkBib = "POS_QUEST_NOM=".urlencode(addslashes($tabQuestBibPublic[$i]))."&POS_QUEST_PUBLIC=1";
				$t->set_var("POS_PARTAGEABLE", CST_LIBELLE_OUI);
	            $t->set_var("POS_PARTAGE", "");
	            $t->set_var("POS_INFO_STRU_QUESTION", $linkBib);
	            $t->set_var("POS_BIB_LIBELLE", htmlentities_currentcharset($tabQuestBibPublic[$i], ENT_QUOTES));
	            $t->set_var("PAIR_OU_IMPAIR", (($cptPair++ % 2) == 0) ? "pair" : "impair");
				$t->parse("biblio_yes","BIBLIO_YES",true);
				$t->parse("biblio_no","BIBLIO_NO",true);

				$t->set_var("LIBELLE_QUEST_BIB", htmlentities_currentcharset($tabQuestBibPublic[$i], ENT_QUOTES));
				$t->set_var("BIB_IS_PUBLIC", "1");
                $t->parse("tab_is_public_bib","TAB_IS_PUBLIC_BIB",true);
				$t->parse("nom_bib","NOM_BIB",true);
			}
			$t->parse("visu_partage_no","VISU_PARTAGE_NO",true);
			$t->set_var("visu_partage_yes","");
		}
		        
		if (($isAdmin && count($tabQuestBibPartagee) == 0 && count($tabQuestBibPrive) == 0)
			|| (!$isAdmin && count($tabQuestBibPublic) == 0 && count($tabQuestBibPrive) == 0)) 
		{
            $t->set_var("biblio" , "");
            $t->set_var("nom_bib" , "");
		}
		
		// affichage du template
		$t->pparse("Output", "bib");
	}
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
		
function getTabLocRequest($szTypeDoc, $iPosNumLoc) 
{
	$tabLoc = array();
	$iCptLoc = 0;
	global $_REQUEST;
	
	// on boucle sur le nombre de locutions
	for ($iLoc = 0; $iLoc<$iPosNumLoc; $iLoc++)
	{
		$bFicheTab = 0;
		$szValeur1 = $_REQUEST["VAL1_LOC_NUM_".$iLoc];
		
		// pas de traitement des locutions avec un champ vide
		//if (isset($szValeur1) && strlen($szValeur1) != 0)
		// si il y a les operateurs vide/non vide
		if (strlen(trim($_REQUEST["OPE_LOC_NUM_".$iLoc])) == 1)
		{
			// on recupère alors les autres champs utiles à la recherche
			$wTypeLien = $_REQUEST["LIEN_LOC_NUM_".$iLoc];
			$szCodeRub = $_REQUEST["RUB_LOC_NUM_".$iLoc];
			$cOperateur = $_REQUEST["OPE_LOC_NUM_".$iLoc];
			$wTypeLienMulti = $_REQUEST["LIEN_TYPE_MULTI_LOC_NUM_".$iLoc];
			$szValeur2 = $_REQUEST["VAL2_LOC_NUM_".$iLoc];
			$szRubLie = $_REQUEST["RUB_LIE_".$iLoc];

			// Si la valeur de la rub liée n'est pas vide
			// on se trouve sur la recherche dans une fiche tableau ou fiche liée.
			if(strcmp($szRubLie,"") != 0)
			{
				$tabValeurLie = explode("#",$szRubLie);
				$bFicheTab = 1;
			}

			$iNbParDeb = isset($_REQUEST["POS_NB_PAR_OUV_".$iLoc]) ? $_REQUEST["POS_NB_PAR_OUV_".$iLoc] : 0;
			$iNbParFin = isset($_REQUEST["POS_NB_PAR_FER_".$iLoc]) ? $_REQUEST["POS_NB_PAR_FER_".$iLoc] : 0;
		    
			if(strcmp($cOperateur,"*") == 0) 
				$valeur = strtoupper(stripslashes($szValeur1));
            else 	   
				$valeur = stripslashes($szValeur1);
                                   
			$tabLoc[$iCptLoc] = new Locution ($wTypeLien,$szTypeDoc, $szCodeRub, $cOperateur, $valeur, $iNbParDeb, $iNbParFin);
            $tabLoc[$iCptLoc]->szValeur2 = stripslashes($szValeur2);
            $tabLoc[$iCptLoc]->wTypeLienMulti = $wTypeLienMulti;
		
			if($bFicheTab)
			{
				$tabLoc[$iCptLoc]->szCodeTypeLie = $tabValeurLie[0];
				$tabLoc[$iCptLoc]->szCodeRubLie = $tabValeurLie[1];
			}

			if (isset($_REQUEST["CODE_THES_LOC_NUM_".$iLoc]))
			{
				//les options pour la recherche thesaurus
		   		$wCodeThesaurus = $_REQUEST["CODE_THES_LOC_NUM_".$iLoc];
				$wProfondeur = $_REQUEST["PFD_THES_LOC_NUM_".$iLoc];
				// si la checkbox "Synonyme" de la ième locution a été cochée
				// on incremente de 10 la valeur du code thesaurus
				if(isset($_REQUEST["SYN_THES_LOC_NUM_".$iLoc]))
					$wCodeThesaurus = $wCodeThesaurus + 10;

				$tabLoc[$iCptLoc]->wCodeThesaurus = $wCodeThesaurus;
				$tabLoc[$iCptLoc]->wProfondeur = $wProfondeur;
			}
		
			// on incremente le compteur du tab des locutions
			$iCptLoc++;
		}
	}
	return $tabLoc;
}
?>