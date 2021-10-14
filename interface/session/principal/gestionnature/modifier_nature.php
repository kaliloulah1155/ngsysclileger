<?php
/* 
 * Modification ou création d'une nature
 * PL 30/03/2011
 * 26.02.2013 GG : reprise et corrections
 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");

if ($_SESSION["sess_droitAdministration"] == false)
{	
	afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
}
else
{
    $retour = connexion($jeton);
    if ($retour)
    {	
        $szCodeNature = stripslashes(urldecode($_REQUEST['POS_CODE_NATURE']));
    	$szAutresWebExtNature = "";
        if(strcmp($_REQUEST['MODE'], "CREATION") == 0 || strcmp($_REQUEST['MODE'], "MODIFICATION") == 0)
        {
            $objNature = new stdClass();
            $objNature->szNature = $szCodeNature; 
            $objNature->bFormatter = (isset($_REQUEST['POS_CTRL_BLOC_FORMATAGE'])) ? 1 : 0;
    		$objNature->szNomNature = $_REQUEST['POS_LIBELLE_NATURE'];
     		$objNature->szExtension = $_REQUEST['POS_EXT_NATURE'];		
    		$objNature->wTypeFic = $_REQUEST['POS_TYPE_FICHIER'];
    		$objNature->szCmdFormat = $_REQUEST['POS_OUTIL_FORMATAGE'];
    		$objNature->szCmdSuppFormat = $_REQUEST['POS_OUTIL_SUPP_FORMATAGE'];
    		$objNature->szTypeMIME = $_REQUEST['POS_TYPE_MIME'];
    		$objNature->szCharset = $_REQUEST['POS_CHARSET'];
    		
    		$retour = pos_setnature($jeton, /*pref*/$objNature);
    		
    		$szAutresWebExtNature = $_REQUEST['POS_AUTRES_WEB_EXT_NATURE'];	
        }
        else if (strcmp($_REQUEST['MODE'], "SUPPRESSION") == 0)
    	{
            $retour = pos_delnature($jeton, $szCodeNature);
        }
        
        if ($retour)
        {
            include("modifier_fichier_nature.inc.php");
            // reecriture complèete du fichier des natures
            majFichierNature($jeton, $szCodeNature, $szAutresWebExtNature);
        }
        else
            debug($jeton);
            
    	include("liste_nature.php");
        	
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
 
?>