<?php
/*
 * DESCRIPTION : Liberation d'un document pris en modification.
 * Plus fermeture de la fenetre.
 *
 * AUTEUR : Guillaume Frutoso
 * DATE de CREATION : 09/10/2001
 *
 * Donnees en entree : 
 * POS_NUM_DOC : numero informatique du document a modifier/consulter
 * MODE : mode dans lequel le document a ete ouvert CONSULTATION ou MODIFICATION
 *
 *------------------------------------------------------------------
 * Modifications :
 * 14/01/2004 GG correction pour fermeture par la croix lors de l'affichage du contenu d'un dossier
 */
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/pos_dmdmodifdoc.inc.php");
 
// traitements uniquement en  modification
if ($_REQUEST["MODE"] == "MODIFICATION")
{
	if (isset($_REQUEST["POS_NUM_DOC"]) && $_REQUEST["POS_NUM_DOC"] > 0)
	{
		$retour = connexion($jeton);
		if ($retour)
		{
			// maintenant on rends le document en modification
			$retour = libere_doc($jeton, $_REQUEST["POS_NUM_DOC"]);
			pos_disconnect($jeton);
		}
		else
		{
			debug($jeton);
			echec_connexion();
		}
	}
}

?>

<HTML>
<HEAD>
<SCRIPT language="javascript" SRC="../../../../include/script/fermeture.js"></SCRIPT>
</HEAD>
<SCRIPT language="javascript">
<?php
if ($_REQUEST["MODE"] == "MODIFICATION")
{
	// B_FORCE_CLOSE si on a cette variable on ferme directement la fiche d'index
	// sert dans le cas ou l'on à une fiche d'index ouverte et que l'on clique sur le menu,
	// dans ce cas la on ne cherche pas à réactualiser la liste de réponse, on ferme simplement
	// par un retour sur la page accueil positionnée dans la frame posdocument.
	if (isset($_REQUEST["B_FORCE_CLOSE"]))
		echo "fermeture(1, 0)";
	else
		echo "fermeture(0, 1)";
}
else
	echo "fermeture(0, 0)";
?>
</SCRIPT>
</HTML>
