<?php
/*
 * Suppression d'un fichier du répertoire WebDav
 * POS_NUM_DOC : numero de document Poseidon
 * POS_NUM_PAGE : numero de fichier
 * POS_NUM_SSPAGE : numero du sous-fichier
 * 
 * Modifications
 * 19.12.2003 GG récupération de la racine du répertoire http
 * 			(au lieu de passer en dur l'url)
 * 13.12.2004 GG : passage v 10.0.03.001.001
 * 
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../gestionfichier/upload_handler.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");

$retour = connexion($jeton);

if ($retour)
{
	$iNumDoc = $_REQUEST["POS_NUM_DOC"];
    $repTmpSession = getRepTmpSession(session_id());
    $uploadHandler = new UploadHandler($jeton, $repTmpSession);
    //$uploadHandler->getFiles();

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>