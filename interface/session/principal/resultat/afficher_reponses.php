<?php     
/*
 * DESCRIPTION : Affichage d'une liste de resultats � partir
 * d'un fichier template.
 * 
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 13/12/2001
 *
 * Donnees en entree : 
 * $szTplName -> nom du template
 * $tabZoneLR -> la structure decrivant la profil de liste resum�e 
 * $tabReponses -> le tableau de reponses a afficher
 *
 * MODIFICATIONS
 * 19.02.2002 Marc : Modifs pour une gestion commune de la liste
 *                      des r�ponses et du contenu d'un dossier
 * 06/2002 Gaby : gestion de droits suppl�mentaires pour l'affichage des boutons
 * 
 */
$t = new template(".");

// MAJ du nb de r�ponses dans la frame centerbal.
if(strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0)
    $t->set_var("MAJ_BAL", "parent.centerbal.majBal('".addslashes($_SESSION["sess_tabHistQuest"][4][$iNumQuest])."','$iNombreReponse');");
else
    $t->set_var("MAJ_BAL", ""); 
 

if ($iNombreReponse > 0)
{
	if(isset($szTypeRecherche) && strcmp($szTypeRecherche, "CONTENU_DOS") == 0)
	{
		$szTypeDoc = "";
	}
	else
	{
		// on r�cup�re le profil de la liste r�sum�e
		$retour = pos_gestplr($jeton, "$szProfilLR", /*pref*/$objLR, /*pref*/$tabZoneLR);
		if(!$retour)
			debug($jeton);
		else
			// initialisation du type de document pour voir si on va travailler avec la LR Photo
	    	$szTypeDoc = $objLR->type_doc_ref;
	}
}

$szTplName = REP_TEMPLATE_APPLICATIF."resultat/liste_resumee.tpl";
 
$t->set_file("lr", $szTplName);

// d�finition des blocs
$t->set_block("lr", "NO_RUB_FILTRE_ENTETE", "no_rub_filtre_entete");
$t->set_block("lr", "IS_RUB_FILTRE_ENTETE", "is_rub_filtre_entete");
$t->set_block("lr", "RUB_FILTRE_ENTETE", "rub_filtre_entete");
$t->set_block("lr", "FILTRE_ENTETE", "filtre_entete");
$t->set_block("lr", "ENTETE", "entete");
$t->set_block("lr", "TD_DOSSIER", "td_dossier");
$t->set_block("lr", "TD_DOCUMENT", "td_document");
$t->set_block("lr", "LR_REPONSE", "lrreponse");
$t->set_block("lr", "LISTE_REPONSES", "listereponses");
$t->set_block("lr", "PAGE", "page");
$t->set_block("lr", "ARBO", "arborescence");
$t->set_block("lr", "BOUTON", "bouton");
$t->set_block("lr", "FILS", "fils");
$t->set_block("lr", "TAB_NUM_DOC", "tabnumdoc");

include ("../include/question.inc.php");

