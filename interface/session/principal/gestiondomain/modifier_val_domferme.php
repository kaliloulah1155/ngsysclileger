<?php
/* 
 * Modification des valeurs d'un domaine ferm� normal
 * 
 *
 * PL 08/2007
 *
 * Donn�es en entr�e :
 * POS_CODE_RUB : Code de la rubrique
 * POS_CODE_DOMFERME : Code de la valeur du domaine ferm�
 * POS_LIBELLE_DOMFERME : Libelle de la valeur du domaine ferm�
 * B_CREATION : Si on est en cr�ation d'une valeur
 *               
 *	PL 04/2011  
 *  Modification pour domaines ferm�s non alphanum�riques            
 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");

if ($_SESSION["sess_droitGestDomainFerme"] == false && $_SESSION["sess_droitAdministration"] == false)
{	
	echo CST_LIBELLE_NO_ADMIN_DOMFERME;
}
else
{
    $retour = connexion($jeton);
    if ($retour)
    {
    	if(strcmp($_REQUEST['POS_DOMFERME_NON_ALPHANUM'], "0") == 0 )
    	{ 
    		$szCode = isset($_REQUEST['POS_CODE_DOMFERME']) ? stripslashes(urldecode($_REQUEST['POS_CODE_DOMFERME'])) : "";
    		$szlibelle = isset($_REQUEST['POS_LIBELLE_DOMFERME']) ? stripslashes(urldecode($_REQUEST['POS_LIBELLE_DOMFERME'])) : "";;
    		$szNewCode =  isset($_REQUEST['POS_NEW_CODE_DOMFERME']) ? stripslashes($_REQUEST['POS_NEW_CODE_DOMFERME']) : "";
    		$szNewLibelle = isset($_REQUEST['POS_NEW_LIBELLE_DOMFERME']) ? stripslashes($_REQUEST['POS_NEW_LIBELLE_DOMFERME']) : "";
    	}
    	else 
    	{	
    		// pas d'ancien libelle dans le cas de l'ajout.
            $szCode = isset($_REQUEST['POS_LIBELLE_DOMFERME']) ? stripslashes(urldecode($_REQUEST['POS_LIBELLE_DOMFERME'])) : "";
    		$szlibelle = "";
            // pas de nv lib dans le cas de la suppression
    		$szNewCode =  isset($_REQUEST['POS_NEW_LIBELLE_DOMFERME']) ? stripslashes($_REQUEST['POS_NEW_LIBELLE_DOMFERME']) : "";
    		$szNewLibelle = $szNewCode;
    	}
    	
    	if(strcmp($_REQUEST['SERVICE'], "suppression" ) == 0)
        {
        	$retour = pos_deltermedomaineferme($jeton, $_REQUEST['POS_CODE_RUB'], $szCode , $szlibelle);
        }
        else if(strcmp($_REQUEST['SERVICE'], "ajout" ) == 0)
        {
        	$retour = pos_settermedomaineferme($jeton, $_REQUEST['POS_CODE_RUB'], $szNewCode, $szNewLibelle);
        }
    	else if(strcmp($_REQUEST['SERVICE'], "modification" ) == 0)
        {
          	// modification si le libelle est r�ellement modifi�
          	if(strcmp($szlibelle, $szNewLibelle) != 0)     
            	$retour = pos_settermedomaineferme($jeton, $_REQUEST['POS_CODE_RUB'], $szNewCode, $szNewLibelle);
    	}
        
        if ($retour)
        {
        	include("fct_ecrire_fichier.inc.php");
            ecrireValeursFichier($jeton, $_REQUEST['POS_CODE_RUB'], false);
            include("consulter_rub_domferme.php");
        }
        else
            debug($jeton);
        
        pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    } 
} 
?>