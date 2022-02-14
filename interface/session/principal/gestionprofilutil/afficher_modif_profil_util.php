<?php
/* 
 * Gestion des profils utilisateurs
 *
 * Patrick Legaigneur 24/01/2011
 *
 */
if (!isset($_SESSION))
	session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("POS_DRT_ADMIN_USER", 0x00000001);
define("POS_DRT_ADMIN_DF", 0x00000004);
define("POS_DRT_ADMIN_LH", 0x00000002);
define("MAX_VOL_CLOISONNEMENT", 20);
if ($_SESSION["sess_droitAdminUtilisateur"] == false && $_SESSION["sess_droitAdministration"] == false)
{
	echo CST_LIBELLE_NO_ADMIN_USER;
}
else
{	
    $retour = connexion($jeton);
    if ($retour)
    {	
    	// Affichage
    	$t = new Template(".");
    
    	$t->set_File("profil", REP_TEMPLATE_APPLICATIF."gestionprofilutil/modif_profil.tpl");
    	$t->set_block("profil", "BLOC_TOUS_NOMS_PROFILS", "bloc_tous_noms_profils");
    	$t->set_block("profil", "BLOC_TOUS_PROFILS_HIERARCHIQUES", "bloc_tous_profils_hierarchiques");
    	$t->set_block("profil", "BLOC_TOUS_SERVICES", "bloc_tous_services");
    	$t->set_block("profil", "BLOC_TOUS_PROFILS_INDEX", "bloc_tous_profils_index");
    	$t->set_block("profil", "BLOC_CLOISONNEMENT_1", "bloc_cloisonnement_1");
    	$t->set_block("profil", "BLOC_CLOISONNEMENT_2", "bloc_cloisonnement_2");
    	$t->set_block("profil", "BLOC_CONFIDENTIALITE_1", "bloc_confidentialite_1");
    	$t->set_block("profil", "BLOC_CONFIDENTIALITE_2", "bloc_confidentialite_2");
    	$t->set_block("profil", "BLOC_DOCUMENT_RECH", "bloc_document_rech");
    	$t->set_block("profil", "BLOC_DOCUMENT_INDEX", "bloc_document_index");
    	
    	$t->set_var("URL_ATTENTE", URL_ATTENTE);
        $t->set_var("CODE_ACTION", URL_MODIFIE_PROFIL_UTILISATEUR);
        $t->set_var("URL_ANNULER", URL_AFFICHE_PROFIL_UTILISATEUR);
    	
    	$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
        $t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
        $t->set_var("MODE", $_REQUEST['MODE']);	
    	$t->set_var("MESSAGE_CODE_PROFIL_OBLIGATOIRE", CST_LIBELLE_CODE_PROFIL_OBLIGATOIRE);  
    	$t->set_var("MESSAGE_CODE_PROFIL_EXISTANT", CST_LIBELLE_CODE_PROFIL_EXISTANT);
    	$t->set_var("MESSAGE_VERIF_FORME_CODE", CST_MESSAGE_VERIF_FORME_LIBELLE_1);
    	$t->set_var("MESSAGE_VERIF_FORME_ALPHANUM", CST_MESSAGE_VERIF_FORME_ALPHANUM);
    	
    	// debut libellés des champs
    	$t->set_var("LIBELLE_FONCTION", CST_LIBELLE_FONCTION);
    	$t->set_var("LIBELLE_SERVICE", CST_LIBELLE_SERVICE);
    	$t->set_var("LIBELLE_PROFIL_INDEX", CST_LIBELLE_PROFIL_INDEX);
    	$t->set_var("LIBELLE_PROFIL_HIER", CST_LIBELLE_PROFIL_HIER);
    	$t->set_var("LIBELLE_CHAMP_PROFIL_PROFIL_UTIL", CST_LIBELLE_CHAMP_PROFIL_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_PERMISSIONS_PROFIL_UTIL", CST_LIBELLE_ENTETE_PERMISSIONS_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_DISPONIBILITE_PROFIL_UTIL", CST_LIBELLE_ENTETE_DISPONIBILITE_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_CLOISONNEMENT_PROFIL_UTIL", CST_LIBELLE_ENTETE_CLOISONNEMENT_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_CONFIDENTIALITE_PROFIL_UTIL", CST_LIBELLE_ENTETE_CONFIDENTIALITE_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_ADMINISTRER_PROFIL_UTIL", CST_LIBELLE_CHAMP_ADMINISTRER_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_ADMIN_THES_PROFIL_UTIL", CST_LIBELLE_CHAMP_ADMIN_THES_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_CREER_INDEX_PROFIL_UTIL", CST_LIBELLE_CHAMP_CREER_INDEX_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_CONSULT_INDEX_PROFIL_UTIL", CST_LIBELLE_CHAMP_CONSULT_INDEX_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_MODIF_INDEX_PROFIL_UTIL", CST_LIBELLE_CHAMP_MODIF_INDEX_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_SUPPRIM_INDEX_PROFIL_UTIL", CST_LIBELLE_CHAMP_SUPPRIM_INDEX_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_MODIF_FICHIER_PROFIL_UTIL", CST_LIBELLE_CHAMP_MODIF_FICHIER_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_NUMERISER_PROFIL_UTIL", CST_LIBELLE_CHAMP_NUMERISER_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_LISTRES_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_LISTRES_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_DOSSIER_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_DOSSIER_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_MAJRAF_PROFIL_UTIL", CST_LIBELLE_CHAMP_MAJRAF_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_DOMFERME_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_DOMFERME_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_LISTHIER_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_LISTHIER_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_UTIL_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_UTIL_PROFIL_UTIL);
    	$t->set_var("LIBELLE_INFO_PERMIS_NON_WEB_PROFIL_UTIL", CST_LIBELLE_INFO_PERMIS_NON_WEB_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_AFFICHER_PERMIS_NON_WEB_PROFIL_UTIL", CST_LIBELLE_ENTETE_AFFICHER_PERMIS_NON_WEB_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_NOTE_EXT_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_NOTE_EXT_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_ANNOTATION_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_ANNOTATION_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_GEST_FOND_PAGE_PROFIL_UTIL", CST_LIBELLE_CHAMP_GEST_FOND_PAGE_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_VISU_HISTO_PROFIL_UTIL", CST_LIBELLE_CHAMP_VISU_HISTO_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_CONECT_NT_PROFIL_UTIL", CST_LIBELLE_CHAMP_CONECT_NT_PROFIL_UTIL);
    	$t->set_var("LIBELLE_CHAMP_IMPRIMER_PROFIL_UTIL", CST_LIBELLE_CHAMP_IMPRIMER_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_EN_INDEXATION_PROFIL_UTIL", CST_LIBELLE_ENTETE_EN_INDEXATION_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_EN_RECHERCHE_PROFIL_UTIL", CST_LIBELLE_ENTETE_EN_RECHERCHE_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_TOUS_PROFIL_UTIL", CST_LIBELLE_ENTETE_TOUS_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_CODE_PROFIL_UTIL", CST_LIBELLE_ENTETE_CODE_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_LIBELLE_PROFIL_UTIL", CST_LIBELLE_ENTETE_LIBELLE_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_TOUS_VOLUMES_PROFIL_UTIL", CST_LIBELLE_ENTETE_TOUS_VOLUMES_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_VOLUMES_PROFIL_UTIL", CST_LIBELLE_ENTETE_VOLUMES_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_VOLUMES_SUIVANTS_PROFIL_UTIL", CST_LIBELLE_ENTETE_VOLUMES_SUIVANTS_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_NUMERO_PROFIL_UTIL", CST_LIBELLE_ENTETE_NUMERO_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_HABILITATION_PROFIL_UTIL", CST_LIBELLE_ENTETE_HABILITATION_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_NIVEAU_PROFIL_UTIL", CST_LIBELLE_ENTETE_NIVEAU_PROFIL_UTIL);
    	$t->set_var("LIBELLE_ENTETE_NIVEAUX_SUIVANTS_PROFIL_UTIL", CST_LIBELLE_ENTETE_NIVEAUX_SUIVANTS_PROFIL_UTIL);
    	// fin libellés des champs
    	
    	if (strcmp($_REQUEST['MODE'], "CREATION") == 0)
    	{ 	
    		$szTraitement =  (isset($_REQUEST['POS_CODE_PROFIL'])) ? "COPIE" : "CREATION";
    		
    		// Récupération de tous les profils pour parser un tableau de nom de profil dans le template de création :
    		// il faut empécher la création/copie d'un profil avec un nom déjà existant.
    		$szTousProfils = "";
    		$objInfoTousProfilsMaj = array();
    		$tabInfoTousProfils = array();
    		$retour = pos_gestprofilutil($jeton, $szTousProfils, PHP_VULCAIN_UTIL_GET_ALL_PROFIL, $objInfoTousProfilsMaj, /*pref*/$tabInfoTousProfils);
    		if ($retour)
    		{
    			for($i=0; $i<count($tabInfoTousProfils);$i++)			
    			{
    				$t->set_var("NOM_PROFIL", trim($tabInfoTousProfils[$i]->szProfil));
    				$t->set_var("CPT_NOM_PROFIL", $i);
    				$t->parse("bloc_tous_noms_profils", "BLOC_TOUS_NOMS_PROFILS",true);
    			}
    		}
    		else
    			debug($jeton);
    	}
    	elseif (strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
    	   	$szTraitement = "MODIFICATION";
    	
    	// Profil en création
    	$bCreation = false;
    	if (strcmp($szTraitement, "CREATION") == 0)
    	{				
            $t->set_var("TITRE_PAGE", CST_LIBELLE_CREATION_PROFIL_UTIL);
    		$t->set_var("CLASS_INFOS", "inputChamp");
    		$t->set_var("READONLY_INFOS", "");
    		$szProfil = "";
            $bCreation = true;						
    	}
    	else
    	{	
    		$szProfilUrl = stripslashes(urldecode($_REQUEST['POS_CODE_PROFIL']));			
    		$retour = pos_gestprofilutil($jeton, $szProfilUrl, PHP_VULCAIN_UTIL_GET_PROFIL, "", /*pref*/$tabInfoProfil);
    		$objProfil = $tabInfoProfil[0];
    		
    		// Profil en modification
    		if(strcmp($szTraitement, "MODIFICATION") == 0)
    		{	
    			$szProfil=  trim($objProfil->szProfil);
    			$t->set_var("TITRE_PAGE", CST_LIBELLE_GESTION_PROFIL." ".$szProfil);
    			$t->set_var("CLASS_INFOS", "verrouille");
    			$t->set_var("READONLY_INFOS", "Readonly");
    		}
    		// Profil en création par copie
    		elseif (strcmp($szTraitement, "COPIE") == 0)
    		{	
    			$t->set_var("TITRE_PAGE", CST_LIBELLE_CREATION_PROFIL_UTIL);
    			$szProfil = "";
    			$t->set_var("CLASS_INFOS", "inputChamp");
    			$t->set_var("READONLY_INFOS", "");
    		}
        }
    	// Informations générales
    	// Profil
    	$t->set_var("CODE_PROFIL", htmlentities_currentcharset($szProfil, ENT_QUOTES));
    	$t->set_var("FONC_PROFIL", (strcmp($szTraitement, "CREATION") != 0) ? htmlentities_currentcharset(trim($objProfil->szFonction), ENT_QUOTES) : "");
    									
    	// Profil Hiérarchique
    	$retour = pos_gestprofil($jeton, PHP_VULCAIN_GET, PHP_VULCAIN_PROFIL_UTI, /*pref*/$iNbProfils, /*pref*/$szListeProfilHier);
    	if ($retour)
    	{
    		$tabTousProfilsHier = explode("\x02", trim($szListeProfilHier, "\x02"));
    		array_unshift($tabTousProfilsHier, "");
    		for($j=0; $j<count($tabTousProfilsHier); $j++)
    		{
    			$t->set_var("PROFIL_HIERARCHIQUE", $tabTousProfilsHier[$j]);
                $t->set_var("TOUS_PROFIL_HIERARCHIQUE_SELECTED", (!$bCreation && (strcmp($tabTousProfilsHier[$j], trim($objProfil->szProfilHier)) == 0)) ? "selected" : "");
    			$t->parse("bloc_tous_profils_hierarchiques", "BLOC_TOUS_PROFILS_HIERARCHIQUES",true);				
    		}
    	}
    	else
    		debug($jeton);
    	
    	// Profil fiche d'index											
    	$retour = pos_gestprofil($jeton, PHP_VULCAIN_GET, PHP_VULCAIN_PROFIL_FIP, /*pref*/$iNbProfils, /*pref*/$szListeProfilIndex);
    	if ($retour)
    	{	
    		$tabTousProfilsIndex = explode("\x02", trim($szListeProfilIndex, "\x02"));
    		array_unshift($tabTousProfilsIndex, "");
    		for($j=0; $j<count($tabTousProfilsIndex); $j++)
    		{
    			$t->set_var("PROFIL_INDEX", $tabTousProfilsIndex[$j]);
    			$t->set_var("TOUS_PROFIL_INDEX_SELECTED", (!$bCreation && strcmp($tabTousProfilsIndex[$j], trim($objProfil->szProfilFIP)) == 0) ? "selected" : "");
    			$t->parse("bloc_tous_profils_index", "BLOC_TOUS_PROFILS_INDEX",true);
    		}
    	}
    	else
    		debug($jeton);
    	
    	// Services
    	$retour = pos_getlisteinfo($jeton, 3, /*pref*/$tabTousService);
    	if ($retour) 
    	{
    		foreach ($tabTousService as $keyService => $valueService)
    		{  
                $t->set_var("TOUS_SERVICE_SELECTED", (!$bCreation && (strcmp($keyService, trim($objProfil->szService)) == 0)) ? "selected" : "");
    			$t->set_var("SERVICE_PROFIL", $keyService);
    			$t->parse("bloc_tous_services", "BLOC_TOUS_SERVICES",true);
    		}
    	}
    	else
    		debug($jeton);
    	
    //	Permissions
    	$t->set_var("DRT_ADMIN_CHECKED", (!$bCreation && ($objProfil->bAdministrer == 1)) ? "checked" : "");
    	$t->set_var("DRT_ADMIN_THES_CHECKED", (!$bCreation && ($objProfil->bThesaurus == 1)) ? "checked" : "");
    	$t->set_var("DRT_CREER_INDEX_CHECKED", (!$bCreation && ($objProfil->bIndexer == 1)) ? "checked" : "");
    	$t->set_var("DRT_CONSULT_INDEX_CHECKED", (!$bCreation && ($objProfil->bConsulter == 1)) ? "checked" : "");
    		
    	$iDrtModifier = (!$bCreation) ? $objProfil->wModifier : 0;
    	$t->set_var("DRT_MODIF_INDEX_CHECKED", ($iDrtModifier == PHP_VULCAIN_DROIT_MODIFIER_IDX_ET_PAGE || $iDrtModifier == PHP_VULCAIN_DROIT_MODIFIER_IDX_SEUL) ? "checked" : "");
    	$t->set_var("DRT_MODIF_FICHIER_CHECKED", ($iDrtModifier == PHP_VULCAIN_DROIT_MODIFIER_IDX_ET_PAGE || $iDrtModifier == PHP_VULCAIN_DROIT_MODIFIER_PAGE_SEUL) ? "checked" : "");
    	$t->set_var("DRT_SUPPRIM_INDEX_CHECKED", (!$bCreation && ($objProfil->bSuppDoc == 1)) ? "checked" : "");				
    	$t->set_var("DRT_NUMERISER_CHECKED", (!$bCreation && ($objProfil->bNumeriser == 1)) ? "checked" : "");
    	$t->set_var("DRT_GEST_LR_CHECKED", (!$bCreation && ($objProfil->bProfilLR == 1)) ? "checked" : "");
    	$t->set_var("DRT_GEST_DOSSIER_CHECKED", (!$bCreation && ($objProfil->bDossier == 1)) ? "checked" : "");
    	$t->set_var("DRT_GEST_NOTE_EXT_CHECKED", (!$bCreation && ($objProfil->bNotesExternes == 1)) ? "checked" : "");
    	$t->set_var("DRT_GEST_ANNOTATION_CHECKED", (!$bCreation && ($objProfil->bAnnotations == 1)) ? "checked" : "");
    	$t->set_var("DRT_GEST_FOND_PAGE_CHECKED", (!$bCreation && ($objProfil->bFondPage == 1)) ? "checked" : "");
    	// à vérifier
    	$t->set_var("DRT_VISU_HISTO_CHECKED", (!$bCreation && ($objProfil->bMarquePage == 1)) ? "checked" : "");					
    	$t->set_var("DRT_MAJ_RAFALE_CHECKED", (!$bCreation && ($objProfil->bMajRafale == 1)) ? "checked" : "");
    	$t->set_var("DRT_CONNECTION_NT_CHECKED", (!$bCreation && ($objProfil->bConnectionNT == 1)) ? "checked" : "");
    	
    	// masques sur dwDroitAdmin
    	$iDrtAdmin = (!$bCreation) ? $objProfil->dwDroitAdmin : 0;
    	$t->set_var("DRT_GEST_UTIL_CHECKED", (POS_DRT_ADMIN_USER & $iDrtAdmin) ? "checked" : "");
    	$t->set_var("DRT_GEST_DOM_FERME_CHECKED", ((POS_DRT_ADMIN_DF & $iDrtAdmin) == 4) ? "checked" : "");
    	$t->set_var("DRT_GEST_LISTHIER_CHECKED", ((POS_DRT_ADMIN_LH & $iDrtAdmin) == 2) ? "checked" : "");
    	$t->set_var("DRT_IMPRIMER_CHECKED", (!$bCreation && ($objProfil->bImpression == 1)) ? "checked" : "");
    	
        // Confidentialité			
    	$retour = pos_getlisteinfo($jeton, 15, /*pref*/$tabNivConf);
    	// renvoit un tableau associatif avec pour cle le numéro de confidentialité
    	// alors que pos_gestprofilutil renvoit un tableau tabNivConf indéxé de 20 valeurs
    	if ($retour) 
    	{
    		$j=0;
    		foreach ($tabNivConf as $keyConf => $valueConf)
    		{		
    			$t->set_var("NUMERO_CONFIDENTIALITE", $keyConf);
    			$t->set_var("HABILITATION_CONFIDENTIALITE", $valueConf);
    			$t->set_var("POS_NIVEAU_CONFIDENTIALITE_NAME", "POS_NIVEAU_CONFIDENTIALITE_".$keyConf);
    			$t->set_var("NIVEAU_CONFIDENTIALITE_VALUE", isset($objProfil->tabNivConf[$j]) ? $objProfil->tabNivConf[$j] : 0) ;							
    			if($j<3)
    				$t->parse("bloc_confidentialite_1", "BLOC_CONFIDENTIALITE_1",true);
    			else
    				$t->parse("bloc_confidentialite_2", "BLOC_CONFIDENTIALITE_2",true);
    			$j++;
    		}
    		$t->set_var("MAX_CONFIDENTIALITE_VALUE", $j);
    	}
    	else
    		debug($jeton);
    // Cloisonnement
        $tabCloisonnement = array();
    	if (!$bCreation)
    		$tabCloisonnement = explode(";",$objProfil->szListeCloison);
    		
    	$t->set_var("MAX_VOL_CLOISONNEMENT_VALUE", MAX_VOL_CLOISONNEMENT);
    	$t->set_var("TOUS_LES_VOLUMES_CHECKED", (!$bCreation && $objProfil->bToutCloison == 1) ? "checked" : "");
    	for($k=0; $k<MAX_VOL_CLOISONNEMENT; $k++)
    	{	
    		$t->set_var("CLASS_CLOISONNEMENT", (!$bCreation && $objProfil->bToutCloison == 1) ? "verrouille" : "");
    		$t->set_var("READONLY_CLOISONNEMENT", (!$bCreation && $objProfil->bToutCloison == 1) ? "Readonly" : "");
    		$t->set_var("VOLUME", (!$bCreation) ? $tabCloisonnement[$k] : "");
    		$t->set_var("CPT", $k+1);
    		
            if($k<5)
    			$t->parse("bloc_cloisonnement_1", "BLOC_CLOISONNEMENT_1", true);
    		else
    			$t->parse("bloc_cloisonnement_2", "BLOC_CLOISONNEMENT_2", true);
    	}
    
        // Types disponibles en indexation
    	// Récupération des types de document de l'application
    	$retour = pos_getlistalltypes($jeton, /*pref*/$tabListeTypeDoc);
    	$t->set_var("MAX_DOCUMENT_TYPE_VALUE", count($tabListeTypeDoc));
    	
    	// si tous les documents sont indexés la chaine est vide 
    	$bTousDocumentsIndexes = (!$bCreation && strlen($objProfil->liste_types_indexables) > 0) ? false : true;
    	$t->set_var("TOUS_DOCUMENTS_INDEX_CHECKED", $bTousDocumentsIndexes ? "checked" : "");
    	$cptDocIndex=1;
    	foreach ($tabListeTypeDoc as $keyDoc => $valueDoc)
    	{	
    		$t->set_var("POS_DOCUMENT_INDEX", "POS_DOCUMENT_INDEX_".$keyDoc);
    		$t->set_var("DOCUMENT_INDEX_ID", "DOCUMENT_INDEX_".$cptDocIndex++);
    		$t->set_var("DOCUMENT_INDEX_CHECKED", (!$bCreation && strstr($objProfil->liste_types_indexables, $keyDoc.";")) ? "checked" : "");
    		$t->set_var("DOCUMENT_INDEX_DISABLED", $bTousDocumentsIndexes ? "disabled" : "");
    		$t->set_var("CODE_DOCUMENT_INDEX", $keyDoc);
    		$t->set_var("LIBELLE_DOCUMENT_INDEX", $valueDoc);			
    		$t->parse("bloc_document_index", "BLOC_DOCUMENT_INDEX",true);
    	}
    
        // Types disponibles en recherche
    	// si tous les documents sont indexés la chaine est vide 
    	$bTousDocumentsRecherche = (!$bCreation && strlen($objProfil->liste_types_recherchables) > 0) ? false : true;
        $t->set_var("TOUS_DOCUMENTS_RECH_CHECKED", $bTousDocumentsRecherche ? "checked" : "");
    	$cptDocRech=1;
    	foreach ($tabListeTypeDoc as $keyDoc => $valueDoc)
    	{	
    		$t->set_var("POS_DOCUMENT_RECH", "POS_DOCUMENT_RECH_".$keyDoc);
    		$t->set_var("DOCUMENT_RECH_ID", "DOCUMENT_RECH_".$cptDocRech++);
    		$t->set_var("DOCUMENT_RECH_CHECKED", (!$bCreation && strstr($objProfil->liste_types_recherchables, $keyDoc.";")) ? "checked" : "");
    		$t->set_var("DOCUMENT_RECH_DISABLED", $bTousDocumentsRecherche ? "disabled" : "");
    		$t->set_var("CODE_DOCUMENT_RECH", $keyDoc);
    		$t->set_var("LIBELLE_DOCUMENT_RECH", $valueDoc);			
    		$t->parse("bloc_document_rech", "BLOC_DOCUMENT_RECH",true);
    	}
    				
    	$t->pparse("MyOutput", "profil");
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
