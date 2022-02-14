<?php
/*
 * DESCRIPTION : Lancer la numerisation via le client windows
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 13/12/2006
 *
 * Donnees en entree : 
 * POS_NUM_DOC : numero informatique du document a modifier/consulter
 */
	
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/pos_dmdmodifdoc.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../include/posdav.inc.php");

define("SEPARATEUR", "###");	
define("SEPARATEUR_KH", "-");
define("FORMAT_KH", 0);
if (!isset($_REQUEST["POS_NUM_DOC"]) || $_REQUEST["POS_NUM_DOC"] <= 0)
	afficheMsg(CST_LIBELLE_CONSULTER_NUM_INIT); 
else
{
	// ------------------
	// Actions vulcain
	// ------------------
	$retour = connexion($jeton);
	$retour = libere_doc($jeton, $_REQUEST["POS_NUM_DOC"]);

	$fileNamePos = "POS_".$_REQUEST["POS_NUM_DOC"].".pos";
	$fileNamePosAbs = getRepDav().$fileNamePos; 
	$handle = fopen($fileNamePosAbs, "w");
	if ($handle)
	{
		fwrite($handle, "[CONNEXION]\n");
		fwrite($handle, "Appli=".$_SESSION["sess_application"]."\n");
		fwrite($handle, "Utilisateur=".$_SESSION["sess_user_name"]."\n");
		fwrite($handle, "\n");
		fwrite($handle, "[RECHERCHE]\n");
		fwrite($handle, "Numero=".$_REQUEST["POS_NUM_DOC"]."\n");
		fwrite($handle, "OUVRE_GESTION_DES_FICHIERS=OUI\n");
		fclose($handle);
	
		$urlDav = getUrlDav();
		echo "<HTML>";
		echo "<HEAD>";
		echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
		echo "<TITLE>Numérisation en cours</TITLE>";
		echo "<SCRIPT language=\"javascript\">";
   	 	echo "function ouvrirFichier() \n{ \n\twindow.location.href='$urlDav$fileNamePos';\n}\n";
		echo "</SCRIPT>";
		echo "</HEAD><BODY onLoad='ouvrirFichier()'>";
		//echo "</HEAD><BODY>";
		echo "<A href='".URL_CONSULTER_INDEX."?POS_NUM_DOC=".$_REQUEST["POS_NUM_DOC"]."&MODE=MODIFICATION'><span class=titreAccueil align=center>*** Cliquer ici pour réafficher le document *** </span></A>";
		echo "</BODY></HTML>";
	}
	else
	{
		afficheMsg("Echec de l\'ouverture du fichier $fileNamePosAbs");
	}
	pos_disconnect($jeton);
}
	
?>
