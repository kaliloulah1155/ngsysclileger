<?php
/*
 * DESCRIPTION : Affichage écran de passage des rubrique à une action Hermès
 */
session_start();

include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/xml_action_hermes.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$t=new template(REP_TEMPLATE_APPLICATIF."hermes");
$t->set_file("form_hermes", "form_rubriques.tpl");

$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
$t->set_var("LIBELLE_BOUTON_FERMER", CST_LIBELLE_FERMER);
$t->set_var("LIBELLE_LANCEMENT_ACTION_HERMES", CST_LIBELLE_LANCEMENT_ACTION_HERMES);
$t->set_var("TITRE_RESOLUTION", CST_LIBELLE_TITRE_RESOLUTION_VAR);
$t->set_var("POS_HERM_LIBACT", $_REQUEST["POS_HERM_LIBACT"]);
$t->set_var("POS_SZ_NUMDOC", $_REQUEST["POS_SZ_NUMDOC"]);
$t->set_var("URL_ACTION", URL_LANCER_NACTIONS_HERMES);
$t->set_var("URL_ATTENTE", URL_ATTENTE);


$ficHermes = "../../../../configuration/action_".$_SESSION["sess_application"].".xml";
$tabRubriques = getListeRubriquesActionHermes($ficHermes, $_REQUEST["POS_HERM_LIBACT"]);
$szCodeTypeDoc = getTypeDocActionHermes($ficHermes, $_REQUEST["POS_HERM_LIBACT"]);

$t->set_block("form_hermes", "LISTE_RUBRIQUES", "liste_rubriques");
$t->set_var("POS_TYPEDOC", $szCodeTypeDoc);
// on boucle sur toutes les variables de la questions...
for($i=0;$i<count($tabRubriques);$i++) 
{
	$t->set_var("POS_LIBELLE_RUB", $tabRubriques[$i]['libelle']);
	$t->set_var("CODE_RUBRIQUE", $tabRubriques[$i]['code']);
	if (isset($tabRubriques[$i]['vocabdate']) && strcmp($tabRubriques[$i]['vocabdate'], '1') == 0)
	   $t->set_var("DISPLAY_CALENDRIER", "");
    else
        $t->set_var("DISPLAY_CALENDRIER", "none");
    $t->parse("liste_rubriques", "LISTE_RUBRIQUES", true);
}

$t->parse("Output", "form_hermes");
$t->p("Output");
?>
