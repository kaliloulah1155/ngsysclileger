<?php
/* Création de fichier OpenDocument
 * 30.06.2010
 * Creation des fichiers resultant d'une macro Hermes
 * pour que celà fonctionne :
 */
define("CST_NATURE_FICHIER_ODT", "ODT");
define("EXTENSION_ODT", ".odt");
if (!function_exists('remplaceValeurRubriqueDansDocOO')) {
	function remplaceValeurRubriqueDansDocOO($szCheminFichierOOSource, $szCheminFichierXmlPos, $szCheminFichierOOGenere, &$msgErreur) 
	{
	    $retour = true;
	    $ficInfo = (isset($_SERVER["PATH_TRANSLATED"])) ? $_SERVER["PATH_TRANSLATED"] : $_SERVER["SCRIPT_FILENAME"];
	    $ficCode = preg_split("/".NOM_APPLICATION."/i", $ficInfo);
	    $szNomFichierXsl = $ficCode[0].NOM_APPLICATION."/redaction_web/xsl/genmodeleod.xsl";
	    
	   // décompression du rapport dans un répertoire rapport
	    $szCheminExtract = getRepTmpSession(session_id())."extractoo\\";
	    extractZipToDir($szCheminFichierOOSource, $szCheminExtract, $msgErreur);
	    
	    // recherche du fichier principal du rapport
	    $fichierDocumentRapport = $szCheminExtract."content.xml";

	    // attention au chemin du fichier XML
		$tabParam = array('fichier_fiche_index' => $szCheminFichierXmlPos);
	    $h = fopen(getRepTmpSession(session_id())."content2.xml", "w");
	    fwrite($h, genererTransformationXslt($fichierDocumentRapport, 
													$szNomFichierXsl, $tabParam));
	    fclose($h);
	    copy(getRepTmpSession(session_id())."content2.xml", $fichierDocumentRapport);
	    addDirToZip($szCheminExtract, $szCheminFichierOOGenere, /*pref*/$msgErreur);
	    
	    if ($retour)
	    {
	        // suppression du répertoire contenant le modèle
	        delRepRecursif($szCheminExtract);
	        unlink(getRepTmpSession(session_id())."content2.xml");
	    }
	    
	    return $retour;
	}
}

if (!function_exists('remplaceImageSignature')) {
	function remplaceImageSignature($szCheminFichierOOSource, $szNomImageSignature, $sCheminImage, $szCheminFichierOOGenere, &$msgErreur) 
    {
        $retour = true;
        $sEnteteXml ="<?xml version='1.0' encoding='ISO-8859-1'"."?".">";
$xslContentExtractImg = <<<EOD
$sEnteteXml
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:draw="urn:oasis:names:tc:opendocument:xmlns:drawing:1.0" xmlns:xlink="http://www.w3.org/1999/xlink">
<xsl:output method="html" encoding="ISO-8859-1"/>
<xsl:template match="/">
<xsl:value-of select="//*[name() = 'draw:frame' and @*[name()='draw:name' and .= '$szNomImageSignature']]/draw:image/@*[name() = 'xlink:href']" />
</xsl:template>
</xsl:stylesheet>
EOD;
      
       // décompression du rapport dans un répertoire rapport
        $szCheminExtract = getRepTmpSession(session_id())."extractoo\\";
        $retour = extractZipToDir($szCheminFichierOOSource, $szCheminExtract, $msgErreur);
        if ($retour)  {
            // recherche du fichier principal 
            $fichierDocument = $szCheminExtract."content.xml";
        	
            $xsltProc = new XSLTProcessor();
            // Chargement du fichier XML
            $xml = new domDocument();
            $xml->load($fichierDocument);
            // Chargement du fichier XSL
            $xsl = new domDocument();
            $xsl->loadXML($xslContentExtractImg);
            // Import de la feuille XSL
            $xsltProc->importStylesheet($xsl);
            	
            $nomFichierImage = trim($xsltProc -> transformToXml($xml));
            if (!copy($sCheminImage, $szCheminExtract.$nomFichierImage)) {
                error_log( "Impossible de copier le fichier signature");
                $retour = false;
            }
        }
        else {
			error_log($msgErreur);
		}
        if ($retour) {
            $retour = addDirToZip($szCheminExtract, $szCheminFichierOOGenere, $msgErreur);
            if (!$retour) {
				error_log( "erreur addDirToZip :: $msgErreur");
			}
        }
        
        if ($retour)
	    {
	        delRepRecursif($szCheminExtract);
	    }
        return $retour;
    }
}

