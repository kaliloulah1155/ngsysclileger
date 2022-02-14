<?php
/*
 * DESCRIPTION : Module d'affichage d'une fiche creation 
 *
 * AUTEUR : Gabrielle Guy, Sébastien Fleury
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document  (pour determiner le template)
 * POS_NUM_FICHE : numero du template utilisé (optionnel, par defaut 0)
 * POS_REAFFICHAGE : reaffichage après une erreur
 * ------------------------------------------------------------
 * Modifications
 * Gaby : 08/08/2001 : gestion des valeurs par défaut
 * Gaby : 26.10.2001 : reaffichage après une création infructueuse
 * Gaby : 30.10.2001 : les templates sont ranges par application
 * Gaby : 12.11.2001 : ajout prise en compte du numéro de fiche
 * Gaby : 23.11.2001 : prise en compte des valeurs des rubriques en entrée
 *   pour passer du mode recherche en mode création
 * Gaby : 06.08.2002 : correction date system + nb jours
 * Gaby : 01.04.2003 : ajout constantes Fermer/Creer
 * PL : 25.07.2007 PL les variables issues de GET et POST
 * 		 sont recuperees par $_REQUEST
 */

//IBSON : Mon Controlleur Personnalisé 

// connexion
if (!isset($_SESSION))
session_start();
include ("../include/debug.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../include/get_template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

//le type de document n'est pas sélectionné
 /*echo $_REQUEST['POS_TYPEDOC'] ;
 exit;*/

if (!isset($_REQUEST['POS_TYPEDOC']) || $_REQUEST['POS_TYPEDOC'] == NULL)
{
	afficheMsg(CST_LIBELLE_CREATION_TYPE_DOC);
	exit;
}
if(defined('DISPLAY_CONF_CREATION_DOC') && strcmp(DISPLAY_CONF_CREATION_DOC, "1") == 0 && !isset($_REQUEST["POS_CONF_HAB"])) {
    include("../creation/choisir_confidentialite.php");
    exit;
}

$iNumFiche = (isset($_REQUEST["POS_NUM_FICHE"])) ? $_REQUEST["POS_NUM_FICHE"] : 0;
$retour_file = get_file_tpl("CREATION", $_REQUEST['POS_TYPEDOC'], $iNumFiche, /*pref*/$file_tpl);

if (!$retour_file)
{
	afficheMsg(CST_LIBELLE_CREATION_SEARCH_NOT_EXIST);
	exit;
}
$retour = connexion($jeton);
if ($retour)
{
	$retour = pos_getrubriquetype($jeton, $_REQUEST['POS_TYPEDOC'], /*pref*/$tabRubInType);
    if ($retour)
    {
    	// remplacement dans le template
    	$t = new Template(".");
        
        $retour_file = get_file_tpl("CREATION_BTN", $_REQUEST['POS_TYPEDOC'], $iNumFiche, /*pref*/$fileBoutonType);
        $file_bouton_tpl =  (file_exists($fileBoutonType)) ? $fileBoutonType : REP_TEMPLATE_APPLICATIF."creation/titre_boutons.tpl";
	
    	$t->set_file(array("creation"=>$file_tpl,"bouton"=>$file_bouton_tpl));
        $t->set_block("bouton", "BLOC_LISTE_RUB_TAB", "bloc_liste_rub_tab");
        $t->set_var("URL_ATTENTE", URL_ATTENTE);
        $t->set_var("LIBELLE_ACTION", CST_LIBELLE_CREER);
        $t->set_var("LIBELLE_CREER_DOSSIER", CST_LIBELLE_CREER_DOSSIER);
    	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
        $t->set_var("CODE_ACTION", URL_CREER);
    	$t->set_var("POS_NUM_FICHE", $iNumFiche);
        $t->set_var("POS_TYPEDOC", $_REQUEST['POS_TYPEDOC']);
    	$t->set_var("TITRE_ENTETE_PAGE", CST_LIBELLE_TITRE_TPL_CREATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
    	$t->set_var("TITRE_FENETRE", CST_LIBELLE_TITRE_TPL_CREATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
    	$t->set_var("FCT_JS_VOC_GEN", "charger_vocabulaire();");
    
    	$t->set_var("VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
        $t->set_var("AFFICHER_CALENDRIER", CST_LIBELLE_CALENDRIER);
    	$t->set_var("CODE_ACTION_FERMER", "fermeture();");
    	$t->set_var("PHPSESSID", session_id());
        $t->set_var("MODE", "CREATION");
        
        if (isset($_REQUEST["POS_CONF_HAB"]))
    		$t->set_var("POS_CONF_HAB", $_REQUEST["POS_CONF_HAB"]);
		else
    		$t->set_var("POS_CONF_HAB", "0");

		if (isset($_REQUEST["POS_CONF_NIV"]))
    		$t->set_var("POS_CONF_NIV", $_REQUEST["POS_CONF_NIV"]);
		else
    		$t->set_var("POS_CONF_NIV", "0");

		if (isset($_REQUEST["POS_CLOISON"]))
    		$t->set_var("POS_CLOISON", $_REQUEST["POS_CLOISON"]);
		else
    		$t->set_var("POS_CLOISON", "");

		if (isset($_REQUEST["POS_CONF_LIBELLE_HAB"]))
    		$t->set_var("POS_CONF_LIBELLE_HAB", $_REQUEST["POS_CONF_LIBELLE_HAB"]);
		else
    		$t->set_var("POS_CONF_LIBELLE_HAB", "");

    	// affichage des valeurs par défaut
    	if (!isset($_REQUEST["POS_REAFFICHAGE"]))
    	{
    		$t->set_var("RUB_ERREUR", "");
    		$szListeRubVerrouille = "";
    		for($i=0;$i<count($tabRubInType);$i++)
    		{
    		    if ($tabRubInType[$i]->wReservee == 1 || $tabRubInType[$i]->wReservee == 2)
    		    {
    		      $szListeRubVerrouille .= $tabRubInType[$i]->szRubrique . ";";
                }
    			// valeurs par défaut
    			$szCodeRubDefaut = $tabRubInType[$i]->szRubrique;
    			$szValeurRubDefaut = $tabRubInType[$i]->szDefaut;
                $szValeurRubDefaut = calcValDefaut($szValeurRubDefaut);
    
    			// si pas de valeur par défaut (ou vide), affiche la valeur de la rubrique 
    			// en entree (cas du passage recherche -> creation)
    			$tag = "POS_VAL_RUB_".$szCodeRubDefaut;
    			if (isset($_REQUEST[$tag]) &&  strlen($_REQUEST[$tag]) != 0 && strlen($szValeurRubDefaut) == 0)
    			{
    				$szValeurRubDefaut = stripslashes($_REQUEST[$tag]);
    				$szValeurRubDefaut = htmlentities($szValeurRubDefaut, ENT_QUOTES);
    			}
    			// si une valeur par défaut existe, elle remplace la précédente
    			$t->set_var("POS_VAL_RUB_".$szCodeRubDefaut, $szValeurRubDefaut);
                
                // rubrique tableau
                if ( $tabRubInType[$i]->szDefaut == "AUTO" && strlen($tabRubInType[$i]->szTypeLie) != 0) {
                    
                    $szNextValCompt = "";
                    $retour = pos_gestcompteur($jeton, $tabRubInType[$i]->szRubrique, $_REQUEST['POS_TYPEDOC'],
                                                PHP_VULCAIN_GET_NEXT_VAL, $szNextValCompt);
                    $t->set_var("CODE_RUB_TAB", $tabRubInType[$i]->szRubrique);
                    $t->set_var("VALEUR_RUB_TAB", $szNextValCompt);
                    $t->set_var("POS_VAL_RUB_".$tabRubInType[$i]->szRubrique, $szNextValCompt);
                    $t->parse("bloc_liste_rub_tab", "BLOC_LISTE_RUB_TAB", true);
                }
    		}
    		$t->set_var("LISTE_RUB_VERROUILLEES", $szListeRubVerrouille);
    	}
    	else
    	// reaffichage des valeurs saisies
    	{
            $t->set_var("RUB_ERREUR", (isset($szRubErreur)) ? $szRubErreur : "");
    		$tabValeur = get_form_values_with_prefix("POS_VAL_RUB_", true);
    		
    	 	while (list($key, $val) = each($tabValeur))
    	 	{
    			$val = htmlentities_currentcharset($val,ENT_QUOTES);
    			$t->set_var("POS_VAL_RUB_".$key, $val);
    		}
    		$t->set_var("LISTE_RUB_VERROUILLEES", $_REQUEST["LISTE_RUB_VERROUILLEES"]);
            
            for($i=0;$i<count($tabRubInType);$i++)
    		{
    		    // rubrique tableau
                if ( $tabRubInType[$i]->szDefaut == "AUTO" && strlen($tabRubInType[$i]->szTypeLie) != 0) {
                    $t->set_var("CODE_RUB_TAB", $tabRubInType[$i]->szRubrique);
                    $t->set_var("VALEUR_RUB_TAB", $tabValeur[$tabRubInType[$i]->szRubrique]);
                    $t->parse("bloc_liste_rub_tab", "BLOC_LISTE_RUB_TAB", true);
                }
    		}
    	}
        $traitements_speciaux = "../specifique/afficher_creation_".$_SESSION["sess_application"].".php";
        if(file_exists($traitements_speciaux))
        {
            include($traitements_speciaux);
        }
        pos_disconnect($jeton);
    }
	$t->parse("TITRE_BOUTONS", "bouton", false);
	$t->pparse("MyOutput", "creation");
}
else
{
	debug($jeton);
	echec_connexion();
}

?>
