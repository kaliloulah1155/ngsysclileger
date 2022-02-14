<?php
/*-------------------------------------------------------------------
 * DESCRIPTION : Récupération des profils de l'utilisateur
 * 
 * AUTEUR: GG
 * DATE DE CREATION: 16.02.2010
 * 27.02.2013 : ajout gestion expiration du mot de passe 
 */
 
session_start();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");
//include ("../include/fonction_util.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["liste_profils"] = array();

$_SESSION["sess_user_name"] = trim($_REQUEST['POS_UTIL']);
$_SESSION["sess_application"] = strtoupper($_REQUEST['POS_APPLI']);
$_SESSION["sess_serveur"] = strtoupper($_REQUEST['POS_SERVEUR']);
$_SESSION["sess_port"] = $_REQUEST['POS_PORT'];
$_SESSION["sess_profil"] = "";


$_SESSION["sess_session_securise"] = 1;
$_SESSION["sess_passwd"] = $_REQUEST['POS_PASSWD'];
$_SESSION["sess_langue"] = CST_LANG;

if (isset($_REQUEST['POS_NVMDP']) && strlen($_REQUEST['POS_NVMDP']) != 0)
{
    $retour = pos_connect_serveur_change_pwd(/*pref*/$jeton, $_REQUEST['POS_NVMDP']);
    if ($retour == 1)
        $_SESSION["sess_passwd"] = $_REQUEST['POS_NVMDP'];
}
else
    $retour = pos_connect_serveur(/*pref*/$jeton);

if ($retour == 1)
{
    $tabAllProfilUtil = array();
    $retour = pos_getutilgetalllien($jeton, $_SESSION["sess_user_name"], /*pref*/$tabAllProfilUtil);
}
else
{
    if ($retour == 2)
    {
        pos_geterreur($jeton, /*pref*/$tabErreur);
        $objRetour["code_retour"] = 2;
    	$objRetour["msg_erreur"] = $tabErreur["msg2"];
    }
    else
    {
    	pos_geterreur($jeton, /*pref*/$tabErreur);
    	$objRetour["code_retour"] = 0;
    	$objRetour["msg_erreur"] = $tabErreur["msg2"];
    }
}

if ($retour == 1)
{
    $iNbProfils = 0;
	// Restriction du tableau des profils pour l'utilisateur sur l'application courante
	for($i=0;$i<count($tabAllProfilUtil);$i++) {
		if (strcmp(trim($tabAllProfilUtil[$i]->szApplication), $_SESSION["sess_application"]) == 0) {
			$tabAllProfilUtilAppli[] = $tabAllProfilUtil[$i];
			$objRetour["liste_profils"][$iNbProfils++] = trim($tabAllProfilUtil[$i]->szProfil);
			$_SESSION["sess_tab_profil_util_appli"][] = trim($tabAllProfilUtil[$i]->szProfil);
		}
	}
	
	// si connexion avec le profil par défaut, on recrée la liste des profils avec uniquement ce profil.
	if (defined('CST_CONNEXION_PROFIL_DEFAUT') && CST_CONNEXION_PROFIL_DEFAUT == 1)
	{
	   $iNbProfils = 1;
	   $objRetour["liste_profils"] = array();
	   for($i=0;$i<count($tabAllProfilUtil);$i++) {
    		if (strcmp(trim($tabAllProfilUtil[$i]->szApplication), $_SESSION["sess_application"]) == 0) {
    		    if ($tabAllProfilUtil[$i]->dwParDefaut == 1)
    		    {
    		      $objRetour["liste_profils"][0] = trim($tabAllProfilUtil[$i]->szProfil);
    		      break;
                }
    		}
	   }
    }
	
	if ($iNbProfils == 1)
	   pos_disconnect($jeton);
	else
	   pos_disconnect_serveur($jeton, 1);
}
else if ($retour == 2)
{
    pos_disconnect_serveur($jeton, 1);
}
else
{
	pos_geterreur($jeton, /*pref*/$tabErreur);
	$objRetour["code_retour"] = 0;
	$objRetour["msg_erreur"] = $tabErreur["msg2"];
}

$output = $json->encode($objRetour);
print($output);
?>
