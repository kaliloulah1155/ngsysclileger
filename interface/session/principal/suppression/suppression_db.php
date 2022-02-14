<?php
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration_w/constantesPHP.conf.php");

$retour = connexion($jeton);

if ($retour)
{
	$retour = pos_deldoc($jeton, $_REQUEST['POS_NUM_DOC']);
	if (!$retour)
	{
		debug($jeton);
	}
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

// --------------------------
// Affichage
// --------------------------
echo "<HTML>\n";
echo "<HEAD>\n";
echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
echo "<SCRIPT language=\"javascript\" SRC=\"".URL_SITE."/include/script/fermeture.js\">\n";
echo "</SCRIPT>\n";
echo "</HEAD>\n";
echo "<BODY>\n";
echo "<SCRIPT>\n";
echo "opener.parent.updateMenuRemoveFils('".$_REQUEST['POS_NUM_DOC']."', 0);";
echo "opener.actualiser();";
echo "window.close();";
echo "</SCRIPT>\n";
echo "</BODY>\n";
echo "</HTML>\n";

?>
