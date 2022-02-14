<?php
/***********************************
 * Recherche FullText
 *
 * AUTEUR : Sébastien COSTANZO
 *
 * DATE DE CREATION: 09/05/2006
 *   
 * TRI      FTX_TRI_DISTANCE 0
 *          FTX_TRI_OCCURRENCE 1
 *          
 * Modification :
 * Patrick L : 08/01/2008 : Affichage de NB_REPONSES_PAR_PAGE 
 */ 
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/form_values.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../resultat/utils_recherche.inc.php");
include_once ("fonction_ftx.inc.php");

if (isset($_REQUEST["INUMQUEST"])) {
    $szRecherche = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]];
    echo "<script>";
    echo "document.location.href = '".URL_ATTENTE."?URL=".URL_RECHERCHE_FTX."&".$szRecherche."&QUESTION_DEJA_ENREG=1'";
    echo "</script>";
    exit;
}
$timestart = getmicrotime();
//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
	// Reconstruction du tableau $POS_CHOIX_LIB depuis une chaine
    // si on vient d'un lien sur numéro de page
    getTypesDoc($tabLib, $szTypeDocs);
    getCodesRub($tabLib, /*pref*/$tabCodeRub);
	$szTypeChoixRub = (isset($_REQUEST["TYPE_CHOIX_RUB"]) && strcmp($_REQUEST["TYPE_CHOIX_RUB"], "RUB_ET_FIC") == 0) ? $_REQUEST["TYPE_CHOIX_RUB"] : "";
	
    // si on affine la recherche
    if(isset($_REQUEST["POS_QUESTION_NEW"]))
        $szQuestion = $_REQUEST["POS_QUESTION_NEW"];
    else
        $szQuestion = $_REQUEST["POS_QUESTION"];
    $szQuestion = preg_replace('/%u[[:alnum:]]{4}/', " ", stripslashes(urldecode($szQuestion)));
        
		
    // Définition du template a utilisé  
    $t = new template(REP_TEMPLATE_APPLICATIF."ftx");
    $t->set_file("ftx", "resultat_ftx.tpl");

    $t->set_var("TITRE_PAGE", CST_TITRE_PAGE_RECH_FTX);
    //$t->set_var("SZ_RECHERCHE", $_SERVER["QUERY_STRING"]);
    $szRecherche = "POS_QUESTION=".urlencode($szQuestion)."&POS_CHOIX_LIB=$szTypeDocs&POS_TRI=".$_REQUEST["POS_TRI"]."&POS_NB_REP=".$_REQUEST["POS_NB_REP"]."&TYPE_CHOIX_RUB=".$_REQUEST["TYPE_CHOIX_RUB"];
    $t->set_var("SZ_RECHERCHE", $szRecherche);
    
    $t->set_var("CONSULT_FICHE", CST_LIBELLE_CONSULT_FICHE);
	$t->set_var("CONSULT_NATIF", CST_LIBELLE_CONSULT_NATIF);
	$t->set_var("CONSULT_FICHIER_PRINCIPAL", CST_LIBELLE_CONSULT_FICHIER_PRINCIPAL);
	$t->set_var("CONSULT_OCC", CST_LIBELLE_CONSULT_OCC);
	$t->set_var("CONSULT_OCC_PDF", CST_LIBELLE_CONSULT_OCC_PDF);
	
	$t->set_var("MESSAGE_NO_DOC_SUIVANT", CST_LIBELLE_NO_DOC_SUIVANT);
    $t->set_var("MESSAGE_NO_DOC_PRECEDENT", CST_LIBELLE_NO_DOC_PRECEDENT);
    $t->set_var("URL_CONSULT", URL_CONSULTER_INDEX);
    $t->set_var("B_CONFIRM_FERMETURE_DOC", (strcmp(CST_CONFIRM_FERMETURE,1) == 0)? CST_CONFIRM_FERMETURE:0);
    $t->set_var("LIBELLE_FERM_FICHE", CST_LIBELLE_FERM_FICHE);
    $t->set_var("LIBELLE_RECHERCHER", CST_LIBELLE_RECHERCHER);
    
    $t->set_var("URL_CONSULT_NATIF", URL_CONSULT_NATIF);
    $t->set_var("URL_CONSULT_OCC", URL_CONSULT_OCC_FTX);
    $t->set_var("URL_CONSULT_OCC_PDF", URL_CONSULT_OCC_PDF_FTX);
    $t->set_var("URL_CONSULT_INDEX", URL_CONSULTER_INDEX);
    $t->set_var("URL_RECHERCHE_FTX", URL_RECHERCHE_FTX);
    $t->set_var("URL_ATTENTE", URL_ATTENTE);
    $t->set_var("URL_AFFICHER_RECHERCHE_FTX", URL_AFFICHER_RECHERCHE_FTX);
    $t->set_var("LIBELLE_AJOUTER_PANIER", CST_LIBELLE_AJOUTER_PANIER);
    $t->set_var("LIBELLE_AFFINER_RECHERCHE", CST_LIBELLE_AFFINER_RECHERCHE);
    $t->set_var("LIBELLE_AFFINER_RECHERCHE_TOUS_CRITERES", CST_LIBELLE_AFFINER_RECHERCHE_TOUS_CRITERES);
    $t->set_var("CST_MSG_NO_FILE_ASSOCIE", addslashes(CST_MSG_NO_FILE_ASSOCIE));
    $t->set_var("CST_LIBELLE_PAGE_NO", CST_LIBELLE_PAGE_NO);
    
    // Bloc pour la navigation
    $t->set_block("ftx", "TAB_NUM_DOC", "tabnumdoc");
    // Bloc pour afficher la liste résumée de chaque document
    $t->set_block("ftx","BLOC_CHAMP_LR","bloc_champ_lr");
	// Bloc de choix de la page de résultat
	$t->set_block("ftx","PAGE","page");  
	$t->set_block("ftx", "LIEN_CONSULT_SI_FICHIER", "lien_consult_si_fichier");
	$t->set_block("ftx", "LIEN_CONSULT_SIPAS_FICHIER", "lien_consult_sipas_fichier");
			
    // Bloc affichant les reponses
    $t->set_block("ftx","BLOC_REPONSE","bloc_reponse");	
    // Bloc général a ne pas afficher si pas de réponses.
    $t->set_block("ftx","BLOC_GENERAL","bloc_general"); 
    
    $szLibelleRecherche = sprintf(LIBELLE_QUESTION_FTX , $szQuestion, $szTypeDocs);
    $t->set_var("QUESTION_RECHERCHEE", stripslashes($szLibelleRecherche));
     
    $retour = pos_searchdocftx($jeton, $szQuestion, $tabLib, $tabCodeRub, $_REQUEST["POS_TRI"], $_REQUEST["POS_NB_REP"], /*pref*/$iNbRep, /*pref*/$iAdrPremRep);

    if ($retour)
    {   
        if($iNbRep > 0)
        {
        	if(!isset($_REQUEST["POS_NUMPAGE"]) || isset($_REQUEST["POS_QUESTION_NEW"]))
				$numPage = 1;
			else
				$numPage = $_REQUEST["POS_NUMPAGE"];
        
    	    // Décalage de lecture des reponses selon le numéro de page
    	    $offset = ($numPage*NB_REPONSES_PAR_PAGE) - NB_REPONSES_PAR_PAGE;
    	    // Nombre de réponses lues
    	    if ($numPage*NB_REPONSES_PAR_PAGE > $iNbRep)
				$nb_reponses_voulues =  $iNbRep - (($numPage - 1)* NB_REPONSES_PAR_PAGE);
			else
				$nb_reponses_voulues = NB_REPONSES_PAR_PAGE;
			$retour = pos_getreponselrdftx($jeton, $iAdrPremRep, $iNbRep, $offset, $nb_reponses_voulues, /*pref*/$szProfil, /*pref*/$tabRep);
    	
    	    if(!$retour)
    	        debug($jeton);
    	}
    }
    else
        debug($jeton);
    
    // Affichage
    if ($iNbRep > 0)
    {   
		// Gestion de la navigation dans les pages de résultats 		
		$iPremierNumPage = (intval(($numPage - 1) / NB_PAGES_AFFICHEES) * NB_PAGES_AFFICHEES)+1;
		$iNbTotPages = intval($iNbRep / NB_REPONSES_PAR_PAGE);
		if ($iNbRep % NB_REPONSES_PAR_PAGE != 0 )
			$iNbTotPages += 1;
		if($iNbTotPages > 1)
			$t->set_var("PAGE_LIBELLE", CST_LIBELLE_PAGE_RESULT_PLURIEL);
		else
			$t->set_var("PAGE_LIBELLE", CST_LIBELLE_PAGE_RESULT);	    

		$t->set_var("TOTAL_PAGE", $iNbTotPages);
		$t->set_var("NB_REPONSES_PAR_PAGE", NB_REPONSES_PAR_PAGE);

		// pages precedentes et suivantes
		$pageSuiv = $iPremierNumPage + NB_PAGES_AFFICHEES;
		$pagePrec = $iPremierNumPage - 1;
		// pages precedente
		$t->set_var("AFFICHE_PAGES_PRECEDENTES", (isset($_REQUEST["POS_NUMPAGE"]) && $_REQUEST["POS_NUMPAGE"] > NB_PAGES_AFFICHEES) ? '' : 'none');
        $t->set_var("PAGE_PRECEDENTE", $pagePrec);
        $t->set_var("CST_LIBELLE_PAGE_PRECEDENTE", CST_LIBELLE_PAGE_PRECEDENTE);

		// pages suivantes
		$t->set_var("AFFICHE_PAGES_SUIVANTES", (($iPremierNumPage + NB_PAGES_AFFICHEES) <= $iNbTotPages) ? "" : 'none');
        $t->set_var("PAGE_SUIVANTE", $pageSuiv);
        $t->set_var("CST_LIBELLE_PAGE_SUIVANTE", CST_LIBELLE_PAGE_SUIVANTE);

		for ($i = $iPremierNumPage; 
				($i < $iPremierNumPage + NB_PAGES_AFFICHEES) && ($i <= $iNbTotPages); 
					$i++)
		{
			$t->set_var("PAGE_SELECTED", $i == $numPage ? "Select" : "");
			$t->set_var("NUMERO_DE_PAGE", $i);
			$t->parse("page", "PAGE", true);
		}
		$t->set_var("CURRENT_PAGE", $numPage);
				
        $szResultat = sprintf(LIBELLE_RESULTAT_FTX , $iNbRep);
        $t->set_var("NB_REPONSES", $szResultat);
        
        $t->set_var("POS_QUESTION", htmlspecialchars_currentcharset($szQuestion));
        
        $script_ouvrir_rep = "";
		for($i=0; $i<$nb_reponses_voulues; $i++)
        {
            $tabChamps = extraireChampsLR($tabRep[$i]->szResume, "\x02");
            $szChamp = "";
			for($j=0; $j<count($tabChamps); $j++)
			{
			    if($j == 0)
			        $szChamp .= $tabChamps[$j];
			    else
				    $szChamp .= " - ".$tabChamps[$j];
			}
			                             
			$szInfoDoc = "POS_NUM_DOC=".$tabRep[$i]->dwNumDocPos;
		    $szInfoDoc.= "&POS_TYPEDOC=".$tabRep[$i]->szTypeDoc;
		    $szInfoDoc.= "&MODE=CONSULTATION";
			$szInfoDoc.= "&POS_NUM_PAGE=".$tabRep[$i]->wNumPage;
			$szInfoDoc.= "&POS_NUM_SSPAGE=".$tabRep[$i]->wNumSousPage;
			
			$numRep = ($numPage*NB_REPONSES_PAR_PAGE + $i) - NB_REPONSES_PAR_PAGE;
			$szInfoDoc.= "&POS_NUM_REP=".$numRep;
			$szInfoDoc.= "&PHPSESSID=".session_id();
			
			$t->set_var("POS_INFO_DOC", $szInfoDoc); 
			 
			// Pour la construction du menu sur chaque ligne (si il y a un fichier ou non).
            $t->set_var("B_FICHIER", ($tabRep[$i]->wNumPage>0)?1:0); 
			 
			$t->set_var("CHAMP_LR", $szChamp); 
			$t->set_var("NUM_DOC", $tabRep[$i]->dwNumDocPos);
			
            $szOcc1 = htmlentities($tabRep[$i]->szOccurence);
            $szOcc2 = str_replace("&lt;B&gt;", "<B class='occurrence'>", $szOcc1);
            $szOcc3 = str_replace("&lt;/B&gt;", "</B>", $szOcc2);
            $t->set_var("OCCURRENCE", $szOcc3);
            
            
            if($_REQUEST["POS_TRI"] == FTX_TRI_OCCURRENCE)
                $szInfoOccPert = sprintf(LIBELLE_OCCURRENCE_FTX , $tabRep[$i]->dwOccurence);
            else
                $szInfoOccPert = sprintf(LIBELLE_PERTINENCE_FTX , $tabRep[$i]->dwScore);
            
            $t->set_var("OCCURRENCE_PERTINENCE", $szInfoOccPert);
            
            if ($tabRep[$i]->wNumSousPage != 0)
                $t->set_var("DISPLAY_SI_SOUS_PAGE", "");
            else
                $t->set_var("DISPLAY_SI_SOUS_PAGE", "none");
            
            if ($tabRep[$i]->wNumPage > 0) {
                $t->parse("lien_consult_si_fichier", "LIEN_CONSULT_SI_FICHIER", false);
                $t->set_var("lien_consult_sipas_fichier", "");
            }
            else {
                $t->set_var("lien_consult_si_fichier", "");
                $t->parse("lien_consult_sipas_fichier", "LIEN_CONSULT_SIPAS_FICHIER", false);
            }
            
            // Ajout de fonctionnalité pour la navigation
    		if(isset($_REQUEST["TYPE_NAVIGATION"]) && 
                    ((strcmp($_REQUEST["TYPE_NAVIGATION"], "SUIV") == 0 && $i == 0) || (strcmp($_REQUEST["TYPE_NAVIGATION"], "PREC") == 0 && $i == ($nb_reponses_voulues-1))))
    		{
    			$script_ouvrir_rep = "";
    			$script_ouvrir_rep = "openFiche("."'".$szInfoDoc."')"; 
    		}
            
            $t->parse("bloc_reponse","BLOC_REPONSE",true);
            $t->set_var("bloc_champ_lr", "");
            
            $t->set_var("CPT_NUM_DOC",$i);
    		$t->parse("tabnumdoc","TAB_NUM_DOC",true);
        }
        
        $t->set_var("SCRIPT_OUVRIR_REPONSE_NAVIGATION", $script_ouvrir_rep);
        $t->parse("bloc_general","BLOC_GENERAL",true);
        
        // ajout à l'historique des question
        if (!isset($_REQUEST["QUESTION_DEJA_ENREG"])) {
    		$iNumQuest = (isset($_SESSION["sess_tabHistQuest"][0]) ) ? count ($_SESSION["sess_tabHistQuest"][0]) : 0;
        	$_SESSION["sess_tabHistQuest"][0][$iNumQuest] = $szRecherche;
            $_SESSION["sess_tabHistQuest"][1][$iNumQuest] = $iNbRep; 
            $_SESSION["sess_tabHistQuest"][2][$iNumQuest] = date("d/m/y  H:i"); 
            $_SESSION["sess_tabHistQuest"][3][$iNumQuest] = "RECHERCHE_EXCALIBUR";
        	$_SESSION["sess_tabHistQuest"][4][$iNumQuest] = $szLibelleRecherche;
        	$_SESSION["sess_tabHistQuest"][5][$iNumQuest] = 0;
            $szTitreQuest = preg_replace('/\'/', '@', $szLibelleRecherche);
    	    $t->set_var("TITRE_NEW_QUEST_NB_REP", " (".$iNbRep.")&nbsp;".$szTitreQuest);
    		$t->set_var("NUM_NEW_QUEST", $iNumQuest);
            $t->set_var("NBREP_NEW_QUEST", $iNbRep);
            $t->set_var("TYPE_QUESTION", "RECHERCHE_EXCALIBUR");
            $t->set_var("IS_NEW_QUESTION", "true");
        }
        else
            $t->set_var("IS_NEW_QUESTION", "false");
        
        // affichage du template
        $t->pparse("Output", "ftx");
    }
    else
    {
        $t->set_var("bloc_general", "");
     	$tabInfoDebug[0] = CST_LIBELLE_EXCALIBUR_NOT_REPONSE;
		debug_code($tabInfoDebug);
    	include("afficher_rech_ftx.php");	
    }
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>