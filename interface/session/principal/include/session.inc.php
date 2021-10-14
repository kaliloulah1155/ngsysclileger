<?php
include ("../include/fonction_util.inc.php");
include ("../include/get_menu.php");
if (!defined("SESSION_INC"))
{
	define("SESSION_INC",1);
	define("POS_DRT_ADMIN_USER", 0x00000001);
	define("POS_DRT_ADMIN_DF", 0x00000004);
	define("POS_DRT_ADMIN_LH", 0x00000002);

	function initSessionUtil($jeton, $objInfoUtil) 
	{
	    $_SESSION["sess_nbclient"] = 1;
		$_SESSION["sess_tab_doc_en_modif"] = array();
        $_SESSION["sess_tab_arbo"] = array();
        
        // Mise en session de la question pour enreg de la question de la bib.
        $_SESSION["sess_tab_enreg_quest_bib"] = array();
        
        // Nombre de réponses pour chaque question de la bal
        // tableau associatif $_SESSION["sess_tab_reponses_bal"]["code_bal"] = <nombre de rep>
        $_SESSION["sess_tab_reponses_bal"]  = array();
        
        // tableau associatif $_SESSION["sess_tabrubintype"]["code_type"] = tableau de code/libelle des rubriques
        $_SESSION["sess_tabrubintype"] = array();
        
		$_SESSION["sess_droitModification"] = $objInfoUtil->wModifier;
		$_SESSION["sess_droitConsultation"] = $objInfoUtil->bConsulter;
		$_SESSION["sess_droitIndexation"] = $objInfoUtil->bIndexer;
		$_SESSION["sess_droitSuppression"] = $objInfoUtil->bSuppDoc;
		$_SESSION["sess_droitAdministration"] = $objInfoUtil->bAdministrer;
		$_SESSION["sess_droitThesaurus"] = $objInfoUtil->bThesaurus;
		$_SESSION["sess_service"]  = trim($objInfoUtil->szService);
		$_SESSION["sess_fonction"] = trim($objInfoUtil->szFonction);
		$_SESSION["sess_profil"] = trim($objInfoUtil->szProfil);
		$_SESSION["sess_profil_fi_param"] = trim($objInfoUtil->szProfilFIP);
		$_SESSION["sess_libelle_nom_util"] = trim($objInfoUtil->szNomUtil);
        // Les types de document autorisés en recherche et en indexation
        // NB : si le tableau est vide, pas de restriction
		$_SESSION["sess_liste_doc_indexables"] = $objInfoUtil->liste_types_indexables;
		$_SESSION["sess_liste_doc_recherchables"] = $objInfoUtil->liste_types_recherchables;
		$_SESSION["sess_droitAdminProfilLR"] = $objInfoUtil->bProfilLR;
		$_SESSION["sess_droitGestDossier"] = $objInfoUtil->bDossier;
		$_SESSION["sess_listeCloison"] = $objInfoUtil->szListeCloison;
		$_SESSION["sess_MajRafale"] = $objInfoUtil->bMajRafale;
		$_SESSION["sess_organisation"] = trim($objInfoUtil->szOrganisation);
		$_SESSION["sess_unite"] = trim($objInfoUtil->szUnite);

		if((POS_DRT_ADMIN_USER & $objInfoUtil->dwDroitAdmin))
			$_SESSION["sess_droitAdminUtilisateur"] = true;
		else
			$_SESSION["sess_droitAdminUtilisateur"] = false;
		
		if((POS_DRT_ADMIN_DF & $objInfoUtil->dwDroitAdmin) == 4)
			$_SESSION["sess_droitGestDomainFerme"] = true;
		else
			$_SESSION["sess_droitGestDomainFerme"] = false;	
			
		if((POS_DRT_ADMIN_LH & $objInfoUtil->dwDroitAdmin) == 2)
			$_SESSION["sess_droitGestListHier"] = true;
		else
			$_SESSION["sess_droitGestListHier"] = false;	

		if($objInfoUtil->bThesaurus)
			$_SESSION["sess_droitThesaurus"] = true;
		else
			$_SESSION["sess_droitThesaurus"] = false;	

        // Le tableau des questions de l'historique
        // Structure du tableau
        // $_SESSION["sess_tabHistQuest"][0][$i] -> le tableau des locutions contenant la question d'indice i
        // $_SESSION["sess_tabHistQuest"][1][$i] -> le nombre de réponses à la question d'indice i
        // $_SESSION["sess_tabHistQuest"][2][$i] -> l'heure à laquelle la question d'indice i a été posée
        // $_SESSION["sess_tabHistQuest"][3][$i] -> le type de la recherche d'indice i
		$_SESSION["sess_tabHistQuest"] = array();
		$_SESSION["sess_tabHistThes"] = array();
		$_SESSION["sess_tab_doc_historique"] = array();
		$_SESSION["sess_tabPanier"] = array();

		$retour = pos_getappliid($jeton, /*pref*/$szAppliId);
		$_SESSION["sess_appliid"] = $szAppliId[0];
		
		$retour = pos_getlistalltypes($jeton, /*pref*/$tabListeType);
		$_SESSION["sess_tabLibTypeDoc"] = $tabListeType;

		$retour = pos_bib_getlistequestions($jeton, /*pref*/$tabQuestBibPriv, /*pref*/$tabQuestBibPub);
		$_SESSION["sess_tabQuestBibPub"] = $tabQuestBibPub;
		$_SESSION["sess_tabQuestBibPriv"] = $tabQuestBibPriv;
        // ajout fichiers et docs consultes a la liste pour marquer comme vu
        $_SESSION["sess_tab_doc_histo_doc_et_fichier"] = array();
		
		$_SESSION["sess_tabInfoType"] = array();
		$_SESSION["sess_tabInfoTypeKH"] = array();

        $tab_bal = array();
        $tab_bal_assoc_libelle = array();
		if(defined('CST_CHARGEMENT_BAL_XML') && strcmp(CST_CHARGEMENT_BAL_XML, "1") == 0)
		{
            // --------------------------------
            // chargement des bals en XML
            // --------------------------------
            // Utilisateur et profil par défaut
            $szUtilisateur = $_SESSION["sess_user_name"];
            $szProfil = $_SESSION["sess_profil"];
            $ficBal = getRepTmpSession(session_id())."bal.xml";
            $szNomFichier = "";
            
            $retour = pos_getficbalxml($jeton, $szUtilisateur, $szProfil, $ficBal, /*pref*/$szNomFichier);
            //if (!$retour)
            //    debug($jeton);
            //$ficBal = "../../../../configuration/bal_".$_SESSION["sess_application"].".xml";
            $tabBalNiveau1 = array();
            // On vérifie que le fichier existe
            if($retour && file_exists($ficBal) && filesize($ficBal) > 0)
            {
                $ficBalXml = simplexml_load_file($ficBal);
                $tabFilsNiveau1 = $ficBalXml->children();
                $iNbBal = 0;
                // parcourt les fils principaux
                for($i=0;$i<count($tabFilsNiveau1);$i++)
                {
                    $isOpen = sprintf("%s", $tabFilsNiveau1[$i]->open);
                    $isOpen = (strcmp($isOpen, "1") == 0 || strcmp($isOpen, "OUI") == 0) ? 1 : 0;
                    $szLibrairie = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->librairie));
                    $szBal = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->bal));
                    $szLibelle = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->libelle));
                    $szProfil = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->profil));
                    $szIcone = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->icone));
                    $szStyleBal = sprintf("%s", utf8_decode($tabFilsNiveau1[$i]->style));
                    
                    if (strcmp($tabFilsNiveau1[$i]->attributes()->type, "titre") == 0)
                    {
                        $tab_bal[$iNbBal] = new Bal11(TYPE_TITRE, $isOpen, 
                                $szLibrairie, $szBal,
                                $szLibelle, $szProfil, $szIcone, $szStyleBal);
                        
                        $tabFilsNiveau2 = $tabFilsNiveau1[$i]->listefils->children();
                        $tabBalNiveau2 = array();
                        $iNbSousBal = 0;
                        for($j=0;$j<count($tabFilsNiveau2);$j++)
                        {
                            // un titre <regroupement>
                            $isOpen = sprintf("%s", $tabFilsNiveau2[$j]->open);
                            $isOpen = (strcmp($isOpen, "1") == 0 || strcmp($isOpen, "OUI") == 0) ? 1 : 0;
                            $szLibrairie = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->librairie));
                            $szBal = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->bal));
                            $szLibelle = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->libelle));
                            $szProfil = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->profil));
                            $szIcone = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->icone));
                            $szStyleSsBal = sprintf("%s", utf8_decode($tabFilsNiveau2[$j]->style));
                            
                            if (strcmp($tabFilsNiveau2[$j]->attributes()->type, "bal") == 0)
                            {
                                $tabBalNiveau2[$iNbSousBal++] = new Bal11(TYPE_BAL, $isOpen, 
                                        $szLibrairie, $szBal,
                                        $szLibelle, $szProfil, $szIcone, $szStyleSsBal);
                                $tab_bal_assoc_libelle[$szLibrairie] = $szBal;
                            }
                        }
                        $tab_bal[$iNbBal]->tabListeFils = $tabBalNiveau2;
                        $iNbBal++;
                    }
                    else if (strcmp($tabFilsNiveau1[$i]->attributes()->type, "bal") == 0)
                    {
                        $tab_bal[$iNbBal++] = new Bal11(TYPE_BAL, $isOpen, 
                            $szLibrairie, $szBal,
                            $szLibelle, $szProfil, $szIcone, $szStyleBal);
                    
                        $tab_bal_assoc_libelle[$szLibrairie] = $szBal;
                    }
                }
            }
        }
        else
        {
        	$retour = pos_bib_getlistequestionsbal($jeton, /*pref*/$tabBAL);
    	    if ($retour)
    	    {
                for($i=0;$i<count($tabBAL);$i++)
                {
                	$tab_bal[$i] = new Bal($tabBAL[$i]);
                	$tab_bal_assoc_libelle[$tab_bal[$i]->szCode] = $tab_bal[$i]->szLibelle;
                	
        			// pas de recherche sur les resolutions de variables : peut prendre du temps
                }
            }
        }
        //error_log(print_r($tab_bal, true));
        
        $_SESSION["sess_tab_bal"] = $tab_bal;
        $_SESSION["sess_tab_bal_assoc_libelle"] = $tab_bal_assoc_libelle;
        

        // gestion des plans de classement		
		$_SESSION["sess_tab_plan_classement"] = array();
        // bloc de resultat des questions
        $ficPlanClassement = "../../../../configuration/".get_nom_fic_planclassement($_SESSION["sess_application"], $_SESSION["sess_user_name"], 
                $_SESSION["sess_service"], $_SESSION["sess_fonction"], $_SESSION["sess_profil"]);
        // On vérifie que le fichier existe
        if(file_exists($ficPlanClassement))
        {
            $iNbPlanClassement = 0;
            // Lecture du fichier.
            $tabIniPlan = parse_ini_file($ficPlanClassement, true);
            if (isset($tabIniPlan["GENERAL"]["NB_PLANS_CLASSEMENT"]))
                $iNbPlanClassement = $tabIniPlan["GENERAL"]["NB_PLANS_CLASSEMENT"];
            for($i=0;$i<$iNbPlanClassement;$i++)
            {
                $szCodePlan = "PLAN_CLASSEMENT_".$i;
                $_SESSION["sess_tab_plan_classement"][$i]["code_plan"] = $szCodePlan;
                $_SESSION["sess_tab_plan_classement"][$i]["titre_plan"] = $tabIniPlan["PLAN_CLASSEMENT_".$i]["TITRE"];
                $_SESSION["sess_tab_plan_classement"][$i]["code_question_plan"] = $tabIniPlan["PLAN_CLASSEMENT_".$i]["CODE_QUESTION"];
                $_SESSION["sess_tab_plan_classement"][$i]["open"] = (strcmp($tabIniPlan["PLAN_CLASSEMENT_".$i]["OPEN"], "1") == 0) ? true : false;
                
                $tab_rep_ratp = array();
                if ($_SESSION["sess_tab_plan_classement"][$i]["open"])
                {
                    $retour = getTabRepPlanClassement($jeton, $_SESSION["sess_tab_plan_classement"][$i]["code_question_plan"], /*pref*/$tab_rep_ratp);
                }
                $_SESSION["sess_tab_rep_".$szCodePlan] = $tab_rep_ratp;
            }
        }
        
        // informations sur l'application
        $retour = pos_getinfoappli($jeton, /*pref*/$objInfoAppli);
        $_SESSION["sess_obj_infos_appli"] = $objInfoAppli;
                
        // le panier
        $_SESSION["sess_nb_elts_panier"] = 0;
        if (defined('GESTION_PANIER_DOSSIER') && GESTION_PANIER_DOSSIER == 1)
        {
            include ("../include/locution.inc.php");
            include ("../panier/fct_panier.inc.php");
            // recherche du dossier PANIER
            $iNumDossierPanier = getNumDocPanier($jeton);
            if ($iNumDossierPanier != 0)
            {
                $tabFils = array();
                $retour = pos_dosinfocontenu($jeton, $iNumDossierPanier, /*pref*/$tabFils);
                $_SESSION["sess_nb_elts_panier"] = count($tabFils);
            }
        }
	}
}

function getTabRepPlanClassement($jeton, $szQuestion, &$tab_rep_ratp)
{
    $tab_rep_ratp = array();
    $tabValVar = array();
	$retour = pos_bib_getreponsesquest($jeton, $szQuestion, 1, 1, $tabValVar,/*pref*/$iNbReponses,/*pref*/$iAdrPremiereReponse);
	//echo "iNbReponses : $iNbReponses<br>";
	$szProfilLR = "";
	if($retour)
	  $retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $iNbReponses, 
				1, 1, /*pref*/$szProfilLR, /*pref*/$tabRepLR);
    if($retour)
    {
        for($i=0;$i<count($tabRepLR);$i++)
        	$tab_rep_ratp[$i] = $tabRepLR[$i]->numdoc.":".$tabRepLR[$i]->titredossier;
    }
    return $retour;
}

?>