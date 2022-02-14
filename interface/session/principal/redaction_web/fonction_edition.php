<?php
if (!defined("FONCTION_EDITION_XML_INC"))
{
	define("FONCTION_EDITION_XML_INC", 1);
	define("NATURE_POSEIDON_REDACTION_WEB", "RWX");
	define("NATURE_POSEIDON_PDF", "PDF");
	
include ("../include/locution.inc.php");
include ("../include/template.inc.php");

function phpPosExportXml($jeton, $iNumDoc, $repXml, &$fileXmlPos)
{	
	//l'export XML se fait via une recherche
	//poser la question correspondant au numero info
	$tabLoc[0] = new Locution(1, "000", "N D", "=", $iNumDoc);
	$retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);

	//exportation XML
	if ($retour)
	{
		$szStyle = "";
		$bLier = 1;
		//$wOption = 0x0010;
		$wOption = 0; 
		$retour = pos_exportxml($jeton, $iAdrPremiereReponse,
					$iNbReponses, $szStyle, $bLier, $wOption, $repXml);
		
		if ($retour)			
			$fileXmlPos = $repXml."export.xml";
        else
            debug($jeton);
	}
	else
		debug($jeton);
	
	return $retour;
}

function genererTransformationXsltFromSource($xmlSource, $xsltFile, $tabParam)
{	
	if (!class_exists("XSLTProcessor"))
	{
		dl('php_xsl.dll');
	}
		
	$xslt = new XSLTProcessor();
	// Chargement du fichier XML
	$xml = new domDocument();
	$xml->loadXML($xmlSource);
	// Chargement du fichier XSL
	$xsl = new domDocument();
	$xsl->load($xsltFile);

	// Import de la feuille XSL
	$xslt->importStylesheet($xsl);
	foreach($tabParam as $code => $valeur)
	{
		$xslt->setParameter(null, $code, $valeur);    
	}
	$szServeurEtPort = (strcmp($_SERVER["SERVER_PORT"], "80") == 0) ?  $_SERVER["SERVER_NAME"] : $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"];
	$xslt->setParameter(null, "server-name", $szServeurEtPort);
	
	// Transformation et affichage du résultat
	return $xslt -> transformToXml($xml);
}

function genererTransformationXslt($xmlFile, $xsltFile, $tabParam)
{	
	if (!class_exists("XSLTProcessor"))
	{
		dl('php_xsl.dll');
	}
		
	$xslt = new XSLTProcessor();
	// Chargement du fichier XML
	$xml = new domDocument();
	$xml->load($xmlFile);
	// Chargement du fichier XSL
	$xsl = new domDocument();
	$xsl->load($xsltFile);

	// Import de la feuille XSL
	$xslt->importStylesheet($xsl);
	while (list($code, $valeur) = each($tabParam))
	{
		$xslt->setParameter(null, $code, $valeur);
	}
	$szServeurEtPort = (strcmp($_SERVER["SERVER_PORT"], "80") == 0) ?  $_SERVER["SERVER_NAME"] : $_SERVER["SERVER_NAME"].":".$_SERVER["SERVER_PORT"];
	$xslt->setParameter(null, "server-name", $szServeurEtPort);
	
	// Transformation et affichage du résultat
	return $xslt -> transformToXml($xml);
}

function phpPosAjouteOuRemplacePage($jeton, $iNumDoc, $iNumPage, $iNumSsPage, $szNature, $nomFichier, $nomCompletFichier)
{	
	// recuperation des informations sur les fichiers associés
	$iNumPageInfo = ($iNumSsPage == 0) ? 0 : $iNumPage;
	$retour = pos_getlisteinfopage($jeton, $iNumDoc, $iNumPageInfo, /*pref*/$tabStruListePage); 
	// Ajout ou remplacement de la première page
	if ($retour)
	{
		if (count($tabStruListePage) > 0)
		{
			$retour = pos_remplacepagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, 0, 0, "", $szNature, "", 
												$nomFichier, $nomCompletFichier);
		}
		else
		{
			$retour = pos_ajoutepagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, 0, 0, "", $szNature, "", 
												$nomFichier, $nomCompletFichier);
		}
	}
		
	return $retour;
}

