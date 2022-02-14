<?php
/*
 * Conversion en PDF d'un modèle HTML
 * Date : 09/03/2007
 * Auteur : GG
 * 
 * Données en entrée
 * POS_NUM_DOC : numéro de document
 * MODELE_HTML : nom du modele html
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("fonction_edition.php");

$retour = connexion($jeton);

if ($retour)
{
	//creer le repertoire de session
	$rep_session = getRepTmpSession(session_id());
	$szFichierTexteRicheXml = $rep_session."postext.xml";
	$iNumDoc = $_REQUEST["POS_NUM_DOC"];
	$iNumPage = $_REQUEST["POS_NUM_PAGE"];
	$szModeleHtml = $_REQUEST["MODELE_HTML"].".html";
	$szFichierPdf = $rep_session."apercu.pdf";
	$szFichierIndexPosXml = "";
	
	$retour = phpPosExtraitFichier($jeton, $iNumDoc, $iNumPage, "", $szFichierTexteRicheXml);
	if ($retour)
	{
		$retour = phpPosExportXml($jeton, $iNumDoc, $rep_session, /*pref*/$szFichierIndexPosXml);
	}
	pos_disconnect($jeton);
			
	if ($retour)
	{
		$retourPdf = genererPdf($szFichierIndexPosXml, $szFichierTexteRicheXml, $szModeleHtml, $szFichierPdf);
		if ($retourPdf)
		{
            header("Cache-Control: ");// leave blank to avoid IE errors
			header("Pragma: ");// leave blank to avoid IE errors
			header("Content-type: application/pdf");
		    header("Content-Length: " . filesize($szFichierPdf));
		    header("Content-Disposition: attachment; filename=file.pdf");
			//$dompdf->stream($dompdf->output());
			//$dompdf->output();
			readfile($szFichierPdf);
		}
		else
		{
			$tabInfoDebug = array();
			$tabInfoDebug[0] = "Le fichier PDF n\'a pas pu être généré.";
			debug_code($tabInfoDebug);
			//include("afficher_edition_action.php");
		}
	}	
}
else
{
	debug($jeton);
	echec_connexion();
}
?>