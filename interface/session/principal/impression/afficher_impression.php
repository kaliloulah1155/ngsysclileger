<?php
/*
*
*	Mise en page pour impression de la liste resumée
*	si un template est defini on utilise ce template
*	sinon on affiche la liste résumée.
*
*	Variable en entrée : INUMQUEST - numéro de la question
*	                     POS_NUMDOS - numéro du dossier
*	                     LISTE_NUMDOC : liste de numeros selectionne manuellement
*						 PROFIL_LR - profil lr utilisé
*                        POS_LR_TRI_TYPE - Type de tri
*                        POS_LR_TRI_NUM_COL - Tri sur la colonne
*  GG : 23.12.2010 : reprise du code, ajout possibilité de selection manuelle
*
*/

include ("../include/locution.inc.php");
session_start();

include ("../include/connexion.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/profil.inc.php");
include ("../include/form_values.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("SEPARATEUR","\x02");


$retour = connexion($jeton);
if($retour)
{
    $bExport = true;
	// on recupere le profil de la liste résumée pour avoir le type de document 
	// dans le cas d'un dossier et les libelles des rubriques.
	$szProfilLR = urldecode($_REQUEST["PROFIL_LR"]);
	$retour = pos_gestplr($jeton, $szProfilLR, /*pref*/$objLR, /*pref*/$tabZoneLR);
	if(!$retour)
		debug($jeton);
	$szCodeTypeDoc = $objLR->type_doc_ref;
	
	// Nom du template pour affichage de la liste resumee par type de doc.
	$file_tpl = "../../../tpl/".$_SESSION["sess_application"]."/$szCodeTypeDoc/impression_lr_".$szCodeTypeDoc."_0.tpl";
	
	// si template specique, recuperation de toutes les valeurs de rubriques par un export excel.
	// sinon, export de la liste résumée
	$bExportLR = true;
    if(file_exists($file_tpl))
	   $bExportLR = false;
	// cas d'une question sans sélection de document
	if(strlen(trim($_REQUEST["LISTE_NUMDOC"])) == 0 && strlen($_REQUEST["INUMQUEST"]) > 0)
	{
		// recuperation des locutions de la question posée 
		$tabLoc = array_slice($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]], 0, count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]));		
		$retour = pos_searchdoc($jeton,count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
		if($retour && $bExportLR)
		{
			$retour = pos_getreponseslrd($jeton,$iAdrPremiereReponse,$iNbReponses,$iNbReponses,
                            $_REQUEST["POS_LR_TRI_NUM_COL"], $_REQUEST["POS_LR_TRI_TYPE"], /*pref*/$szProfilLR,/*pref*/$tabRepLR);
		}
	}
	else 
    {
        // cas d'un dossier sans sélection de document
        if(strlen(trim($_REQUEST["LISTE_NUMDOC"])) == 0 && strlen($_REQUEST["POS_NUMDOS"]) > 0)
    	{
    		if($bExportLR)
    		{
                $retour = pos_constlrdavecattributs($jeton, $_REQUEST["POS_NUMDOS"], 50, $_REQUEST["POS_LR_TRI_NUM_COL"], 
                                                    $_REQUEST["POS_LR_TRI_TYPE"], /*pref*/$szProfilLR,/*pref*/$tabRepLR,/*pref*/$tabzonelrd);
    		}
    		else
    		{	
    			$retour = pos_dosinfocontenu($jeton, $_REQUEST["POS_NUMDOS"], /*pref*/$tabFils);
    			for($i=0;$i<count($tabFils);$i++)
    				$tabNumDoc[$i] = $tabFils[$i]->doc_numero;
    		}
    	}
    	// sélection manuelle de document
    	else if (strlen(trim($_REQUEST["LISTE_NUMDOC"])) > 0)
    	{
            $listeTabNumDoc = $_REQUEST["LISTE_NUMDOC"];
            // suppression du dernier ;
            $listeTabNumDoc = substr($_REQUEST["LISTE_NUMDOC"], 0, strlen($_REQUEST["LISTE_NUMDOC"]) - 1);
            $tabNumDoc = explode (";", $listeTabNumDoc);
		        
            if($bExportLR)
    		{	
    			$retour = pos_constnumlrd($jeton, $tabNumDoc, count($tabNumDoc), $_REQUEST["POS_LR_TRI_NUM_COL"], 
                                                    $_REQUEST["POS_LR_TRI_TYPE"], /*pref*/$szProfilLR, /*pref*/$tabRepLR);
    		}
        }
        else
        {
            $bExport = false;
            afficheMsg("Il n'y a pas de document à imprimer.");
        }
    } 
    
    if($retour && $bExport)
    {			
    	if(!$bExportLR)
    	{
    		$fileTmp = tempnam(getRepTmp(), "POS_");
    		if(strlen(trim($_REQUEST["LISTE_NUMDOC"])) == 0 && strlen($_REQUEST["INUMQUEST"]) > 0)
    			$retour = pos_exportexcelttsrep($jeton,	$iAdrPremiereReponse, $iNbReponses, 0, SEPARATEUR, $fileTmp);
    		else
    		{
    		    $retour = pos_exportexcel($jeton, $tabNumDoc, count($tabNumDoc), $_REQUEST["POS_NUMDOS"], SEPARATEUR, $fileTmp);
            }
    		
    		if(!$retour)
    		  debug($jeton);
            else
    		{
    		    $tabLigne = file($fileTmp);
        		
                $t = new Template(".");
        		$t->set_file("impression", $file_tpl);
        		$t->set_block("impression", "LISTE_REPONSES", "liste_reponses");
        		$tabEntete = explode(SEPARATEUR, $tabLigne[0]);
        	
        		for($i=1;$i<count($tabLigne);$i++)
        		{
            	  	$tabChamps = explode(SEPARATEUR, $tabLigne[$i]);
              		for($j=0;$j<count($tabChamps)-1;$j++)
              		{
              			$szCodeRub = "POS_VAL_RUB_".$tabEntete[$j];
              			$t->set_var($szCodeRub, htmlentities_currentcharset($tabChamps[$j], null));
              		}
              		$t->parse("liste_reponses","LISTE_REPONSES",true); 
        		}
        		//suppression du fichier
        		unlink($fileTmp);
        		$t->pparse("MyOutput", "impression");
            }
    	}
    	else
    	{
    		$file_tpl = REP_TEMPLATE_APPLICATIF."impression/imprimer.tpl";
    		$t = new Template(".");
    		$t->set_file("impression", $file_tpl);
    		$t->set_block("impression", "CHAMPS_LR", "champs_lr");
    		$t->set_block("impression", "LISTE_REPONSES", "liste_reponses");
    		
    		if(isset($tabRepLR))
    		{
    			for($i=0;$i<count($tabRepLR);$i++)
    			{
                    $tabChamps = explode(SEPARATEUR,$tabRepLR[$i]->lr);
                    for($j=0;$j<count($tabChamps)-1;$j++)
    			    {
                        $t->set_var("POS_ENTETE_COL", $tabZoneLR[$j]->zone_titre_col);
                        $t->set_var("POS_VALEUR_CHAMPS", htmlentities_currentcharset($tabChamps[$j], null));
                        $t->parse("champs_lr","CHAMPS_LR",true);
                    }
    			    $t->parse("liste_reponses","LISTE_REPONSES",true);
                    $t->set_var("champs_lr", "");
    			}
    		}
    		$t->pparse("MyOutput", "impression");
    	}
    }
    else
        debug($jeton);	
	
	pos_disconnect($jeton);
}
else
	debug($jeton);

?>