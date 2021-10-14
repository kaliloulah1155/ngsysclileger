<?php
/******************************************************************************
* DESCRIPTION : Connexion a la base + lancement de l'application
* AUTEUR: FLEURY Sébastien
* DATE DE CREATION:
* LISTE DE FONCTIONS: aucune
*
* Donnees en entree :
* POS_UTIL : code utilisateur
* POS_APPLI : code de l'application
* POS_PASSWD : mot de passe de l'utilisateur
* POS_SERVEUR : nom de la machine serveur Poseidon
* POS_PORT : numero de port ou Poseidon est en attente
* POS_NUM_DOC <optionnel> : numero informatique du document
* MODE <optionnel> : type de consultation
* 
* Modifications :
* 15.02.2002 GG ajout de la fonction en variable de session, suppression
* variables inutiles arg_ref, szMsg1, szMsg2 
* 05.11.2002 GG changement des noms du champ du formulaire
* 19.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
* 28.07.2007 PL ajout des droits de gestion des domaines fermés
* 25.01.2008 PL ajout des droits de gestion des listes hiérarchiques
*********************************************************************************/ 
// ---------------------------------------
// enregistrement des variables de session
// ---------------------------------------

// PHPSESSID est transmise par cookie (a activer !)
// au travers de $_COOKIE ou $_REQUEST(=$_GET + $_POST + $_COOKIE)

include_once ("../include/bal.inc.php");

session_start();

// INCLUDES
require("../include/connexion.inc.php");
include("../include/debug.inc.php");
include("../include/session.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");

$_SESSION["sess_user_name"] = trim($_REQUEST['POS_UTIL']);
$_SESSION["sess_application"] = strtoupper($_REQUEST['POS_APPLI']);
$_SESSION["sess_serveur"] = strtoupper($_REQUEST['POS_SERVEUR']);
$_SESSION["sess_port"] = $_REQUEST['POS_PORT'];
// si on veut securiser le fichier de session,
// on stocke le mot de passe securise dans le fichier de session et
// on décripte à chaque nouvelle action ( = connexion)
$_SESSION["sess_session_securise"] = 1;
$_SESSION["sess_passwd"] = $_REQUEST['POS_PASSWD'];
$_SESSION["sess_langue"] = CST_LANG;
if (isset($_REQUEST['POS_CONNEXION_AUTO']) && strcmp($_REQUEST['POS_CONNEXION_AUTO'], "1") == 0)
{
    $retour = connexion($jeton);
}
else
{
    $_SESSION["sess_profil"] = trim($_REQUEST["POS_PROFIL"]);
    $retour = pos_connect_serveur(/*pref*/$jeton);
}

if ($retour)
{
    setcookie(NOM_APPLICATION."_user_name",$_SESSION["sess_user_name"],time()+3600*24*365,"/");
	$retour = pos_getinfoutil($jeton, $_SESSION["sess_user_name"], $_SESSION["sess_profil"], /*pref*/$objInfoUtil);
	if ($retour)
	{
		initSessionUtil($jeton, $objInfoUtil);
		include("../accueil/afficher_accueil.php");
	}
	else
		debug ($jeton);

    pos_disconnect($jeton);
}
else
{
    debug ($jeton);
	$ident="no";
	echo "<script>";
    echo "document.location.href='".URL_SITE."/index.php';";
    echo "</script>";
}
?>