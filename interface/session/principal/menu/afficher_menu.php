<?php

/*
 * DESCRIPTION : Affichage de l'ecran d'exportation de la liste des réponses 
 * 	au format excel
 * 
 * AUTEUR : Frédéric Tramarin
 * DATE de CREATION : 05/02/2003
 * MODIFICATIONS
 */
 
session_start();
include ("../include/template.inc.php");
include ("../include/profil.inc.php");
include ("../include/connexion.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$isOneBlocAdmin = false;

$t = new template(REP_TEMPLATE_APPLICATIF."menu");
if (strcmp($_REQUEST["MENU"], "recherche") == 0)
{
    $t->set_file("menu", "menu_util_recherche.tpl");
}
else if (strcmp($_REQUEST["MENU"], "creation") == 0)
{
    $t->set_file("menu", "menu_util_creation.tpl");
    $t->set_block("menu", "LISTE_TYPES", "liste_types");
    if (!isset($_SESSION["tabTypeDoc"]))
    {
    	// connexion a poseidon
    	$retour = connexion($jeton);
    	if ($retour)
    	{
            $sessTabTypesDoc = array();
    		$retour = pos_getlistalltypesrmc($jeton, /*pref*/$sessTabTypesDoc);
            $_SESSION["tabTypeDoc"] =  $sessTabTypesDoc;
    		pos_disconnect($jeton);
    	}
    	else
    	{
    		debug($jeton);
    		echec_connexion();
    	}
    }
	$t->set_var("URL_CREATION", URL_CREATION);	
    $compt = 0;
	while (list($key, $val) = each($_SESSION["tabTypeDoc"]))
	{
		if (stristr($_SESSION["sess_liste_doc_indexables"], $key.";") || 
                strlen($_SESSION["sess_liste_doc_indexables"]) == 0)
		{
		    $t->set_var("POS_CODE_TYPE", $key);
			$t->set_var("POS_LIBELLE_TYPE", $val);
			$t->set_var("COMPT", $compt);
			$compt++;
			$t->parse("liste_types", "LISTE_TYPES", true);
		}
    }    
}
else
{
    $t->set_file("menu", "menu_util_param.tpl");
    
    $t->set_block("menu", "BLOC_ADMIN_LISTE_HIER", "bloc_admin_liste_hier");
    $t->set_block("menu", "BLOC_ADMIN_DOMAINE_FERME", "bloc_admin_domaine_ferme");
    $t->set_block("menu", "BLOC_ADMIN_UTILISATEUR", "bloc_admin_utilisateur");
    $t->set_block("menu", "BLOC_ADMIN_THESAURUS", "bloc_admin_thesaurus");
    $t->set_block("menu", "BLOC_ADMINISTRATION", "bloc_administration");
    //$t->set_block("menu", "BLOC_CREATION", "bloc_creation");
    $t->set_block("menu", "BLOC_ADMIN", "bloc_admin");
    $t->set_block("menu", "LISTE_PROFIL", "liste_profil");
    $t->set_block("menu", "BLOC_CHANGE_PROFIL", "bloc_change_profil");
    $t->set_block("menu", "BLOC_GESTION_LR", "bloc_gestion_lr");

    if ($_SESSION["sess_droitGestListHier"] == true)
    {
        $isOneBlocAdmin = true;
        $t->parse("bloc_admin_liste_hier", "BLOC_ADMIN_LISTE_HIER");
    }
    else
        $t->set_var("bloc_admin_liste_hier", "");
    
    if ($_SESSION["sess_droitGestDomainFerme"] == true)
    {
        $isOneBlocAdmin = true;
        $t->parse("bloc_admin_domaine_ferme", "BLOC_ADMIN_DOMAINE_FERME");
    }
    else
        $t->set_var("bloc_admin_domaine_ferme", "");
    
    if ($_SESSION["sess_droitAdminUtilisateur"] == true)
    {
        $isOneBlocAdmin = true;
        $t->parse("bloc_admin_utilisateur", "BLOC_ADMIN_UTILISATEUR");
    }
    else
        $t->set_var("bloc_admin_utilisateur", "");
    
    if ($_SESSION["sess_droitThesaurus"] == true)
    {
        $isOneBlocAdmin = true;
        $t->parse("bloc_admin_thesaurus", "BLOC_ADMIN_THESAURUS");
    }
    else
        $t->set_var("bloc_admin_thesaurus", "");
    
	if ($_SESSION["sess_droitAdministration"] == true)
	{
		$isOneBlocAdmin = true;
		$t->parse("bloc_administration", "BLOC_ADMINISTRATION");
    }
    else
    	$t->set_var("bloc_administration", "");
    	
    if ($isOneBlocAdmin)
        $t->parse("bloc_admin", "BLOC_ADMIN");
    else
        $t->set_var("bloc_admin", "");
        
    if ( $_SESSION["sess_droitAdminProfilLR"] == true)
        $t->parse("bloc_gestion_lr", "BLOC_GESTION_LR");
    else
        $t->set_var("bloc_gestion_lr", "");
        
    if(defined('CST_AFFICHAGE_PROFIL_BAL_MENU') && strcmp(CST_AFFICHAGE_PROFIL_BAL_MENU, "1") == 0)
    {
        $t->set_var("LIBELLE_ACCES_PROFIL_COURT", CST_LIBELLE_ACCES_PROFIL_COURT);
        $t->set_var("LIBELLE_CHANGER_PROFIL", CST_LIBELLE_CHANGER_PROFIL);
        $t->set_var("LIBELLE_TITRE_ACCES_PROFIL_COURT", CST_LIBELLE_TITRE_ACCES_PROFIL_COURT);
    
        $tabListeProfils = $_SESSION["sess_tab_profil_util_appli"];
        if (count($tabListeProfils) == 1)
        	$t->set_var("bloc_change_profil", "");
        else
        {
            $cpt = 0;
        	for($i=0;$i<count($tabListeProfils);$i++)
        	{
        		if (strcmp($tabListeProfils[$i], $_SESSION["sess_profil"]) != 0)
        		{
        			$t->set_var("CODE_PROFIL", $tabListeProfils[$i]);
        			$t->set_var("LIBELLE_PROFIL", $tabListeProfils[$i]);
        			$t->set_var("CPT", $cpt++);
        			
        			$t->parse("liste_profil", "LISTE_PROFIL", true);
        		}
        	}
        	$t->parse("bloc_change_profil", "BLOC_CHANGE_PROFIL", true);
        }
    }
    else
    {
        $t->set_var("liste_profil", "");
        $t->set_var("bloc_change_profil", "");
    }
}

$t->set_var("CST_LIBELLE_VERSION", CST_LIBELLE_VERSION);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_UTIL", CST_LIBELLE_TOOLBAR_GEST_UTIL);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_DOMAIN", CST_LIBELLE_TOOLBAR_GEST_DOMAIN);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_LISTHIER", CST_LIBELLE_TOOLBAR_GEST_LISTHIER);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_THESAURUS", CST_LIBELLE_TOOLBAR_GEST_THESAURUS);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_PROFIL_UTIL", CST_LIBELLE_TOOLBAR_GEST_PROFIL_UTIL);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_SESS_UTIL", CST_LIBELLE_TOOLBAR_GEST_SESS_UTIL);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_DOC_EN_MODIF", CST_LIBELLE_TOOLBAR_GEST_DOC_EN_MODIF);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_NATURE", CST_LIBELLE_TOOLBAR_GEST_NATURE);
$t->set_var("CST_LIBELLE_TOOLBAR_TYPES_DOC", CST_LIBELLE_TOOLBAR_TYPES_DOC);
$t->set_var("CST_LIBELLE_TOOLBAR_RUBRIQUES", CST_LIBELLE_TOOLBAR_RUBRIQUES);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_PROFIL_HIER", CST_LIBELLE_TOOLBAR_GEST_PROFIL_HIER);
$t->set_var("CST_LIBELLE_TOOLBAR_STAT_ADMIN", CST_LIBELLE_TOOLBAR_STAT_ADMIN);
$t->set_var("CST_LIBELLE_TOOLBAR_RECH_CLE", CST_LIBELLE_TOOLBAR_RECH_CLE);
$t->set_var("CST_LIBELLE_TOOLBAR_RECH_ELA", CST_LIBELLE_TOOLBAR_RECH_ELA);
$t->set_var("CST_LIBELLE_TOOLBAR_RECH_SIM", CST_LIBELLE_TOOLBAR_RECH_SIM);
$t->set_var("CST_LIBELLE_TOOLBAR_RECH_HIS_DOC", CST_LIBELLE_TOOLBAR_RECH_HIS_DOC);
$t->set_var("CST_LIBELLE_TOOLBAR_RECH_HIS_QUEST", CST_LIBELLE_TOOLBAR_RECH_HIS_QUEST);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_BIB", CST_LIBELLE_TOOLBAR_GEST_BIB);
$t->set_var("CST_LIBELLE_TOOLBAR_RECH_NUM", CST_LIBELLE_TOOLBAR_RECH_NUM);
$t->set_var("CST_LIBELLE_TOOLBAR_RECH_EXC_SIM", CST_LIBELLE_TOOLBAR_RECH_EXC_SIM);
$t->set_var("CST_LIBELLE_TOOLBAR_CREATION", CST_LIBELLE_TOOLBAR_CREATION);
$t->set_var("CST_LIBELLE_TOOLBAR_PASSWORD", CST_LIBELLE_TOOLBAR_PASSWORD);
$t->set_var("CST_LIBELLE_TOOLBAR_FERMER", CST_LIBELLE_TOOLBAR_FERMER);
$t->set_var("CST_LIBELLE_ACCUEIL", CST_LIBELLE_ACCUEIL);
$t->set_var("CST_LIBELLE_TOOLBAR_GEST_PROFIL", CST_LIBELLE_TOOLBAR_GEST_PROFIL);
$t->set_var("CST_LIBELLE_TOOLBAR_BLOC_ACCUEIL", CST_LIBELLE_TOOLBAR_BLOC_ACCUEIL);
$t->set_var("CST_LIBELLE_TOOLBAR_BLOC_PARAMETRAGE", CST_LIBELLE_TOOLBAR_BLOC_PARAMETRAGE);
$t->set_var("CST_LIBELLE_TOOLBAR_BLOC_ADMIN", CST_LIBELLE_TOOLBAR_BLOC_ADMIN);
$t->set_var("CST_LIBELLE_TOOLBAR_BLOC_RECHERCHE", CST_LIBELLE_TOOLBAR_BLOC_RECHERCHE);

