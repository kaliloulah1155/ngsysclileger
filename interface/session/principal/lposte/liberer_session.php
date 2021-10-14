<?php
/*
 * DESCRIPTION : Suppression d'une connexion
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 04/04/2006
 *
 * Donnees en entree : Numéro de la session à supprimer
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$retour = connexion($jeton);
if ($retour)
{
	if (isset($_REQUEST["POS_NUMSESSION"]) && strcmp($_REQUEST["POS_NUMSESSION"], $_SESSION["sess_id_connexion"]) ==  0)
	{
		$tabInfoDebug[0] = CST_MESSAGE_NON_SUPPRESSION_SESSION_COURANTE;
		debug_code($tabInfoDebug);	
	}
	elseif (isset($_REQUEST["POS_NUMSESSION"]) && strlen($_REQUEST["POS_NUMSESSION"]) > 0)
	{
		$retour = pos_killlposteconnexion($jeton, $_REQUEST["POS_NUMSESSION"]);
		if (!$retour)
			debug($jeton);
	}
	else
	{
		$tabInfoDebug[0] = CST_MESSAGE_SESSION_INACCESSIBLE;
		debug_code($tabInfoDebug);
	}
	include("../lposte/lposte.php");
	pos_disconnect($jeton);	
}
else
{
	debug($jeton);
	echec_connexion();
}

?>