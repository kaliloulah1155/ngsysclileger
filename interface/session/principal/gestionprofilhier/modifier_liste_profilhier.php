<?php
/* 
 * Suppression ou ajout d'un profil hiérarchique
 *
 * PL 08/03/2011
 *
 * Données en entrée :
 *		POS_PROFIL_HIER : Profil hiérarchique                                                                                            
 * 
   
 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
 
$retour = connexion($jeton);

if ($retour)
{
    $szProfilHier = stripslashes(urldecode($_REQUEST['POS_PROFIL_HIER']));
    
	$iNbProfils = 1;
    // Si on est en ajout
    if(strcmp($_REQUEST['MODE'], "CREATION") == 0)
    {	
		$retour = pos_gestprofil($jeton, PHP_VULCAIN_SET, PHP_VULCAIN_PROFIL_UTI, /*pref*/$iNbProfils, /*pref*/$szProfilHier);
		if (!$retour)
			debug($jeton);	
    } 
    else if (strcmp($_REQUEST['MODE'], "SUPPRESSION") == 0)
	{   
        $retour = pos_gestprofil($jeton, PHP_VULCAIN_DEL, PHP_VULCAIN_PROFIL_UTI, /*pref*/$iNbProfils, /*pref*/$szProfilHier);
        if (!$retour)
			debug($jeton);
    }
       
	include("liste_profilhier.php");
	
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
} 
 
?>
