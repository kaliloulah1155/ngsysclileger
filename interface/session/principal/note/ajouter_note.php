<?php
/*************************************************************************
* DESCRIPTION : liste des notes d'un fichier

* AUTEUR: Gabrielle Guy
*
* DATE DE CREATION: 03.01.2003
*
* DESCRIPTION : Affichage des notes externes d'un fichier
* 
* DONNEES EN ENTREES
* 
* POS_NUM_DOC : numero de document Poseidon
* POS_NUM_PAGE : numero de fichier
* POS_NUM_SSPAGE : numero du sous-fichier
* POS_NOTE_LIBELLE : libelle de la note
* POS_NOTE_TEXTE : texte de la note
* POS_NOTE_PARTAGE : (1/0) si la note est partage ou non
*************************************************************************/ 
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
session_start();

//connexion a poseidon
$retour = connexion($jeton);
if ($retour)
{
	$wNumSsPage = isset($_REQUEST["POS_NUM_SSPAGE"]) ? $_REQUEST["POS_NUM_SSPAGE"] : 0;
	$retour = pos_setnoteexterne($jeton, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $wNumSsPage, 
			$_REQUEST["POS_NOTE_PARTAGE"], $_REQUEST["POS_NOTE_LIBELLE"], $_REQUEST["POS_NOTE_TEXTE"]);

	if (!$retour)
		debug($jeton);

	// reaffichage des notes externes
	include("../note/afficher_notes.php");

	// deconnexion
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>