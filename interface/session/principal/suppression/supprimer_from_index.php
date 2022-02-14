<?php
/*
 * DESCRIPTION : Suppression d'un document à partir de la fiche d'index.
 *
 * AUTEUR : GG
 * DATE de CREATION : 09/10/2001
 *
 * Donnees en entree : 
 * POS_NUM_DOC : numero informatique du document a modifier/consulter
 *------------------------------------------------------------------
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
 
// traitements uniquement en  modification
if (isset($_REQUEST["POS_NUM_DOC"]) && $_REQUEST["POS_NUM_DOC"] > 0)
{
	$retour = connexion($jeton);
	if ($retour)
	{
		// maintenant on rends le document en modification
		$retour = pos_deldoc($jeton, $_REQUEST['POS_NUM_DOC']);
		pos_disconnect($jeton);
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}
}
?>

<HTML>
<HEAD>
<SCRIPT language="javascript" SRC="../../../../include/script/fermeture.js"></SCRIPT>
</HEAD>
<SCRIPT language="javascript">
fermeture(0, 1);
</SCRIPT>
</HTML>
