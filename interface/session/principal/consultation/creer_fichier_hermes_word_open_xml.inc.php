<?php

include("../redaction_web/fonction_edition.php");
include("../include/fonction_util.inc.php");
include("../include/fonction_modification_doc_word.php");

if(!defined('EXTENSION_DOCX') || !defined('NATURE_POSEIDON_DOCX') || !defined('URL_WEB_SERVICE_WSGEDPOSEIDON')) {
    afficheMsg("La nature et l'extension des documents OfficeOpenXml ainsi que l'adresse du service web doivent être dans le fichier de configuration.");
}
else {

    $szRepModele = REP_TEMPLATE_APPLICATIF."macro/";
    $time_start = getmicrotime();
    $tabActionsSignature = array();
    // on recupere le nom de la macro (szInfo = "WMR ...")
    $szNomMacro = substr($szInfo, 4);
    $szNomFichierWord = getRepTmpSession(session_id())."exportationHermes_".$_REQUEST["POS_NUM_DOC"].EXTENSION_DOCX;
    $retour = phpPosExportXml($jeton, $_REQUEST["POS_NUM_DOC"], getRepTmpSession(session_id()), /*pref*/$fileXmlPos);
    if ($retour) 
    {
        // fichier non enregistré sur poseidon
        if ($szInfo{2} == 'D') 
        {
            $bFicNoSave = true;
            $szNomModele = $szNomMacro;
            $fileNameWord = $szRepModele.$szNomModele.EXTENSION_DOCX;
            if (file_exists($fileNameWord))
            {
                if (file_exists($szNomFichierWord))
                    unlink($szNomFichierWord);
                $retour = soapCallMergeContentWithXML($fileNameWord, $fileXmlPos, $szNomFichierWord, $msgErreur);
                if (!$retour)
                {
                    afficheMsg($msgErreur);
                    unset($szNomFichierWord);
                }
                // reaffectation nom du fichier word sans le chemin complet
                else
                {
                    $bAfficheFichierCree = true;
                    $szNomFichierWord = "exportationHermes_".$_REQUEST["POS_NUM_DOC"].EXTENSION_DOCX;
                }
        	}
        	else
            {
                $tabInfoDebug = array();
                $tabInfoDebug[0] = CST_LIBELLE_HERMES_MACRO." $fileNameWord ".CST_LIBELLE_HERMES_MACRO_NOT_DEFINE; 
                debug_code($tabInfoDebug);
            }
        	
        }
        // ajouter le fichier en dernière position
        elseif ($szInfo{2} == 'R' || $szInfo{2} == 'E')
        {
            $bFicNoSave = false;
            $szNomModele = $szNomMacro;
            $fileNameWord = $szRepModele.$szNomModele.EXTENSION_DOCX;
            if (file_exists($fileNameWord))
            {
                if (file_exists($szNomFichierWord))
                    unlink($szNomFichierWord);
                $retour = soapCallMergeContentWithXML($fileNameWord, $fileXmlPos, $szNomFichierWord, $msgErreur);
                if (!$retour)
                {
                    afficheMsg($msgErreur);
                }
                else
                {
                    $retour = pos_getinfonumdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$objInfoNumDoc);
                	if ($retour)
                	{	
                	    $iNumPage = $objInfoNumDoc->nb_pagereelle + 1;
                	    // Ajout de la page
                		$retour = pos_ajoutepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $iNumPage, 0, 0, 0, "", NATURE_POSEIDON_DOCX, 
        							"", $szNomModele.".docx", $szNomFichierWord);
                	}
                    if (!$retour)
                		debug($jeton);
                }
            }
            else
            {
                $tabInfoDebug = array();
                $tabInfoDebug[0] = CST_LIBELLE_HERMES_MACRO." $fileNameWord ".CST_LIBELLE_HERMES_MACRO_NOT_DEFINE; 
                debug_code($tabInfoDebug);
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
        		$retour = pos_dmdpagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $iNumPage, 0, $szNomFichierWord, /*pref*/$objInfoPage);
        		
        		if (!$retour)
        			debug($jeton);
        		else
        		{
        		    // nom du fichier avant modif		
        		    $szNomFichierOriginal = $objInfoPage->szNomFichierOriginal;
                    // passe le même fichier en entrée et en sortie
        		    if (in_array($szNomMacro, $tabActionsSignature))
        		        $retour = soapCallReplaceImage($szNomFichierWord, REP_TEMPLATE_APPLICATIF."macro/".NOM_IMG_SIGNATURE, "signature", $szNomFichierWord, /*pref*/$msgErreur);
        		    else
                        $retour = soapCallMergeContentWithXML($szNomFichierWord, $fileXmlPos, $szNomFichierWord, $msgErreur);
        		    
        			if ($retour)
        			{
        				$retour = pos_remplacepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], 
        							$iNumPage, 
        							0, 0,0, "", NATURE_POSEIDON_DOCX, "", $szNomFichierOriginal, $szNomFichierWord);
        				if (!$retour)
        			        debug($jeton);
        			}
        			else
        			{
                        afficheMsg($msgErreur);
                    }
        		}
        	}
        }
        $time = getmicrotime() - $time_start;
        echo "Temps ecoule : $time<br>";
    }
    
    // on efface les fichiers utilises
    
    if (file_exists($szFileDonnees))
     	unlink($szFileDonnees);
    /*
    if ($szInfo{2} != 'D') // fichier non enregistré sur poseidon suppression plus tard dans le tmp	
    	if (file_exists($szNomFichierWord))
    		unlink($szNomFichierWord);
    */
    
    
    if($retour && isset($iNumPage) && $iNumPage != 0)
    {
    	$iNumAOuvrir = $iNumPage;
        $bAfficheFichierCree = true;
    }

}
?>