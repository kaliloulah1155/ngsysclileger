<?php
/**
 *
 * 11/07/2003 : FT : Création de l'include
 *
 * Donnees en entree : 
 * $iNumQuestHist -> numéro de la question sur l'historique
 *
 * Données en sorties
 * $linkHis -> lien vers la modification de la recherche
 * $bModif -> true si on doit faire afficher l'image false sinon
 *
 * Mofification : 
 * Seb : passage en fonction avec $bModif pour visualiser ou non l'image
 */

if (!defined("RAPPEL_HIST"))
{
	define("RAPPEL_HIST", 1);

    function getLienHistorique($iNumQuestHist, &$bModif)
    {
        $bModif = true;
    
    	// on fixe le lien pour un rappel de la question en fonction du type de la recherche (thesaurus ou non)
    	if($_SESSION["sess_tabHistQuest"][3][$iNumQuestHist] == "RECHERCHE_ELABOREE")
    	{
    		$locutions = $_SESSION["sess_tabHistQuest"][0][$iNumQuestHist];
            $sCodeTypeTmp = "";
            for($i=0;$i<count($locutions);$i++)
            {
                if ((strlen($sCodeTypeTmp) != 0 && strcmp($sCodeTypeTmp, trim($locutions[$i]->szCodeType)) != 0) 
                        || strcmp($locutions[$i]->szCodeTypeLie, "000") == 0)
                {
                    $bModif = false;
                    break;
                }
                else
                    $sCodeTypeTmp = trim($locutions[$i]->szCodeType);
            }    
            $linkHis = sprintf(URL_PARAM_RECHERCHE_ELABOREE , $iNumQuestHist, urlencode($_SESSION["sess_tabHistQuest"][0][$iNumQuestHist][0]->szCodeType));
    	}	
    	else
       if($_SESSION["sess_tabHistQuest"][3][$iNumQuestHist] == "RECHERCHE_SIMPLE")
     	{
    		$szCodeTypeDoc = $_SESSION["sess_tabHistQuest"][0][$iNumQuestHist][0]->szCodeType;
     		if (isset($_SESSION["sess_tabHistQuest"][5][$iNumQuestHist]) && strlen($_SESSION["sess_tabHistQuest"][5][$iNumQuestHist]) != 0)
     	    	$linkHis = sprintf(URL_PARAM_RECHERCHE_SIMPLE_NUM_FICHE, $iNumQuestHist, urlencode($szCodeTypeDoc), $_SESSION["sess_tabHistQuest"][5][$iNumQuestHist]);
			else
				$linkHis = sprintf(URL_PARAM_RECHERCHE_SIMPLE, $iNumQuestHist, urlencode($szCodeTypeDoc));
     	}
     	else
      	if($_SESSION["sess_tabHistQuest"][3][$iNumQuestHist] == "RECHERCHE_POS_NUM_DOC")
      	{
    		$linkHis = sprintf(URL_PARAM_RECHERCHE_POS_NUM_DOC, $_SESSION["sess_tabHistQuest"][0][$iNumQuestHist][0]->szValeur1);
    	}
    	else
    	if($_SESSION["sess_tabHistQuest"][3][$iNumQuestHist] == "RECHERCHE_FTX_LOC")
    	{
    		$linkHis = sprintf(URL_PARAM_AFFICHER_RECHERCHE_FTX_LOC, $iNumQuestHist);
    	}
    	else
    	if($_SESSION["sess_tabHistQuest"][3][$iNumQuestHist] == "RECHERCHE_CLE")
    	{
    		$linkHis = sprintf(URL_PARAM_RECHERCHE_CLE_2, $iNumQuestHist, $_SESSION["sess_tabHistQuest"][0][$iNumQuestHist][0]->szCodeType);
    	}
    	else
    	if($_SESSION["sess_tabHistQuest"][3][$iNumQuestHist] == "RECHERCHE_EXCALIBUR")
        {	
            $bModif = false;
        }
    	else
    	{
    		//Cas des recherches bibliothèques ..... ou non encore référencé
			include ("../../../../configuration_w/constantesPHP.conf.php");
    		$linkHis = 	URL_SITE."/interface/accueil.htm";
    		$bModif = false;
    	}
    
    	return $linkHis;
   }
}

?>