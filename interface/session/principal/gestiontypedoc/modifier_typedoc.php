<?php
/* 
 * Modification ou création d'une rubrique
 * 
 *
 * Patrick Legaigneur 27/05/2011
 *

 */  
//header('Content-type: text/html; charset=UTF-8');
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");

function supprimerFip($argjeton, $argCodeTypeDoc)
{
	$retour = pos_gestprofil($argjeton, PHP_VULCAIN_GET, PHP_VULCAIN_PROFIL_FIP, /*pref*/$iNbProfils, /*pref*/$szListeProfilIndex);
	if ($retour)
	{
		if ($iNbProfils > 0)
		{ 
			$tabTousProfilsIndex = explode("\x02", trim($szListeProfilIndex, "\x02"));
			array_unshift($tabTousProfilsIndex, "");
			for($j=0; $j<count($tabTousProfilsIndex); $j++)
			{
				$tabParamFiche = array();			
				$retour = pos_setparamindex($argjeton, $argCodeTypeDoc, $tabTousProfilsIndex[$j],$tabParamFiche);
				if (!$retour)
					debug($argjeton);
			}
		}
	}
	else
		debug($jeton);
}

if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $retour = connexion($jeton);
    if ($retour)
    {
        $szCodeTypeDoc = stripslashes(urldecode($_REQUEST['POS_CODE_TYPEDOC']));
    	// Si on est en ajout/modification
        if(strcmp($_REQUEST['MODE'], "CREATION") == 0 || strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
        {
     		$objTypeDoc = Array();
    		$objTypeDoc["szTypeDoc"] = $szCodeTypeDoc;
    		$objTypeDoc["szNomTypeDoc"]  = stripslashes(urldecode(trim($_REQUEST['POS_LIBELLE_TYPEDOC'])));
    		$objTypeDoc["wArchiver"] = $_REQUEST['POS_CHOIX_ARCHIVAGE'];
    		    		
    		// sinon toutes les rubriques intervenant dans le paramétrage ne sont ne sont prises en compte
    		if(strcmp($_REQUEST['MODE'], "CREATION") == 0)
            {
                $objTypeDocTmp = Array();
        		$objTypeDocTmp["szTypeDoc"] = $szCodeTypeDoc;
        		$objTypeDocTmp["szNomTypeDoc"]  = stripslashes(urldecode(trim($_REQUEST['POS_LIBELLE_TYPEDOC'])));
        		$objTypeDocTmp["wArchiver"] = $_REQUEST['POS_CHOIX_ARCHIVAGE'];
                $retour = pos_settype($jeton, $objTypeDocTmp);
            }  
    		if (!$retour)
        		debug($jeton);
            
            // la gestion des versions n'existe pas en client léger, on conserve l'existant            
            $retour = pos_gettype($jeton, $szCodeTypeDoc, /*pref*/$tabLstDoc);
            $objTypeDoc["stArchive"] =  $tabLstDoc[0]->stArchive;
            $objTypeDoc["bInvisible"]  = isset($_REQUEST['POS_INV_RECH']) ? 1: 0;
     		if (isset($_REQUEST['POS_K_H_TYPEDOC']))
     			if (isset($_REQUEST['POS_KH_MULTI']))
     				$objTypeDoc["wHierarchie"] = 2;
     			else
     				$objTypeDoc["wHierarchie"] = 1;
     		else
    			$objTypeDoc["wHierarchie"] = 0;	
            
            $objTypeDoc["cSeparateurCle"] = $_REQUEST['POS_SEPARATEUR_KH'];
    		$objTypeDoc["bThesaurus"] = $_REQUEST['POS_THESAURUS_TYPEDOC'];
    		$objTypeDoc["bIndexAuto"]  = isset($_REQUEST['POS_INDEX_AUTO_FIC']) ? 1: 0;
    		//$objTypeDoc["wArchiver"] = $_REQUEST['POS_CHOIX_ARCHIVAGE'];
    		$objTypeDoc["wNbJourSurDM"] = $_REQUEST['POS_RETENTION_DM'];
    		
    		$FichiersFullText = isset($_REQUEST['POS_CHECK_FICHIERS_FULLTEXT']) ? PHP_VULCAIN_FULLTEXT_INDEXER_PAGE : PHP_VULCAIN_FULLTEXT_INDEXER_NON;
    		$SousFichiersFullText = isset($_REQUEST['POS_CHECK_SOUS_FICHIERS_FULLTEXT']) ? PHP_VULCAIN_FULLTEXT_INDEXER_SOUSPAGE : PHP_VULCAIN_FULLTEXT_INDEXER_NON;
            $DernierFichierFullText = isset($_REQUEST['POS_CHECK_DERNIER_FICHIER_FULLTEXT']) ? PHP_VULCAIN_FULLTEXT_INDEXER_LAST_PAGE : PHP_VULCAIN_FULLTEXT_INDEXER_NON;        
    		
            // les 3 checkbox ne sont pas cumulatives, soit dernier fichier, soit fichier et/ou sous-fichiers
            if ($DernierFichierFullText != PHP_VULCAIN_FULLTEXT_INDEXER_NON)
                $objTypeDoc["wFullTexte"] = $DernierFichierFullText;
            else
                $objTypeDoc["wFullTexte"] = $FichiersFullText | $SousFichiersFullText;
    		
    		$objTypeDoc["bXML"] = isset($_REQUEST['POS_XML']) ? 1: 0;
    		$objTypeDoc["bFicheParam"] =isset($_REQUEST['POS_FICHE_PARAM']) ? 1: 0;
    		// Suppression des fiches paramétrées
    		if ($objTypeDoc["bFicheParam"] == 0)
    			supprimerFip($jeton, $szCodeTypeDoc);				
    		
    		// début restricfion d'accés
            $tabRestrictionAcces = json_decode(utf8_encode(stripslashes($_REQUEST["POS_RESTACCES_JSON_STRING"])), true);
            //print_r($tabRestrictionAcces);
    		$objTypeDoc["wTypeRubConsultIndex"] = $tabRestrictionAcces['POS_CTRL_CONSULT_INDEX'];
    		$objTypeDoc["wTypeRubConsultFichiers"] = 0;
    		$objTypeDoc["wTypeRubModifIndex"] = $tabRestrictionAcces['POS_CTRL_MODIF_INDEX'];
    		$objTypeDoc["wTypeRubModifFichiers"] = $tabRestrictionAcces['POS_CTRL_MODIF_FICHIER'];
    		$objTypeDoc["wTypeRubSupprIndex"] = $tabRestrictionAcces['POS_CTRL_SUPP_INDEX']; 
    		$objTypeDoc["wTypeRubSupprFichiers"] = $tabRestrictionAcces['POS_CTRL_SUPP_FICHIER'];
    		$objTypeDoc["wTypeRubAjoutFils"] = $tabRestrictionAcces['POS_CTRL_AJOUT_FILS'];
    		$objTypeDoc["wTypeRubSupprFils"] = $tabRestrictionAcces['POS_CTRL_SUPP_FILS'];
    		$objTypeDoc["szCodeRubConsultIndex"] = $tabRestrictionAcces['POS_RUB_CONSULT_INDEX'];
    		$objTypeDoc["szCodeRubConsultFichiers"] = ""; 
    		$objTypeDoc["szCodeRubModifIndex"] = $tabRestrictionAcces['POS_RUB_MODIF_INDEX'];
    		$objTypeDoc["szCodeRubModifFichiers"] = $tabRestrictionAcces['POS_RUB_MODIF_FICHIER'];
    		$objTypeDoc["szCodeRubSupprIndex"] = $tabRestrictionAcces['POS_RUB_SUPP_INDEX'];
    		$objTypeDoc["szCodeRubSupprFichiers"] = $tabRestrictionAcces['POS_RUB_SUPP_FICHIER'];
    		$objTypeDoc["szCodeRubAjoutFils"] = $tabRestrictionAcces['POS_RUB_AJOUT_FILS'];
    		$objTypeDoc["szCodeRubSupprFils"] = $tabRestrictionAcces['POS_RUB_SUPP_FILS'];
    		$objTypeDoc["szQuestionRestriction"] =  utf8_decode($tabRestrictionAcces['POS_RESTRICTION_QUESTION']); 
    		
    		$objTypeDoc["dwTypeConfDef"]  = $tabRestrictionAcces['POS_CTRL_CONF_TYPE'];		 
    		if ($_REQUEST['POS_CTRL_CONF_TYPE'] == 0)
    			$objTypeDoc["wIndConfDef"] = 0;
    		else 
    			$objTypeDoc["wIndConfDef"] = $tabRestrictionAcces['POS_HAB_CONF_TYPE'] - 1; 
    		$objTypeDoc["wNivConfDef"] = $tabRestrictionAcces['POS_NIV_CONF_TYPE']; 
    		$objTypeDoc["szCloisonDef"] = $tabRestrictionAcces['POS_CLOIS_CONF_TYPE'];
    		// fin restricfion d'accés
    	
    		// début clé hiérarchique
    		if (isset($_REQUEST['POS_KH']))
    		{	
    			//print_r($_REQUEST["POS_CLEHIER_JSON_STRING"]);
    			$tabCleHier = json_decode(utf8_encode(stripslashes($_REQUEST["POS_CLEHIER_JSON_STRING"])), true);
    			
    			// la structure  de données a été modifiée par la consulation de l'interface de la clé hiérarchique
    			// même si celle ci elle n'a pas pas été modifiée
    			if ($tabCleHier[2]["num_zone_kh"] != null)		
    			{	$tabCleHierFinal = Array();
    				$tabCleHierFinal[0] = $tabCleHier[0];	// wHierarchie pas utilisé car on se sert des checkbox du formulaire				
    				$tabCleHierFinal[1] = $tabCleHier[1]; //wHierNbZone
    				foreach($tabCleHier as $key => $value)			
    				{	
    				// value est "stKeyHier"
    					if ($key == 2)
    					{
    						foreach($value as $key2 => $value2)
    						{	
    							if (strcmp($key2, "wIndZoneCpt") != 0 && strcmp($key2, "wIndZoneRupture") !=0)
    							{
    								for($i=0; $i<20;$i++)
    								{	
    									if($i<$tabCleHier[1])					
    									{
    										if(strcmp($key2, "szLibelleZone") == 0)
    											$tabCleHier[$key][$key2][$i] = utf8_decode($value2[$i]);
    									}
    									else
    									{ 
    										if($key2[0] == "b" || $key2[0] == "w")
    										{
    											array_push($tabCleHier[$key][$key2],"0");
    										}
    										else // $key2[0] == "s"
    											array_push($tabCleHier[$key][$key2],"");	 
    									}
    								}
    							}	
    							if (strcmp($key2, "num_zone_kh") != 0)								
    							{
    								$tabCleHierFinal[2][$key2] = $tabCleHier[$key][$key2];
    								for($i=0; $i<20;$i++)
    									$tabCleHierFinal[2]["wNumZoneComp"][$i] = 0;
    							}
    						}
    					}	
    				}
    			}
    			else
    			{
    				for($i=0;$i<count($tabCleHier[2]["szLibelleZone"]); $i++)
    					$tabCleHier[2]["szLibelleZone"][$i] =  utf8_decode($tabCleHier[2]["szLibelleZone"][$i]);
    				$tabCleHierFinal = Array();
    				$tabCleHierFinal = $tabCleHier;				
    			}
    			$objTypeDoc["wHierNbZone"] = $tabCleHierFinal[1];
    			$objTypeDoc["stKeyHier"] = $tabCleHierFinal[2];
    			if (isset($_REQUEST['POS_KH_MULTI']))
    				$objTypeDoc["wHierarchie"] = 2;
    			else
    				$objTypeDoc["wHierarchie"] = 1;			
    		}
    		else
    			$objTypeDoc["wHierarchie"] = 0;
    		// fin clé hiérarchique
    		
    		// début Informations dossiers
    		$tabInfoDossier = json_decode(utf8_encode(stripslashes($_REQUEST["POS_INFOSDOSSIER_JSON_STRING"])), true);
            //print_r($tabInfoDossier);
    		if (isset($tabInfoDossier['POS_CHECK_TYPE_DOSSIER']))
    		{
    			if (isset($tabInfoDossier['POS_CHECK_DOSSIER_REF']))
    				$objTypeDoc["wTypeDos"] = 2;
    			else
    				$objTypeDoc["wTypeDos"] = 1;
    			
    			$objTypeDoc["szRubTitreDos"] = $tabInfoDossier['POS_RUB_TITRE_DOSSIER'];	
    
    		}
    		else
    			$objTypeDoc["wTypeDos"] = 0;
    			
    			// // Type de document fils
    		$iSommewInsererAutoDos = 0;
    		if (isset($tabInfoDossier['POS_CHECK_INSERTION_AUTO']))
    		{
    		    // client windows : le masque est positionné soit à PHP_VULCAIN_INSERE_AUTO_DOSSIER, soit à PHP_VULCAIN_INSERE_AUTO_DOSSIER_EXISTANT
    			$iSommewInsererAutoDos = PHP_VULCAIN_INSERE_AUTO_DOSSIER;
    			if (isset($tabInfoDossier['POS_CHECK_TEST_EXIST_PERE']))
    				$iSommewInsererAutoDos = PHP_VULCAIN_INSERE_AUTO_DOSSIER_EXISTANT;
    			
    			if (isset($tabInfoDossier['POS_CHECK_SELECTION_CHAQUE_MOT']))
    				$iSommewInsererAutoDos |= PHP_VULCAIN_INSERE_AUTO_MULTILOC;
    				
    			if (isset($tabInfoDossier['POS_CHECK_MAJ_INSERTION_DOSSIER']))
    				$iSommewInsererAutoDos |= PHP_VULCAIN_MOVE_AUTO_DOSSIER;
    			
    			$objTypeDoc["wInsererAutoDos"] = $iSommewInsererAutoDos;
    			$objTypeDoc["szTypeDosRangement"] = $tabInfoDossier['POS_RUB_CODE_TYPE_PERE'];
    			$objTypeDoc["szRubSelectDos"] = $tabInfoDossier['POS_RUB_VAL_SELECTION_PERE'];
    			$objTypeDoc["szRubSelectDosFils"] = $tabInfoDossier['POS_RUB_VAL_SELECTION_FILS'];		
    		}		
    		else
    		{
    			$objTypeDoc["wInsererAutoDos"] = 0;
    			$objTypeDoc["szTypeDosRangement"] = "";
    			$objTypeDoc["szRubSelectDos"] = "";
    			$objTypeDoc["szRubSelectDosFils"] = "";		
    		}
    		// fin Informations dossiers
    				    
    		$objTypeDoc["bSpool"] = $tabLstDoc[0]->bSpool;
    		$objTypeDoc["wRubCloison"] = $tabLstDoc[0]->wRubCloison;
    		$objTypeDoc["wRubIndConf"] = $tabLstDoc[0]->wRubIndConf;
    		$objTypeDoc["szFondPage"] = $tabLstDoc[0]->szFondPage;
    		$objTypeDoc["wRubNivConf"] = $tabLstDoc[0]->wRubNivConf;
    		$objTypeDoc["bLierArr"] = $tabLstDoc[0]->bLierArr;
    		$objTypeDoc["wLigFdPg"] = $tabLstDoc[0]->wLigFdPg;
    		$objTypeDoc["wColFdPg"] = $tabLstDoc[0]->wColFdPg;
    		$objTypeDoc["nMaxPages"] = $tabLstDoc[0]->nMaxPages;
    		$objTypeDoc["szNomQuestion"] = $tabLstDoc[0]->szNomQuestion;
        		
    		$retour = pos_settype($jeton, $objTypeDoc);
            if (!$retour)
        		debug($jeton);
    		else
            {
    		//Actualisation de rubriques
        		$tabModificationRub = json_decode(utf8_encode($_REQUEST["POS_TABRUB_AJOUT_JSON_STRING"]), true);
        		
    		foreach($tabModificationRub as $szCodeRubModif => $tabRubParam)			
    		{	
    			$objRubrique = array();
    			$tabAsso = array();
    			foreach($tabRubParam as $szParam => $value)	
    			{ 
    				if (strcmp($szParam, "objAsso") == 0)
    				{						
    					for($i=0;$i<count($value);$i++)
    					{	foreach($value[$i] as $szRubinit => $szRubCible)
    						{	
    							$tabAsso[$i] = new stdClass();
                                $tabAsso[$i]->szRubInit = $szRubinit;
    							$tabAsso[$i]->szRubTypeCible = $szRubCible;
    						}
    					}	
    				}	
    				else
    				{
    	 				if (strcmp($szParam, "szDefaut") == 0 )
    	 				{		 					
    					 	$objRubrique[$szParam] = utf8_decode($value);
    					}
    					else if (strcmp($szParam, "Compteur") == 0)
    					{
    						if($value != "")
    						{
    							$valeurCpt = $value;
    							$retour = pos_gestcompteur($jeton, $szCodeRubModif, $szCodeTypeDoc, PHP_VULCAIN_INIT_CPT, /*pref*/$valeurCpt);
    							if (!$retour)
    								debug($jeton);
    						}
    					}
    					else if (strcmp($szParam, "szNomRub") == 0)
    					{
    						$objRubrique[$szParam] = utf8_decode($value);
    					}
    	 				else
    	 				{	
    					 	$objRubrique[$szParam] = $value;
    		 			}
    				}				
    			}
    			$retour = pos_setrubriquetype($jeton, $szCodeTypeDoc, "", $szCodeRubModif, $objRubrique);
    			
    			if (!$retour)
    				debug($jeton);
    			else				
            	{	
            		if (count($tabAsso)> 0)
            		{
    					$retour = pos_setassociation($jeton, $szCodeTypeDoc,  $szCodeRubModif,/*pref*/$tabAsso);
            			if (!$retour)
    						debug($jeton);
    				}
    				else
    				{
    					$retour = pos_delassociation($jeton, $szCodeTypeDoc,  $szCodeRubModif);
            			if (!$retour)
    						debug($jeton);
    				}		
    			}
    		}
    		
    	
    		//Suppression de rubriques
    		$tabSuppressionRub = json_decode(utf8_encode(stripslashes($_REQUEST["POS_TABRUB_SUPP_JSON_STRING"])), true);
    		// tableau des rubriques ajoutées
    		$tabTmpAjoutRub = json_decode(utf8_encode(stripslashes($_REQUEST["POS_TABRUB_TMP_JSON_STRING"])), true);				
    		foreach($tabSuppressionRub as $key => $szCodeRubSupp)			
    		{	
    			$bFoundTmpRub = false;
    			foreach($tabTmpAjoutRub as $key2 => $szCodeRubTmpAjout)			
    			{		
    				if (strcmp($szCodeRubSupp, $szCodeRubTmpAjout) == 0)
    				{
    					$bFoundTmpRub = true;
    					break;	
    				}
    			}
    			if($bFoundTmpRub == false)
    			{
    				$retour = pos_delrubriquetype($jeton, $szCodeTypeDoc, $szCodeRubSupp);
    				if (!$retour)
    					debug($jeton);
    			}
    		}			
                
                // gestion du profil par défaut
                //define GET_DEFAULT         9
                //define INIT_DEFAULT        11
                //define DEL_DEFAULT         13
                $sProfil = "";
            	$retour = pos_gestassoplr($jeton, 9, $szCodeTypeDoc, /*pref*/$sProfil);
                if (strlen($sProfil) == 0)
                {
                    $retour = pos_gestassoplr($jeton, 11, $szCodeTypeDoc, /*pref*/$sProfil);
                }
                $sProfilTousTypes = "";
            	$retour = pos_gestassoplr($jeton, 9, "000", /*pref*/$sProfilTousTypes);
                if (strlen($sProfilTousTypes) == 0)
                {
                    $retour = pos_gestassoplr($jeton, 11, "000", /*pref*/$sProfilTousTypes);
                }
                    
            }
            			
        } 
        else if (strcmp($_REQUEST['MODE'], "SUPPRESSION") == 0)
    	{
    		$retour = pos_deltype($jeton, $szCodeTypeDoc);
            if ($retour)
    			supprimerFip($jeton, $szCodeTypeDoc);
            else
    					debug($jeton);
        }  
    	 
    	include("liste_typedoc.php");
    	  
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
} 
?>