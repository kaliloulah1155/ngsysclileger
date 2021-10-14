<?php
/*-------------------------------------------------------------------
 * DESCRIPTION : Affichage des questions de la biblioth�que, des BAL et
 * des questions de l'historique ou du mode portail
 * REPRISE : 2012.07.03 GG 
 * --------------------------------------------------------------------
 */
include_once ("../include/bal.inc.php");
if (!isset($_SESSION))
    session_start();
include ("../include/question.inc.php");
include ("../include/template.inc.php");
include ("../question/util_question.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$t = new template(REP_TEMPLATE_APPLICATIF);
if(defined('MODE_PORTAIL') && strcmp(MODE_PORTAIL, "1") == 0) {
    $t->set_file("question", "portail/container_portlet.tpl");
	$t->set_var("ELEMENTS_DANS_BAL", sizeof($_SESSION["sess_tab_bal"]));
    $t->set_var("DISPLAY_ICON_DELETE_BAL", DISPLAY_ICON_DELETE_BAL);
}
else
    $t->set_file("question", "question/question.tpl");
    
$t->set_var("SET_RELOAD_BAL", defined('SET_RELOAD_BAL') ? SET_RELOAD_BAL : 10);
$t->set_var("URL_ATTENTE", URL_ATTENTE);
$t->set_var("URL_VERSION", URL_VERSION);
$t->set_var("URL_RESULTAT", URL_RESULTAT);
$t->set_var("URL_OBTENIR_NB_REP", URL_OBTENIR_NB_REP);
$t->set_var("URL_CHANGER_PROFIL", URL_CHANGER_PROFIL);
$t->set_var("LIBELLE_VERSION", CST_LIBELLE_VERSION);
$t->set_var("LIBELLE_BIENVENUE_ACCUEIL", CST_LIBELLE_BIENVENUE_ACCUEIL);
$t->set_var("TITRE_PAGE", CST_LIBELLE_ACCUEIL);
$t->set_var("SESS_APPLICATION", $_SESSION["sess_application"]);
$t->set_var("LANG", $_SESSION["sess_langue"]);
$t->set_var("IS_MODE_EDITION", (isset($_REQUEST["EDITION"]) && $_REQUEST["EDITION"] == '1') ? 1 : 0);

$t->set_block("question", "LISTE_PROFIL", "liste_profil");
$t->set_block("question", "BLOC_CHANGE_PROFIL", "bloc_change_profil");

if(defined('MODE_PORTAIL') && strcmp(MODE_PORTAIL, "1") == 0)
{
    include ("../portail/util_layout.inc.php");
    if (getCurrentLayout($content, $msgErr))
    {
        $t->set_var("LAYOUT_CONTENT", addslashes($content));
        $t->set_var("LAYOUT_CONTENT_MSG_ERR", "");
    }
    else {
        $t->set_var("LAYOUT_CONTENT", "");
        $t->set_var("LAYOUT_CONTENT_MSG_ERR", $msgErr);
    }
    // affichage du panier
    $t->set_var("LIBELLE_PANIER", CST_LIBELLE_PANIER);
    $t->set_var("NB_ELEMENT_PANIER", $_SESSION["sess_nb_elts_panier"]);
    
    // titre button +/- :
    $t->set_var ('LIBELLE_CONFIGURER_PORTAIL', CST_LIBELLE_AFFICHER_MASQUER_CONF);
    $t->set_var ('LIBELLE_EDITER_PORTAIL', (isset($_REQUEST["EDITION"]) && $_REQUEST["EDITION"] == '1') ? CST_LIBELLE_REVENIR_CONSULT_PORTAIL : CST_LIBELLE_EDITER_PORTAIL);
    $t->set_var ('MGS_EDITION', ($_SESSION["sess_droitAdministration"]) ? CST_MGS_ADMIN_EDITION : CST_MGS_PERSO_EDITION);
    $displayMsgEdition = (isset($_REQUEST["EDITION"]) && $_REQUEST["EDITION"] == '1') ? '' : 'none';
    $t->set_var ('DISPLAY_MGS_EDITION', $displayMsgEdition);
    
    
    afficherListeProfils(/*pref*/$t);
    
    $t->set_block("question","BIBLIO_PUB","biblio_pub");
    $t->set_block("question","BIBLIO_PRIV","biblio_priv");
    afficherListeQuestionBibPubliques(/*pref*/$t);
    afficherListeQuestionBibPrivees(/*pref*/$t);
    if(count($_SESSION["sess_tabQuestBibPub"])==0)
    	$t->set_var("biblio_pub", "");
    if(count($_SESSION["sess_tabQuestBibPriv"])==0)
    	$t->set_var("biblio_priv", "");
}
else
{
    $t->set_var("LIBELLE_RAFRAICHISSEMENT_BAL", CST_LIBELLE_RAFRAICHISSEMENT_BAL);
    $t->set_var("NOTE_RAFRAICHISSEMENT_BAL", CST_NOTE_RAFRAICHISSEMENT_BAL);
    $t->set_var("URL_RAFRAICHISSEMENT_BAL", URL_AFFICHER_QUESTION);
    // affichage du panier
    $t->set_block("question", "BLOC_PANIER", "bloc_panier");
    if(strcmp(CST_PANIER,1) == 0)
    {
    	$t->set_var("LIBELLE_PANIER", CST_LIBELLE_PANIER);
    	$t->set_var("NB_ELEMENT_PANIER", $_SESSION["sess_nb_elts_panier"]);
    	$t->parse("bloc_panier", "BLOC_PANIER", true);
    }
    else
    {
    	$t->set_var("bloc_panier", "");
    }
    
    if(defined('CST_AFFICHAGE_PROFIL_BAL') && strcmp(CST_AFFICHAGE_PROFIL_BAL, "1") == 0)
        afficherListeProfils(/*pref*/$t);
    else
    {
        $t->set_var("liste_profil", "");
        $t->set_var("bloc_change_profil", "");
    }
    afficherListeQuestionBib(/*pref*/$t);
    
    // bloc de resultat des questions
    $ficQuestionAccueil = "../../../../configuration/question_".$_SESSION["sess_application"].".conf";
    $iNbQuestions = 0;
    $t->set_block("question", "ENTETE", "entete");
    $t->set_block("question", "LR_REPONSE", "lr_reponse");
    $t->set_block("question", "LISTE_REPONSES", "liste_reponses");
    $t->set_block("question", "BLOC_AFFICHER_QUESTION", "bloc_afficher_question");
    // On v�rifie que le fichier existe
    if(file_exists($ficQuestionAccueil))
    {
        // Lecture du fichier.
        $tabInfoQuestion = parse_ini_file($ficQuestionAccueil, true);
        if (isset($tabInfoQuestion["GENERAL"]["NB_QUESTIONS"]))
            $iNbQuestions = $tabInfoQuestion["GENERAL"]["NB_QUESTIONS"];
        else
        {
            echo "La section NB_QUESTIONS est absente du fichier de configuration.";
        }   
    }
    if($iNbQuestions > 0)
    {
        include ("../include/connexion.inc.php");
        include ("../include/debug.inc.php");
        include ("../include/locution.inc.php");
        include ("../include/liste_resumee.inc.php");
        include ("../tableau/fonction_tableau.php");
        $retour = connexion($jeton);
        if($retour)
        {
            $retour = afficherResultatAccueil($jeton, $tabInfoQuestion, /*pref*/$t);
            pos_disconnect($jeton);
        }
        else
        	debug($jeton);
        if ($retour)
            $t->parse("bloc_afficher_question", "BLOC_AFFICHER_QUESTION", false); 
        else
            $t->set_var("bloc_afficher_question", "");
    }
    else
        $t->set_var("bloc_afficher_question", "");
}

afficherListeBal(/*pref*/$t);

// affichage du template
$t->pparse("Output", "question");
?>
