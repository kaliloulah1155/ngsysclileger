<?php
/*
 * DESCRIPTION : Module d'affichage du choix du niveau et de l'indice de confidentialité
 * et du cloisonnement
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 18/10/2006
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document  (pour determiner le template)
 * ------------------------------------------------------------
 * Modifications
 */
if (!isset($_SESSION))
session_start();
include ("../include/debug.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/get_template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if ($retour)
{
	// remplacement dans le template
	$t = new template(REP_TEMPLATE_APPLICATIF."creation");
	$t->set_File("confidentialite", "choix_confidentialite.tpl");
	$t->set_block("confidentialite", "LISTE_NIV_CONF", "liste_niv_conf");
	    	
	$t->set_var("URL_ATTENTE", URL_ATTENTE);
	$t->set_var("POS_TYPEDOC", $_REQUEST["POS_TYPEDOC"]);
	    
	$t->set_var("LIBELLE_ACTION", CST_LIBELLE_VALIDER);
	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
	$t->set_var("TITRE_PAGE", CST_TITRE_CONFIDENTIALITE);
	$t->set_var("LIBELLE_INDICE_HABITATION", CST_LIBELLE_INDICE_HABITATION);
	$t->set_var("LIBELLE_NIVEAU_HABITATION", CST_LIBELLE_NIVEAU_HABITATION);
	$t->set_var("LIBELLE_CLOISONNEMENT", CST_LIBELLE_CLOISONNEMENT);
	$t->set_var("CODE_ACTION", URL_CREATION);
	$iPosNumFiche = (isset($_REQUEST["POS_NUM_FICHE"])) ? $_REQUEST["POS_NUM_FICHE"] : "0";
	$t->set_var("POS_NUM_FICHE", $iPosNumFiche);

	$tabLstNivConf = array();
	$retour = pos_getlistnivconf($jeton, /*pref*/$tabLstNivConf);
	if ($retour)
	{
		$keys = array_keys($tabLstNivConf);
		for ($i=0; $i<count ($tabLstNivConf); $i++)
		{
			$t->set_var("POS_CODE_CONF_HAB", $i);
			$t->set_var("POS_LIBELLE_CONF_HAB", $tabLstNivConf[$keys[$i]]);
			$t->parse("liste_niv_conf", "LISTE_NIV_CONF", true);
		}
	}
	else
		debug ($jeton);
	    
	// fin du traitement des lignes du tableau
	$t->pparse("MyOutput", "confidentialite");
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>