if (!function_exists('addDirToZip')) {
	function addDirToZip($source, $szDirZipFileName, &$msgErreur) 
	{
	    $retour = false;
	    if (class_exists("ZipArchive"))
	    { 
	        if (file_exists($source) === true) 
	        { 
	            $zip = new ZipArchive(); 
	            if ($zip->open($szDirZipFileName, ZIPARCHIVE::CREATE) === true) 
	            { 
	                $source = realpath($source); 
	                if (is_dir($source) === true) 
	                { 
	                    $files = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($source), RecursiveIteratorIterator::SELF_FIRST);
	                    foreach ($files as $file) 
	                    {
	                        $file = realpath($file); 
	                        //echo "file : $file<br>";
	                        if (is_dir($file) === true) 
	                        {   
	                            // ajouter le chemin relatif
	                            $fileToAdd = str_replace("\\", "/", substr(str_replace($source . '/', '', $file), strlen($source) + 1));
	                            //echo "fileToAdd : $fileToAdd<br>";
	                            $zip->addEmptyDir($fileToAdd); 
	                        } 
	                        else
	                            if (is_file($file) === true) 
								{ 
	                                // il faut ajouter le chemin relatif
	                                $fileToAdd = str_replace($source . '/', '', $file);
	                                $fileToAddName = str_replace("\\", "/", substr($file, strlen($source) + 1));
	                                //echo "fileToAdd : $fileToAdd, fileToAddName : $fileToAddName<br>";
	                                $zip->addFile($fileToAdd, $fileToAddName); 
	                            } 
	                    }
	                    $retour = true;
	                } 
	                else
	                { 
	                    $msgErreur = "Erreur $source n'est pas un dossier";
	                }
	                $zip->close(); 
	            }
	            else
	                $msgErreur = "Erreur lors de la création de l'archive ".$szDirZipFileName;
	        } 
	    }
	    else
	        $msgErreur = "La librairie php_zip n'est pas disponible sur cette version de php.";
	        
	    return $retour; 
	} 
}

if (!function_exists('extractZipToDir')) {
	function extractZipToDir($szZipFileName, $path, &$msgErreur) 
	{
	    $retour = false;
	    if (class_exists("ZipArchive"))
	    {
	        $zip = new ZipArchive;
	        if ($zip->open($szZipFileName) === TRUE) 
	        {
	            if ($zip->extractTo($path) === TRUE) 
	                $retour = true;
	            else
	                $msgErreur = "Erreur lors de l'extraction du fichier ".$szZipFileName;
	            $zip->close();
	        }
	        else 
	            $msgErreur = "Erreur à l'ouverture du fichier ".$szZipFileName;
	    }
	    else
	        $msgErreur = "La librairie php_zip n'est pas disponible sur cette version de php.";
	    return $retour;
	}
}
include("../redaction_web/fonction_edition.php");
include("../include/fonction_util.inc.php");
// on recupere le nom de la macro (szInfo = "WMR ...")
$szNomMacro = substr($szInfo, 4);
if (!isset($szNomModele) || strcmp($szNomModele, "") == 0)
	$szNomModele = substr($szInfo, 4);	

$szNomFichierWord = getRepTmpSession(session_id())."exportationHermes_".$_REQUEST["POS_NUM_DOC"].EXTENSION_ODT;

$cloison = "";
$szNomFicTmp = $szNomMacro;
$retour = phpPosExportXml($jeton, $_REQUEST["POS_NUM_DOC"], getRepTmpSession(session_id()), /*pref*/$szCheminFichierXmlPos);

