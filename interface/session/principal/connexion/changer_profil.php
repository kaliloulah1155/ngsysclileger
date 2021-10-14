<?php

include("../include/bal.inc.php");
session_start();
require("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../dossier/arborescence_dossier.php");
include("../include/debug.inc.php");
include("../include/session.inc.php");
include ("../include/get_menu.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$szOldProfil = $_SESSION["sess_profil"];

// connexion pour deconnexion totale
$retour = connexion($jeton);
if ($retour)
	pos_disconnect_serveur($jeton, 1);

$_SESSION["sess_profil"] = trim($_REQUEST["POS_PROFIL"]);
// reconnexion avec le nouveau profil
if ($retour)
	$retour = pos_connect_serveur(/*pref*/$jeton2);

//Mise à jour session
if ($retour)
{
	$retour = pos_getinfoutil($jeton2, $_SESSION["sess_user_name"], trim($_REQUEST["POS_PROFIL"]), /*pref*/$objInfoUtil);
	
	if ($retour)
	{
		initSessionUtil($jeton2, $objInfoUtil);
	}
	else
		debug($jeton2);
	
    $t = new template(REP_TEMPLATE_APPLICATIF."arborescence");
	$t->set_file("arborescence", "arborescence_dossier.tpl");
    writeTemplateArborescence($t);
    $arborescence = $t->parse("Output", "arborescence");
    
	//fermeture de la connexion a poseidon
	pos_disconnect($jeton2);
	echo "<script>";
	echo "parent.bFirstLoad=true;";
	//echo "parent.initialise_menu();";
    echo "parent.childrenInitTree=".$arborescence."\n";
    echo "parent.treeReInit();";	
    $szNewMenu = get_nom_menu($_SESSION["sess_application"], $_SESSION["sess_user_name"],  $_SESSION["sess_service"], $_SESSION["sess_fonction"], $_SESSION["sess_profil"]);
    $szUrlMenu = URL_SITE."/interface/tpl/".$_SESSION["sess_application"]."/menu/$szNewMenu";
    echo "parent.szMenuLocation='".$szUrlMenu."';";
    echo "parent.afficherMenu('accueil');";
    echo "parent.setWindowTitle('".$_SESSION["sess_user_name"]."', '".$_REQUEST["POS_PROFIL"]."');";
    echo "parent.changementProfil('".$_REQUEST["POS_PROFIL"]."');";
    $sUrlQuestion = URL_SITE."/interface/session/principal/question/afficher_question.php";
    echo "document.location.href='".$sUrlQuestion."';";
    echo "</script>";
}

if (!$retour)
	$_SESSION["sess_profil"] = $szOldProfil;
?>