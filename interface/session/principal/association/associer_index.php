<?php
/*
 * DESCRIPTION : Module de gestion des associations 
 * Après selection du document choisi pour l'association,
 * permet de retourner les paires codes/valeurs 
 *
 * AUTEUR : Gabrielle Guy, Sébastien Fleury
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document 
 * POS_CODRUB : code de la rubrique associee 
 * POS_NUMDOC : numero du document cible
 *
 * MODIFICATION:
 * 21/08/2001 - Fermeture de la fenêtre après association des valeurs
 * 03/10/2001 - Gestion des caractère spéciaux dans les associations
 */
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

$retour = connexion($jeton);

if ($retour)
{
	// recuperation des associations
	$retour = pos_getassociationspardoc($jeton, $_REQUEST["POS_TYPEDOC"], $_REQUEST["POS_CODERUB"], $_REQUEST["POS_NUM_DOC"], /*pref*/$tabCodeValeurAssociee); 

	// valeurs à remplacer
	$trans = array("\n" => "\\n", "\r\n" => "\\r\\n", "\"" => "\\\"");

	if ($retour)
	{
		echo "<HTML>\n";
		echo "<HEAD>\n";
		echo "<SCRIPT language=\"javascript\">\n";
		echo "function affecte_valeurs()\n";
		echo "{\n";
		while (list($key, $val) = each($tabCodeValeurAssociee))
		{
			$tag="POS_VAL_RUB_".$key;
			$valmod=strtr("$val", $trans);
			echo "	if (parent.document.principal.".$tag.")";
			echo "	{\n";
			echo "	if (parent.document.principal.".$tag.".type == 'textarea' && parent.document.principal.".$tag.".value.length != 0)\n";
			echo "	parent.document.principal.".$tag.".value += '\\n' + \"".$valmod."\";\n";
			echo "  else\n";
			echo "	parent.document.principal.".$tag.".value=\"".$valmod."\";\n";
			echo "	}\n";
		}
		echo "}\n";
		echo "</SCRIPT>\n";
		echo "</HEAD>\n";
        // le parent.close permet de fermer la fenêtre d'association après association des valeurs
		echo "<BODY onLoad=\"affecte_valeurs();if (parent.onValiderAssociation) parent.onValiderAssociation('".trim($_REQUEST["POS_TYPEDOC"])."', '".trim($_REQUEST["POS_CODERUB"])."' );parent.closeAssocModif();\">\n";
		// echo "<BODY onLoad=affecte_valeurs();>\n";
		echo "</BODY>\n";
		echo "</HTML>\n";
	}
	else
	{
		echo "<br><br><br><br><h1 align=center>Association impossible</h1>";
		debug($jeton);
	}

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>
 
