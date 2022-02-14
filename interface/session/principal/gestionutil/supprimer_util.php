<?php
/* 
 * Suppression d'un utilisateur
 *
 * Seb 10/2004
 *
 * Données en entrée :
 *		POS_CODE_UTIL : Code de l'utilisateur
 *                                                                                                      
 * 31.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
 * 				 urldecodage de la donnee en entree
 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

if ($_SESSION["sess_droitAdminUtilisateur"] == false && $_SESSION["sess_droitAdministration"] == false)
{
	echo CST_LIBELLE_NO_ADMIN_USER;
}
else
{
    $retour = connexion($jeton);
    
    if ($retour)
    {
        $szCodeUtil = stripslashes(urldecode($_REQUEST['POS_CODE_UTIL']));
        $retour = pos_delutilisateur($jeton, $szCodeUtil);
    
        if(!$retour)
            debug($jeton);
            
        include("consulter_util.php");
    
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>