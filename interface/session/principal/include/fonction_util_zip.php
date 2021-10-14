<?php

if (!defined("FONCTION_UTIL_ZIP"))
{
    define("FONCTION_UTIL_ZIP",1);
    
    function getRepZip($sessId)
    {
     	$szRepTmp = getRepTmpSession($sessId);
    	$szRepTmp .= "zipencours";
    	$szRepTmp .= "/";
    	if (!file_exists($szRepTmp))
    	{
    		mkdir($szRepTmp);
    	}
    	return $szRepTmp;
    }
    
    function delRepZip($sessId)
    {
    	$szRepTmp = getRepZip($sessId);
    	if (file_exists($szRepTmp))
    	{
    		$hd = opendir($szRepTmp);
    		if ($hd)
    		{
    			while (($f = readdir($hd)) !== false)
    			{
    				if ($f != "." && $f != "..")
    					unlink($szRepTmp.$f);
    			}
    			closedir($hd);
    		}
    		rmdir($szRepTmp);
    	}
    }
    
    /*
     * $tabNumPage : si vide : toutes les pages
     * sinon uniquement les pages indexées dans le tableau   
     */     
    function ajouteFichiersDocumentToZipFile($jeton, $zip, $iNumDoc, $tabNumPage, $bAjouteFichier, $bAjouteSousFichier)
    {
        $iNbFichierAjoutes = 0;
        $retour = pos_getlisteinfopage($jeton, $iNumDoc, 0, /*pref*/$tabStruListePage);
    	// recuperation de tous les fichiers du document
        for($i=0; $i<count($tabStruListePage); $i++)
        {
            $iNumPage = $i + 1;
            $iNumSsPage = 0;
            // si le tableau est vide, on triate toutes les pages
            $bTraitePage = (count($tabNumPage) == 0) ? true : false;
            for($j=0; $j<count($tabNumPage); $j++)
            {
                if ($tabNumPage[$j] == $iNumPage)
                {
                    $bTraitePage = true;
                    break;
                }
            }
            
            if ($bTraitePage)
            {
                $szFileNameBase = sprintf("%011d-%03d-%03d", $iNumDoc, $iNumPage, $iNumSsPage);
                $search = array("\\", "/");
                $replace = "_";
                $szFileName = sprintf("%s-%s", $szFileNameBase, 
                    strlen($tabStruListePage[$i]->szNomFichierOriginal) ? str_replace($search, $replace, iconv('ISO-8859-1', 'IBM850', $tabStruListePage[$i]->szNomFichierOriginal)) : "fichier.".$tabStruListePage[$i]->szExtension);
                $szDirFileName = getRepZip(session_id()).$szFileNameBase;
                $retour = pos_dmdpagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, $szDirFileName, /*pref*/$objInfoPage);
                
                if ($retour)
                {
                    // ajout dans l'archive
                    $retour_add = $zip->addFile($szDirFileName, $szFileName);
                    if ($retour_add)
                        $iNbFichierAjoutes++;
                
	                if ($bAjouteSousFichier)
	                {
	        	        for($j=0; $j<$objInfoPage->wNbSousPage; $j++)
	        	        {
	        	            $iNumSsPage = $j + 1;
	                        $szFileNameSousFichier = sprintf("%011d-%03d-%03d", $iNumDoc, $iNumPage, $iNumSsPage);
	                        $szDirFileNameSousFichier = getRepZip(session_id()).$szFileNameSousFichier;
	            	        $retour = pos_dmdpagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, $szDirFileNameSousFichier, /*pref*/$objInfoSousPage);
	    
	                        if ($retour)
	                        {
	                            // renommer le fichier apres avoir recuperer son nom d'origine
	                            $szNewFileNameSousFichier = sprintf("%s-%s", $szFileNameSousFichier, 
                                    strlen($objInfoSousPage->szNomFichierOriginal) != 0 ? str_replace($search, $replace, iconv('ISO-8859-1', 'IBM850', $objInfoSousPage->szNomFichierOriginal)) : "fichier.".$objInfoSousPage->szExtension);
	                            
	                	        // ajout dans l'archive
	                            $retour_add = $zip->addFile($szDirFileNameSousFichier, $szNewFileNameSousFichier);
	                            if ($retour_add)
	                                $iNbFichierAjoutes++;
	                        }
	                    }
	                }
	            }
                else
                    error_log(get_erreur_poseidon($jeton));
            }
        }
        return $iNbFichierAjoutes;
    }
}
?>
