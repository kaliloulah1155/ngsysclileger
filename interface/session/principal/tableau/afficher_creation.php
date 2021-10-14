<?php
/*
 * DESCRIPTION : Module daffichage du template de creation
 * 				 d'une ligne des rub tableaux
 *
 * AUTEUR : Sebastien Costanzo
 * DATE de CREATION : 07/03/2003
 *
 * Donnees en entree : 
 * Données du document principal :
 * POS_VALEUR_TAB_RUB : valeur de la rubrique
 * POS_TYPEDOC_PERE : type du document
 * POS_CODE_RUB : Code de la rub liée
 *
 * Données du nouveau document :
 * POS_TYPEDOC : Type du document
 * POS_CODE_RUB : Code de la rub liée (rub numérique)
 * POS_VALEUR_RUB_LIE : Valeur de la rub liée
 *
 * ENCHAINER : 1 ou 0 pour l'enchainement automatique de la creation.
 */

session_start();

include ("../include/debug.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../include/get_template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../tableau/fonction_tableau.php");

if(!isset($_REQUEST["POS_NUM_FICHE"])) 
    $_REQUEST["POS_NUM_FICHE"]=0;
$szTypeDoc = $_REQUEST["POS_TYPEDOC"];

$retour_file = get_file_tpl("CREATION", $szTypeDoc, $_REQUEST["POS_NUM_FICHE"], /*pref*/$file_tpl);
if (!file_exists($file_tpl))
{
	afficheMsg(CST_LIBELLE_CREATION_TYPE_DOC); 
	exit;
}


$retour = connexion($jeton);

if ($retour)
{
	$retour = pos_getinforubintype($jeton, $szTypeDoc, "", 200, /*pref*/$tabRubInType);
	if ($retour)
    {
    	// remplacement dans le template
    	$t = new Template(".");
        $retour_file = get_file_tpl("CREATION_BTN", $szTypeDoc, $_REQUEST["POS_NUM_FICHE"], /*pref*/$fileBoutonType);
        $file_bouton_tpl =  (file_exists($fileBoutonType)) ? $fileBoutonType : REP_TEMPLATE_APPLICATIF."creation/titre_boutons_tableau.tpl";

    	$t->set_file(array("creation"=>$file_tpl,"bouton"=>$file_bouton_tpl));
        $t->set_var("POS_TYPEDOC", $_REQUEST['POS_TYPEDOC']);
    	$t->set_var("POS_VALEUR_TAB_RUB", $_REQUEST["POS_VALEUR_TAB_RUB"]);
    	$t->set_var("POS_TYPEDOC_PERE", $_REQUEST["POS_TYPEDOC_PERE"]);
    	$t->set_var("POS_CODE_RUB", $_REQUEST["POS_CODE_RUB"]);
    	$t->set_var("POS_CODE_RUB_LIE", $_REQUEST["POS_CODE_RUB_LIE"]);
    	$t->set_var("POS_VALEUR_RUB_LIE", $_REQUEST["POS_VALEUR_RUB_LIE"]);
    	$t->set_var("POS_NUM_FICHE", $_REQUEST["POS_NUM_FICHE"]);
    	$t->set_var("URL_ATTENTE", URL_ATTENTE);
    	$t->set_var("ENCHAINER", isset($_REQUEST["ENCHAINER"]) ? $_REQUEST["ENCHAINER"] : "0");
    	
    	$t->set_var("LIBELLE_ACTION", CST_LIBELLE_CREER);
    	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
    	$t->set_var("VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
    	$t->set_var("TITRE_ENTETE_PAGE", CST_LIBELLE_TITRE_TPL_CREATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
	    $t->set_var("TITRE_FENETRE", CST_LIBELLE_TITRE_TPL_CREATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
	    $t->set_var("FCT_JS_VOC_GEN", "charger_vocabulaire();");
        $t->set_var("LISTE_RUB_VERROUILLEES", "");
    	
    	// "1" : si on a le droit de creer, c'est que l'action Hermes le permet
    	$szCodeActionFermer = scriptListeTableau($_REQUEST["POS_TYPEDOC_PERE"], $_REQUEST["POS_VALEUR_TAB_RUB"], "MODIFICATION", 
                            $_REQUEST["POS_CODE_RUB"], "1", false);
    	$t->set_var("CODE_ACTION", URL_CREER_TABLEAU);
    	$t->set_var("CODE_ACTION_FERMER", $szCodeActionFermer);
    
    
        // affichage des valeurs par défaut
    	if (!isset($_REQUEST["POS_REAFFICHAGE"]))
    	{
    		$t->set_var("RUB_ERREUR", "");
    		// affichage des valeurs par défaut
    		for($i=0;$i<count($tabRubInType);$i++)
    		{
    			// valeurs par défaut
    			$szCodeRubDefaut = $tabRubInType[$i]->code;
    			$szValeurRubDefaut = $tabRubInType[$i]->val_defaut;
    	        $szValeurRubDefaut = calcValDefaut($szValeurRubDefaut); 
    			
    			// si une valeur par défaut existe, elle remplace la précédente
    			$t->set_var("POS_VAL_RUB_".$szCodeRubDefaut, $szValeurRubDefaut);
    			
    			$tag = "POS_VAL_RUB_".$szCodeRubDefaut;
    		}
    	}
    	else
    	// reaffichage des valeurs saisies
    	{
    
    		if(isset($szRubErreur))
    			$t->set_var("RUB_ERREUR", $szRubErreur);
    		else
    			$t->set_var("RUB_ERREUR", "");
    
    		$tabValeur = get_form_values_with_prefix("POS_VAL_RUB_", true);
    		
    	 	while (list($key, $val) = each($tabValeur))
    	 	{
    			$val = htmlentities_currentcharset($val,ENT_QUOTES);
    			$t->set_var("POS_VAL_RUB_".$key, $val);
    		}
    	}
        $traitements_speciaux = "../specifique/afficher_creation".$szTypeDoc.".php";
        if(file_exists($traitements_speciaux))
        {
            include($traitements_speciaux);
        }
    	
    	$t->parse("TITRE_BOUTONS", "bouton", false);
    	$t->pparse("MyOutput", "creation");
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