// fichier non enregistré sur poseidon
if ($szInfo{2} == 'D') 
{
    // non géré 
	$bFicNoSave = true;
	$szNomFichierWord = "exportationHermes_".$_REQUEST["POS_NUM_DOC"].".odt";
}
// ajouter le fichier en dernière position
elseif ($szInfo{2} == 'R')
{
    $bFicNoSave = false;
    // récupération du modele
    $ficInfo = (isset($_SERVER["PATH_TRANSLATED"])) ? $_SERVER["PATH_TRANSLATED"] : $_SERVER["SCRIPT_FILENAME"];
    $ficCode = preg_split("/".NOM_APPLICATION."/i", $ficInfo);
    $szRepModele = $ficCode[0].NOM_APPLICATION."/modeles/";
    $szNomFichierModele = $szNomModele.EXTENSION_ODT;
    
    // copie du modèle dans le répertoire de travail
    $retour = copy($szRepModele.$szNomFichierModele, getRepTmpSession(session_id()).$szNomFichierModele);
    if (!$retour)
        $msgErreur = "Erreur lors de la récupération du modèle $szNomFichierModele."; 
    $retour = remplaceValeurRubriqueDansDocOO(getRepTmpSession(session_id()).$szNomFichierModele, 
                            $szCheminFichierXmlPos, $szNomFichierWord, /*pref*/$msgErreur);
    if ($retour)
    {
        // suppression du fichier modèle
        if (file_exists(getRepTmpSession(session_id()).$szNomFichierModele))
            unlink(getRepTmpSession(session_id()).$szNomFichierModele);
    }
    
    if (!$retour)
    {
        $tabMsg = array();
		$tabMsg[0] = $msgErreur; 
		debug_code($tabMsg);
    }
    else
    {
        $retour = pos_getinfonumdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$objInfoNumDoc);
    	if ($retour)
    	{	
			if(!isset($iNumPage))
    	    	$iNumPage = $objInfoNumDoc->nb_pagereelle + 1;

			if(!isset($iNumPageSsPage))
				$iNumPageSsPage = 0;

    	    // Ajout de la page
    		$retour = pos_ajoutepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $iNumPage, $iNumPageSsPage, 0, 0, "$cloison", 
                        CST_NATURE_FICHIER_ODT, "", $szNomFicTmp.EXTENSION_ODT, $szNomFichierWord);
    	}
        if (!$retour)
    		debug($jeton);
    }
}
else
{
	$iNumPage = 0;
	
	// On modifie le fichier qui se trouve en premiere position
	if($szInfo{2} == 'F')
		$iNumPage = 1;
	elseif($szInfo{2} == 'L') // on modifie le fichier en dernière position
	{
		$retour = pos_getinfonumdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$objInfoNumDoc);
		if ($retour)
			$iNumPage = $objInfoNumDoc->nb_pagereelle;
		else
			debug($jeton);
	}

	if ($iNumPage != 0)
	{
	    $szNomFichierWordExistant = getRepTmpSession(session_id())."exportationHermes_src_".$_REQUEST["POS_NUM_DOC"].".odt";
		$retour = pos_dmdpagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $iNumPage, 0, $szNomFichierWordExistant, /*pref*/$objInfoPage);
		
		if (!$retour)
			debug($jeton);
		else
		{
		    // nom du fichier avant modif		
		    $szNomFichierOriginal = $objInfoPage->szNomFichierOriginal;
		    
		    $retour = remplaceValeurRubriqueDansDocOO($szNomFichierWordExistant, 
                            $szCheminFichierXmlPos, $szNomFichierWord, /*pref*/$msgErreur);
            // suppression du fichier existant
            if (file_exists($szNomFichierWordExistant))
                unlink($szNomFichierWordExistant);
		    
			if ($retour)
			{
				$retour = pos_remplacepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], 
							$iNumPage, 
							0, 0,0, "$cloison", CST_NATURE_FICHIER_ODT, "", $szNomFichierOriginal, $szNomFichierWord);
				if (!$retour)
			        debug($jeton);
			}
		}
	}
}

// on efface les fichiers utilises

if (file_exists($szFileDonnees))
 	unlink($szFileDonnees);
 	
if ($szInfo{2} != 'D') // fichier non enregistré sur poseidon suppression plus tard dans le tmp	
	if (file_exists($szNomFichierWord))
		unlink($szNomFichierWord);

$bAfficheFichierCree = true;

if(isset($iNumPage))
	$iNumAOuvrir = $iNumPage;

// on détruit les variables si on fait un code qui boucle (création spéciale)
unset($iNumPage);
unset($iNumPageSsPage);



?>