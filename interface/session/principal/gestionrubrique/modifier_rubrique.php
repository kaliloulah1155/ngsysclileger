<?php
/* 
 * Modification ou création d'une rubrique
 * 
 *
 * PL 27/05/2011
 *

 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/label_admin_".$_SESSION["sess_langue"].".conf");

if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $retour = connexion($jeton);
    
    if ($retour)
    {
        $szCodeRubrique = stripslashes(urldecode($_REQUEST['POS_CODE_RUBRIQUE']));
       
        // Si on est en ajout
        if(strcmp($_REQUEST['MODE'], "CREATION") == 0 || strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
        {
    		$objRubrique = array();
    		$objRubrique["szRubrique"]  = $szCodeRubrique;
    		$objRubrique["szNomRub"]  = stripslashes(urldecode(trim($_REQUEST['POS_LIBELLE_RUBRIQUE'])));
           	$objRubrique["bInvisible"]  = isset($_REQUEST['POS_ATTRIBUT_INVISIBLE'])? 1: 0;
           	$objRubrique["bMonoCritere"]  = $_REQUEST['POS_MONOCRITERE'];
           	$objRubrique["bSecondaire"]  = isset($_REQUEST['POS_ATTRIBUT_SECOND'])? 1: 0;
           	$objRubrique["bThesaurus"]  = strcmp($_REQUEST['POS_CODE_THESAURUS_RUBRIQUE'], "") == 0 ? 0 : 1;
           	$objRubrique["szCodeThesaurus"]  = $_REQUEST['POS_CODE_THESAURUS_RUBRIQUE'] ;
           	$objRubrique["wTypeRub"]  = $_REQUEST['POS_CHOIX_TYPE_RUBRIQUE'] ;
           	$objRubrique["wNbCharMot"]  = $_REQUEST['POS_NB_CAR_MAX_INDEX_RUBRIQUE'];
           	
           	if (strcmp($_REQUEST['POS_CHOIX_TYPE_RUBRIQUE'], "0") == 0)
        		$objRubrique["wDomFerme"]  =  $_REQUEST['POS_TYPE_ALPHA_DOMFERME_RUBRIQUE'];
           	elseif (strcmp($_REQUEST['POS_CHOIX_TYPE_RUBRIQUE'], "3") == 0)
           		$objRubrique["wDomFerme"]  =  "0";
           	else
           		$objRubrique["wDomFerme"]  =  $_REQUEST['POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE'];
           	
    		if ($objRubrique["wDomFerme"] == 0)
    			$objRubrique["wControleDomFerme"] = 2;
    		else
    			$objRubrique["wControleDomFerme"]  =  isset($_REQUEST['POS_CONTROLE_DOMFERME_RUBRIQUE'])?  $_REQUEST['POS_CONTROLE_DOMFERME_RUBRIQUE'] : 0;
    		
    		$retour = pos_setrubrique($jeton, /*pref*/$objRubrique); 
    		if (!$retour)
    	            debug($jeton);
    		include("liste_rubrique.php");
    
        } 
        else if (strcmp($_REQUEST['MODE'], "SUPPRESSION") == 0)
    	{
    		// on vérifie l'apppartenance à un type de document
    		$bRubDansTypeDoc = false;
    		$retour = pos_getlistalltypes($jeton, /*pref*/$tabListeTypeDoc);
    		if($retour)
    		{
    			foreach ($tabListeTypeDoc as $keyDoc => $valueDoc)
    			{
    				if ($bRubDansTypeDoc == true)
    					break;
    				else
    				{
    					$retour = pos_getlistrubintype($jeton,$keyDoc, /*pref*/$tabCodeLibRub);
    					if($retour)
    					{				
    						while(list($code, $valeur) = each($tabCodeLibRub))
    						{
    							if(strcmp($szCodeRubrique,$code) == 0)
    							{
    								$bRubDansTypeDoc = true;
    								break;
    							}
    						}
    					}
    				}		
    			}
            }
            else
            	debug($jeton);	
            
    		if ($bRubDansTypeDoc == false)
    		{
    			$retour = pos_delrubrique($jeton, $szCodeRubrique);
    	        if (!$retour)
    	            debug($jeton);
        		include("liste_rubrique.php");    		
        	}
        	else 
    			echo CSTE_MESSAGE_RUBRIQUE_DANS_TYPEDOC; 
            
        }
       
        
        
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
} 
?>
