<?php
/* 
 * Gestion des rubriques
 * 
 *	PL : 17/05/2011
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

$tabTypeRubriqueUpperCase = array (
	"0" => "ALPHA",
	"1" => "ENTIER",
	"2" => "DATE",
	"3" => "TABLEAU",
	"4" => "DECIMAL"
);
$tabTypeDomaineFerme = array (
	"0" => "AUCUN",
	"1" => "NORMAL",
	"2" => "UTIL",
	"3" => "REQUETE_LDAP",
	"4" => "PROFIL_UTIL",
);
$tabControleDomaineFerme = array (
	"1" => "VERIF_APPARTENANCE",
	"2" => "AUCUN",
	"3" => "VERIF_NON_APPARTENANCE",
);

if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $retour = connexion($jeton);
    
    if ($retour)
    {
    	// Affichage
    	$t = new Template(".");
    
    	$t->set_File("modif_rubrique", REP_TEMPLATE_APPLICATIF."gestionrubrique/modif_rubrique.tpl");
    		
    	$t->set_block("modif_rubrique", "BLOC_TOUTES_RUBRIQUES", "bloc_toutes_rubriques");
    	$t->set_var("MESSAGE_CODE_RUBRIQUE_OBLIGATOIRE", CST_MESSAGE_CODE_RUBRIQUE_OBLIGATOIRE);
    	$t->set_var("MESSAGE_LIBELLE_RUBRIQUE_OBLIGATOIRE", CST_MESSAGE_LIBELLE_RUBRIQUE_OBLIGATOIRE);
    	$t->set_var("MESSAGE_CODE_RUBRIQUE_EXISTANT", CST_MESSAGE_CODE_RUBRIQUE_EXISTANT);
    	$t->set_var("MESSAGE_ALPHA_NB_CAR_AUTORISE",  CST_MESSAGE_ALPHA_NB_CAR_AUTORISE);
    	$t->set_var("MESSAGE_ENTIER_NB_CAR_AUTORISE", CST_MESSAGE_ENTIER_NB_CAR_AUTORISE);
    	$t->set_var("MESSAGE_VERIF_FORM_NUM", CST_MESSAGE_VERIF_FORM_NUM);
    	$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
        $t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
        $t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
    	$t->set_var("URL_ATTENTE", URL_ATTENTE);
        $t->set_var("CODE_ACTION", URL_MODIFIE_RUBRIQUE);
        $t->set_var("URL_ANNULER", URL_LIST_RUBRIQUE);
        
        $t->set_var("LIBELLE_RUBRIQUE", CST_LIBELLE_RUBRIQUE);
        $t->set_var("LIBELLE_LIBELLE_RUBRIQUE", CST_LIBELLE_LIBELLE_RUBRIQUE);
        $t->set_var("LIBELLE_CODE_RUBRIQUE_LONG", CST_LIBELLE_CODE_RUBRIQUE_LONG);
    	$t->set_var("LIBELLE_CODE_THESAURUS_LONG", CST_LIBELLE_CODE_THESAURUS_LONG);
    	$t->set_var("LIBELLE_NB_CAR_A_INDEXER", CST_LIBELLE_NB_CAR_A_INDEXER);	
    	$t->set_var("LIBELLE_ENTETE_TYPE_RUBRIQUE", CST_LIBELLE_ENTETE_TYPE_RUBRIQUE);
    	$t->set_var("LIBELLE_TYPE_RUBRIQUE_ALPHA", CST_LIBELLE_TYPE_RUBRIQUE_ALPHA);
    	$t->set_var("LIBELLE_TYPE_RUBRIQUE_ALPHA_LONG", CST_LIBELLE_TYPE_RUBRIQUE_ALPHA_LONG);
    	$t->set_var("LIBELLE_TYPE_RUBRIQUE_ENTIER", CST_LIBELLE_TYPE_RUBRIQUE_ENTIER);
    	$t->set_var("LIBELLE_TYPE_RUBRIQUE_DECIMAL", CST_LIBELLE_TYPE_RUBRIQUE_DECIMAL);
    	$t->set_var("LIBELLE_TYPE_RUBRIQUE_DATE", CST_LIBELLE_TYPE_RUBRIQUE_DATE);
    	$t->set_var("LIBELLE_TYPE_RUBRIQUE_TABLEAU", CST_LIBELLE_TYPE_RUBRIQUE_TABLEAU);
    	$t->set_var("LIBELLE_ENTETE_ATTRIBUTS_RUBRIQUE", CST_LIBELLE_ENTETE_ATTRIBUTS_RUBRIQUE);
    	$t->set_var("LIBELLE_ATTRIBUTS_RUBRIQUE_MONOCRITERE", CST_LIBELLE_ATTRIBUTS_RUBRIQUE_MONOCRITERE);
    	$t->set_var("LIBELLE_ATTRIBUTS_RUBRIQUE_SECONDAIRE", CST_LIBELLE_ATTRIBUTS_RUBRIQUE_SECONDAIRE);
    	$t->set_var("LIBELLE_ATTRIBUTS_RUBRIQUE_INVISIBLE", CST_LIBELLE_ATTRIBUTS_RUBRIQUE_INVISIBLE);
    	$t->set_var("LIBELLE_ENTETE_CONTENUE_DANS_TYPE", CST_LIBELLE_ENTETE_CONTENUE_DANS_TYPE);
    	$t->set_var("LIBELLE_ENTETE_DOMAINES_FERMES_RUBRIQUE", CST_LIBELLE_ENTETE_DOMAINES_FERMES_RUBRIQUE);
    	$t->set_var("LIBELLE_TYPE_DOMAINES_FERMES_RUBRIQUE", CST_LIBELLE_TYPE_DOMAINES_FERMES_RUBRIQUE);
    	$t->set_var("LIBELLE_CONTROLE_DOMAINES_FERMES_RUBRIQUE", CST_LIBELLE_CONTROLE_DOMAINES_FERMES_RUBRIQUE);
        $t->set_var("LIBELLE_DOMFERME_NORMAL", CST_LIBELLE_DOMFERME_NORMAL);
    	$t->set_var("LIBELLE_DOMFERME_AUCUN", CST_LIBELLE_DOMFERME_AUCUN);
    	$t->set_var("LIBELLE_DOMFERME_UTIL", CST_LIBELLE_DOMFERME_UTIL);
    	$t->set_var("LIBELLE_DOMFERME_REQUETE_LDAP", CST_LIBELLE_DOMAINE_REQUETE_LDAP);
    	$t->set_var("LIBELLE_DOMFERME_PROFIL_UTIL", CST_LIBELLE_DOMAINE_PROFIL_UTIL);
        $t->set_var("CONTROLE_DOMFERME_AUCUN", CST_LIBELLE_CONTROLE_DOMFERME_AUCUN);
    	$t->set_var("CONTROLE_DOMFERME_VERIF_APPARTENANCE", CST_LIBELLE_CONTROLE_DOMFERME_VERIF_APPARTENANCE);
    	$t->set_var("CONTROLE_DOMFERME_VERIF_NON_APPARTENANCE", CST_LIBELLE_CONTROLE_VERIF_NON_APPARTENANCE);
    	$t->set_var("MESSAGE_VERIF_FORME_CODE", CST_MESSAGE_VERIF_FORME_CODE);
    	$t->set_var("MESSAGE_VERIF_FORME_LIBELLE", CST_MESSAGE_VERIF_FORME_LIBELLE_2);
        
    	
    	$szCodeRubrique = isset($_REQUEST['POS_CODE_RUBRIQUE']) ? stripslashes(urldecode($_REQUEST['POS_CODE_RUBRIQUE'])) : "";
        $szLibelleRubrique = isset($_REQUEST['POS_LIBELLE_RUBRIQUE']) ? stripslashes(urldecode($_REQUEST['POS_LIBELLE_RUBRIQUE'])) : "";   
        $t->set_var("CODE_RUBRIQUE", $szCodeRubrique);
        $t->set_var("LIBELLE_RUBRIQUE", $szLibelleRubrique);
    	$t->set_var("MODE", $_REQUEST['MODE']);
    	// En création, le type par défaut est alphanumérique
    	if(strcmp($_REQUEST['MODE'], "CREATION") == 0)
    	{
    		$t->set_var("TITRE_PAGE", CST_LIBELLE_PAGE_CREATE_RUBRIQUE);
    		$t->set_var("DISPLAY_LIBELLE_RUBRIQUE", "none");
    		$t->set_var("CODE_THESAURUS_RUBRIQUE", "");			
    		$t->set_var("NB_CAR_MAX_INDEX_RUBRIQUE", "119");
    		$t->set_var("MONOCRITERE", "0");
    		$t->set_var("ALPHA_SELECTED_TYPE_DOMFERME_AUCUN", "selected");
    		$t->set_var("ALPHA_SELECTED_TYPE_DOMFERME_NORMAL", "");
    		$t->set_var("ALPHA_SELECTED_TYPE_DOMFERME_UTIL", "");
    		$t->set_var("ALPHA_SELECTED_TYPE_DOMFERME_REQUETE_LDAP", "");
    		$t->set_var("ALPHA_SELECTED_TYPE_DOMFERME_PROFIL_UTIL", "");
    		$t->set_var("SELECTED_CONTROLE_DOMFERME_AUCUN", "selected");
    		$t->set_var("SELECTED_CONTROLE_DOMFERME_VERIF_APPARTENANCE", "");
    		$t->set_var("SELECTED_CONTROLE_DOMFERME_VERIF_NON_APPARTENANCE", "");
    		$t->set_var("CONTENUE_DANS_TYPES", "");
    		
    		$t->set_var("CHECKED_ALPHA", "checked");
    		
    		// Récupération de toutes le rubriques
    		// pour le controle du code à la création  	
    		$retour = pos_getrubrique($jeton, "", /*pref*/$tabLstRub); 			
    		if ($retour)
    		{
    			for($i=0; $i<count($tabLstRub);$i++)
        		{
    		 		$t->set_var("CPT_CODE_RUBRIQUE", $i);
    		 		$t->set_var("CODE_RUBRIQUE_CONTROLE", $tabLstRub[$i]->szRubrique);
    		 		$t->parse("bloc_toutes_rubriques", "BLOC_TOUTES_RUBRIQUES", true);
    			}
    		}
    		else
    			debug($jeton);	
    
    	}
    	else if(strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
    	{	
    	    $retour = pos_getrubrique($jeton, $szCodeRubrique, /*pref*/$tabRubrique);
    	    $objRubrique = $tabRubrique[0];
    		// pas besoin de controle car ici le code de la rubrique n'est pas modifiable
    		$t->set_var("bloc_toutes_rubriques", "");
    		$t->set_var("TITRE_PAGE", CST_LIBELLE_PAGE_MODIF_RUBRIQUE);
    		$t->set_var("DISPLAY_LIBELLE_RUBRIQUE", "");
    		
    		// Tout type de rubrique sauf tableau
    		if ($objRubrique->wTypeRub != 3)
    		{
    			// Si type alphanumérique
    			$t->set_var("CODE_THESAURUS_RUBRIQUE", $objRubrique->szCodeThesaurus);
    			if ($objRubrique->wTypeRub == 0)
    				$szTypeOption = "ALPHA_SELECTED_TYPE_DOMFERME_";
    			else
    				$szTypeOption = "NONALPHA_SELECTED_TYPE_DOMFERME_";
    			
    			foreach	($tabTypeDomaineFerme as $keyTypeDomaineFerme => $valueTypeDomaineFerme)
    				$t->set_var($szTypeOption.$valueTypeDomaineFerme, (strcmp($objRubrique->wDomFerme, $keyTypeDomaineFerme) == 0) ? "selected" : "");
    			
                foreach	($tabControleDomaineFerme as $keyControleDomaineFerme => $valueControleDomaineFerme)
    				$t->set_var("SELECTED_CONTROLE_DOMFERME_".$valueControleDomaineFerme, (strcmp($objRubrique->wControleDomFerme, $keyControleDomaineFerme) == 0) ? "selected" : "");	
    		}
    		//Tableau
    		else
    		{
    			$t->set_var("CODE_THESAURUS_RUBRIQUE", "");
    		}
    		
    		foreach	($tabTypeRubriqueUpperCase as $keyTypeRubriqueUpperCase => $valueTypeRubriqueUpperCase)
    			$t->set_var( "CHECKED_".$valueTypeRubriqueUpperCase, ($objRubrique->wTypeRub == $keyTypeRubriqueUpperCase) ? "checked" : "");
    		
    		
    		//attributs du type
    		$t->set_var("CHECKED_CHOIX_MONO_RUBRIQUE", ($objRubrique->bMonoCritere == 1) ? "checked" : "");
    		$t->set_var("MONOCRITERE", ($objRubrique->bMonoCritere == 1) ? "1" : "0");
    		$t->set_var("CHECKED_CHOIX_SECOND_RUBRIQUE", ($objRubrique->bSecondaire == 1) ? "checked" : "");
    		$t->set_var("CHECKED_CHOIX_INVISIBLE_RUBRIQUE", ($objRubrique->bInvisible == 1) ? "checked" : "");
    		$t->set_var("NB_CAR_MAX_INDEX_RUBRIQUE", $objRubrique->wNbCharMot);
    			
    		// rubrique contenue dans les types de documents
    		$szContenueDansTypes = "";
    		$retour = pos_getlistalltypes($jeton, /*pref*/$tabListeTypeDoc);
    		if($retour)
    		{
    			foreach ($tabListeTypeDoc as $keyDoc => $valueDoc)
    			{
    				$retour = pos_getlistrubintype($jeton, $keyDoc, /*pref*/$tabCodeLibRub);
    				if($retour)
    				{	
    					while(list($code, $valeur) = each($tabCodeLibRub))
    					{
    						if(strcmp($_REQUEST['POS_CODE_RUBRIQUE'],$code) == 0)
    							if(strlen($szContenueDansTypes) == 0)
    								$szContenueDansTypes=$keyDoc;
    							else
    								$szContenueDansTypes=$szContenueDansTypes."\n".$keyDoc;
    					}
    					$t->set_var("CONTENUE_DANS_TYPES", $szContenueDansTypes);
    				}
    				else
    					debug($jeton);				
    			}
    		}
    		else
    			debug($jeton);
    	}
        $t->pparse("MyOutput", "modif_rubrique");
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
