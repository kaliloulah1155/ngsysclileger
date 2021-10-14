<?php

session_start();
include ("../../../../configuration/constantesPHP.conf.default");
$tabCstUser = get_defined_constants(true);
include ("../include/template.inc.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_fr.conf");

//print_r($tabCstUser['user']);
$t = new template(REP_TEMPLATE_APPLICATIF."application");
$t->set_file("question", "cst_application.tpl");
$t->set_block("question", "CONSTANTE", "constante");
$t->set_var("LIB_CREATION_SITE", "Initialisation du site");
$t->set_var("LIBELLE_PARAM_SITE", "Paramètres du site");

$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);

$currentDir = getCwd();
chdir($currentDir."../../../../..");
$applDir = basename(getCwd());
chdir($currentDir);

$t->set_var("CST_TITRE", "Nom du serveur");
$t->set_var("CST_NAME", "POS_SERVEUR");
$t->set_var("CST_VALUE", "localhost");
$t->parse("constante", "CONSTANTE", true);

$t->set_var("CST_TITRE", "Numéro du port");
$t->set_var("CST_NAME", "POS_PORT");
$t->set_var("CST_VALUE", "8800");
$t->parse("constante", "CONSTANTE", true);

$t->set_var("CST_TITRE", "Nom de l'application poseidon");
$t->set_var("CST_NAME", "POS_APPLICATION");
$t->set_var("CST_VALUE", "");
$t->parse("constante", "CONSTANTE", true);

$t->set_var("CST_TITRE", "Nom de l'application web (chemin)");
$t->set_var("CST_NAME", "NOM_APPLICATION");
$t->set_var("CST_VALUE", $applDir);
$t->parse("constante", "CONSTANTE", true);


//foreach ($tabCstUser['user'] as $key => $value)
//{
//    $t->set_var("CST_TITRE", $key);
//    $t->set_var("CST_NAME", $key);
//    $t->set_var("CST_VALUE", $value);
//    $t->parse("constante", "CONSTANTE", true);
//}

// affichage du template
$t->pparse("Output", "question");
?>
