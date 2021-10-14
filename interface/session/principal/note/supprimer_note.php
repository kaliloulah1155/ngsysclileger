<?php
/*************************************************************************
* DESCRIPTION : suppression d'une note externe note

* AUTEUR: Gabrielle Guy
*
* DATE DE CREATION: 07.01.2003
*
* DONNEES EN ENTREES
* 
* POS_NUM_DOC : numero de document Poseidon
* POS_NUM_PAGE : numero de fichier
* POS_NUM_SSPAGE : numero du sous-fichier
* POS_NOTE_NUM : numero de la note
*************************************************************************/ 
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
session_start();
$retour = connexion($jeton);
if ($retour)
{
	$wNumSsPage = isset($_REQUEST["POS_NUM_SSPAGE"]) ? $_REQUEST["POS_NUM_SSPAGE"] : 0;
	$retour = pos_delnoteexterne($jeton, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $wNumSsPage, 
			$_REQUEST["POS_NOTE_NUM"]);

	if (!$retour)
		debug($jeton);

	// reaffichage des notes externes
	include("../note/afficher_notes.php");
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
