<?php
/* 
 * Modification du fichier ide configuration des natures "../../../../configuration_w/natures.conf"
 * Ce fichier permet d'associer plusieurs extensions à un même code de nature 
 * PL 04/2011 : création
 * 26/02/2013 GG : reprise : passage en focntion et réecriture complète du fichier
 */
function majFichierNature($jeton, $szCodeNatureMod, $szAutresWebExtNature)
{
	$szFilePath = "../../../../configuration_w/";
  	$szFileName = $szFilePath . "natures.conf";
  	$szFileNameNew = $szFileName.".new";
    $szFileNameSav = $szFileName.".sav";
  	$tabNatures = array();
  	$sContenuFichier = '<?php'."\n";
  	$sContenuFichier .= '$tabNatures = array();'."\n";
  	if (file_exists($szFileName))
        include($szFileName);
  	 
  	$retour = pos_getlistnatures($jeton, /*pref*/$tabLstNat);
			
	if ($retour)
	{
		foreach($tabLstNat as $codeNature=> $libelleNature)
		{
            $retour = pos_getnature($jeton, $codeNature, /*pref*/$objNature);
            $listeExtension = $objNature->szExtension;
            // extension en cours de modification : les extensions web sont passees en argument
            if (strcmp($codeNature, $szCodeNatureMod) == 0)
            {
                if ( strlen(trim($szAutresWebExtNature)) != 0) 
                {
                    $szNewExtension = preg_replace("/\s+/", "\",\"", trim($szAutresWebExtNature));
                    $listeExtension = $listeExtension."\",\"".$szNewExtension;
                }
            }
            // autres extensions : les extensions web sont recuperees dans le fichier des natures
            else
            {
                if (array_key_exists($codeNature, $tabNatures))
        		{	
        			// la première valeur est renseignée dans le champ input de l'extension principal
        			for($i=1;$i<count($tabNatures[$codeNature]);$i++)
        			{
        				$listeExtension = $listeExtension."\",\"".$tabNatures[$codeNature][$i];					
        			}					
        		}
            }
            $sContenuFichier .= '$tabNatures["'.$codeNature.'"] = array("'.$listeExtension.'");'."\n";
		}
	}
  	$sContenuFichier .= '?'.'>';
  	
  	
  	if ($retour)
  	{
  		if (is_writable($szFilePath))
        {
	    	$handle = @fopen($szFileNameNew, 'w');
	        if (!$handle)
	            afficheErreurNature("Erreur de création du fichier des natures : ");
	        else
			{
                fwrite($handle, $sContenuFichier);			
		    	fclose($handle);
				// remplacement du fichier
                if (file_exists($szFileName))
                    $cpy = @copy($szFileName, $szFileNameSav);
                else
                    $cpy = true;
                if ($cpy)
                {
                    if (file_exists($szFileName))
                       $unl = @unlink($szFileName);
                    else
                        $unl = true;
                    if ($unl)
                    {
                        $cpy = @rename($szFileNameNew, $szFileName);
                        if (!$cpy)
                        {
                            afficheErreurNature("Erreur lors du remplacement de fichier :");
                        }
                    }
                    else
                        afficheErreurNature("Erreur lors de la suppression du fichier :");
                } 
                else
                    afficheErreurNature("Erreur lors de la copie de sauvegarde : ");	                  
			}
        }
        else
        {
            $tabMessage[0] = "Le fichier des natures n\'a pas pu être mis à jour : le fichier est protégé en écriture";
            debug_code($tabMessage);
        }
    }
}

function afficheErreurNature($sMsg)
{
    $error = error_get_last();
    $tabMessage[0] = $sMsg;
    $tabMessage[1] = $error['message'];
    debug_code($tabMessage);
}
?>