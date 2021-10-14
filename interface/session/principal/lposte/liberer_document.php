<?php
/*
 * DESCRIPTION : Liberation d'un document pris en modification
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 04/04/2006
 *
 * Donnees en entree : Numéro du document à liberer
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

//define("LPOSTEDOC_LISTE", 0);
define("LPOSTEDOC_EFFACE", 1);
//define("LPOSTEDOC_PURGE", 2);

$retour = connexion($jeton);
if ($retour)
{
	$tabLigneConnexion = array();
	if (isset($_REQUEST["POS_NUMDOC"]) && strlen($_REQUEST["POS_NUMDOC"]) > 0)
	{
		$retour = pos_gestlpostedocument($jeton, LPOSTEDOC_EFFACE, 
							$_REQUEST["POS_NUMDOC"], /*pref*/$tabLigneConnexion);
		if (!$retour)
			debug($jeton);
	}
	else
	{
		$tabInfoDebug[0] = CST_MESSAGE_DOCUMENT_NON_ACCESSIBLE;
		debug_code($tabInfoDebug);
	}
	include("../lposte/lposte_document.php");
	pos_disconnect($jeton);	
}
else
{
	debug($jeton);
	echec_connexion();
}

?>