function genererPdf($szFichierIndexPosXml, $szFichierTexteRicheXml, $szModeleHtml, $szFichierPdf)
{	
	$bRetour = true;
	$tabParam = array('fichier_fiche_index' => $szFichierIndexPosXml, 
                'fichier_texte_riche' => $szFichierTexteRicheXml, 'mode_edition' => 'no');
	$sContent = genererTransformationXslt('../../../../redaction_web/modele/'.$szModeleHtml, '../../../../redaction_web/xsl/poseidon.apercu.xsl', $tabParam);
    preg_match('/<page.*>/', $sContent, $matches, PREG_OFFSET_CAPTURE);
    if (isset($matches[0][1])) {
        $sContent = substr ($sContent, $matches[0][1]);
        
    }
    $idx = strpos($sContent, "</page>");
    $sContent = substr($sContent, 0, $idx + strlen("</page>"));
    //error_log($sContent);
    
    // convert in PDF
    require_once(dirname(__FILE__).'/../include/html2pdf/html2pdf.class.php');
    try {
        $html2pdf = new HTML2PDF('P', 'A4', 'fr', false, "ISO-8859-1");
        //      $html2pdf->setModeDebug();
        $html2pdf->setDefaultFont('Arial');
        $content = str_replace("</br>", "", $sContent);
        $content = str_replace("</img>", "", $content);
        $html2pdf->writeHTML($content, isset($_GET['vuehtml']));
        $html2pdf->Output($szFichierPdf, 'F');
    }
    catch(HTML2PDF_exception $e) {
        error_log($e->getMessage());
        $bRetour = false;
    }
	return $bRetour;
}

function phpPosExtraitFichier($jeton, $iNumDoc, $iNumPage, $szNomModele, $nomCompletFichier)
{	
	// recuperation des informations sur les fichiers associés
	$retour = pos_getlisteinfopage($jeton, $iNumDoc, 0, /*pref*/$tabStruListePage);
	if ($retour)
	{
		if (count($tabStruListePage) > ($iNumPage-1))
		{
			$retour = pos_dmdpagenumdoc($jeton, $iNumDoc, $iNumPage, 0, $nomCompletFichier, /*pref*/$objInfoPage);
			
			if ($retour)
			{
                $szChaineContenu = file_get_contents($nomCompletFichier);
                // force l'interpreteur a accepter les entites &nbsp;
                $szChaineContenu = str_replace("<document>", 
                        "<!DOCTYPE stylesheet [<!ENTITY nbsp  \"&#160;\" >]>\n<document>", $szChaineContenu);
                $h1 = fopen($nomCompletFichier, "w");
                fwrite($h1, $szChaineContenu);
                fclose($h1);
            }
            else
                debug($jeton);
		}
		else
		{
			//$h1 = fopen($nomCompletFichier, "w");
			//fclose($h1);
			
			// au besoin création d'un fichier vide
			$file_tpl = "../../../../redaction_web/xml/fichier.xml";
			$t = new Template(".");
			$t->set_file("xml", $file_tpl);
			$t->set_block("xml", "LISTE_SECTIONS", "liste_sections");
			$t->set_var("MODELE_HTML", $_REQUEST["MODELE_HTML"]);
			$t->parse("Output", "xml");
			$t->write("Output", $nomCompletFichier);
			
			// enregistrement de ce fichier dans Poseidon car l'action Hermès n'est plus disponible
			if (strlen($szNomModele) != 0)
				$szNomFichier = $szNomModele;
			else 
				$szNomFichier = "fichier".$iNumPage.".0";
				
			$retour = pos_ajoutepagenumdoc($jeton, $iNumDoc, $iNumPage, 0, 0, 0, "", 
							NATURE_POSEIDON_REDACTION_WEB, "", $szNomFichier, $nomCompletFichier);
		}
	}
	else
		debug ($jeton);
	
	return $retour;
}
}
?>