<?php
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration/url.conf.php");
include ("../tableau/fonction_tableau.php");

$retour = connexion($jeton);
if ($retour)
{
	$retour = pos_deldoc($jeton, $_REQUEST["POS_NUM_DOC"]);
	
	if (!$retour)
		debug($jeton);
	scriptListeTableauCodeHtml($_REQUEST["POS_TYPEDOC_PERE"], $_REQUEST["POS_VALEUR_TAB_RUB"], "MODIFICATION", 
                                $_REQUEST["POS_CODE_RUB"], "1", true);
	
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
