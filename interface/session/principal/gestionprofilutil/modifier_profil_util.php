<?php
/* 
 * Gestion des profils utilisateurs
 *
 * Patrick Legaigneur 21/01/2011
 *
 */
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");

define("POS_DRT_ADMIN_USER", 0x00000001);
define("POS_DRT_ADMIN_DF", 0x00000004);
define("POS_DRT_ADMIN_LH", 0x00000002);
define("MAX_CONFIDENTIALITE", 20);

if ($_SESSION["sess_droitAdminUtilisateur"] == false && $_SESSION["sess_droitAdministration"] == false)
{
	echo CST_LIBELLE_NO_ADMIN_USER;
}
else
{	
    $retour = connexion($jeton);
    if ($retour)
    {
    	$szProfil= trim($_REQUEST['POS_CODE_PROFIL']);
    
        // Si on est créé un profil ou modifie
        if($_REQUEST['MODE'] == "CREATION" || $_REQUEST['MODE'] == "MODIFICATION")
        {		
    		// préparation de l'objet Profil à partir des données du formulaire
        	$objInfoProfilMaj = new stdClass();
        	$objInfoProfilMaj->szProfil =  stripslashes($_REQUEST['POS_CODE_PROFIL']);
        	$objInfoProfilMaj->szFonction =  stripslashes($_REQUEST['POS_FONC_PROFIL']);
        	$objInfoProfilMaj->szProfilHier =  stripslashes($_REQUEST['POS_PROFIL_HIER']);
        	$objInfoProfilMaj->szService =  stripslashes($_REQUEST['POS_SERVICE_PROFIL']);
        	$objInfoProfilMaj->szProfilFIP =  stripslashes($_REQUEST['POS_PROFIL_INDEX']);
        	
    		// permissions    	
    		$objInfoProfilMaj->bAdministrer = isset($_REQUEST['POS_DRT_ADMIN']) ? 1 : 0;
        	$objInfoProfilMaj->bThesaurus = isset($_REQUEST['POS_DRT_ADMIN_THES']) ? 1 : 0;
    		$objInfoProfilMaj->bIndexer = isset($_REQUEST['POS_DRT_CREER_INDEX']) ? 1 : 0;
    		$objInfoProfilMaj->bConsulter = isset($_REQUEST['POS_DRT_CONSULT_INDEX']) ? 1 : 0;
    		
    		if (isset($_REQUEST['POS_DRT_MODIF_INDEX']))
    		{	
    			if (isset($_REQUEST['POS_DRT_MODIF_FICHIER']))
    				$objInfoProfilMaj->wModifier = PHP_VULCAIN_DROIT_MODIFIER_IDX_ET_PAGE;
    			else
    				$objInfoProfilMaj->wModifier = PHP_VULCAIN_DROIT_MODIFIER_IDX_SEUL;
    		}
    		else if (isset($_REQUEST['POS_DRT_MODIF_FICHIER']))
    				$objInfoProfilMaj->wModifier = PHP_VULCAIN_DROIT_MODIFIER_PAGE_SEUL;	
    		else 
    			$objInfoProfilMaj->wModifier = "0";	
    		
    		$objInfoProfilMaj->bSuppDoc = isset($_REQUEST['POS_DRT_SUPPRIM_INDEX']) ? 1 : 0;
    		$objInfoProfilMaj->bNumeriser = isset($_REQUEST['POS_DRT_NUMERISER']) ? 1 : 0;
    		$objInfoProfilMaj->bProfilLR = isset($_REQUEST['POS_DRT_GEST_LR']) ? 1 : 0;
    		$objInfoProfilMaj->bDossier = isset($_REQUEST['POS_DRT_GEST_DOSSIER']) ? 1 : 0;
    		$objInfoProfilMaj->bNotesExternes = isset($_REQUEST['POS_DRT_GEST_NOTE_EXT']) ? 1 : 0;
    		$objInfoProfilMaj->bAnnotations = isset($_REQUEST['POS_DRT_GEST_ANNOTATION']) ? 1 : 0;
    		$objInfoProfilMaj->bFondPage = isset($_REQUEST['POS_DRT_GEST_FOND_PAGE']) ? 1 : 0;
    		$objInfoProfilMaj->bMarquePage = isset($_REQUEST['POS_DRT_VISU_HISTO']) ? 1 : 0;
    		$objInfoProfilMaj->bMajRafale = isset($_REQUEST['POS_DRT_MAJ_RAFALE']) ? 1 : 0;
    		$objInfoProfilMaj->bConnectionNT = isset($_REQUEST['POS_DRT_CONNECTION_NT']) ? 1 : 0;
    		
    		$iDroitDomFerme = isset($_REQUEST['POS_DRT_GEST_DOM_FERME']) ? POS_DRT_ADMIN_DF : 0; 
    		$iDroitListHier = isset($_REQUEST['POS_DRT_GEST_LISTHIER']) ? POS_DRT_ADMIN_LH : 0;
    		$iDroitAdminUser = isset($_REQUEST['POS_DRT_GEST_UTIL']) ? POS_DRT_ADMIN_USER : 0;
    		$objInfoProfilMaj->dwDroitAdmin = $iDroitDomFerme + $iDroitListHier + $iDroitAdminUser;
    		$objInfoProfilMaj->bImpression = isset($_REQUEST['POS_DRT_IMPRIMER']) ? 1 : 0;
    		
    		// Confidentialite
    		for($i=0; $i<MAX_CONFIDENTIALITE;$i++)
    		{
    			$iNumIndex = $i+1;
    			$szNiveauConf="POS_NIVEAU_CONFIDENTIALITE_".$iNumIndex;
    			if (isset($_REQUEST[$szNiveauConf]))
    				$objInfoProfilMaj->tabNivConf[$i]=$_REQUEST[$szNiveauConf];
    			else
    				$objInfoProfilMaj->tabNivConf[$i]=0;
    		}
    		// Cloisonnement
    		$iNbCloisonnement = 0;
    		$szListeCloison = "";
    		$iToutCloison = 0;
    		if (isset($_REQUEST['POS_TOUS_LES_VOLUMES']))
    		{
                $objInfoProfilMaj->bToutCloison = 1;
                for($i=0; $i<$_REQUEST['MAX_VOL_CLOISONNEMENT'];$i++)
    			     $szListeCloison = $szListeCloison.";";
            }
    		else
    		{
    		    $objInfoProfilMaj->bToutCloison = 0;
    			for($i=1; $i<=$_REQUEST['MAX_VOL_CLOISONNEMENT'];$i++)
    			{
    				$szNiveauCloisonnement="POS_VOLUME_".$i;
    				$szListeCloison = $szListeCloison.$_REQUEST[$szNiveauCloisonnement].";";
    			}
    		}
    		$objInfoProfilMaj->szListeCloison = $szListeCloison;
    		
    		// Types disponible en indexation
    		$szliste_types_indexables = "";
    		if (isset($_REQUEST['POS_TOUS_DOCUMENTS_INDEX']))
    			$szliste_types_indexables = "";			
    		else
    		{
    			$retour = pos_getlistalltypes($jeton, /*pref*/$tabListeTypeDoc);
    			if ($retour)
    			{
    				foreach ($tabListeTypeDoc as $keyDoc => $valueDoc)
    				{
    					$szFormNomIndex = "POS_DOCUMENT_INDEX_".$keyDoc;
    					if(isset($_REQUEST[$szFormNomIndex]))
    						$szliste_types_indexables=$szliste_types_indexables.$keyDoc.";";
    				}
    			}
    			else
    				debug($jeton);									
    		}
    		$objInfoProfilMaj->liste_types_indexables = $szliste_types_indexables;
    		
    		// Types disponibles en recherche
    		$szliste_types_recherchables = "";
    		if (isset($_REQUEST['POS_TOUS_DOCUMENTS_RECH']))
    			$szliste_types_recherchables = "";			
    		else
    		{
    		    if (!isset($tabListeTypeDoc))
                    $retour = pos_getlistalltypes($jeton, /*pref*/$tabListeTypeDoc);
                    
    			foreach ($tabListeTypeDoc as $keyDoc => $valueDoc)
    			{
    				$szFormNomRecherche = "POS_DOCUMENT_RECH_".$keyDoc;
    				if(isset($_REQUEST[$szFormNomRecherche]))
    					$szliste_types_recherchables=$szliste_types_recherchables.$keyDoc.";";
    			}								
    		}
    		$objInfoProfilMaj->liste_types_recherchables = $szliste_types_recherchables;
    		
    		// création     
        	if(strcmp($_REQUEST['MODE'], "CREATION") == 0)
            	$retour = pos_gestprofilutil($jeton, $szProfil, PHP_VULCAIN_UTIL_NEW_PROFIL, $objInfoProfilMaj, /*pref*/$tabInfoProfil);
         	// modification
    		else if(strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
            	$retour = pos_gestprofilutil($jeton, $szProfil, PHP_VULCAIN_UTIL_SET_PROFIL, $objInfoProfilMaj, /*pref*/$tabInfoProfil);
        }
    	else if (strcmp($_REQUEST['MODE'], "SUPPRESSION") == 0)
        {
    		$retour = pos_gestprofilutil($jeton, urldecode($szProfil), PHP_VULCAIN_UTIL_DEL_PROFIL, "", /*pref*/$tabInfoProfil);
        }
        if (!$retour)
            debug($jeton);
    
    	include("liste_profil_util.php");
    	
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
