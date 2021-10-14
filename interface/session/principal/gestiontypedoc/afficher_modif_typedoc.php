<?php
/* 
 * Gestion des types de document
 * 
 *	Patrick Legaigneur : 17/06/2011
 */
if (!isset($_SESSION))
    session_start();                                                                                  
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$tabTypeRubrique = array (
	"0" => CST_LIBELLE_TYPE_RUBRIQUE_ALPHA,
	"1" => CST_LIBELLE_TYPE_RUBRIQUE_ENTIER,
	"2" => CST_LIBELLE_TYPE_RUBRIQUE_DATE,
	"3" => CST_LIBELLE_TYPE_RUBRIQUE_TABLEAU,
	"4" => CST_LIBELLE_TYPE_RUBRIQUE_DECIMAL
);

if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $szCodeTypeDoc = isset($_REQUEST['POS_CODE_TYPEDOC']) ? stripslashes(urldecode($_REQUEST['POS_CODE_TYPEDOC'])) : "";
    $szLibelleTypeDoc = isset($_REQUEST['POS_LIBELLE_TYPEDOC']) ? stripslashes(urldecode($_REQUEST['POS_LIBELLE_TYPEDOC'])) : "";   
    	    
    $retour = connexion($jeton);
    if ($retour)
    {
        if(strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
        {
            $retour = pos_gettype($jeton, $szCodeTypeDoc, /*pref*/$tabLstDoc);
            $objType = $tabLstDoc[0];
        }
    	if($retour)
    	{
    		//error_log(print_r($objType, true));
    		// Affichage
    		$t = new Template(".");
    	
    		$t->set_File("modif_typedoc", REP_TEMPLATE_APPLICATIF."gestiontypedoc/modif_typedoc.tpl");
    			
    		$t->set_block("modif_typedoc", "BLOC_TOUS_TYPEDOC", "bloc_tous_typedoc");
    		$t->set_block("modif_typedoc", "BLOC_RUBRIQUES_DISPONIBLES", "bloc_rubriques_disponibles");
    		$t->set_block("modif_typedoc", "BLOC_RUBRIQUES_DANS_TYPEDOC", "bloc_rubriques_dans_typedoc");
    		
    		//	début de déclaration pour affichage dans les datatables yui
    		// datatable source		
    		$t->set_block("modif_typedoc", "COLUMN_POSITION", "column_position");
    		$t->set_block("modif_typedoc", "COLUMNS_DEF", "columns_def");
    		$t->set_block("modif_typedoc", "LR_REPONSE", "lr_reponse");
     		$t->set_block("modif_typedoc", "BLOCK_LIGNE", "block_ligne");		
    		// datatable target	
    		$t->set_block("modif_typedoc", "COLUMN_POSITION2", "column_position2");
    		$t->set_block("modif_typedoc", "COLUMNS_DEF2", "columns_def2");
    		$t->set_block("modif_typedoc", "LR_REPONSE2", "lr_reponse2");
     		$t->set_block("modif_typedoc", "BLOCK_LIGNE2", "block_ligne2");		
    		//	fin de déclaration pour affichage dans les datatables yui
    	
            $tabDefine = get_defined_constants(true);
            $prefixLibelle = "CST_TDOC_";
            $lenPrefixLibelle = strlen($prefixLibelle);
            foreach($tabDefine['user'] as $code => $valeur)
            {
                if(strpos($code, $prefixLibelle) === 0)
                {
                    $t->set_var(substr($code, $lenPrefixLibelle), $valeur);
                }
            }
    		
    		$t->set_var("LIBELLE_TYPEDOC_FULLTEXT", CST_TDOC_LIBELLE_TYPEDOC_FULLTEXT);
    		$t->set_var("LIBELLE_AJOUTER_RUBRIQUE", CST_LIBELLE_AJOUTER);
    		$t->set_var("LIBELLE_SUPPRIMER_RUBRIQUE", CST_LIBELLE_SUPP);
    		$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
    	    $t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
    	    $t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
    	    
    		$t->set_var("LIBELLE_RUB_FULLTEXT", CST_TDOC_LIBELLE_TYPEDOC_FULLTEXT);
    		$t->set_var("MESSAGE_CODE_TYPEDOC_OBLIGATOIRE", CST_MESSAGE_CODE_TYPEDOC_OBLIGATOIRE);
    		$t->set_var("MESSAGE_LIBELLE_TYPEDOC_OBLIGATOIRE", CST_MESSAGE_LIBELLE_TYPEDOC_OBLIGATOIRE);
    		$t->set_var("MESSAGE_CODE_TYPEDOC_EXISTANT", CST_MESSAGE_CODE_TYPEDOC_EXISTANT);
    		$t->set_var("MESSAGE_NB_RUBRIQUE_OBLIGATOIRE", CST_MESSAGE_NB_RUBRIQUE_OBLIGATOIRE);		
    		$t->set_var("MESSAGE_VERIF_FORME_CODE", CST_MESSAGE_VERIF_FORME_CODE);
    		$t->set_var("MESSAGE_VERIF_FORME_LIBELLE", CST_MESSAGE_VERIF_FORME_LIBELLE_2);		
    
            $t->set_var("LIBELLE_RUB_CLEHIER", CST_CHAMP_SPE_KH);
            $t->set_var("CODE_RUB_CLEHIER", "K H");
            
    		$t->set_var("URL_ATTENTE", URL_ATTENTE);
    	    $t->set_var("CODE_ACTION", URL_MODIFIE_TYPEDOC);
    	    $t->set_var("URL_ANNULER", URL_LIST_TYPEDOC);
    	    
    	    // bloc et variables  dans div popup "Restriction d'accès"
    		$t->set_block("modif_typedoc", "BLOC_RESTRICTION_QUESTION", "bloc_restriction_question");
    	    $t->set_block("modif_typedoc", "BLOC_HAB_CONF_TYPE", "bloc_hab_conf_type");
    		$t->set_var("LIBELLE_HAB_CONF_TYPE", CST_LIBELLE_ENTETE_HABILITATION_PROFIL_UTIL);
    		$t->set_var("LIBELLE_NIV_CONF_TYPE", CST_LIBELLE_ENTETE_NIVEAU_PROFIL_UTIL);
    		$t->set_var("LIBELLE_CLOIS_CONF_TYPE", CST_CHAMP_SPE_CLOI);
    	    $t->set_var("MESSAGE_CONSULTATION_INDEX_RUB_VIDE", CST_MESSAGE_CONSULTATION_INDEX_RUB_VIDE);
    	    $t->set_var("MESSAGE_MODIFICATION_INDEX_RUB_VIDE", CST_MESSAGE_MODIFICATION_INDEX_RUB_VIDE);
    	    $t->set_var("MESSAGE_MODIFICATION_FICHIER_RUB_VIDE", CST_MESSAGE_MODIFICATION_FICHIER_RUB_VIDE);
    	    $t->set_var("MESSAGE_SUPPRESSION_INDEX_RUB_VIDE", CST_MESSAGE_SUPPRESSION_INDEX_RUB_VIDE);
    	    $t->set_var("MESSAGE_SUPPRESSION_FICHIER_RUB_VIDE", CST_MESSAGE_SUPPRESSION_FICHIER_RUB_VIDE);
    	    $t->set_var("MESSAGE_AJOUT_FILS_RUB_VIDE", CST_MESSAGE_AJOUT_FILS_RUB_VIDE);
    	    $t->set_var("MESSAGE_SUPPRESSION_FILS_RUB_VIDE", CST_MESSAGE_SUPPRESSION_FILS_RUB_VIDE);	    
    	   	$t->set_var("MESSAGE_HABILITATION_VIDE", CST_MESSAGE_HABILITATION_VIDE);
    	   		   	
    		   // bloc et variables  dans div popup "Ajout de rubrique"
    		$t->set_block("modif_typedoc", "BLOC_TYPE_CIBLE_RUB_AJOUT","bloc_type_cible_rub_ajout");
    	    $t->set_block("modif_typedoc", "BLOC_CODE_LISTHIER",  "bloc_code_listhier");
    	    $t->set_var("LIBELLE_RUB_OBLIG_NON", CST_LIBELLE_NON);
    	    $t->set_var("LIBELLE_RUB_OBLIG_OUI", CST_LIBELLE_OUI);
    	    
    	    $t->set_var("MESSAGE_CODE_RUB_IDENTIQUE", CST_MESSAGE_CODE_RUB_IDENTIQUE);
    	   	$t->set_var("MESSAGE_TYPE_LIE_VIDE", CST_MESSAGE_TYPE_LIE_VIDE);
    	   	$t->set_var("MESSAGE_CODE_RUB_ASSOCIEE", CST_MESSAGE_CODE_RUB_ASSOCIEE);
    	   	$t->set_var("MESSAGE_PARAM_ASSO_INCOMPLET", CST_MESSAGE_PARAM_ASSO_INCOMPLET);
    	   	$t->set_var("MESSAGE_VAL_COMPTEUR_VIDE", CST_MESSAGE_VAL_COMPTEUR_VIDE);
    	   	$t->set_var("MESSAGE_VAL_COMPTEUR_INI_VIDE", CST_MESSAGE_VAL_COMPTEUR_INI_VIDE);
    	   	
    	   	 // bloc et variables  dans div popup "Clé hiérarchique"
    	   	$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
    	   	$t->set_var("MESSAGE_VERIF_LIBELLE_ZONE_KH", CST_MESSAGE_VERIF_LIBELLE_ZONE_KH);
    	   	$t->set_var("MESSAGE_SELECTIONNER_ZONE_KH", CST_MESSAGE_SELECTIONNER_ZONE_KH);
    	   	$t->set_var("MESSAGE_VERIF_LONGUEUR_ZONE_KH", CST_MESSAGE_VERIF_LONGUEUR_ZONE_KH);
    	   	$t->set_var("MESSAGE_VERIF_DEBUT_LIEN_ZONE_KH", CST_MESSAGE_VERIF_DEBUT_LIEN_ZONE_KH);
    	   	$t->set_var("MESSAGE_RUB_LIE_VIDE_ZONE_KH", CST_MESSAGE_RUB_LIE_VIDE_ZONE_KH);
    	   	$t->set_var("MESSAGE_ZONE_RUPTURE_VIDE_ZONE_KH", CST_MESSAGE_ZONE_RUPTURE_VIDE_ZONE_KH);
    
     		// bloc et variables  dans div popup "infos_dossier"
     		$t->set_var("MESSAGE_RUB_INVALIDE_INFOS_DOSSIER", CST_MESSAGE_RUB_INVALIDE_INFOS_DOSSIER);
    				   	    	    
    		$t->set_var("CODE_TYPEDOC", $szCodeTypeDoc);
    	    $t->set_var("LIBELLE_TYPEDOC", $szLibelleTypeDoc);
    	
    		$t->set_var("MODE", $_REQUEST['MODE']);
    		//	début if MODE = CREATION
    		if(strcmp($_REQUEST['MODE'], "CREATION") == 0)
    		{
    			$t->set_var("TITRE_PAGE", CST_TDOC_LIBELLE_PAGE_CREATE_TYPEDOC);
    			$t->set_var("DISPLAY_LIBELLE_TYPEDOC", "none");
    			$t->set_var("CLASS_CODE_TYPEDOC", "inputChampOblig");
    			$t->set_var("READONLY_CODE_TYPEDOC", "");
    		}
    		//	fin if MODE = CREATION
    		//	début if MODE = MODIFICATION
    		else if(strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
    		{	
    			// pas besoin de controle car ici le code de la rubrique n'est pas modifiable
    			$t->set_var("bloc_toutes_rubriques", "");
    			$t->set_var("TITRE_PAGE", CST_TDOC_LIBELLE_PAGE_MODIF_TYPEDOC." : ".$szLibelleTypeDoc);
    			$t->set_var("DISPLAY_LIBELLE_TYPEDOC", "");
    			$t->set_var("CLASS_CODE_TYPEDOC", "verrouille");
    			$t->set_var("READONLY_CODE_TYPEDOC", "readonly");
    		}		
    		//	fin if MODE = MODIFICATION
    		
    		// parsing
    		// GG
    		$t->set_var("THESAURUS_TYPEDOC", isset($objType) ? $objType->bThesaurus : "");
    		$t->set_var("CHECKED_INV_RECH", (isset($objType) && $objType->bInvisible == 1) ? "checked" : "");				
    		$t->set_var("CHECKED_INDEX_AUTO_FIC", (isset($objType) && $objType->bIndexAuto == 1) ? "checked" : "");				
    		//$t->set_var("CHECKED_TYPEDOC_FULLTEXT", (isset($objType) && ($objType->wFullTexte | PHP_VULCAIN_FULLTEXT_INDEXER_NON)) ? "checked" : "");
    		$t->set_var("CHECKED_FICHIERS_FULLTEXT", (isset($objType) && ($objType->wFullTexte & PHP_VULCAIN_FULLTEXT_INDEXER_PAGE)) ? "checked" : "");
    		$t->set_var("CHECKED_SOUS_FICHIERS_FULLTEXT", (isset($objType) && ($objType->wFullTexte & PHP_VULCAIN_FULLTEXT_INDEXER_SOUSPAGE)) ? "checked" : "");
            $t->set_var("CHECKED_DERNIER_FICHIER_FULLTEXT", (isset($objType) && ($objType->wFullTexte & PHP_VULCAIN_FULLTEXT_INDEXER_LAST_PAGE)) ? "checked" : "");		
    		
            $t->set_var("CHECKED_XML" , (isset($objType) && $objType->bXML == 1) ? "checked" : "");			
    		$t->set_var("CHECKED_KH", (isset($objType) && $objType->wHierarchie > 0) ? "checked" : "");
    		$t->set_var("CHECKED_KH_MULTI", (isset($objType) && $objType->wHierarchie == 2 ) ? "checked" : "");
    		$t->set_var("DISABLED_KH_MULTI", (isset($objType) && $objType->wHierarchie > 0 ) ? "" : "disabled");
    		$t->set_var("CHECKED_FICHE_PARAM" , (isset($objType) && $objType->bFicheParam == 1) ? "checked" : "");
            $t->set_var("CHECKED_GEST_VERSIONS" , (isset($objType) && strlen($objType->stArchive->szTypeDocArchive) != 0) ? "checked" : "");
            $t->set_var("CHECKED_GEST_SPOOL" , (isset($objType) && $objType->bSpool == 1) ? "checked" : "");
            $t->set_var("CHECKED_AUCUN_ARCHIVAGE" , (!isset($objType) || $objType->wArchiver == PHP_VULCAIN_AUCUNE_ARCH) ? "checked" : "");
    		$t->set_var("CHECKED_FICHIERS_ARCHIVAGE" , (isset($objType) && $objType->wArchiver == 2) ? "checked" : "");
    		$t->set_var("CHECKED_FICHIERS_INDEX_ARCHIVAGE" , (isset($objType) && $objType->wArchiver == 3) ? "checked" : "");								
    		$t->set_var("RETENTION_DM", (isset($objType)) ? $objType->wNbJourSurDM : "");
            $t->set_var("POS_SEPARATEUR_KH", (isset($objType) && isset($objType->cSeparateurCle) ) ? $objType->cSeparateurCle : "/");			
    					
    		
    	    // Affichage des rubriques disponibles
    		$tabColumnName = array(
    			array(CST_LIBELLE_CODE_RUBRIQUE, "40", "", "false"),
    			array(CST_LIBELLE_LIBELLE_RUBRIQUE, "125", "", "false"),
    			array(CST_LIBELLE_TYPE_RUBRIQUE, "40", "", "false"),
    			array(CST_LIBELLE_NB_CAR_RUBRIQUE, "40", "", "false"),
    			array(CST_LIBELLE_VISIBILITE_RUBRIQUE, "40", "align-center", "false"),
    			array(CST_LIBELLE_MONO_RUBRIQUE, "40", "align-center", "false"),
    			array(CST_LIBELLE_CRITERE_SECONDAIRE_RUBRIQUE, "50", "align-center", "false"), 
    			array(CST_LIBELLE_DOMFERME_RUBRIQUE, "60", "align-center", "false"),
    			array(CST_LIBELLE_CODE_THESAURUS_RUBRIQUE, "60", "", "false"),
    			array("type_rub", "60", "", "true")			
    		);
    		$tabKeyName = array(
    			"code_rub",
    			"libelle_rub",
    			"libelle_type_rub",
    			"nb_car_rub",
    			"visibilite_rub",
    			"mono_rub", 
    			"crit_second_rub", 
    			"domferme_rub",
    			"code_thes_rub",
    			"type_rub",			
    		);
    		// début d'affichage des entêtes de colonne de  la datatable yui source
    		$sep = ",";
    		for ($i=0;$i<count($tabColumnName);$i++) 
    	  	{
    	        $t->set_var("COLUMN_NAME",$tabColumnName[$i][0]);
    	        $t->set_var("COLUMN_WIDTH", $tabColumnName[$i][1]);
    	        $t->set_var("CLASS_NAME", $tabColumnName[$i][2]);
    	        $t->set_var("HIDDEN", $tabColumnName[$i][3]);
    	        $t->set_var("KEY_NAME", $tabKeyName[$i]);
    			$t->set_var("COLUMN_FORMAT", "formatter:YAHOO.widget.DataTable.formatText");
    			$t->set_var("COLUMN_SORTABLE", "false");
    			
    			if( $i == count($tabColumnName) -1)
    				$sep = "";
    			$t->set_var("SEPARATEUR_COLUMN", $sep);	
    					
    			$t->parse("columns_def", "COLUMNS_DEF", true);
    			//$t->parse("fields_def", "FIELDS_DEF", true);
    		}
    		// fin d'affichage des entêtes de colonne de la datatable yui source
    		
    		$retour = pos_getrubrique($jeton, "", /*pref*/$tabLstRub);
    		//print_r($tabLstRub);
    		if($retour)
    		{
    			// pour éviter de rappeler la fonction lors de le recherche
    			// des infos TypeRub, Monocritere, DomFerme des rubriques du type de document
    			$tabAllRubAppli = array();	
    					
    			$sep_row = ","; 
    			array_unshift($tabLstRub, "");
    			// On parsera le tableau des rubriques disponibles	pour l'ajout
    			// mais aussi pour les select des blocs "Restrictions d'accès", "Informations dossiers"
    			// d'où la ligne blanche ajouté en 0 du tableau
    			for ($i=0; $i<count($tabLstRub); $i++)
    			{	
    				// début d'affichage des lignes de rubrique dans la datatable yui source
    				if($i != 0)
    				{
    					$tabAllRubAppli[$tabLstRub[$i]->szRubrique] = array();
    					$tabAllRubAppli[$tabLstRub[$i]->szRubrique]['TypeRub'] = $tabLstRub[$i]->wTypeRub;
    					$tabAllRubAppli[$tabLstRub[$i]->szRubrique]['MonoCritere'] = $tabLstRub[$i]->bMonoCritere;
    					$tabAllRubAppli[$tabLstRub[$i]->szRubrique]['DomFerme'] = $tabLstRub[$i]->wDomFerme;
    					
    					//	Domaine fermé 0:Aucun, 1:Domaine fermé normal, 2:Liste des utilisateurs 
    					$szDomFermeRub="";
    					if($tabLstRub[$i]->wDomFerme == 1 || $tabLstRub[$i]->wDomFerme == 2)
    						$szDomFermeRub="X";
    				
    					$tabRubrique = array (
    						$tabLstRub[$i]->szRubrique,
    						$tabLstRub[$i]->szNomRub,
    						$tabTypeRubrique[$tabLstRub[$i]->wTypeRub],
    						$tabLstRub[$i]->wNbCharMot,
    						($tabLstRub[$i]->bInvisible== 1) ? "X": "",
    						($tabLstRub[$i]->bMonoCritere== 1) ? "X": "",
    						($tabLstRub[$i]->bSecondaire == 1) ? "X": "",
    						$szDomFermeRub,
    						$tabLstRub[$i]->szCodeThesaurus,
    						$tabLstRub[$i]->wTypeRub,
    						);
    				}					
    				$sep_field = ",";
    				if ($i != 0)
    				{	
    					for ($j = 0; $j<count($tabKeyName); $j++)
    						{
    				        	$t->set_var("KEY_NAME2", $tabKeyName[$j]);
    							$t->set_var("ZONE_LR", $tabRubrique[$j]);
    							//$t->set_var("ZONE_LR", urlencode(htmlspecialchars_currentcharset($tabChamps[$j])));
    				        	if( $j == count($tabRubrique) -1)
    								$sep_field = "";
    							$t->set_var("SEPARATEUR_FIELD", $sep_field);	
    				        	$t->parse("lr_reponse", "LR_REPONSE", true);
    						}
    					
    					if( $i == count($tabLstRub) -1)
    						$sep_row = "";
    					$t->set_var("SEPARATEUR_ROW", $sep_row);
    					$t->parse("block_ligne", "BLOCK_LIGNE", true);				
    					$t->set_var("lr_reponse", "");
    				}
    				// fin d'affichage des lignes de rubrique dans la datatable yui source													
    				
    				$t->set_var("CODE_LIBELLE_RUB", ($i != 0) ? $tabLstRub[$i]->szRubrique." - ".$tabLstRub[$i]->szNomRub : "");
    			}
                
                // gestion des "Select" pour le div popup "Restriction d'accès"
                $t->set_var("CODE_RUB_CONSULT_INDEX_RUB", (isset($objType) && $objType->wTypeRubConsultIndex == 2) ? $objType->szCodeRubConsultIndex : "");
                $t->set_var("CODE_RUB_MODIF_INDEX_RUB", (isset($objType) && $objType->wTypeRubModifIndex == 2) ? $objType->szCodeRubModifIndex : "");
                $t->set_var("CODE_RUB_MODIF_FICHIER_RUB", (isset($objType) && $objType->wTypeRubModifFichiers == 2) ? $objType->szCodeRubModifFichiers : "");
                $t->set_var("CODE_RUB_SUPP_INDEX_RUB", (isset($objType) && $objType->wTypeRubSupprIndex == 2) ? $objType->szCodeRubSupprIndex : "");
                $t->set_var("CODE_RUB_SUPP_FICHIER_RUB", (isset($objType) && $objType->wTypeRubSupprFichiers == 2) ? $objType->szCodeRubSupprFichiers : "");
                $t->set_var("CODE_RUB_AJOUT_FILS_RUB", (isset($objType) && $objType->wTypeRubAjoutFils == 2) ? $objType->szCodeRubAjoutFils : "");
                $t->set_var("CODE_RUB_SUPP_FILS_RUB", (isset($objType) && $objType->wTypeRubSupprFils == 2) ? $objType->szCodeRubSupprFils : "");
    		}
    				
    	   //Affichage des questions de la bibilothèque pour le div popup "Restriction d'accès"
    		$retour = pos_bib_getlistequestions($jeton, /*pref*/$tabQuestBibPrive, /*pref*/$tabQuestBibPublic); 
    		if($retour)
    		{
    			array_unshift($tabQuestBibPublic, "");
    			for($k=0;$k<count($tabQuestBibPublic);$k++)
    			{
    		  		$t->set_var("QUESTION", $tabQuestBibPublic[$k]);
    		  		
    		  		if (strcmp($_REQUEST['MODE'], "CREATION") == 0)
    		  		  $t->set_var("SELECTED_QUESTION", ($k == 0) ? "selected" : "");
    				else
    		  		    $t->set_var("SELECTED_QUESTION", (strcmp($tabQuestBibPublic[$k], $objType->szQuestionRestriction) == 0) ? "selected" : "");
    				$t->parse("bloc_restriction_question", "BLOC_RESTRICTION_QUESTION", true);	
    			}
    		}
    		else
    			debug($jeton);
    		// Affichage des habilitations	pour le div popup "Restriction d'accès"
    		$retour = pos_getlisteinfo($jeton, 15, /*pref*/$tabNivConf); 
    		if($retour)
    		{	
                // Array ( [1] => secret [2] => CD [3] => SD [4] => niveau1 [5] => niveau2 ) 
                // valeur de l'habilitation = SD
    			array_unshift($tabNivConf, "");
    			for($k=0; $k<count($tabNivConf);$k++)
    			{
    				$t->set_var("HAB_CONF_TYPE_LIBELLE", $tabNivConf[$k]);
    				$t->set_var("HAB_CONF_TYPE_VALUE", $k);
                    			
    				if (!isset($objType) || $objType->dwTypeConfDef == 0)
    		  		    $t->set_var("SELECTED_HAB_CONF_TYPE", ($k == 0) ? "selected" : "");
    				else
    		  			$t->set_var("SELECTED_HAB_CONF_TYPE", ($objType->wIndConfDef == $k - 1) ? "selected" : "");	 
    				$t->parse("bloc_hab_conf_type", "BLOC_HAB_CONF_TYPE", true);			
    			}			
    		}
    		else
    			debug($jeton);
    		
    		//Restriction d'accès
            $t->set_var("CHECKED_POS_CTRL_CONSULT_INDEX_RUB", (isset($objType) && $objType->wTypeRubConsultIndex == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_CONSULT_INDEX_AUCUN", (isset($objType) && $objType->wTypeRubConsultIndex == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "" : "checked");
    		
    		$t->set_var("CHECKED_POS_CTRL_MODIF_INDEX_RUB", (isset($objType) && $objType->wTypeRubModifIndex == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_MODIF_INDEX_AUCUN", (isset($objType) && ($objType->wTypeRubModifIndex == PHP_VULCAIN_ACCES_CONTROLE_RUB || $objType->wTypeRubModifIndex == 1)) ? "" : "checked");
    		$t->set_var("CHECKED_POS_CTRL_MODIF_INDEX_IMP", (isset($objType) && $objType->wTypeRubModifIndex == 1) ? "checked" : "");
    		
    		$t->set_var("CHECKED_POS_CTRL_MODIF_FICHIER_RUB", (isset($objType) && $objType->wTypeRubModifFichiers == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_MODIF_FICHIER_AUCUN", (isset($objType) && ($objType->wTypeRubModifFichiers == PHP_VULCAIN_ACCES_CONTROLE_RUB || $objType->wTypeRubModifFichiers == 1)) ? "" : "checked");
    		$t->set_var("CHECKED_POS_CTRL_MODIF_FICHIER_IMP", (isset($objType) && $objType->wTypeRubModifFichiers == 1) ? "checked" : "");
    		
    		$t->set_var("CHECKED_POS_CTRL_SUPP_INDEX_RUB", (isset($objType) && $objType->wTypeRubSupprIndex == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_SUPP_INDEX_AUCUN", (isset($objType) && ($objType->wTypeRubSupprIndex == PHP_VULCAIN_ACCES_CONTROLE_RUB || $objType->wTypeRubSupprIndex == 1)) ? "" : "checked");
    		$t->set_var("CHECKED_POS_CTRL_SUPP_INDEX_IMP", (isset($objType) && $objType->wTypeRubSupprIndex == 1) ? "checked" : "");
    		
    		$t->set_var("CHECKED_POS_CTRL_SUPP_FICHIER_RUB", (isset($objType) && $objType->wTypeRubSupprFichiers == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_SUPP_FICHIER_AUCUN", (isset($objType) && ($objType->wTypeRubSupprFichiers == PHP_VULCAIN_ACCES_CONTROLE_RUB || $objType->wTypeRubSupprFichiers == 1)) ? "" : "checked");
    		$t->set_var("CHECKED_POS_CTRL_SUPP_FICHIER_IMP", (isset($objType) && $objType->wTypeRubSupprFichiers == 1) ? "checked" : "");
    		
    		$t->set_var("CHECKED_POS_CTRL_AJOUT_FILS_RUB", (isset($objType) && $objType->wTypeRubAjoutFils == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_AJOUT_FILS_AUCUN", (isset($objType) && ($objType->wTypeRubAjoutFils == PHP_VULCAIN_ACCES_CONTROLE_RUB || $objType->wTypeRubAjoutFils == 1)) ? "" : "checked");
    		$t->set_var("CHECKED_POS_CTRL_AJOUT_FILS_IMP", (isset($objType) && $objType->wTypeRubAjoutFils == 1) ? "checked" : "");
    		
    		$t->set_var("CHECKED_POS_CTRL_SUPP_FILS_RUB", (isset($objType) && $objType->wTypeRubSupprFils == PHP_VULCAIN_ACCES_CONTROLE_RUB) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_SUPP_FILS_AUCUN", (isset($objType) && ($objType->wTypeRubSupprFils == PHP_VULCAIN_ACCES_CONTROLE_RUB || $objType->wTypeRubSupprFils == 1)) ? "" : "checked");
    		$t->set_var("CHECKED_POS_CTRL_SUPP_FILS_IMP", (isset($objType) && $objType->wTypeRubSupprFils == 1) ? "checked" : "");
    		
    		$t->set_var("CHECKED_POS_CONF_TYPE_AUCUN", (!isset($objType) || $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_AUCUNE) ? "checked" : "");
    		$t->set_var("CHECKED_POS_CTRL_CONF_TYPE_MODIF_PAR_UTIL", (isset($objType) && $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_UTIL) ? "checked"  : "");
    		$t->set_var("CHECKED_POS_CTRL_CONF_TYPE_NON_MODIF_PAR_UTIL", (isset($objType) && $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_SERVEUR) ? "checked"  : "");
    		$t->set_var("CLASS_CONF_TYPE", (isset($objType) && $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_AUCUNE) ? "verrouille" :  "inputChamp");
    		$t->set_var("READONLY_CONF_TYPE", (isset($objType) && $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_AUCUNE) ? "readonly" : "");
    		$t->set_var("DISABLED_SELECT_HAB_CONF_TYPE", (isset($objType) && $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_AUCUNE) ? "disabled" : "");
    		$t->set_var("NIV_CONF_TYPE", (!isset($objType) || $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_AUCUNE) ? "" : $objType->wNivConfDef);		
    		$t->set_var("CLOIS_CONF_TYPE", (!isset($objType) || $objType->dwTypeConfDef == PHP_VULCAIN_TYPE_CONF_DEF_AUCUNE) ? "" : $objType->szCloisonDef);
    
    		// infos_dossier
    		$t->set_var("CHECKED_TYPE_DOSSIER", (isset($objType) && $objType->wTypeDos > 0) ? "checked" : "");
    		$t->set_var("DISABLED_DOSSIER_REF", (!isset($objType) || $objType->wTypeDos == 0) ? "disabled" : "");
    		$t->set_var("CHECKED_DOSSIER_REF", (isset($objType) && $objType->wTypeDos == 2) ? "checked" : "");
    
            // client windows : le masque est positionné soit à PHP_VULCAIN_INSERE_AUTO_DOSSIER, soit à PHP_VULCAIN_INSERE_AUTO_DOSSIER_EXISTANT
    		$t->set_var("CHECKED_INSERTION_AUTO", (isset($objType) && ($objType->wInsererAutoDos > 0)) ? "checked" : "");
    		$t->set_var("DISABLED_SELECTION_CHAQUE_MOT", (isset($objType) && ($objType->wInsererAutoDos > 0)) ? "" : "disabled"); 
    		$t->set_var("CHECKED_SELECTION_CHAQUE_MOT", (isset($objType) && ($objType->wInsererAutoDos & PHP_VULCAIN_INSERE_AUTO_MULTILOC)) ? "checked" : "");					
    		$t->set_var("DISABLED_TEST_EXIST_PERE", (isset($objType) && ($objType->wInsererAutoDos > 0)) ? "" : "disabled"); 
    		$t->set_var("CHECKED_TEST_EXIST_PERE", (isset($objType) && ($objType->wInsererAutoDos & PHP_VULCAIN_INSERE_AUTO_DOSSIER_EXISTANT)) ? "checked" : "");
    		$t->set_var("DISABLED_MAJ_INSERTION_DOSSIER", (isset($objType) && ($objType->wInsererAutoDos > 0)) ? "" : "disabled"); 
    		$t->set_var("CHECKED_MAJ_INSERTION_DOSSIER", (isset($objType) && ($objType->wInsererAutoDos & PHP_VULCAIN_MOVE_AUTO_DOSSIER)) ? "checked" : "");
    		
    		$t->set_var("CODE_RUB_TITRE_DOSSIER", (isset($objType)) ? $objType->szRubTitreDos : "");
    		$t->set_var("CODE_RUB_CODE_TYPE_PERE", (isset($objType)) ? $objType->szTypeDosRangement : "");
    		$t->set_var("CODE_RUB_VAL_SELECTION_FILS", (isset($objType)) ? $objType->szRubSelectDosFils : "");
    		$t->set_var("CODE_RUB_VAL_SELECTION_PERE", (isset($objType)) ? $objType->szRubSelectDos : "");
    		
    		// Affichage des rubriques déjà dans le type de document 
    			// YUI entête datatable cible	
    			$tabColumnName2 = array(
    				array(CST_LIBELLE_CODE_RUBRIQUE, "40", "", "false"),
    				array(CST_LIBELLE_LIBELLE_RUBRIQUE, "150", "", "false"),
    				array(CST_TDOC_LIBELLE_INDEXEE_RUB, "30", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_MODIFIABLE_RUB, "40", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_VALEUR_UNIQUE_RUB, "50", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_RUB_OBLIG,  "40", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_MAJUSCULE_RUB, "40", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_TYPE_LIE, "40", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_RUB_LIE, "40", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_VAL_DEF, "75", "", "false"),
    				array(CST_TDOC_LIBELLE_VAL_MIN, "50", "", "false"),
    				array(CST_TDOC_LIBELLE_VAL_MAX, "50", "", "false"),
    				array(CST_TDOC_LIBELLE_FULLTEXT_RUB, "50", "align-center", "false"),
                    array(CST_TDOC_LIBELLE_VERROUILLEE_CREATION, "85", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_VERROUILLEE_MODIFICATION, "85", "align-center", "false"),
    				array(CST_TDOC_LIBELLE_REPORT_VAL_RUB, "76", "align-center", "false"),
    				array("Type", "50", "align-center", "true"),
    				array("Mono", "50", "align-center", "true"),
    				array("DomFerme", "50", "align-center", "true"),
    			);
    			$tabKeyName2 = array(
    				"code_rub",
    				"libelle_rub",
    				"indexee_rub",
    				"modifiable_rub",
    				"valeur_unique_rub",
    				"obligatoire_rub", 
    				"majuscule_rub",
    				"code_type_lie_rub",
    				"rub_lie_rub",
    				"valeur_defaut_rub",
    				"valeur_min_rub",
    				"valeur_max_rub",
    				"fulltext_rub",
                    "verrouillee_creation_rub",
    				"verrouillee_modification_rub",
    				"report_valeur_rub",
    				"type_rub",	
    				"mono_rub",	
    				"domferme_rub",	
    			);
    		
    			$sep2 = ",";
    			for ($i=0;$i<count($tabColumnName2);$i++) 
    		  	{
    		        $t->set_var("COLUMN_NAME2",$tabColumnName2[$i][0]);		        
    		        $t->set_var("COLUMN_WIDTH2", $tabColumnName2[$i][1]);
    		        $t->set_var("CLASS_NAME2", $tabColumnName2[$i][2]);
    		        $t->set_var("HIDDEN2", $tabColumnName2[$i][3]);
    		        $t->set_var("KEY_NAME21", $tabKeyName2[$i]);
    		   		
    				$szFormat2 = "formatter:YAHOO.widget.DataTable.formatText";
    				$szSortable2 = "false";
    				
    				$t->set_var("COLUMN_FORMAT2", $szFormat2);
    				$t->set_var("COLUMN_SORTABLE2", $szSortable2);
    				
    				if( $i == count($tabColumnName2) -1)
    					$sep2 = "";
    				$t->set_var("SEPARATEUR_COLUMN2", $sep2);	
    						
    				$t->parse("columns_def2", "COLUMNS_DEF2", true);
    				//$t->parse("fields_def2", "FIELDS_DEF2", true);				
    			}
    			// fin YUI entête datatatable cible
    			// début d'affichage des lignes de rubrique présentes dans le document
    			if (strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
    			{
    				$retour = pos_getrubriquetype($jeton, $szCodeTypeDoc, /*pref*/$tabRubriquetype);
    				//error_log(print_r($tabRubriquetype, true));
    			    if ($retour)
    			  	{	  		
    			  		$sep_row2 = ","; 
    			  		$t->set_var("NB_RUB_DANS_DOC", count($tabRubriquetype));
    			  		for($j=0; $j<count($tabRubriquetype); $j++)
    			  		{							  
    			  			// début d'affichage des lignes de rubrique dans la datatable cible
    			  			// récupération du type 
    			  			
    					  	$sztype_rub = $tabAllRubAppli[$tabRubriquetype[$j]->szRubrique]['TypeRub'];
    						$szmono_rub = $tabAllRubAppli[$tabRubriquetype[$j]->szRubrique]['MonoCritere'];							
    						$szdomferme_rub = $tabAllRubAppli[$tabRubriquetype[$j]->szRubrique]['DomFerme'];
    						$order   = array("\r\n", "\n", "\r");
                            $replace   = array("\\r\\n", "\\n", "\\r");
    					  	$tabRubrique2 = array (
    						$tabRubriquetype[$j]->szRubrique,
    						$tabRubriquetype[$j]->szNomRub,
    						($tabRubriquetype[$j]->bIndexee == 1) ? "X" : "",
    						($tabRubriquetype[$j]->bModifiable) ? "X" : "",
    						($tabRubriquetype[$j]->bMonoValeur == 1) ? "X" : "",
    						($tabRubriquetype[$j]->wOblig == 1 || $tabRubriquetype[$j]->wOblig == 2) ? "X" : "", 
    						($tabRubriquetype[$j]->bMajuscule == 1) ? "X" : "",
    						$tabRubriquetype[$j]->szTypeLie,
    						$tabRubriquetype[$j]->szRubLie,
    						($tabRubriquetype[$j]->bDefaut == 1) ? str_replace($order, $replace, $tabRubriquetype[$j]->szDefaut) : "",
    						$tabRubriquetype[$j]->szMinimum,
    						$tabRubriquetype[$j]->szMaximum,
    						($tabRubriquetype[$j]->bFullTexte == 1) ? "X" : "",
                            ($tabRubriquetype[$j]->wReservee == 1 || $tabRubriquetype[$j]->wReservee == 2) ? "X" : "",
    						($tabRubriquetype[$j]->wReservee == 1 || $tabRubriquetype[$j]->wReservee == 3) ? "X" : "",
                            ($tabRubriquetype[$j]->bReport == 1) ? "X" : "",
    						$sztype_rub,
    						$szmono_rub,
    						$szdomferme_rub,
    						);
    			  			
    			  			$sep_field2 = ",";
    						for ($l = 0; $l<count($tabKeyName2); $l++)
    						{
    				        	$t->set_var("KEY_NAME22", $tabKeyName2[$l]);
    				        	// valeur par défaut pour multicritère
    							if($l == 13)
    								//$t->set_var("ZONE_LR2", addslashes(str_replace("\r\n",'\\r\\n',$tabRubrique2[$l])));
    								$t->set_var("ZONE_LR2", addslashes(str_replace("\r",'\\r', str_replace("\n",'\\n',$tabRubrique2[$l]))));
    							else
    								$t->set_var("ZONE_LR2", $tabRubrique2[$l]);	
    							//$t->set_var("ZONE_LR", urlencode(htmlspecialchars_currentcharset($tabChamps[$j])));
    				        	if( $l == count($tabRubrique2) -1)
    							$sep_field2 = "";
    							$t->set_var("SEPARATEUR_FIELD2", $sep_field2);	
    				        	$t->parse("lr_reponse2", "LR_REPONSE2", true);
    						}
    						
    						if( $j == count($tabRubriquetype) -1)
    							$sep_row2 = "";
    						$t->set_var("SEPARATEUR_ROW2", $sep_row2);
    						$t->parse("block_ligne2", "BLOCK_LIGNE2", true);				
    						$t->set_var("lr_reponse2", "");
    			  			// fin d'affichage des lignes de rubrique dans la datatable yui cible
    			  			
    			  		}
    			  	}
    			  	else
    			  		debug($jeton);
    		}
    		else
    			$t->set_var("NB_RUB_DANS_DOC", "");	
    		
            // affichage des listes hiérarchiques pour la gestion des rubriques	
    		$retour = pos_getlisteinfo($jeton, 26, /*pref*/$tabLstHier);
            if ($retour)
    		{	
    			$t->set_var("CODE_LISTHIER", "");
    			$t->parse("bloc_code_listhier", "BLOC_CODE_LISTHIER", true);				
    			foreach($tabLstHier as $key => $value)
    			{
    				$t->set_var("CODE_LISTHIER", $key);
    				$t->parse("bloc_code_listhier", "BLOC_CODE_LISTHIER", true);
    			}	
    		}
    		else
    			debug($jeton);
                
    		// affichage de la liste déroulante des types de document
    		// pour la gestion des associations des rubriques	
    		$retour = pos_getlistalltypes($jeton, /*pref*/$tabLstDocAssociation);
            if ($retour)
    		{	
    			$j=0;
                $t->set_var("TYPE_CIBLE", "000");
    			$t->parse("bloc_type_cible_rub_ajout", "BLOC_TYPE_CIBLE_RUB_AJOUT", true);	
    			foreach($tabLstDocAssociation as $key => $value)
    			{
    				$t->set_var("TYPE_CIBLE", $key);
    				$t->parse("bloc_type_cible_rub_ajout", "BLOC_TYPE_CIBLE_RUB_AJOUT", true);
    				if(strcmp($_REQUEST['MODE'], "CREATION") == 0)
    				{ 
    					$t->set_var("CPT_CODE_TYPEDOC", $j);
    					$t->set_var("CODE_DOC_CONTROLE", $key);
    					$t->parse("bloc_tous_typedoc", "BLOC_TOUS_TYPEDOC", true);
    					$j++;
    				}
    			}	
    		}
    		else
    			debug($jeton);	
    													
    	    $t->pparse("MyOutput", "modif_typedoc");
        }
    	else
        	debug($jeton);
    	
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
