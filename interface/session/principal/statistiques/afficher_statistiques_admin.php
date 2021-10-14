<?php

/*
 * DESCRIPTION : Affichage de l'ecran des statistiques administrateur
 * 
 * AUTEUR : GG
 * DATE de CREATION : 28/05/2015
 *
 * Donnees en entree : 
 * MODIFICATIONS
 * 
 */
if (!isset($_SESSION))
session_start();
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $t = new template(REP_TEMPLATE_APPLICATIF."statistiques");
    $t->set_file("export", "afficher_stats_admin.tpl");
    $t->set_block("export", "MOIS_DEBUT", "mois_debut");
    $t->set_block("export", "MOIS_FIN", "mois_fin");
    
    $t->set_var("PHPSESSID", session_id());
    $t->set_var("TITRE_PAGE", CST_STAT_ADMIN_TITRE);
    $t->set_var("LIB_STAT_ADMIN_BLOC_PARAM", CST_STAT_ADMIN_BLOC_PARAM);
    $t->set_var("LIB_DATE_DEBUT", CST_STAT_ADMIN_DATE_DEBUT);
    $t->set_var("LIB_DATE_FIN", CST_STAT_ADMIN_DATE_FIN);
    $t->set_var("LIB_VALIDER", CST_LIBELLE_VALIDER);
    $t->set_var("LIB_ANNULER", CST_LIBELLE_ANNULER);
    $t->set_var("MSG_DATES_NON_RENSEIGNEES", CST_STAT_ADMIN_MSG_DATES_NON_RENSEIGNEES);
    
    $tabMois = explode(";",CST_LISTE_MOIS);
    $moisCourant = date_format(new DateTime(), 'n');
	for($i=0;$i<count($tabMois);$i++) 
	{
        $t->set_var("NUM_MOIS", ($i + 1));
        $t->set_var("LIB_MOIS", $tabMois[$i]);
        $t->set_var("SELECTED", ($moisCourant == ($i + 1)) ? "SELECTED" : "");
        $t->parse("mois_debut", "MOIS_DEBUT", true);
        $t->parse("mois_fin", "MOIS_FIN", true);
	}
    $t->set_var("ANNEE_DEBUT", date_format(new DateTime(), 'Y'));
    $t->set_var("ANNEE_FIN", date_format(new DateTime(), 'Y'));  
    
    
    $t->set_var("LIB_EXPORT_CARACT_SEP", CST_EXPORT_CARACT_SEP);
	$t->set_var("LIB_EXPORT_TAB", CST_EXPORT_TAB);
    $t->set_var("LIB_EXPORT_POINT_VIRGULE", CST_EXPORT_POINT_VIRGULE);
	$t->set_var("LIB_EXPORT_OTHER_VALUE", CST_EXPORT_OTHER_VALUE);
    $t->set_var("LIB_FORMAT_SORTIE", CST_STAT_ADMIN_FORMAT_SORTIE);
    
    $t->set_var("URL_GENERER_STATS_ADMIN", URL_GENERER_STATS_ADMIN);	
    $t->parse("Output", "export");  
    $t->p("Output");
}             
?>