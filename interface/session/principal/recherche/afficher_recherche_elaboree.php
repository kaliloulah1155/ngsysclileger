<?php
/*
 * Affichage de l'ecran de recherche par locution pour 
 * un type de document (ou tous types "000")
 * Reaffichage d'une question deja posee
 *
 * Donnees en entree 
 * POS_TYPEDOC : type de document
 * $_REQUEST["INUMQUEST"] : numero de la question
 *
 * Template utilise :
 * REP_TEMPLATE_APPLICATIF."recherche/recherche_elaboree.tpl"
 *
 * Modifications
 * 19.02.2003 GG separation de l'affichage du code rubrique et
 *               de la variable SELECTED
 * 11/04/2003 GG affichage des rubriques tableaux, concatenation du code au libele dans
 *         le cas de libelle identique
 * 11.09.2003 SC ajout de la recherche par thésaurus (IE uniquement)
 * 23.04/2004 SC 
 *              NEW GESTION DES RUB LIEES
 *              NEW GESTION DES RUB TABLEAUX
 *              AJOUT D'OPERATEURS
 *              MODIF POUR LES OPERATEUR SUR LES RUB MULTI
 *              GESTION DES OPERATEURS EN FONCTIONS DES RUB SELECTIONNEES
 * 21.01.2008 PL les variables issues de GET et POST sont recuperees par $_REQUEST              
 *  
 */

include ("../include/locution.inc.php");
if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/get_infoparam.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

// on fixe le nombre de locutions à renseigner lors du premier affichage de la page
$iNbLocAffichees = CST_NB_LOC_RECH_ELA;
if (isset($_REQUEST["INUMQUEST"]) && isset($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]) && count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]) >= CST_NB_LOC_RECH_ELA)
{
    $iNbLocAffichees = count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]) + 2;
}

$tabCodeSpeciauxNum = array("N D", "N P");
$tabLibelleSpeciauxNum = array(CST_LIBELLE_RUB_RECH_NUMDOC, CST_LIBELLE_RUB_RECH_NBFIC);

$tabCodeSpeciauxNumSql = array("NuP");
$tabLibelleSpeciauxNumSql = array(CST_LIBELLE_RUB_RECH_NUMPERES);

if (strcmp($_REQUEST['POS_TYPEDOC'], "") == 0)
{
	afficheMsg(CST_LIBELLE_SEARCH_ELAB_CHOOSE_DOC);
	exit;
}
if (isset($_REQUEST["INUMQUEST"]))
{
    $locutions = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]];
    $sCodeTypeTmp = "";
    for($i=0;$i<count($locutions);$i++)
    {
        if ((strlen($sCodeTypeTmp) != 0 && strcmp($sCodeTypeTmp, trim($locutions[$i]->szCodeType)) != 0) 
                || strcmp($locutions[$i]->szCodeTypeLie, "000") == 0)
        {
            afficheMsg(CST_MESSAGE_NO_AFFICHE_QUESTION_BIB);
            exit;
        }
        else
            $sCodeTypeTmp = trim($locutions[$i]->szCodeType);
    }    
}

