<?php
/* 
 * suppression d'une liste hiérarchique
 * PL 19/10/2011
 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");

$retour = connexion($jeton);
if ($retour)
{	
	$szCodeNewListeHier = $_REQUEST['POS_CODE_LISTHIER'];
	if (function_exists("pos_lsthierdelete"))
    {
        $retour = pos_lsthierdelete($jeton, $szCodeNewListeHier);
        if (!$retour)
            debug($jeton);
    }
    else
    {
        $tabInfoDebug = array();
        $tabInfoDebug[] = "Cette fonction n'est pas disponible dans votre librairie php_vulcain";
        debug_code($tabInfoDebug);
    }
	include("liste_listhier.php");
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
} 	
?>