$t->set_var("URL_VERSION", URL_VERSION);
$t->set_var("URL_AFFICHE_UTILISATEUR", URL_AFFICHE_UTILISATEUR);
$t->set_var("URL_AFFICHE_PROFIL_UTILISATEUR", URL_AFFICHE_PROFIL_UTILISATEUR);
$t->set_var("URL_LIST_RUB_DOMFERME", URL_LIST_RUB_DOMFERME);
$t->set_var("URL_LIST_LISTHIER", URL_LIST_LISTHIER);
$t->set_var("URL_LIST_THESAURUS", URL_LIST_THESAURUS);
$t->set_var("URL_AFFICHE_LIST_PROFILHIER", URL_AFFICHE_LIST_PROFILHIER);
$t->set_var("URL_LIST_NATURE", URL_LIST_NATURE);
$t->set_var("URL_LIST_TYPEDOC", URL_LIST_TYPEDOC);
$t->set_var("URL_LIST_RUBRIQUE", URL_LIST_RUBRIQUE);
$t->set_var("URL_STAT_ADMIN", URL_AFFICHER_STATS_ADMIN);
$t->set_var("URL_AFFICHE_CONNEXION", URL_AFFICHE_CONNEXION);
$t->set_var("URL_AFFICHE_DOC_EN_MODIFICATION", URL_AFFICHE_DOC_EN_MODIFICATION);
$t->set_var("URL_CHOIX_TYPE_RECHERCHE_CLE", "../type/afficher_type.php?ACTION=RECHERCHE_CLE");
$t->set_var("URL_CHOIX_TYPE_RECHERCHE_ELABOREE", "../type/afficher_type.php?ACTION=RECHERCHE_ELA");
$t->set_var("URL_CHOIX_TYPE_RECHERCHE_SIMPLE", "../type/afficher_type.php?ACTION=RECHERCHE");
$t->set_var("URL_AFFICHE_HISTORIQUE", URL_AFFICHE_HISTORIQUE);
$t->set_var("URL_AFFICHE_HIST_QUESTION", URL_AFFICHE_HIST_QUESTION);
$t->set_var("URL_RECHERCHE_ELABOREE_ENREG_QUEST", URL_RECHERCHE_ELABOREE_ENREG_QUEST);
$t->set_var("URL_RECHERCHE_POS_NUM_DOC", URL_RECHERCHE_POS_NUM_DOC);
$t->set_var("URL_AFFICHER_RECHERCHE_FTX", URL_AFFICHER_RECHERCHE_FTX);
$t->set_var("URL_AFFICHER_CHANGER_PWD", URL_AFFICHER_CHANGER_PWD);
$t->set_var("URL_AFFICHE_GEST_PROFIL_LR", URL_AFFICHE_GEST_PROFIL_LR);
$t->set_var("URL_CHOIX_TYPE_CREATION", "../type/afficher_type.php?ACTION=CREATION");
$t->set_var("URL_FERMER_APPLICATION", URL_FERMER_APPLICATION);
$t->set_var("URL_AFFICHER_QUESTION", URL_AFFICHER_QUESTION);
$t->set_var("URL_AFFICHE_QUEST_BIB", URL_AFFICHE_QUEST_BIB);
$t->set_var("URL_TOOLBAR", URL_TOOLBAR);
$t->set_var("URL_RESULTAT", URL_RESULTAT);
$t->set_var("URL_ATTENTE", URL_ATTENTE);


$t->set_var("USER_NAME", $_SESSION["sess_user_name"]);
$t->set_var("USER_PROFIL", $_SESSION["sess_profil"]);
$t->set_var("CST_LANG", $_SESSION["sess_langue"]);


$t->parse("Output", "menu");  
$t->p("Output");
?>
