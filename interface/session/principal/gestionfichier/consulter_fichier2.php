<?php
/*
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../include/fonction_util.inc.php");

$file = getRepTmpSession(session_id()).$_REQUEST["POS_FILE"];
         
//vérification de l'existence du fichier
if (file_exists($file))
{
	// on l'ouvre en lecture
	$fp= fopen($file,"rb");
	//définition du type MIME du fichier
	header("Cache-Control: ");// leave blank to avoid IE errors
	header("Pragma: ");// leave blank to avoid IE errors
	header("Content-type: ".$_REQUEST["POS_MIME"]."");
	$fileName = "download.".$_REQUEST["POS_EXT"];
		header("Content-Disposition: attachment; filename=\"".$fileName."\"");
	header("Content-Length:".(string)(filesize($file)));

	sleep(1);
	fpassthru($fp);
	flush();
	// fermeture du fichier
	fclose($fp);
	//suppression du fichier
	unlink($file);
}
?>
