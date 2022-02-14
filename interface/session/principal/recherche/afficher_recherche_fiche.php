<?php
/*
 * DESCRIPTION : Module d'affichage de la fiche d'index en mode recherche 
 *
 * AUTEUR : Sebastien Fleury
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document
 * INUMQUEST : num�ro de la question quand on vient de l'historique (facultatif)
 *------------------------------------------------------------------
 * Modifications :
 * 13.09.2001 GG remplacement des valeurs des rubriques afin de pouvoir r�afficher la recherche
 * 24.02.2003 FT gestion pour le retour de l'historique
 * 25.03.2005 GG suppression de la connexion a Poseidon
 */
 
include "../include/locution.inc.php";
if (!isset($_SESSION))
    session_start();
include("../include/template.inc.php");
include("../include/connexion.inc.php");
include("../include/debug.inc.php");
include("../include/get_template.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

if (!isset($_REQUEST["POS_TYPEDOC"]) || strlen($_REQUEST["POS_TYPEDOC"]) == 0)
{
	afficheMsg(CST_LIBELLE_PARSER_CHOOSE_DOC);
	exit;
}
$tabRecherche = array();
//Si l'on vient de l'historique
if(isset($_REQUEST["INUMQUEST"]))
{
	//traitement pour mettre en place le remplissage des rubriques
	for($i=0; $i < count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]); $i++)
	{
		$szCodeRub = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szCodeRub;
		//on cr�e le nom de la variable
		$code = "POS_VAL_RUB_$szCodeRub";
		$tabRecherche[$code] = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szValeur1;
        if (strlen($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szCodeTypeLie) != 0)
        {
            $code = "POS_VAL_RUB_".$szCodeRub."_".$_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szCodeTypeLie."_".$_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szCodeRubLie;
            $tabRecherche[$code] = $_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]][$i]->szValeur1;
        }
	}
}
      
$szCodeTypeDoc = $_REQUEST["POS_TYPEDOC"];
$iNumFiche = isset($_REQUEST["POS_NUM_FICHE"]) ? $_REQUEST["POS_NUM_FICHE"] : "0";

// Test d'existence de la fiche d'index par d�faut
$retour_file = get_file_tpl("RECHERCHE", $szCodeTypeDoc, $iNumFiche, /*pref*/$file_tpl);

if (!$retour_file)
{
	afficheMsg(CST_LIBELLE_PARSER_SEARCH_NO_EXIST);
	exit;
}

// -------------------------------------
// Affichage
// -------------------------------------
$tpl = new template(".");
$retour_file = get_file_tpl("RECHERCHE_BTN", $szCodeTypeDoc, $iNumFiche, /*pref*/$fileBoutonType);
$file_bouton_tpl =  (file_exists($fileBoutonType)) ? $fileBoutonType : REP_TEMPLATE_APPLICATIF."recherche/titre_boutons.tpl";

$tpl->set_file(array("fiche"=>$file_tpl,"bouton"=>$file_bouton_tpl));
foreach($tabRecherche as $szCode => $szValeur)
{
	$tpl->set_var($szCode, htmlentities_currentcharset($szValeur, ENT_QUOTES));
}

//add by Ibson
$nom_utilisateur=$_SESSION["sess_user_name"];
$profil_utilisateur=$_SESSION["sess_profil"];
echo "<input  type='hidden' class='utilisateur'value='{$nom_utilisateur}' />";
echo "<input  type='hidden' class='profil'value='{$profil_utilisateur}' />";
 


$tpl->set_var("URL_ATTENTE", URL_ATTENTE_RECHERCHE);
$tpl->set_var("POS_NUM_FICHE", $iNumFiche);
$tpl->set_var("CODE_ACTION", URL_RESULTAT_SIMPLE);
$tpl->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
$tpl->set_var("CODE_ACTION_FERMER", "fermeture()");
$tpl->set_var("VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
$tpl->set_var("AFFICHER_CALENDRIER", CST_LIBELLE_CALENDRIER);
$tpl->set_var("RECHERCHER", CST_LIBELLE_RECHERCHER);
$tpl->set_var("LIBELLE_ACTION", CST_LIBELLE_RECHERCHER);
$tpl->set_var("TITRE_ENTETE_PAGE", CST_LIBELLE_TITRE_TPL_RECHERCHE.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
$tpl->set_var("TITRE_FENETRE", CST_LIBELLE_TITRE_TPL_RECHERCHE.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
$tpl->set_var("FCT_JS_VOC_GEN", "charger_vocabulaire_recherche();");
$tpl->set_var("LIBELLE_CREER", CST_LIBELLE_AFF_CREER);
$tpl->set_var("POS_TYPEDOC", $_REQUEST['POS_TYPEDOC']);
$tpl->set_var("CODE_ACTION_CREER", "document.principal.URL.value='".URL_CREATION."';document.principal.submit();");

$tpl->parse("TITRE_BOUTONS", "bouton", false);
$tpl->parse("MyOutput","fiche");
$tpl->p("MyOutput");
?>
