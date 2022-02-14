<?php
/*
 * AUTEUR : Seb le 24/03/2005
 * Affichage de la page des parametres de combiner question
 * pour le choix du lien entre les questions et du titre de la question
 */

session_start();

include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$t = new template(".");
$szTplName = REP_TEMPLATE_APPLICATIF."question/param_comb_quest.tpl";
$t->set_file("param_combine", $szTplName);
			
$t->set_var("POS_ENTETE_OPERATEUR", CST_LIBELLE_ENTETE_COL_OPERATEUR);
$t->set_var("POS_ENTETE_TITRE", CST_LIBELLE_TITRE_QUEST);

$t->set_var("TITRE_PAGE", CST_LIBELLE_COMBINER_QUESTION);
$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
$t->set_var("LIEN_OU", CST_LIBELLE_LIEN_OU);
$t->set_var("LIEN_ET", CST_LIBELLE_LIEN_ET);
$t->set_var("LIBELLE_NO_NOM_QUEST_BIB", CST_LIBELLE_NO_NOM_QUEST_BIB);


// affichage du template
$t->parse("Output", "param_combine");  
$t->p("Output");

?>

