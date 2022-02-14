<?php
/*
 *
 */
$szNomModeleHtml = substr($szInfo, 4);
$MODELE_HTML = $szNomModeleHtml; 
if($szInfo{2} == 'F' || $szInfo{2} == '1')
{
    $retour = pos_getlisteinfopage($jeton, $_REQUEST["POS_NUM_DOC"], 0, /*pref*/$tabStruListePage);
    // il y a déjà un fichier qui n'est pas de nature RWX pb
    if (count($tabStruListePage) > 0 && strcmp($tabStruListePage[0]->szNature, "RWX") != 0)
    {
        $tabInfoDebug = array();
        $tabInfoDebug[0] = "Il y a déjà un fichier en première position qui n\'est pas de nature Rédaction Web.";
        debug_code($tabInfoDebug);
        include("../consultation/consulter_index.php");
    }
    else
    {
    	$POS_NUM_PAGE = 1;
    	include("../redaction_web/afficher_edition_include.php");
    }
}
elseif($szInfo{2} == 'R' || $szInfo{2} == 'L') // creation du fichier en dernière position
{
	$retour = pos_getinfonumdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$objInfoNumDoc);
	if ($retour)
	{
		if($szInfo{2} == 'R')
			$POS_NUM_PAGE = $objInfoNumDoc->nb_pagereelle + 1;
		else
		$POS_NUM_PAGE = $objInfoNumDoc->nb_pagereelle;
	}
	else
		debug($jeton);
	include("../redaction_web/afficher_edition_include.php");
}
elseif($szInfo{2} == 'D') // pas de creation du fichier
{
	include("../redaction_web/fonction_edition.php");
	//creer le repertoire de session
	$rep_session = getRepTmpSession($PHPSESSID);
	$szFichierTexteRicheXml = $rep_session."postext.xml";
	$szModeleHtml = $MODELE_HTML.".html";
	$szFichierPdf = $rep_session."apercu.pdf";
	$szFichierIndexPosXml = "";
	
	// création d'un fichier vide
	$file_tpl = "../../../../redaction_web/xml/fichier.xml";
	$t = new Template(".");
	$t->set_file("xml", $file_tpl);
	$t->set_block("xml", "LISTE_SECTIONS", "liste_sections");
	$t->set_var("MODELE_HTML", $MODELE_HTML);
	$t->parse("Output", "xml");
	$t->write("Output", $szFichierTexteRicheXml);
	
	$retour = phpPosExportXml($jeton, $_REQUEST["POS_NUM_DOC"], $rep_session, /*pref*/$szFichierIndexPosXml);
				
	if ($retour)
	{
		// le fichier de texte riche n'est pas present mais ça ne doit pas poser problème
		$retourPdf = genererPdf($szFichierIndexPosXml, $szFichierTexteRicheXml, $szModeleHtml, $szFichierPdf);
	
		if ($retourPdf)
		{
			$bAfficheFichierCree = true;
			$bFicNoSave = true;
			$szNomFichierWord = "apercu.pdf";
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
?>
