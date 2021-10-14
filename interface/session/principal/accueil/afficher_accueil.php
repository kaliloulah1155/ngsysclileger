<?php
include ("../include/template.inc.php");
include ("../include/get_menu.php");
include ("../dossier/arborescence_dossier.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration_w/constantesPHP.conf.php");

$menu = get_nom_menu($_SESSION["sess_application"], $_SESSION["sess_user_name"], 
            $_SESSION["sess_service"], $_SESSION["sess_fonction"], $_SESSION["sess_profil"]);
    
$t = new template(".");
$t->set_file(array("accueil"=>REP_TEMPLATE_APPLICATIF."accueil/accueil_dd.tpl", 
                            "arborescence"=>REP_TEMPLATE_APPLICATIF."arborescence/arborescence_dossier.tpl"));
$t->set_block("accueil", "BLOC_MODE_SANS_ONGLET", "bloc_mode_sans_onglet");
$t->set_block("accueil", "BLOC_MODE_ONGLET", "bloc_mode_onglet");
    

$t->set_var("NB_REPONSES_PAR_PAGE", NB_REPONSES_PAR_PAGE);
$t->set_var("STYLE_THEME", isset($_REQUEST["STYLE_THEME"]) ? $_REQUEST["STYLE_THEME"] : "theme_gris");
$t->set_var("DISPLAY_PLEIN_ECRAN", (defined('DISPLAY_PLEIN_ECRAN') && DISPLAY_PLEIN_ECRAN == "1") ? 1 : 0); 
$t->set_var("DISPLAY_RECH_FTX", (defined('DISPLAY_RECH_FTX') && DISPLAY_RECH_FTX == "1") ? "" : "none" );

// affichage de l'arborescence
$szUrlArbo = "../dossier/arborescence_dossier.php?FIRST_LOAD=1";
$szNameMenu = $_SESSION["sess_application"]."/menu/$menu";
$szUrlMenuDirect = URL_SITE."/interface/tpl/".$szNameMenu;

$szSrcIndex = URL_SITE."/interface/vide.htm";
$bOpenDocumentOnConnect = 0;
if (isset($_REQUEST["POS_QUEST_NOM"]) && strlen($_REQUEST["POS_QUEST_NOM"]) > 0)
{
	// a prefixer d'un & car on passe par l'attente
    $szQueryQuestString = "&POS_QUEST_NOM=".urlencode($_REQUEST["POS_QUEST_NOM"]);
    $szQueryQuestString .= "&POS_QUEST_PUBLIC=".$_REQUEST["POS_QUEST_PUBLIC"];
	$szQueryQuestString .= "&TYPE_RECHERCHE=RECHERCHE_BIB";
    if (isset($_REQUEST["POS_QUEST_RES_VAR"]))
    {
	    $szQueryQuestString .= "&POS_QUEST_RES_VAR=".$_REQUEST["POS_QUEST_RES_VAR"];
	    $szQueryQuestString .= "&POS_QUEST_NB_VAR=".$_REQUEST["POS_QUEST_NB_VAR"];
	    $szQueryQuestString .= "&POS_VAR_RECH_1=".urlencode(stripslashes($_REQUEST["POS_VAR_RECH_1"]));
    }
    $szFrameAffiche = 'center';
}
else
{
	$szFrameAffiche = 'centerbal';
}

