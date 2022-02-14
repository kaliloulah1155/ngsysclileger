<?php
/*
 * DESCRIPTION : Affichage d'une liste de resultats à partir
 * 
 * AUTEUR : Sébastien COSTANZO
 * DATE de CREATION : 04/08/2003
 *
 * Donnees en entree : 
 * POS_NUMDOS : numéro du dossier
 * POS_NUM_DOC : numéro de doc principal
 * 
 */

session_start();

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

$retour = connexion($jeton);

if($retour)
{
    if (isset($_REQUEST["NUMDOC_ATT"]) && isset($_REQUEST["DROIT_ATT"]) )
    {
        $dwNumDocAtt = $_REQUEST["NUMDOC_ATT"];
        $dwDroitModif = $_REQUEST["DROIT_ATT"];
    }
    else {
		// On recherche le numéro de doc et le droit de modif de l'utilisateur.
		$retour = pos_gestattribut($jeton, $_REQUEST["POS_NUMDOS"], $_REQUEST["POS_NUM_DOC"], /*pref*/$dwNumDocAtt, /*pref*/$dwDroitModif);
    }
	if($retour)
	{
		// On change le POS_NUM_DOC pour visualiser le document attribut
		$_REQUEST["POS_TYPEDOC"] = "A00";
		$_REQUEST["POS_NUM_DOC"] = $dwNumDocAtt;
		
		// Droit de modif de l'utilisateur
		if($dwDroitModif != 1)
			$bVisuParLien = 1;
	
		include("consulter_index.php");	
	}
	else
		debug($jeton);

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>