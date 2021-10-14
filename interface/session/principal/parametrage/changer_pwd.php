<?php
/*
 * DESCRIPTION : Changement du mot de passe de l'utilisateur connecte
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 05/03/2002
 *
 * Donnees en entree : 
 * POS_ANC_PWD : ancien mot de passe
 * POS_NV_PWD : nouveau mot de passe
 * POS_COPIE_NV_PWD : copie nouveau mot de passe
 *------------------------------------------------------------------
 * Modifications :
 * 19.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include("../include/md5.inc.php");
include("../include/fonction_cryptage.php");
include ("../../../../configuration_w/constantesPHP.conf.php");


$szAncPwd = decrypt_text($_REQUEST['POS_ANC_PWD'], $_SESSION["sess_crypt_key"]);
$szNvPwd = decrypt_text($_REQUEST['POS_NV_PWD'], $_SESSION["sess_crypt_key"]);
$szCopieNvPwd = decrypt_text($_REQUEST['POS_COPIE_NV_PWD'], $_SESSION["sess_crypt_key"]);

if (strcmp($szNvPwd, $szCopieNvPwd) == 0)
{
	$retour = connexion($jeton);
	if ($retour)
	{
		$retour = pos_changepwd($jeton, $_SESSION["sess_user_name"], $szAncPwd, $szNvPwd);
		
		// modification de la variable de session pour la
		// prochaine connexion
		if ($retour)
			$_SESSION["sess_passwd"] = $_REQUEST['POS_NV_PWD'];
		else
			debug($jeton);
		
		pos_disconnect($jeton);
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}
	
}
else
{
	$tabInfoDebug[0] = "Vous n\'avez pas saisi deux fois le même mot de passe";
	debug_code($tabInfoDebug);
	$retour = 0;
}

if($retour)
{
    echo "<head><SCRIPT LANGUAGE='JavaScript' SRC='".URL_SITE."/include/script/fermeture.js'></SCRIPT></head>";
    echo "<script>";
    echo "fermeture();";
    echo "</script>";
}
else
	include ("afficher_changer_pwd.php");

?>
