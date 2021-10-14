<?php

/**
 * Ecrit les valeurs dans le fichier de configuration des DF
 */
function ecrireValeursFichier($jeton, $sCodeRub, $bListeHier) {

	// mise à jour du fichier des domaines fermés si nécessaire 
    // il existe un fichier "domaineferme.js" et le DF modifié fait partie des DF enregistré
	// -------------------------------------------------------
	$szFilePath = "../../../../configuration_w/";
	$szFileName = $szFilePath . "domaine_ferme.js";
	$szFileNameNew = $szFileName.".new";
	$szFileNameSav = $szFileName.".sav";
	if (file_exists($szFileName))
	{
	   $tabLineDf = file($szFileName);
	   for($i=0;$i<count($tabLineDf);$i++)
	   {
	       $pos = strpos($tabLineDf[$i], "LISTE_RUB_COMBO=");
	       if ($pos !== false)
	       {
	           $szListeRub = substr($tabLineDf[$i], $pos + 1);
	           break;
           }
       }
       
       $posRub = strpos($szListeRub, $sCodeRub.";");
       if ($posRub !== false)
       {
            if (is_writable($szFileName) && is_writable($szFileName))
            {
                $handle = @fopen($szFileNameNew, 'w');
                if (!$handle)
                {
                    $error = error_get_last();
                    $tabMessage[0] = "Erreur de création du fichier des domaines fermés : ";
                    $tabMessage[1] = $error['message'];
                    debug_code($tabMessage);
                }
                else
                {
                    $szChaineARemplacer = "";
                    include ("../include/liste_vocab.inc.php");
                    $liste_mots = array();
                    if ($bListeHier) {
                    
                        $szCodeLstHier = $sCodeRub;
                        $szCheminLstHier = "";
                        $szProfilLstHierUser = "";   
                        $retour = pos_getlistehier($jeton, $szCodeLstHier, $szCheminLstHier, 
                                        $szProfilLstHierUser, /*pref*/$szValeur);
                        $liste_mots = extraireValeurs($szValeur);
                    }
                    else {
                        $retour = pos_getinforub($jeton, $sCodeRub, /*pref*/$tabInfoOneRub);
                        $retour = getListeTousMotDf($jeton, $sCodeRub, POS_LIBELLE_DF, 
                                    $tabInfoOneRub->typerub, /*pref*/$liste_mots);
                    }
                    
            		if($retour)
            		{	
            			$transform = array("\"" => "\\\"");
                        if (!$bListeHier) {
                            if ($tabInfoOneRub->typerub == POS_RUB_ALPHA) {
                                foreach($liste_mots as $codeterme => $libelleterme)
                                    $szChaineARemplacer .= "tabRubCombo".$sCodeRub."[\"".strtr($codeterme, $transform)."\"]= \"".strtr($libelleterme, $transform)."\";\n";
                            }
                        }
                        else {
                            // tableau indexe !! 
                            foreach($liste_mots as $codeterme => $libelleterme) {
                            
                                $szCodeLstHier = $sCodeRub;
                                $szCheminLstHier = $libelleterme.SEPARATEUR;
                                $szProfilLstHierUser = "";   
                                $retour = pos_getlistehier($jeton, $szCodeLstHier, $szCheminLstHier, 
                                                $szProfilLstHierUser, /*pref*/$szValeur);
                                $liste_mots2 = extraireValeurs($szValeur);
                                $szChaineARemplacer .= "tabRubCombo".$sCodeRub."[\"".strtr($libelleterme, $transform)."\"] = new Array();\n";
                                $szChaineARemplacer .= "tabRubCombo".$sCodeRub."[\"".strtr($libelleterme, $transform)."\"][0] = new Array();\n";
                                $szChaineARemplacer .= "tabRubCombo".$sCodeRub."[\"".strtr($libelleterme, $transform)."\"][1] = new Array();\n";
                                $szChaineARemplacer .= "tabRubCombo".$sCodeRub."[\"".strtr($libelleterme, $transform)."\"][0]= \"".strtr($libelleterme, $transform)."\";\n";
                                if (count($liste_mots2) != 0) {
                                    
                                    foreach($liste_mots2 as $codeterme2 => $libelleterme2) {
                                        $szChaineARemplacer .= "tabRubCombo".$sCodeRub."[\"".strtr($libelleterme, $transform)."\"][1][\"".strtr($libelleterme2, $transform)."\"]= \"".strtr($libelleterme2, $transform)."\";\n";
                                    }
                                }
                            }
                        }
                        
                        $bChaineAEcrire = true;
                        $szChaineAChercher = "tabRubCombo".$sCodeRub."[";
                        for($i=0;$i<count($tabLineDf);$i++)
                        {
                            if (strpos($tabLineDf[$i], $szChaineAChercher) === false)
                                fwrite($handle, $tabLineDf[$i]);
                            else 
                            {
                                if ($bChaineAEcrire)
                                {
                                    $bChaineAEcrire = false;
                                    fwrite($handle, $szChaineARemplacer);
                                }
                            }
                        }
                    }
                    fclose($handle);
                    if($retour)
            		{
                        // remplacement du fichier
                        $cpy = @copy($szFileName, $szFileNameSav);
                        if ($cpy)
                        {
                            $unl = @unlink($szFileName);
                            if ($unl)
                            {
                                $cpy = @rename($szFileNameNew, $szFileName);
                                if (!$cpy)
                                {
                                    $error = error_get_last();
                                    $tabMessage[0] = "Erreur lors du remplacement de fichier";
                                    $tabMessage[1] = $error['message'];
                                    debug_code($tabMessage);
                                }
                                else {
                                    // retour ajax !
                                    if (!$bListeHier) {
                                        echo "<script>";
                                        echo "parent.dateModifDf='".filemtime($szFileName)."';";
                                        echo "</script>";
                                    }
                                }
                            }
                            else
                            {
                                $error = error_get_last();
                                $tabMessage[0] = "Erreur lors de la suppression du fichier des domaines fermés";
                                $tabMessage[1] = $error['message'];
                                debug_code($tabMessage);
                            }
                        } 
                        else
                        {
                            $error = error_get_last();
                            $tabMessage[0] = "Erreur lors de la copie de sauvegarde";
                            $tabMessage[1] = $error['message'];
                            debug_code($tabMessage);
                        }
                    }
                    else
                        debug($jeton);
                }
            }
            else
            {
                $tabMessage[0] = "Le fichier des domaines fermés n\'a pas pu être mis à jour : erreur d'accès aux fichiers";
                debug_code($tabMessage);
            }
       }
    }

}

?>