$szSrcCenter = URL_SITE."/interface/vide.htm";
if(isset($_REQUEST["POS_NUM_DOC"]) && strlen($_REQUEST["POS_NUM_DOC"]) > 0) {
    $bOpenDocumentOnConnect = 1;
    $t->set_var("OPEN_DOCUMENT_ON_CONNECT_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
    $t->set_var("OPEN_DOCUMENT_ON_CONNECT_MODE", $_REQUEST["MODE"]);
    $t->set_var("OPEN_DOCUMENT_ON_CONNECT_URL", "../../../../interface/session/principal/attente/attente.php?URL=URL_CONSULTER_INDEX&POS_NUM_DOC=".$_REQUEST["POS_NUM_DOC"]."&MODE=".$_REQUEST["MODE"]);
}
else {
    if(isset($_REQUEST["POS_QUEST_NOM"]) && strlen($_REQUEST["POS_QUEST_NOM"]) > 0)
        $szSrcCenter = URL_SITE."/interface/session/principal/resultat/rechercher_db.php?".$szQueryQuestString;
}
   

$t->set_var("FRAME_ACCUEIL", $szFrameAffiche);
$t->set_var("URL_AFFICHER_INDEX", $szSrcIndex);
$t->set_var("OPEN_DOCUMENT_ON_CONNECT", $bOpenDocumentOnConnect);

$t->set_var("URL_ACCES_DIRECT_MENU", $szUrlMenuDirect);
// affichage de la barre uniquement si le menu existe
$t->set_var("DISPLAY_MENU_SOUS_ARBO", file_exists("../../../../interface/tpl/".$szNameMenu) ? "true" : "false");

$t->set_var("POS_APPLICATION", $_SESSION["sess_application"]);
$t->set_var("PAGE_ACCUEIL", CST_LIBELLE_ACCUEIL);

$t->set_var("URL_CENTER", $szSrcCenter);
$t->set_var("URL_TOOLBAR", URL_TOOLBAR);
$t->set_var("URL_AFFICHER_QUESTION", URL_AFFICHER_QUESTION);
$t->set_var("URL_ATTENTE", URL_ATTENTE);
$t->set_var("URL_ATTENTE_DECONNECT", URL_ATTENTE."?URL=URL_DECONNECT&DECONNECT=1&EXTERNALWIN=1");

$t->set_var("NOM_UTILISATEUR", $_SESSION["sess_user_name"]);
$t->set_var("PROFIL_UTILISATEUR", $_SESSION["sess_profil"]);
$t->set_var("LARGEUR_FRM_MENU", LARGEUR_FRM_MENU);
$t->set_var("AFFICHAGE_MENU_EN_HAUT", (defined('AFFICHAGE_MENU_EN_HAUT') && strcmp(AFFICHAGE_MENU_EN_HAUT, "0") == 0) ? "0" : "1");
$t->set_var("POURCENTAGE_TAILLE_MENU", (defined('POURCENTAGE_TAILLE_MENU')) ? POURCENTAGE_TAILLE_MENU : "50");

$t->set_var("LIBELLE_MENU", CST_LIBELLE_MENU);
$t->set_var("LIBELLE_ARBORESCENCE", CST_LIBELLE_ARBORESCENCE);
$t->set_var("URL_AFFICHER_MENU", URL_AFFICHER_MENU);
$t->set_var("URL_CHOIX_TYPE", URL_CHOIX_TYPE);
$t->set_var("NUM_INSTANCE", $_SESSION["sess_nbclient"]);
$t->set_var("CST_LIBELLE_DEBUT_TITRE", ($_SESSION["sess_nbclient"] == 1) ? CST_LIBELLE_DEBUT_TITRE_SESS_PRINCIPALE : CST_LIBELLE_DEBUT_TITRE_SESS_SECONDAIRE);
$t->set_var("CST_LANG", $_SESSION["sess_langue"]);
$t->set_var("LIBELLE_TOOLBAR_FERMER", CST_LIBELLE_TOOLBAR_FERMER);
$t->set_var("URL_FERMER_APPLICATION", URL_ATTENTE."?URL=URL_DECONNECT&DECONNECT=1");
$t->set_var("LIBELLE_FENETRE_FICHIER_APPLET", CST_LIBELLE_FENETRE_FICHIER_APPLET);
$t->set_var("AFFICHE_MASQUE_ARBO", CST_AFFICHE_MASQUE_ARBO);

$t->set_var("VERIF_SESSION",  (defined('TIME_OUT_SESSION') && defined('TIME_REMAINING_ALERT_USER')) ? "true" : "false");
$t->set_var("NEXT_VERIF_SESSION",  (defined('TIME_OUT_SESSION') && defined('TIME_REMAINING_ALERT_USER')) ? (TIME_OUT_SESSION - TIME_REMAINING_ALERT_USER)*1000 : 8*60*1000);

$t->set_var("URL_VERSION", URL_VERSION);
$t->set_var("LIBELLE_VERSION", CST_LIBELLE_VERSION);
$t->set_var("MENU_INSERTION_DOS", CST_MENU_INSERTION_DOS);
$t->set_var("MENU_STOP_INSERTION_DOS", CST_MENU_STOP_INSERTION_DOS);

$t->set_var("MODE_PORTAIL", (defined('MODE_PORTAIL') && strcmp(MODE_PORTAIL, "1") == 0) ? "true" : "false");
$isModeOnglet = !defined('MODE_ONGLET') || (defined('MODE_ONGLET') && strcmp(MODE_ONGLET, "1") == 0);

if($isModeOnglet) {
    $t->set_var("MODE_ONGLET", "1");
    $t->set_var("bloc_mode_sans_onglet", "");
    $t->parse("bloc_mode_onglet", "BLOC_MODE_ONGLET");
}
else {
    $t->set_var("MODE_ONGLET", "0");
    $t->parse("bloc_mode_sans_onglet", "BLOC_MODE_SANS_ONGLET");
    $t->set_var("bloc_mode_onglet", "");
}

$szFilePath = "../../../../configuration_w/";
$szFileName = $szFilePath . "domaine_ferme.js";
$t->set_var("DATE_MODIF_DF", (file_exists($szFileName)) ? filemtime($szFileName) : "0"); 
$t->set_var("IS_OPEN_FILE_HIDDEN_FRAME", ((defined('TYPE_LANCEMENT_APPL')) && TYPE_LANCEMENT_APPL == "TYPE_LANCEMENT_APPL_JWS_SIMPLE") ? "1" : "0"); 

// affichage menu
include ("../redaction_web/fonction_edition.php");
include ("../toolbar/afficher_toolbar.php");
$tToolbar = new template("../../../../configuration");
$szFichierMenu = get_nom_toolbar($_SESSION["sess_application"], $_SESSION["sess_user_name"], 
                $_SESSION["sess_service"], $_SESSION["sess_fonction"], $_SESSION["sess_profil"]);
$tToolbar->set_file("toolbar", $szFichierMenu);
$tabParam = array();
$t->set_var("CONTENU_MENU", genererTransformationXsltFromSource(parseXmlToolbar($tToolbar), "../../../../xsl/transform-menu.xsl", $tabParam));

$lstCstJs = "";
$tabDefine = get_defined_constants(true);
$prefixLibelle = "CST_JS_";
$lenPrefixLibelle = strlen($prefixLibelle);
foreach($tabDefine['user'] as $code => $valeur)
{
    if(strpos($code, $prefixLibelle) === 0)
    {
        $lstCstJs .= "var $code = \"$valeur\";\n"; 
    }   
}
$t->set_var("LISTE_MSG_JS", $lstCstJs);

$t->set_var("URL_RESULTAT", URL_RESULTAT);
$t->set_var("URL_RECHERCHE_FTX", URL_RECHERCHE_FTX);
$t->set_var("URL_AFFICHE_HISTORIQUE", URL_AFFICHE_HISTORIQUE);
$t->set_var("URL_AFFICHE_HIST_QUESTION", URL_AFFICHE_HIST_QUESTION);
$t->set_var("CST_LIBELLE_DOSS_QST_BULLE", CST_LIBELLE_DOSS_QST_BULLE);
$t->set_var("CST_LIBELLE_DOSS_DOC_BULLE", CST_LIBELLE_DOSS_DOC_BULLE);
$t->set_var("CST_LIBELLE_DOSS_ACT_DOS_INS1", CST_LIBELLE_DOSS_ACT_DOS_INS1);
$t->set_var("CST_LIBELLE_DOSS_ACT_DOS_INS2", addslashes(CST_LIBELLE_DOSS_ACT_DOS_INS2));
$t->set_var("CST_LIBELLE_RETOUR_MENU", CST_LIBELLE_RETOUR_MENU);
$t->set_var("DIMINUER_TAILLE_MENU", CST_LIBELLE_DIMINUER_TAILLE_MENU);
$t->set_var("AUGMENTER_TAILLE_MENU", CST_LIBELLE_AUGMENTER_TAILLE_MENU);
$t->set_var("CST_MSG_ERR_ARBO_NO_DOSS_SELECT_DD", CST_MSG_ERR_ARBO_NO_DOSS_SELECT_DD);
$t->set_var("CST_MSG_CONFIRM_INSERT_DOS_CHECKBOX", CST_MSG_CONFIRM_INSERT_DOS_CHECKBOX);
$t->set_var("CST_MSG_CONFIRM_INSERT_DOS_DRAG1", CST_MSG_CONFIRM_INSERT_DOS_DRAG1);
$t->set_var("CST_MSG_CONFIRM_INSERT_DOS_DRAG2", CST_MSG_CONFIRM_INSERT_DOS_DRAG2);

$t->set_var("CST_PLACEHOLDER_SEARCH", CST_PLACEHOLDER_SEARCH);
$t->set_var("CST_TITLE_ALT_SEARCH_ICON", CST_TITLE_ALT_SEARCH_ICON);
$t->set_var("CST_EVITEMENT_ACCUEIL", CST_EVITEMENT_ACCUEIL);
$t->set_var("CST_EVITEMENT_ARBO", CST_EVITEMENT_ARBO);
$t->set_var("CST_DECONNEXION",CST_DECONNEXION);
$t->set_var("CST_LIBELLE_TOOLBAR_AIDE", CST_LIBELLE_TOOLBAR_AIDE);

writeTemplateArborescence($t);

$t->parse("ARBORESCENCE", "arborescence", false);
$t->pparse("Output", "accueil");  
?>