//connexion à poseidon
$retour = connexion($jeton);
if ($retour) 
{   
	$file_tpl = REP_TEMPLATE_APPLICATIF."recherche/recherche_elaboree.tpl";
	
	$t = new Template(".");
	$t->set_File("recherche", $file_tpl);
	
	$t->set_var("POS_TYPEDOC", $_REQUEST['POS_TYPEDOC']);
	$t->set_var("POS_NUMLOC", $iNbLocAffichees);
	
	$t->set_var("URL_ACTION_FORM", URL_RESULTAT);
	$t->set_var("URL_ENREG_QUEST", URL_RECHERCHE_ELABOREE_ENREG_QUEST);
	$t->set_var("URL_RESET_FORM", URL_RECHERCHE_ELABOREE);
	$t->set_var("URL_ATTENTE", URL_ATTENTE_RECHERCHE);
		
	$t->set_var("LIBELLE_RECHERCHER", CST_LIBELLE_RECHERCHER);
	$t->set_var("LIBELLE_EFFACER", CST_LIBELLE_EFFA);
	$t->set_var("LIBELLE_ENREG_QUEST", CST_LIBELLE_ENREG_QUESTION);
	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
	
	$t->set_var("LIBELLE_LIEN", CST_LIBELLE_LIEN);
	$t->set_var("LIBELLE_RUBRIQUE", CST_LIBELLE_RUBRIQUE);
	$t->set_var("LIBELLE_OP", CST_LIBELLE_OP);
	$t->set_var("LIBELLE_VALEUR", CST_LIBELLE_VALEUR);	
	$t->set_var("TITRE_RECHERCHE", CST_LIBELLE_TOOLBAR_RECH_ELA);
	
	$t->set_var("LIBELLE_LIE", CST_LIBELLE_ENTETE_COL_LIE);
	$t->set_var("LIBELLE_COLONNE", CST_LIBELLE_ENTETE_COL_COLONNE);
	
	$t->set_var("LIBELLE_LIEN_OU", CST_LIBELLE_LIEN_OU);
	$t->set_var("LIBELLE_LIEN_ET", CST_LIBELLE_LIEN_ET);
	$t->set_var("LIBELLE_LIEN_SAUF", CST_LIBELLE_LIEN_SAUF);
	$t->set_var("LIBELLE_LIEN_ENTRE_CHAMPS", CST_LIBELLE_LIEN_ENTRE_CHAMPS);
	$t->set_var("LANGUE", $_SESSION["sess_langue"]);
	$t->set_var("POS_TYPE_BDD", $_SESSION["sess_obj_infos_appli"]->dwTypeBDD);
				
	$t->set_var("NB_LOC_AFFICHEES", $iNbLocAffichees);
	$t->set_var("MESSAGE_CONFIRM_SUPPRESSION_LOC", CST_MESS_CONFIRM_SUPPRESSION_LOC);
    $t->set_var("CST_LIBELLE_MANQUE_VALEUR1", CST_LIBELLE_MANQUE_VALEUR1);
    $t->set_var("CST_LIBELLE_MANQUE_VALEUR2", CST_LIBELLE_MANQUE_VALEUR2);
    $t->set_var("CST_LIBELLE_MANQUE_RUBRIQUE", CST_LIBELLE_MANQUE_RUBRIQUE);
	$t->set_var("MESSAGE_SAISIE_PARENTHESE", CST_MESS_SAISIE_PARENTHESE);
    $t->set_var("JOKER_1CARACTERE", ($_SESSION["sess_obj_infos_appli"]->dwTypeBDD == PHP_VULCAIN_TYPE_BDD_DISAM) ? "?" : "_");
    $t->set_var("JOKER_MANYCARACTERES", ($_SESSION["sess_obj_infos_appli"]->dwTypeBDD == PHP_VULCAIN_TYPE_BDD_DISAM) ? "*" : "%");
    
    // affichage des libellés des opérateurs
    $tabDefine = get_defined_constants(true);
    $prefixLibelle = "CST_LIBELLE_OPE_";
    foreach($tabDefine['user'] as $code => $valeur)
    {
        if(strpos($code, $prefixLibelle) === 0)
        {
            $t->set_var($code, $valeur);
        }
    }
    			
	// Définition des blocs.
	$t->set_block("recherche", "LOC_RUB", "loc_rub");
	$t->set_block("recherche", "LOC_LIEN", "locution_lien");
	$t->set_block("recherche", "LOC_LIEN_0", "locution_lien_0");
	$t->set_block("recherche", "LOCUTION", "locution");
	$t->set_block("recherche", "LIEN_RUB_TYPE_THESAURUS", "lien_rub_type_thesaurus");
	$t->set_block("recherche", "RUB_THESAURUS", "rub_thesaurus");
	$t->set_block("recherche", "RUB_DATE", "rub_date");
	$t->set_block("recherche", "RUB_NUM", "rub_num");
	$t->set_block("recherche", "RUB_TABLEAU", "rub_tableau");
	$t->set_block("recherche", "RUB_MULTI", "rub_multi");
	$t->set_block("recherche", "COL_RUB_LIE", "col_rub_lie");
	$t->set_block("recherche", "RUB_LIE", "rub_lie");
	$t->set_block("recherche", "RUB_FTX", "rub_ftx");
    $t->set_block("recherche", "RUB_TYPE_FTX", "rub_type_ftx");
    if (isset($_REQUEST['POS_QUEST_NOM']) && strlen($_REQUEST['POS_QUEST_NOM']) != 0)
    {
        $t->set_var("POS_QUEST_NOM", stripslashes(urldecode($_REQUEST['POS_QUEST_NOM'])));
        $t->set_var("LIBELLE_TITRE_QUEST", CST_LIBELLE_TITRE_QUEST);
        $t->set_var("DISPLAY_TITRE_QUEST", "");
    }
    else
        $t->set_var("DISPLAY_TITRE_QUEST", "none");
	
    $bExistRubLie = false;
	// Gestion de la recherche tous types.
	if(strcmp($_REQUEST['POS_TYPEDOC'], "000") == 0)
	{
		$retour = pos_getlistallrubrmc($jeton, /*pref*/$tabLibRub);
	}
	else
	{
		// liste des rubriques du type de document
		$retour = pos_getlistrubintypermc($jeton, $_REQUEST['POS_TYPEDOC'], /*pref*/$tabLibRub);
		if ($retour)
		{
			$retour = pos_getrubriquetype($jeton, $_REQUEST['POS_TYPEDOC'], /*pref*/$tabInfoRubInType);
            if ($retour)
			{
			    // parcourt de toutes les rubriques du type
			    for($i=0;$i<count($tabInfoRubInType);$i++)
			    {
					if (strlen($tabInfoRubInType[$i]->szTypeLie) != 0 &&
						strcmp($tabInfoRubInType[$i]->szTypeLie, "000") != 0)
					{
						$bExistRubLie = true;
						// recuperer toutes les rubriques du type de document lie
						$szCodeTypeLie = $tabInfoRubInType[$i]->szTypeLie;
						if (!isset($_SESSION["sess_tabrubintype"][$szCodeTypeLie])) 
						{
						    $sessTabRubintypeLie = array();
							$retour = pos_getlistrubintype($jeton, $tabInfoRubInType[$i]->szTypeLie, /*pref*/$sessTabRubintypeLie);
                            $_SESSION["sess_tabrubintype"][$szCodeTypeLie] = $sessTabRubintypeLie;
						}
						else
							reset($_SESSION["sess_tabrubintype"][$szCodeTypeLie]);
						
                        asort($_SESSION["sess_tabrubintype"][$szCodeTypeLie]);
						$t->set_var("CODE_RUB", $tabInfoRubInType[$i]->szRubrique);
						$t->set_var("TYP_DOC_LIE", $szCodeTypeLie);
                        foreach($_SESSION["sess_tabrubintype"][$szCodeTypeLie] as $szCodeRubLiee => $szLibelleRubLiee)
						{
						    $t->set_var("CODE_RUB_LIE", $szCodeRubLiee);
						    $t->set_var("LIBELLE_RUB_LIE", $szLibelleRubLiee);
						    
						    $t->parse("col_rub_lie", "COL_RUB_LIE", true);	    
						}
						
						$t->parse("rub_lie", "RUB_LIE", true);
						$t->set_var("col_rub_lie", "");
					}
                    
                    if ($tabInfoRubInType[$i]->bFullTexte > 0)
                    {
                    	$t->set_var("CODE_RUB_TYPE_FTX", $tabInfoRubInType[$i]->szRubrique);
				        $t->parse("rub_type_ftx", "RUB_TYPE_FTX", true);
                    }

				}
			}
			else
				debug($jeton);	
		}
	}
	
	if (!$bExistRubLie)
		$t->set_var("rub_lie", "");
	
	if($retour)
	{
        //Initialisation des tableaux 
		$tabRubThesaurus = array();
		$tabRubMultiCritere = array();
		$tabRubTableau = array();
		$tabRubDate = array();
		$tabRubNum = array();
		$tabCodeRubTheThesaurus = array();
		
		$bFullText = 0;
		if(strcmp($_REQUEST['POS_TYPEDOC'], "000") == 0)
		    $t->set_var("TITRE_TYPEDOC", CST_LIBELLE_RECH_000);
		else
		{
            $retour = get_infotypecache($jeton, $_REQUEST["POS_TYPEDOC"], /*pref*/$objInfoType, /*pref*/$tabInfoZonesKeys);	
            if($retour)
            {
            	$bFullText = $objInfoType->wFullTexte;
                $t->set_var("TITRE_TYPEDOC", $objInfoType->libelle);
            }
            else
                debug($jeton);                                      
        }
        		
		// recuperation du parametrage de toutes les rubriques
		$retour = pos_getrubrique($jeton, "", /*pref*/$tabInfoRub);
		if ($retour)
		{
			// recuperation de la structure info rubrique
			// pour savoir la nature des rubriques (tableau, thesaurus, multicritère,...)
			for($i=0;$i<count($tabInfoRub);$i++)
			{
				if($tabInfoRub[$i]->bThesaurus == true)
				{
					$tabCodeRubTheThesaurus[$tabInfoRub[$i]->szRubrique] = $tabInfoRub[$i]->szCodeThesaurus;
					$tabRubThesaurus[] = $tabInfoRub[$i]->szRubrique;
				}
				
				// tableau
				if($tabInfoRub[$i]->wTypeRub == 3)
					$tabRubTableau[] = $tabInfoRub[$i]->szRubrique;
				//date
				elseif($tabInfoRub[$i]->wTypeRub == 2)
					$tabRubDate[] = $tabInfoRub[$i]->szRubrique;
				// numérique ou decimale
				elseif($tabInfoRub[$i]->wTypeRub == 1 || $tabInfoRub[$i]->wTypeRub == 4)
					$tabRubNum[] = $tabInfoRub[$i]->szRubrique;
				else if($tabInfoRub[$i]->bMonoCritere != true)
					$tabRubMultiCritere[] = $tabInfoRub[$i]->szRubrique;
			}
		}
		else
			debug($jeton);
				
		// Tri du tableau des rubriques par libelle
		asort($tabLibRub);	
        
        // liste des rubriques tableaux pas en tous types
		if(count($tabRubTableau) > 0)
	    {
			for($i=0;$i<count($tabRubTableau);$i++)
		    {
				$t->set_var("CODE_TAB", $tabRubTableau[$i]);
				$t->parse("rub_tableau", "RUB_TABLEAU", true);
                
                // si on est en tous types, il faut mettre à jour les rubriques liees correspondantes
                // mauvaise nouvelle : on n'a pas la fonction qui ramène à quels type appartient une rubrique
                // on suppose qu'une rubrique tableau sera tjs liée au même type ce qui parait évident mais pas bloqué dans le paramétrage 
                if(strcmp($_REQUEST['POS_TYPEDOC'], "000") == 0)
                {
                    $sFirstCodeType = "";
                    $sCodeTypeLieTmp = "";
                    $sCodeRubLieeTmp = "";
                    //echo "Code : {$tabRubTableau[$i]}<br>";
                    $retour = pos_getlistalltypes($jeton, /*pref*/$tabListeTypeDoc);
        			foreach ($tabListeTypeDoc as $codeType => $libelle)
        			{
                        //echo "Code : $codeType :: $libelle<br>";
        				$retour = pos_getlistrubintype($jeton, $codeType, /*pref*/$tabCodeLibRub);
                        // la rubrique tableau appartient au paramétrage du type
    					if (isset($tabCodeLibRub[$tabRubTableau[$i]]))
    					{
                            $sFirstCodeType = $codeType;
    						$retour = pos_getrubriquetype($jeton, $sFirstCodeType, /*pref*/$tabInfoRubInTypeTmp1);
                            for($k=0;$k<count($tabInfoRubInTypeTmp1);$k++)
            			    {
                                //echo "Coderubrique : {$tabInfoRubInTypeTmp1[$k]->szRubrique}<br>";
                                if (strcmp($tabInfoRubInTypeTmp1[$k]->szRubrique, $tabRubTableau[$i]) == 0)
                                {
                                    $sCodeTypeLieTmp = $tabInfoRubInTypeTmp1[$k]->szTypeLie;
                                    $sCodeRubLieeTmp = $tabInfoRubInTypeTmp1[$k]->szRubLie;
                                    break;
                                }
                            }
                            break;
    					}
        			}
                    
                    if (strlen($sCodeTypeLieTmp) != 0 && strlen($sCodeRubLieeTmp) != 0)
                    {
                        // recuperer toutes les rubriques du type de document lie
    					if (!isset($_SESSION["sess_tabrubintype"][$sCodeTypeLieTmp])) 
    					{
    					   $sessTabRubintypeLie =  array();
                           $retour = pos_getlistrubintype($jeton, $sCodeTypeLieTmp, /*pref*/$sessTabRubintypeLie);
                           $_SESSION["sess_tabrubintype"][$sCodeTypeLieTmp] = $sessTabRubintypeLie;
    					}
    					else
    					   reset($_SESSION["sess_tabrubintype"][$sCodeTypeLieTmp]);
    						
                        asort($_SESSION["sess_tabrubintype"][$sCodeTypeLieTmp]);
    					$t->set_var("CODE_RUB", $tabRubTableau[$i]);
    					$t->set_var("TYP_DOC_LIE", $sCodeTypeLieTmp);
						while (list($szCodeRubLiee, $szLibelleRubLiee) = each($_SESSION["sess_tabrubintype"][$sCodeTypeLieTmp]))
						{
						    $t->set_var("CODE_RUB_LIE", $szCodeRubLiee);
						    $t->set_var("LIBELLE_RUB_LIE", $szLibelleRubLiee);
						    $t->parse("col_rub_lie", "COL_RUB_LIE", true);	    
						}
						
						$t->parse("rub_lie", "RUB_LIE", true);
						$t->set_var("col_rub_lie", "");   
                    }
                }
            }
		}
		else
		    $t->set_var("rub_tableau", "");
		
		// s'il y a des rubriques thésaurus
		if(count($tabRubThesaurus) > 0)
		{
            foreach($tabCodeRubTheThesaurus as $key => $valeur)
			{
				$t->set_var("CODE_RUB_THES", $key);
				$t->set_var("CODE_TYPE_THES", $valeur);
				$t->parse("lien_rub_type_thesaurus", "LIEN_RUB_TYPE_THESAURUS", true);
			}
			
			for($i=0;$i<count($tabRubThesaurus);$i++)
			{
				$t->set_var("CODE_THES", $tabRubThesaurus[$i]);
				$t->set_var("CPT", $i);
				
				$t->parse("rub_thesaurus", "RUB_THESAURUS", true);
			}
		}
		else
		{
    		$t->set_var("rub_thesaurus", "");
    		$t->set_var("lien_rub_type_thesaurus", "");
		}
				
		// liste de rubrique multi-critère
		if(count($tabRubMultiCritere) > 0)
		{
		    for($i=0;$i<count($tabRubMultiCritere);$i++)
			{
				$t->set_var("CODE_RUB_MULTI", $tabRubMultiCritere[$i]);
				$t->parse("rub_multi", "RUB_MULTI", true);
			}
		}
		else
    		$t->set_var("rub_multi", "");
		
		// liste de rubrique date
		if(count($tabRubDate) > 0)
		{
		    for($i=0;$i<count($tabRubDate);$i++)
			{
				$t->set_var("CODE_RUB_DATE", $tabRubDate[$i]);
				$t->set_var("CPT", $i);
				
				$t->parse("rub_date", "RUB_DATE", true);
			}
		}
		else
    		$t->set_var("rub_date", "");
		
		// liste des rubriques numériques
	    for($i=0;$i<count($tabRubNum);$i++)
		{
			$t->set_var("CODE_RUB_NUM", $tabRubNum[$i]);
			$t->parse("rub_num", "RUB_NUM", true);
		}
		for($j=0;$j<count($tabCodeSpeciauxNum);$j++)
		{
			$t->set_var("CODE_RUB_NUM", $tabCodeSpeciauxNum[$j]);
			$t->parse("rub_num", "RUB_NUM", true);
		}
		if ($_SESSION["sess_obj_infos_appli"]->dwTypeBDD != PHP_VULCAIN_TYPE_BDD_DISAM)
		{
			for($j=0;$j<count($tabCodeSpeciauxNumSql);$j++)
			{
				$t->set_var("CODE_RUB_NUM", $tabCodeSpeciauxNumSql[$j]);
				$t->parse("rub_num", "RUB_NUM", true);
			}
		}
        
        if($bFullText > 0 &&  $_SESSION["sess_obj_infos_appli"]->wFullTexte > 0)
		{
			$t->set_var("CODE_RUB_FTX", "F X");
			$t->parse("rub_ftx", "RUB_FTX", true);
            $t->set_var("CODE_RUB_FTX", "FtX");
			$t->parse("rub_ftx", "RUB_FTX", true);
            $t->set_var("CODE_RUB_FTX", "FrX");
			$t->parse("rub_ftx", "RUB_FTX", true);
		}
		else
			$t->set_var("rub_ftx", "");

		// boucle sur le nombre locution à renseigner.
		for ($i=0; $i<$iNbLocAffichees; $i++)
		{
			$t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
			$t->set_var("i", $i);
			$t->set_var("NUM_LOC", $i);
		
			// Pour réaffichage d'une locution.
			if (isset($_REQUEST["INUMQUEST"]) && isset($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]))
			{
	   		    $iValLien = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wTypeLien;
				$szRubLocution =  $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szCodeRub;
				$iOpLocution = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->cOperateur;
				$iNbParOuv = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wNbParDeb;
				$iNbParFer = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wNbParFin;
				$szValeurLoc = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szValeur1;
				$szValeur2Loc = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szValeur2;
				$szCodeRubLie = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szCodeRubLie;
            	
            	// Gestion du thésaurus
            	if(isset($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wProfondeur))
            		$wProfondeur = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wProfondeur;
            	
            	if(isset($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wCodeThesaurus) &&
		  				$_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wCodeThesaurus >= 10)
            		$szThesSynonymeChecked = "CHECKED";
        		else
            		$szThesSynonymeChecked = "";
            		
            	$iValCodeThesaurus = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wCodeThesaurus;
            	
            	$iValLienRubMulti = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->wTypeLienMulti;
            	// affichage de la croix pour suppression de locution
            	$szDisplaySuppLoc = "";
			}
			else
			{
	   			$iValLien = 0;
				$szRubLocution = "";
				$iOpLocution = '';
				$iNbParOuv = 0;
				$iNbParFer = 0;
				$szValeurLoc = "";
				$szValeur2Loc = "";
				$wProfondeur = 0;
				$szThesSynonymeChecked = "";
				$iValCodeThesaurus = 0;
				$iValLienRubMulti = 0;
				$szCodeRubLie = "";
				// affichage de la croix pour suppression de locution
				$szDisplaySuppLoc = "none";
			}

			$t->set_var("DISPLAY_SUPP_LOC", $szDisplaySuppLoc);
			
			// Gestion du champ lien.
		   //----------------------
		   // Si il s'agit de la première locution (lien "OU" obligatoire),
		   // le champ du formulaire dans le tpl associé
		   // n'est pas un SELECT mais un INPUT de type "hidden".
			if ($i > 0)
			{ 
        		// on vide le bloc LOC_LIEN
        		$t->set_var("locution_lien", "");
        		for ($j=1; $j<=3; $j++)
        		{
					$szVarSelected = "LIEN_SELECTED_".$j;
					$t->set_var($szVarSelected, ($j == $iValLien) ? "SELECTED" : "");
				}
           	    $t->parse("locution_lien", "LOC_LIEN", false);
        		$t->set_var("locution_lien_0", "");
			}
			else
			{
           		$t->parse("locution_lien_0", "LOC_LIEN_0", false);
        		$t->set_var("locution_lien", "");
			}
		        
			// Gestion du champ rubrique.
			//--------------------------
			// On boucle sur toutes les rubriques de la fiche.
			$t->set_var("loc_rub", "");
			$bPrevValIdentique = 0;

			for($j=0;$j<count($tabCodeSpeciauxNum);$j++)
			{
				$t->set_var("SELECTED", strcmp($tabCodeSpeciauxNum[$j], $szRubLocution) == 0 ? "SELECTED" : "");
				$t->set_var("CODE_RUB", $tabCodeSpeciauxNum[$j]);
				$t->set_var("LIBELLE_RUB", $tabLibelleSpeciauxNum[$j]);
				$t->parse("loc_rub", "LOC_RUB", true);
			}
			
			if ($_SESSION["sess_obj_infos_appli"]->dwTypeBDD != PHP_VULCAIN_TYPE_BDD_DISAM)
		    {
    			for($j=0;$j<count($tabCodeSpeciauxNumSql);$j++)
    			{
    				$t->set_var("SELECTED", strcmp($tabCodeSpeciauxNumSql[$j], $szRubLocution) == 0 ? "SELECTED" : "");
    				$t->set_var("CODE_RUB", $tabCodeSpeciauxNumSql[$j]);
    				$t->set_var("LIBELLE_RUB", $tabLibelleSpeciauxNumSql[$j]);
    				$t->parse("loc_rub", "LOC_RUB", true);
    			}
            }
			
			if($bFullText > 0 && $_SESSION["sess_obj_infos_appli"]->wFullTexte > 0)
			{
				$t->set_var("SELECTED", strcmp("F X", $szRubLocution) == 0 ? "SELECTED" : "");
				$t->set_var("CODE_RUB", "F X");
				$t->set_var("LIBELLE_RUB", CST_LIBELLE_RUB_RECH_FICHIERS);
				$t->parse("loc_rub", "LOC_RUB", true);
                
                $t->set_var("SELECTED", strcmp("FrX", $szRubLocution) == 0 ? "SELECTED" : "");
				$t->set_var("CODE_RUB", "FrX");
				$t->set_var("LIBELLE_RUB", CST_LIBELLE_RUB_RECH_FTX_INDEX);
				$t->parse("loc_rub", "LOC_RUB", true);
                
                $t->set_var("SELECTED", strcmp("FtX", $szRubLocution) == 0 ? "SELECTED" : "");
				$t->set_var("CODE_RUB", "FtX");
				$t->set_var("LIBELLE_RUB", CST_LIBELLE_RUB_RECH_FTX_FICHIERS_ET_INDEX);
				$t->parse("loc_rub", "LOC_RUB", true);
			}

            foreach($tabLibRub as $key => $valeur)
			{				
				// Pour reaffichage d'une locution.
				$t->set_var("SELECTED", strcmp($key, $szRubLocution) == 0 ? "SELECTED" : "");
				$t->set_var("CODE_RUB", $key);

				$nextVal = current($tabLibRub);
				// concatenation libelle (code) si le libelle est identique au suivant
				// ou si le libelle precedent etait identique
				if (strcmp($valeur, $nextVal) == 0 || $bPrevValIdentique)
				{
					$t->set_var("LIBELLE_RUB", $valeur." (".$key.")");
					if ($bPrevValIdentique && strcmp($valeur, $nextVal) != 0)
						$bPrevValIdentique = 0;
					else
						$bPrevValIdentique = 1;
				}
				else
					$t->set_var("LIBELLE_RUB", $valeur);
				// retour a l'element courant
				// prev($tabLibRub);
						
				$t->parse("loc_rub", "LOC_RUB", true);
			}
			
			// on remet à zéro le pointeur du tableau pour la prochaine itération
			reset($tabLibRub);
				
			// Gestion du champ operateur.
			//---------------------------
			// Pour reaffichage d'une locution.
            $t->set_var("OPERATEUR_SELECTED", $iOpLocution);
					
			// Parenthese debut.
			$t->set_var("POS_NB_PAR_OUV", $iNbParOuv);
			// on remplis le champ de parenthese.
			$szParOuv = "";
			for($nbPar=0; $nbPar<$iNbParOuv; $nbPar++)
			{
				$szParOuv .= "(";
			}
			$t->set_var("PAR_OUV", $szParOuv);
				
			// Parenthese fin.
			$t->set_var("POS_NB_PAR_FER", $iNbParFer);
			// on remplis le champ de parenthese.
			$szParFer = "";
			for($nbPar=0; $nbPar<$iNbParFer; $nbPar++)
			{
				$szParFer .= ")";
			}
			$t->set_var("PAR_FER", $szParFer);

			// Gestion du champ valeur.
		   	//------------------------
			// pour réaffichage d'une locution
			$t->set_var("LOC_VAL_VALUE", htmlentities_currentcharset($szValeurLoc, ENT_QUOTES));
			
			// Gestion du champ valeur 2.
		   	//------------------------
		   	$t->set_var("LOC_VAL2_VALUE", htmlentities_currentcharset($szValeur2Loc, ENT_QUOTES));
		   	
			// display des valeurs 2
			if(strlen($szValeur2Loc) > 0)
                $t->set_var("DISPLAY_VAL2", "display:yes");
            else
    			$t->set_var("DISPLAY_VAL2", "display:none");
			
			
			//---------------------
			// Gestion du thésaurus
			//---------------------
			
			// Champ Profondeur
			$t->set_var("LOC_PFDTHES_VALUE", $wProfondeur);
			// Synonyme
			$t->set_var("LOC_SYNTHES_CHECKED", $szThesSynonymeChecked);
			
			// Code Thésaurus
			$iValCodeThesaurusTmp = ($iValCodeThesaurus >= 10) ? ($iValCodeThesaurus - 10) : $iValCodeThesaurus;
			$szVarCodeThesaurus = "SELECTED_".$iValCodeThesaurusTmp;
			
			$t->set_var($szVarCodeThesaurus, "SELECTED");
			
			if($iValCodeThesaurusTmp > 0 || strcmp($szThesSynonymeChecked,"CHECKED")==0)
				$t->set_var("DISPLAY", "display:yes");
			else		
				$t->set_var("DISPLAY", "display:none");
			
			// Gestion du lien des rubriques multicritères
            $szRubPourAfficheLien = strlen($szCodeRubLie) != 0 ?  $szCodeRubLie : $szRubLocution;
			if(in_array($szRubPourAfficheLien, $tabRubMultiCritere, TRUE) && $iValLienRubMulti > 0)
				$t->set_var("DISPLAY_LIEN_MULTI", "display:yes");
			else		
				$t->set_var("DISPLAY_LIEN_MULTI", "display:none");

    		for ($j=1; $j<=3; $j++)
    		{
				$szVarSelected = "LIEN_MULTI_SELECTED_".$j;
				$t->set_var($szVarSelected, ($j == $iValLienRubMulti) ? "SELECTED" : "");
			}
			
			// Gestion des rub liées
			//----------------------
			// Cette partie reseigne juste une variable qui va nous permettre 
			// de positionner la bonne colonne lié.
			// la gestion du display est géré par le lancement d'une fonction javascript.
			$t->set_var("RUB_LIE_SELECTED", $szCodeRubLie);
			$t->set_var("DISPLAY_RUB_LIE", "display:none");
			$t->set_var("DISPLAY_RUB_TAB", "display:none");
			
			$t->parse("locution", "LOCUTION", true);
			
			// pour pas que la valeur soit répétée sur les locutions suivantes.
			$t->set_var($szVarCodeThesaurus, "");
		}
		$t->pparse("MyOutput", "recherche");
	}
	else
	{	
		debug ($jeton);
	}
	// Déconnexion poseidon.
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