if(isset($iNumQuest) && strlen($iNumQuest) > 0 && ($_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_PANIER" || 
		$_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_COMBINE" || 
		$_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_HISTORIQUE" ||
		$_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_BAL"))
{
	
	if ($_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_BAL") {
		$locutions = htmlentities_currentcharset($_SESSION["sess_tab_bal_assoc_libelle"][$_SESSION["sess_tabHistQuest"][4][$iNumQuest]], null);
		$szChemin = CST_LIBELLE_BAL;
	}
	else {
		$locutions = htmlentities_currentcharset($_SESSION["sess_tabHistQuest"][4][$iNumQuest], null);
		$szChemin = CST_RECHERCHE;
	}
}
elseif(isset($iNumQuest) && strlen($iNumQuest) > 0 && $_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_BIB")
{
	$locutions = htmlentities_currentcharset($_SESSION["sess_tabHistQuest"][4][$iNumQuest], null);
	$szChemin = CST_LIBELLE_QUESTION;
}
elseif(isset($_REQUEST["POS_NUMDOS"]) && strlen($_REQUEST["POS_NUMDOS"]))
{
    // pour afficher le chemin complet : modifier aussi arborescence_dossier.tpl
    //if (isset($_REQUEST["CHEMIN_DOSSIER"]))
    //    $locutions = stripslashes($_REQUEST["CHEMIN_DOSSIER"]);
    //else
    $locutions = stripslashes(urldecode($_REQUEST["POS_TITREDOS"]));
	$szChemin = CST_LIBELLE_TITRE_DOSSIER;
}
else
{
    $locutions = affiche_une_locution($jeton, 0, 1, $iNumQuest, 0, $_SESSION["sess_tabLibTypeDoc"]);
    $szChemin = CST_RECHERCHE;
}

//var_dump($_SESSION["sess_tab_bal_assoc_libelle"][$_SESSION["sess_tabHistQuest"][4][$iNumQuest]] ); exit;
$t->set_var("TITRE_QUESTION", $locutions);

if(isset($iNumQuest) && strlen($iNumQuest) > 0 && $_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_BAL")
	$t->set_var("POS_QUEST_NOM", $_SESSION["sess_tabHistQuest"][4][$iNumQuest]);
else
	$t->set_var("POS_QUEST_NOM", "");
 
$t->set_var("CHEMIN", $szChemin);
$t->set_var("POS_NUMDOS", (isset($_REQUEST["POS_NUMDOS"]) && strlen($_REQUEST["POS_NUMDOS"]))? $_REQUEST["POS_NUMDOS"] : "");
$t->set_var("POS_TITREDOS", (isset($_REQUEST["POS_TITREDOS"]))? $_REQUEST["POS_TITREDOS"] : "");
$t->set_var("MESSAGE_RENSEIGNER_DOSSIER_PERE", CST_LIBELLE_RENSEIGNE_PERE);
$t->set_var("MESSAGE_NO_DOC_SUIVANT", CST_LIBELLE_NO_DOC_SUIVANT);
$t->set_var("MESSAGE_NO_DOC_PRECEDENT", CST_LIBELLE_NO_DOC_PRECEDENT);
$t->set_var("LIBELLE_DRAG_DROP", CST_LIBELLE_DRAG_DROP);
$t->set_var("LIBELLE_SELECT_ALL", CST_LIBELLE_SELECT_ALL);
$t->set_var("LIBELLE_SELECT_ACTION_PLUSIEURS_DOC", CST_LIBELLE_SELECT_ACTION_PLUSIEURS_DOC);
$t->set_var("LIBELLE_DOC_SELECT", CST_LIBELLE_DOC_SELECT);
$t->set_var("LIBELLE_DOCS_SELECTS", CST_LIBELLE_DOCS_SELECTS);
$t->set_var("LIBELLE_CAPTION_TABLE_RESULTAT", CST_LIBELLE_CAPTION_TABLE_RESULTAT);

$t->set_var("URL_CONSULT", URL_CONSULTER_INDEX);
$t->set_var("B_CONFIRM_FERMETURE_DOC", (strcmp(CST_CONFIRM_FERMETURE,1) == 0)? CST_CONFIRM_FERMETURE:0);
$t->set_var("LIBELLE_FERM_FICHE", CST_LIBELLE_FERM_FICHE);
$t->set_var("POS_LR_TRI_TYPE", $iTypeTri);
$t->set_var("POS_LR_TRI_NUMCOL", $iNumColTri);
$t->set_var("POS_NUMPAGE", $_REQUEST["POS_NUMPAGE"]);
$t->set_var("POS_PROFIL_LR", $szProfilLR);

$t->set_var("IS_DRAG_AND_DROP", (defined('DRAG_AND_DROP') && strcmp(DRAG_AND_DROP, "1") == 0) ? "true" : "false");
$t->set_var("NB_REPONSES_PAR_PAGE", NB_REPONSES_PAR_PAGE);
$t->set_var("TYPE_RECHERCHE", $szTypeRecherche);
$t->set_var("URL_RESULTAT", URL_RESULTAT);
$t->set_var("URL_ATTENTE", URL_ATTENTE);
 
$t->set_var("NB_REPONSES", $iNombreReponse);

 
 

// appel de la fonction d'affichage de la liste des pages
afficherListePage($szTypeRecherche, $iNombreReponse, /*pref*/$t);
// Si on traite l'affichage d'une liste de r�ponses ou le contenu d'un dossier non vide
if ($iNombreReponse > 0)
{
	// Gestion du lien de reactualisation du fichier, de l'affichage du nb total de r�ponses
	// et des pages de resultats consecutives ou du nb d'elements dans le dossier consulte :
	// remarque : si le nb de reponses de la page de resultats consulte ou si le nb
	// d'elements contenus dans un dossier excede 1, on ajoute un "s" au libelle affiche.
	if(isset($szTypeRecherche) && strcmp($szTypeRecherche, "CONTENU_DOS") == 0)
	{
		$szNbRepLibelleTmp = ($iNombreReponse > 1) ? CST_LIBELLE_NB_REP_DOSSIER_PLURIEL : CST_LIBELLE_NB_REP_DOSSIER;
	}
	else 
	{           
		if(strcmp($szTypeRecherche,"RECHERCHE_PANIER") == 0)
		    $szNbRepLibelleTmp = ($iNombreReponse > 1) ? CST_LIBELLE_NB_REP_PLURIEL_PANIER : CST_LIBELLE_NB_REP_PANIER;
		else
		$szNbRepLibelleTmp = ($iNombreReponse > 1) ? CST_LIBELLE_NB_REP_PLURIEL : CST_LIBELLE_NB_REP;
	}   
	$szNbRepLibelle = sprintf($szNbRepLibelleTmp , $iNombreReponse);

	$t->set_var("AFFICHE_NB_REP", $szNbRepLibelle);
	$t->set_var("MESSAGE_SELECT_REP", CST_LIBELLE_SELECT_REP);
	$t->set_var("MESSAGE_SELECT_PANIER", CST_LIBELLE_SELECT_DOC_PANIER);
    $t->set_var("LIBELLE_ATTENTE_SAISIE_VALEUR_FILTRE", CST_LIBELLE_ATTENTE_SAISIE_VALEUR_FILTRE);
    $t->set_var("MESSAGE_SUPP_DOC", (strcmp($szTypeRecherche,"RECHERCHE_PANIER") != 0) ? CST_LIBELLE_SUPP_DOC : CST_LIBELLE_SUPP_DOC_PANIER);
    // Pour l'ouverture des fichiers
    $t->set_var("PHPSESSID", session_id());  
    $t->set_var("INUMQUEST", (isset($iNumQuest) && strlen($iNumQuest) > 0) ? $iNumQuest : "");
      
	// Ligne des entetes
	//-------------------
	// on boucle sur le nb de zones de la liste r�sum�e
	$tabAlignCol = array();
	for ($i=0;$i<count($tabZoneLR);$i++) 
  	{
		if($iNumColTri == ($i+1))
			$szObjImg = "<IMG SRC='".URL_SITE."/images/icons/tri_lr_$iTypeTri.png' border=0 align=center>";
		else
			$szObjImg = "";
	
		// recuperation des titres du profil de la liste resumee
        $t->set_var("TITRE_COLONNE", $tabZoneLR[$i]->zone_titre_col."&nbsp;".$szObjImg);
        $t->set_var("TAILLE_COLONNE",  $tabZoneLR[$i]->zone_largeur_col);
        $t->set_var("ID_RUBRIQUE", ($tabZoneLR[$i]->zone_type == 1) ? $tabZoneLR[$i]->zone_code_rub_ref : $tabZoneLR[$i]->zone_type);
        $t->set_var("COMPT", $i);
   
		switch($tabZoneLR[$i]->zone_align_col)
		{
			case 1 :
				$tabAlignCol[$i] = "center"; break;
		
			case 2 :
				$tabAlignCol[$i] = "left"; break;
		
			case 3 :
				$tabAlignCol[$i] = "right"; break;
		
			default :
				$tabAlignCol[$i] = "left"; break;
		}
		
        // si on retrie une colonne, on le fait alors avec le type de tri oppos�
        $iTri = (($i+1) == $iNumColTri && $iTypeTri == CROISSANT) ? DECROISSANT : CROISSANT;
        	
        // lien sur les entetes de colonne de la LR
		$t->set_var("NV_TYPE_TRI", $iTri);
		$t->set_var("NV_COLONNE_TRI", $i + 1);
			
		$t->parse("entete", "ENTETE", true);
		if (strlen($tabZoneLR[$i]->zone_code_rub_ref) > 0 || $tabZoneLR[$i]->zone_type == 9 || $tabZoneLR[$i]->zone_type == 10)
		{
		    if ($tabZoneLR[$i]->zone_type == 9)
		    {
		      $t->set_var("CODE_RUBRIQUE", "N_D");
            }
		    else if ($tabZoneLR[$i]->zone_type == 10)
		    {
		      $t->set_var("CODE_RUBRIQUE", "N_P");
            }
		    else
                $t->set_var("CODE_RUBRIQUE", $tabZoneLR[$i]->zone_code_rub_ref);
            
            $t->parse("is_rub_filtre_entete", "IS_RUB_FILTRE_ENTETE", false);
            $t->set_var("no_rub_filtre_entete", "");
        }
        else
        {
            $t->parse("no_rub_filtre_entete", "NO_RUB_FILTRE_ENTETE", false);
            $t->set_var("is_rub_filtre_entete", "");
        }
		
        $t->parse("rub_filtre_entete", "RUB_FILTRE_ENTETE", true);
	}
      
	$szCodeTypeDocLR = "";
	if( (strcmp($szTypeRecherche, "CONTENU_DOS") == 0 && $_SESSION["sess_obj_infos_appli"]->dwTypeBDD == PHP_VULCAIN_TYPE_BDD_DISAM) ||
         strcmp($szTypeRecherche, "RECHERCHE_PANIER") == 0 || strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0 || strcmp($szTypeRecherche, "RECHERCHE_HISTORIQUE") == 0)
	   $t->set_var("filtre_entete", "");
    else
        $t->parse("filtre_entete", "FILTRE_ENTETE", true);
	
	$retour = pos_getlistalltypesdos($jeton, /*pref*/$tabListeTypDos);
	$isDossierReponse = false;	
	
    // verification existence colonne liste fichiers
    $numColFileList = -1; 
    if (defined('AFFICHER_FICHIER_DANS_LR_COL_NAMES')) {
        $numColFileList = verifierExistenceColonne($tabZoneLR, 10, AFFICHER_FICHIER_DANS_LR_COL_NAMES);
        if ($numColFileList != -1)
            $t->set_var("AFFICHER_FICHIER_DANS_LR_COL_NAME", $tabZoneLR[$numColFileList]->zone_titre_col);
    }
            
    //...et on boucle sur le nombre de r�ponses par page � afficher 
	// ou sur le nombre de documents inclus dans le dossier ouvert
    for ($i = 0; $i<count($tabREP_LR); $i++)
	{
	    $t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
            
		// Ajout de fonctionnalit� pour la navigation
		if(isset($_REQUEST["TYPE_NAVIGATION"]) && 
                ((strcmp($_REQUEST["TYPE_NAVIGATION"], "SUIV") == 0 && $i == 0) || (strcmp($_REQUEST["TYPE_NAVIGATION"], "PREC") == 0 && $i == (count($tabREP_LR)-1))))
		{
			$script_ouvrir_rep = "";
			$szFonction = ($_REQUEST["MODE_NAVIGATION"] == "MODIFICATION")? "onModifier(" : "onConsulter(";
			$script_ouvrir_rep = $szFonction."'POS_NUM_DOC=".$tabREP_LR[$i]->numdoc."&POS_TYPEDOC=".$tabREP_LR[$i]->typedoc."')"; 
		}
        
        $t->set_var("POS_NUMDOC",  $tabREP_LR[$i]->numdoc);
		$t->set_var("CPT_NUM_DOC",$i);
		$t->set_var("NUM_DOC",$tabREP_LR[$i]->numdoc);
		$t->parse("tabnumdoc","TAB_NUM_DOC",true);
	
		// verifier s'il n'y a qu'un seul type de document en r�ponse
		if (strcmp($szCodeTypeDocLR, $tabREP_LR[$i]->typedoc) != 0 && 
					strlen($szCodeTypeDocLR) != 0)
			$szCodeTypeDocLR = "000";
		else
			$szCodeTypeDocLR = $tabREP_LR[$i]->typedoc;	

		//colonne des icones : le document est un dossier s'il est de type dossier
		// if (strlen($tabREP_LR[$i]->titredossier) != 0)
		if (array_key_exists($tabREP_LR[$i]->typedoc, $tabListeTypDos))
		{
			$isDossierReponse = true;	
			$isDos = 1;
			// c'est un dossier
			// affichage du titre a l'ecran par un ALT...
			$szTitreDos = $tabREP_LR[$i]->titredossier;
            $t->set_var("TITRE_DOS",  htmlentities_currentcharset(str_replace ( "\"", "_", $szTitreDos), null));
            $t->set_var("td_document", "");
			$t->parse("td_dossier", "TD_DOSSIER", false);
			$t->parse("fils", "FILS", true);
		}
		else
		{
		    $isDos = 0;
			$t->set_var("td_dossier", "");
			$t->parse("td_document", "TD_DOCUMENT", false);
		}
        	
        if($bAfficheAttribut)
			$t->set_var("VALUE_RADIO_NUMDOC",  "POS_NUM_DOC={$tabREP_LR[$i]->numdoc}&POS_TYPEDOC={$tabREP_LR[$i]->typedoc}&POS_NUMDOS={$_REQUEST["POS_NUMDOS"]}&isdos=$isDos");
		else
            $t->set_var("VALUE_RADIO_NUMDOC",  "POS_NUM_DOC={$tabREP_LR[$i]->numdoc}&POS_TYPEDOC={$tabREP_LR[$i]->typedoc}&isdos=$isDos");
		$t->set_var("lrreponse", "");
        
      	// toutes les autres colonnes
		$tabChamps = extraireChampsLR($tabREP_LR[$i]->lr, "\x02");
		for ($j = 0; $j<count($tabChamps); $j++)
		{
		    $t->set_var("ALIGN", $tabAlignCol[$j]);
            if ($numColFileList === $j) {
              
              $tabStruListePage = array();
              if ($tabChamps[$numColFileList] != 0) {
                pos_getlisteinfopage($jeton, $tabREP_LR[$i]->numdoc, 0, /*pref*/$tabStruListePage);
              }
              $sListFiles = count($tabStruListePage) . "|";              
              for ($k = 0; $k<count($tabStruListePage); $k++) {
                // format identique a celui ramene par le serveur dans le cas d'une base postgres
                $sListFiles .=  $tabStruListePage[$k]->wNumPage . "." .  $tabStruListePage[$k]->wNumSousPage . " " . $tabStruListePage[$k]->szNomFichierOriginal;
                if ($k != (count($tabStruListePage)-1))
                    $sListFiles .=  "|";
		      }
               $t->set_var("ZONE_LR", $sListFiles);
            }
            else
        	   $t->set_var("ZONE_LR", htmlentities_currentcharset($tabChamps[$j], null));
        	
            $t->parse("lrreponse", "LR_REPONSE", true);
		}
		$t->parse("listereponses", "LISTE_REPONSES", true);
   }

	if (!$isDossierReponse)
			$t->set_var("fils", "");
	
	// le type de document
	$t->set_var("POS_TYPEDOC", $szCodeTypeDocLR);

	// recherche des droits de creation/suppression
	if (strcmp($szCodeTypeDocLR, "000") != 0)
	{
		// recherche des infos du type pour les restrictions d'acces
		$iRetour = get_infotypecache($jeton, $szCodeTypeDocLR, /*pref*/$objInfoType, /*pref*/$tabStruKEYHbyTyp);

		// droit de suppression pour ce type de document
		$bSuppression = ($objInfoType->wTypeRubSupprIndex == 1 && $_SESSION["sess_droitAdministration"] != 1) ? 0 : 1;
	}
	else
        $bSuppression = 1;

	// gestion des actions
	if($_SESSION["sess_droitConsultation"])
        afficherFonction("'onConsulter'", CST_LIBELLE_CONSULT, "lr_consulter.png", /*pref*/$t);
	
    if($_SESSION["sess_droitModification"] != 0)
      afficherFonction("'onModifier'", CST_LIBELLE_MODIF, "lr_modifier.png", /*pref*/$t);
    	
    afficherFonction("'onOuvrirDossier'", CST_LIBELLE_OUVRIR_DOSSIER, "lr_ouvrir.png", /*pref*/$t);
    
    // Gestion des attributs.
    if($bAfficheAttribut)
    {	
    	afficherSeparateurFonction($t);
    	afficherFonction("'onConsulterAttributs'", CST_LIBELLE_VOIR_ATTRIBUT, "", /*pref*/$t);
    }
	
	if(strcmp(CST_IMPRIMER,1)==0 ||strcmp(CST_EXPORTER,1)==0 )
	    afficherSeparateurFonction($t);
	
	if(strcmp(CST_IMPRIMER,1)==0)
		//afficherFonction("'onImprimerLR'", CST_LIBELLE_IMPRIMER, "lr_imprimer.png", /*pref*/$t);
		
	if(strcmp(CST_EXPORTER,1)==0)
		afficherFonction("'onExporter'", CST_EXPORT_EXPORT, "lr_expor.png", /*pref*/$t);

	if($_SESSION["sess_MajRafale"] == 1)
	    //afficherFonction("'onMiseAJourRafale'", CST_MAJRAF_BOUTON, "", /*pref*/$t);

    if($_SESSION["sess_droitGestDossier"] && strcmp(CST_GESTION_DOSSIER, 1)==0)
    {
        afficherSeparateurFonction($t);
		//afficherFonction("'onInsereDos'", CST_LIBELLE_DOSS_INSERTION, "lr_inserer.png", /*pref*/$t);
        if(isset($_REQUEST["POS_NUMDOS"]) && strlen($_REQUEST["POS_NUMDOS"]) > 0)
            afficherFonction("'onRetireDos'", CST_LIBELLE_DOSS_RETRAIT, "lr_retirer.png", /*pref*/$t);
    }
    
    if(strcmp(CST_PANIER,1) == 0)
	    afficherSeparateurFonction($t);
		
	if(strcmp($szTypeRecherche,"RECHERCHE_PANIER") == 0)
	    afficherFonction("'onSupprimerPanier'", CST_LIBELLE_SUPP_PANIER, "multi_select.png", /*pref*/$t);
		
	if(strcmp(CST_PANIER,1)==0  && strcmp($szTypeRecherche,"RECHERCHE_PANIER") != 0)
	  afficherFonction("'onAjouterPanier'", CST_LIBELLE_AJOUTER_PANIER, "lr_ajpanier.png", /*pref*/$t);
    
	if($_SESSION["sess_droitSuppression"] && $bSuppression && strcmp($szTypeRecherche,"RECHERCHE_PANIER") != 0)
	{
	    afficherSeparateurFonction($t);
	    afficherFonction("'onSupprimer'", CST_LIBELLE_SUPP, "lr_supprimer.png", /*pref*/$t);
	}
	//afficherFonction($cpt++, "onGenererRapport()", "G�n�rer rapport", "liste.png", /*pref*/$t);
	
    // Gestion des actions hermes � partir de la liste de r�ponse
    // On met cette fonctionnalit� que si on vient des BAL
    // Fichier de configuration des actions � proposer 'configuration/action_<nom appli>.xml'
    $ficActionXml = "../../../../configuration/action_".$_SESSION["sess_application"].".xml";
    if(file_exists($ficActionXml))
    {
        include ("../include/xml_action_hermes.php");
        $szNomQuestion = (isset($iNumQuest) && isset($_SESSION["sess_tabHistQuest"][4][$iNumQuest])) ? $_SESSION["sess_tabHistQuest"][4][$iNumQuest] : "";
        $tabAction = getListeActionsFromXml($ficActionXml, 
                        $szNomQuestion, $szCodeTypeDocLR, $_SESSION["sess_profil"], $_SESSION["sess_fonction"]);
        //print_r($tabAction);
        if (count($tabAction) > 0)
        {
            if(strcmp(CST_PANIER,"1") != 0 )
                afficherSeparateurFonction($t);
            
            for($i=0;$i<count($tabAction);$i++)
            {
                $bIsVariable = 0;
                if (count($tabAction[$i]['tabRubrique']) > 0)
                    $bIsVariable = 1;
    			afficherFonction("'onActionHermes', '".trim($tabAction[$i]['libelle'])."', ".$bIsVariable, $tabAction[$i]['libelle'], 
                                        "multi_select.png", /*pref*/$t);
            }
        }
    }  
    
	//Lien RAPPEL
	if(isset($iNumQuest) && strlen($iNumQuest) > 0)
	{
	    // affichage question dans le menu gauche
	    if($bNewQuestion  
	        && $_SESSION["sess_tabHistQuest"][3][$iNumQuest] != "RECHERCHE_PANIER" 
            && $_SESSION["sess_tabHistQuest"][3][$iNumQuest] != "RECHERCHE_BAL"
            && $_SESSION["sess_tabHistQuest"][3][$iNumQuest] != "RECHERCHE_HISTORIQUE"
            && $_SESSION["sess_tabHistQuest"][3][$iNumQuest] != "RECHERCHE_BIB")
	    {
	        $t->set_var("IS_NEW_QUESTION", "true"); 
		    include ("../include/question.inc.php");
		    if($_SESSION["sess_tabHistQuest"][3][$iNumQuest] == "RECHERCHE_COMBINE")
                $szTitreQuest = htmlentities_currentcharset($_SESSION["sess_tabHistQuest"][4][$iNumQuest], null);
            else
                $szTitreQuest = affiche_une_locution($jeton, 0, 1, $iNumQuest, 0, $_SESSION["sess_tabLibTypeDoc"]);
	        $szTitreQuest = preg_replace('/\'/', '\\\'', $szTitreQuest);
	        $t->set_var("TITRE_NEW_QUEST", $szTitreQuest);
	        $t->set_var("TITRE_NEW_QUEST_NB_REP", " (".$_SESSION["sess_tabHistQuest"][1][$iNumQuest].")&nbsp;".$szTitreQuest);
	    }
	    else
	    {
		    $t->set_var("IS_NEW_QUESTION", "false");
		    $t->set_var("TITRE_NEW_QUEST", "");
		}    
		$t->set_var("NUM_NEW_QUEST", $iNumQuest);
        $t->set_var("NBREP_NEW_QUEST", $iNombreReponse);
        $t->set_var("TYPE_QUESTION", $_SESSION["sess_tabHistQuest"][3][$iNumQuest]);
	    
		include("../include/rappel_historique.inc.php");
		$linkHis = getLienHistorique($iNumQuest, /*pref*/$bModif);
        $t->set_var("URL_RAPPEL", ($bModif == true) ? "<A HREF=\"".$linkHis."\"><FONT color=black>[".CST_LIBELLE_RAPPEL."]</FONT></A>" : "");
	}
	else
	{
	    $t->set_var("IS_NEW_QUESTION", "false");
	    $t->set_var("TITRE_NEW_QUEST", "");
        $t->set_var("NUM_NEW_QUEST", "");
        $t->set_var("NBREP_NEW_QUEST", "");
        $t->set_var("TYPE_QUESTION", "");
		$t->set_var("URL_RAPPEL", "");
	}

	// gestion d'une reponse unique :
	// dans le cas o� il n'y a qu'une seule reponse,
	if(!isset($script_ouvrir_rep)) 
 		$script_ouvrir_rep = "";
	if ($iNombreReponse == 1 && ($szTypeRecherche != "CONTENU_DOS") && (!isset($_REQUEST["POS_FIRSTLOAD"]) || $_REQUEST["POS_FIRSTLOAD"]) && 
			CST_OUVERTURE_AUTO == 1)
	{
		$szFonction = $_SESSION["sess_droitModification"] ? "onModifier(" : "onConsulter(";
        $script_ouvrir_rep = $szFonction."'POS_NUM_DOC=".$tabREP_LR[0]->numdoc."&POS_TYPEDOC=".$tabREP_LR[0]->typedoc."')"; 
	}
    $t->set_var("SCRIPT_OUVRIR_REPONSE_UNIQUE", $script_ouvrir_rep);        
}
else
{
	// affichage pour un dossier vide
   $szDossierVide_libelle =  CST_LIBELLE_DOSSIER_VIDE;
   $t->set_var("page", "");
   $t->set_var("entete", "");
   $t->set_var("lrreponse", "");
   $t->set_var("listereponses", "");
   $t->set_var("IS_NEW_QUESTION", "false");
   $t->set_var("DISPLAY_TABLE_REPONSE", "none");
   
}
// ---------------------------------
// Affichage de la liste des profils
// ---------------------------------
include("../resultat/afficher_profil.inc.php");
$t->set_var("AFFICHE_LIBELLE_DOSSIER_VIDE", isset($szDossierVide_libelle) ? "<br><br>&nbsp;&nbsp;".$szDossierVide_libelle : "");

      //$time_start = getmicrotime();
// affichage du template
$t->parse("Output", "lr");  
$t->p("Output");
?>
