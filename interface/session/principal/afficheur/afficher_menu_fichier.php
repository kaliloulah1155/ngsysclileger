<?php

/*
 * DESCRIPTION : Affichage des fichiers lies de premier niveau
 *
 *
 */
include ("../include/locution.inc.php");
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".CST_LANG.".conf");
include ("../../../../configuration/url.conf.php");
$time_start = getmicrotime();
// Si il n'y a pas de numero de document, on ne fait rien.
if (!isset($_REQUEST["POS_NUM_DOC"]) || strlen($_REQUEST["POS_NUM_DOC"]) <= 0)
{
	afficheMsg(CST_LIBELLE_CONSULTER_NUM_INIT); 
}
else
{
	$retour = connexion($jeton);
//$time = getmicrotime() - $time_start;
//echo("Temps ecoule connexion : ".$time);

	if($retour)
	{
		$iNumDoc = $_REQUEST["POS_NUM_DOC"];
		// affichage des fichiers de documents liés ou affichage des fichiers du document en cours
		$bAfficherFichierDocLie = (isset($_REQUEST["POS_AFF_DOC_LIE"]) && strcmp($_REQUEST["POS_AFF_DOC_LIE"], "1") == 0) ? true: false;
		$tabAssoNumFichierNumDoc = array();
		$tabAssoNumFichierNumFichier = array();
		$tabAssoNumFichierTitreFichier = array();
        $iNbFichiers = 0;

        if ($bAfficherFichierDocLie)
        {
            if (isset($_SESSION["sess_numdoc_viewer"]) && $_SESSION["sess_numdoc_viewer"] == $iNumDoc && 
                isset($_REQUEST["CACHE_INDEX_LIE"]) && strcmp($_REQUEST["CACHE_INDEX_LIE"], "1") == 0)
            {
                $tabAssoNumFichierNumDoc = $_SESSION["sess_tabAssoNumFichierNumDoc"];
            	$tabAssoNumFichierNumFichier = $_SESSION["sess_tabAssoNumFichierNumFichier"];
            	$tabAssoNumFichierTitreFichier = $_SESSION["sess_tabAssoNumFichierTitreFichier"];
            }
            else
            {
                $_SESSION["sess_numdoc_viewer"] = $iNumDoc;
            	$retour = pos_getallindexdoc($jeton, $iNumDoc, /*pref*/$codevalrub);
                //$time = getmicrotime() - $time_start;
                //echo("Temps ecoule recup index  : ".$time);

        	    if ($retour)
        	    {
        	        //$szValeurLien = $codevalrub["LDO"];
        	        $szValeurLien = $codevalrub[$_REQUEST["CODE_RUB_SOURCE"]];
        	        $tabLoc = array();
                    //$tabLoc[0] = new Locution(1, "DOC", "LCA", '=', $szValeurLien);
                    $tabLoc[0] = new Locution(1, $_REQUEST["CODE_TYPE_CIBLE"], $_REQUEST["CODE_RUB_CIBLE"], '=', $szValeurLien);
        		     
        			$retour = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
                }
                
                if ($retour)
        	    {
        	        //$szProfilLr = "php_nb_pages_titre_visualiseur";
        	        $szProfilLr = $_REQUEST["PROFIL_LR"];
        	        $iTriNumCol = 2;
        	        $iTypeTri = 1;
        	        $tabRepLR = array();
        		    
        		    if ($iNbReponses > 0)
        			     $retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $iNbReponses, 
        					$iTriNumCol, $iTypeTri, /*pref*/$szProfilLr, /*pref*/$tabRepLR);
                    $time = getmicrotime() - $time_start;
                    //echo("Temps ecoule recherche: ".$time);
    
        			
                    if ($retour)
            	    {
            	        $bCompteurFichier = 0;
                        for ($j = 0; $j<count($tabRepLR); $j++)
                        {
                            $tabChamps = extraireChampsLR($tabRepLR[$j]->lr, "\x02");
                            for($b=0; $b<$tabChamps[0]; $b++)
                            {
                                $tabAssoNumFichierNumDoc[$bCompteurFichier] = $tabRepLR[$j]->numdoc;
                                $tabAssoNumFichierNumFichier[$bCompteurFichier] = $b + 1;
                                $szNomFichier = "";
                                for($c=1; $c<count($tabChamps); $c++)
                                {
                                    $szNomFichier .= $tabChamps[$c]."-";
                                }
                                $tabAssoNumFichierTitreFichier[$bCompteurFichier] = $szNomFichier.sprintf("%02d", ($b+1));
                                $bCompteurFichier++;
                            }
                        }
            	    }
            	    $_SESSION["sess_tabAssoNumFichierNumDoc"] = $tabAssoNumFichierNumDoc;
            	    $_SESSION["sess_tabAssoNumFichierNumFichier"] = $tabAssoNumFichierNumFichier;
            	    $_SESSION["sess_tabAssoNumFichierTitreFichier"] = $tabAssoNumFichierTitreFichier;
                }
            }
        }
        else
        {
            $retour = pos_getlisteinfopage($jeton, $iNumDoc, 0, /*pref*/$tabStruListePage);
    		$iNbFichiers = count($tabStruListePage);
    		for ($j = 0; $j<$iNbFichiers; $j++)
            {
                $tabAssoNumFichierNumDoc[$j] = $iNumDoc;
                $tabAssoNumFichierNumFichier[$j] = $j + 1;
                $tabAssoNumFichierTitreFichier[$j] = (strlen($tabStruListePage[$j]->szNomFichierOriginal) != 0) ? $tabStruListePage[$j]->szNomFichierOriginal : ("Fichier ".($j + 1));
            }
        }
       	
        $iNbFichiers = count($tabAssoNumFichierNumDoc); 
	    if($retour)
		{
			$t = new template(REP_TEMPLATE_APPLICATIF."afficheur");
            $t->set_file ("menuFichier", "menu_fichier.tpl");
            $t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
            $iNumFichier = isset($_REQUEST["POS_NUM_FICHIER"]) ? $_REQUEST["POS_NUM_FICHIER"] : "1";
            $t->set_var("POS_NUM_FICHIER_INIT", $iNumFichier);
            
            $t->set_var("CODE_RUB_SOURCE", isset($_REQUEST["CODE_RUB_SOURCE"]) ? $_REQUEST["CODE_RUB_SOURCE"] : "");
            $t->set_var("CODE_TYPE_CIBLE", isset($_REQUEST["CODE_TYPE_CIBLE"]) ? $_REQUEST["CODE_TYPE_CIBLE"] : "");
            $t->set_var("CODE_RUB_CIBLE", isset($_REQUEST["CODE_RUB_CIBLE"]) ? $_REQUEST["CODE_RUB_CIBLE"] : "");
            $t->set_var("PROFIL_LR", isset($_REQUEST["PROFIL_LR"]) ? $_REQUEST["PROFIL_LR"] : "");
            $t->set_var("POS_AFF_DOC_LIE", isset($_REQUEST["POS_AFF_DOC_LIE"]) ? $_REQUEST["POS_AFF_DOC_LIE"] : "0");
            $t->set_var("NB_FICHIERS", $iNbFichiers);
            // blocs  :
            $t->set_block("menuFichier", "BLOC_PAGES", "bloc_pages");
            $t->set_block("menuFichier", "BLOC_AVEC_FICHIERS", "bloc_avec_fichiers");
            $t->set_block("menuFichier", "BLOC_SANS_FICHIERS", "bloc_sans_fichiers");
            if ( $iNbFichiers == 0)
            {
                $t->set_var("POS_NUM_SSFICHIER", 0);
                $t->set_var("NB_PAGES_FICHIER", 0);
                $t->set_var("POS_NUM_DOC_EN_COURS", $iNumDoc);
    		    $t->set_var("POS_NUM_FICHIER_POSEIDON", 1);
                $t->parse("bloc_sans_fichiers", "BLOC_SANS_FICHIERS", true);
                $t->set_var("bloc_avec_fichiers", "");
            }
            else
            {
                for($a=0; $a<$iNbFichiers; $a++)
                {
                    $t->set_var("NUM_FICHIER", ($a + 1));
                    $t->set_var("NOM_FICHIER", $tabAssoNumFichierTitreFichier[$a]);
                    $t->set_var("SELECT_FICHIER", (($a + 1) == $iNumFichier) ? "SELECTED" : "");
                    $t->parse ("bloc_pages", "BLOC_PAGES", true);
    			}
    			
    			// transfert infos nécessaires pour affichage première page 
    			$iNumberPage = 0;
    		    $iNumSousFichier = 0;
    		    $iNumDocCorrespondant = $tabAssoNumFichierNumDoc[$iNumFichier - 1];
    		    $iNumFichierCorrespondant = $tabAssoNumFichierNumFichier[$iNumFichier - 1];
    		    $t->set_var("POS_NUM_DOC_EN_COURS", $iNumDocCorrespondant);
    		    $t->set_var("POS_NUM_FICHIER_POSEIDON", $iNumFichierCorrespondant);
    		    
    		    if ($bAfficherFichierDocLie)
    		    {
                    $retour = pos_getinfopage($jeton, $iNumDocCorrespondant, $iNumFichierCorrespondant, 0, /*pref*/$struInfoPage);
                    if (!$retour)
                        debug ($jeton);
                }
                else
                    $struInfoPage = $tabStruListePage[$iNumFichierCorrespondant - 1];
                    
    		    if ($retour)
    		    {
                    $iNumberPage = 1;
        		    // le fichier n'est pas affichable directement => recherche sous-fichier
        		    if  ( !(strcmp($struInfoPage->szNature, CST_NATURE_FICHIER_PDF) == 0 ||
                        strcmp($struInfoPage->szNature, CST_NATURE_FICHIER_JPG) == 0 || 
                        strcmp($struInfoPage->szNature, CST_NATURE_FICHIER_TIFF) == 0))
                    {
                        $retour = pos_getlisteinfopage($jeton, $iNumDocCorrespondant, $iNumFichierCorrespondant, /*pref*/$tabStruListeSsPage);
                        if (count($tabStruListeSsPage) > 0)
        		        {
        		            if (strcmp($tabStruListeSsPage[0]->szNature, CST_NATURE_FICHIER_PDF) == 0 ||
                                strcmp($tabStruListeSsPage[0]->szNature, CST_NATURE_FICHIER_JPG) == 0 || 
                                strcmp($tabStruListeSsPage[0]->szNature, CST_NATURE_FICHIER_TIFF) == 0)
                            {
                                $iNumSousFichier = 1;
                            }
        		        }
                    }
                }
                
                $t->set_var("POS_NUM_SSFICHIER", $iNumSousFichier);
                $t->set_var("NB_PAGES_FICHIER", $iNumberPage);
                $t->parse ("bloc_avec_fichiers", "BLOC_AVEC_FICHIERS", true);
                $t->set_var("bloc_sans_fichiers", "");
            }
            
            //$time = getmicrotime() - $time_start;
            //echo("Temps ecoule : ".$time);
            $t->pparse("Output", "menuFichier");
		}
		else
		{
		    if(!$retour)
				debug ($jeton);
            afficheMsg("Il n'y a pas de fichier associé à ce document"); 
        }
	}
	else
	{
		debug ($jeton);	
	}
   
    pos_disconnect($jeton);

}

function getNumPagesInPDF($PDFPath) 
{
    $stream = @fopen($PDFPath, "r");
    $PDFContent = @fread ($stream, filesize($PDFPath));
    if(!$stream || !$PDFContent)
        return false;
        
    $firstValue = 0;
    $secondValue = 0;
    if(preg_match("/\/N\s+([0-9]+)/", $PDFContent, $matches)) {
        $firstValue = $matches[1];
    }
     
    if(preg_match_all("/\/Count\s+([0-9]+)/s", $PDFContent, $matches))
    {
        $secondValue = max($matches[1]);
    }
    return (($secondValue != 0) ? $secondValue : max($firstValue, $secondValue));
}
?>
