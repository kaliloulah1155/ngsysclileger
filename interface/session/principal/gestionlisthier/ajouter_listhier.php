<?php
/* 
 * création d'une liste hiérarchique
 * PL 18/10/2011
 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");

$retour = connexion($jeton);
if ($retour)
{
	$szCodeNewListeHier = stripslashes(urldecode($_REQUEST['POS_CODE_LISTHIER']));
	$szLibelleNewListeHier = stripslashes(urldecode($_REQUEST['POS_LIBELLE_LISTHIER']));
	
    if (function_exists("pos_lsthiercreation"))
    {
        $retour = pos_lsthiercreation($jeton, $szCodeNewListeHier, $szLibelleNewListeHier);
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
