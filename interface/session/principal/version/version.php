<?php
/*
 * Affiche les version de
 *	php_vulcain
 * vulcain
 * serveur
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/version.conf");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$retour = connexion($jeton);

echo "<HTML><HEAD><TITLE>".CST_LIBELLE_VERSION."</TITLE>";
echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
echo "</HEAD><BODY  topmargin=\"0\" leftmargin=\"0\">";

if ($retour)
{
    echo "<table cellspacing='5'>";
	echo "<tr height='10'><td></td><td></td></tr>";
	echo "<tr><td class='labelChamp'>".CST_LIBELLE_VERSION_APOLLON."</td><td class='labelChamp'><b>",VERSION_SERVEUR.".".VERSION_POSEIDON_PHP.".".REVISION_POSEIDON_PHP,"</b></td></tr>";
	$retour = pos_getinfoappli($jeton,/*pref*/$objInfoAppli);
    $sVersionServeur = $objInfoAppli->szVersion .((strlen($objInfoAppli->szSpecifiqueVersion) != 0) ? "-" : "").$objInfoAppli->szSpecifiqueVersion;
	echo "<tr><td></td><td></td></tr>";
	echo "<tr><td class='labelChamp'>".CST_LIBELLE_VERSION_SERVEUR."</td><td class='labelChamp'><b>",$sVersionServeur,"</b></td></tr>";
	
	$retour = pos_getversionphpvulcain(/*pref*/$version);
	
	$all_versions=explode("#",$version);
	$vulc_version="";
	$phpvulc_version="";
	for($i=0;$i<count($all_versions)-1;$i++){
		if($i==0)
			$vulc_version=$all_versions[0];
		else
			$phpvulc_version=$all_versions[1];
	}
	echo "<tr><td class='labelChamp'>".CST_LIBELLE_VERSION_PHP_VULCAIN."</td><td class='labelChamp'><b>",$all_versions[0],"</b></td></tr>";
	echo "<tr><td class='labelChamp'>".CST_LIBELLE_VERSION_VULCAIN."</td><td class='labelChamp'><b>",$all_versions[1],"</b></td></tr>";
	echo "</table>";
	pos_disconnect($jeton);
}
else 
{
		debug($jeton);
		echec_connexion();
}
echo "</BODY><HTML>";
?>