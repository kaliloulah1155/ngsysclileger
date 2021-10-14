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
*************************************************************************/ 
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
session_start();

//connexion a poseidon
$retour = connexion($jeton);
if ($retour)
{
	// on definit le template utilisé  
	$t = new template(REP_TEMPLATE_APPLICATIF."note");
	$t->set_file("listenotes", "listenotes.tpl");

	$wNumSsPage = isset($_REQUEST["POS_NUM_SSPAGE"]) ? $_REQUEST["POS_NUM_SSPAGE"] : 0;
	$retour = pos_getnoteexterne($jeton, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_PAGE"], $wNumSsPage,
			/*pref*/$tabNoteExterne);

	if ($retour)
	{
		$t->set_var("URL_SUP_NOTE", URL_SUPPRIMER_NOTE."?");
		$t->set_var("URL_AFF_AJOUT_NOTE", URL_AFFICHER_AJOUTER_NOTE);
		$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
		$t->set_var("POS_NUM_PAGE", $_REQUEST["POS_NUM_PAGE"]);
		$t->set_var("POS_NUM_SSPAGE", $wNumSsPage);

		$t->set_block("listenotes", "NOTE", "note");

		if (count($tabNoteExterne) > 0)
		{
			for($i=0;$i<count($tabNoteExterne);$i++) 
			{
				$t->set_var("POS_NOTE_NUM", $tabNoteExterne[$i]->wNumNote);
				$t->set_var("POS_NOTE_PARTAGE", $tabNoteExterne[$i]->bPartage);
				$t->set_var("POS_NOTE_DATE", $tabNoteExterne[$i]->szDate);
				$t->set_var("POS_NOTE_CREATEUR", $tabNoteExterne[$i]->szCreateur);
				$t->set_var("POS_NOTE_LIBELLE", $tabNoteExterne[$i]->szLibelle);
				$t->set_var("POS_NOTE_TEXTE", $tabNoteExterne[$i]->szTexte);
            	
				$t->parse("note", "NOTE", true);
			}
		}
		else
		{
			$t->set_var("note", "");
		}
	}
	else
		debug($jeton);
    
	// affichage du template
	$t->pparse("Output", "listenotes");

	// deconnexion
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>