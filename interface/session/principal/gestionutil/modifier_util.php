<?php
/* 
 * Modification ou ajout d'un utilisateur
 * (Nom, Email, Profil)
 *
 * Seb 10/2004
 *
 * Données en entrée :
 *		POS_CODE_UTIL : Code de l'utilisateur
 *      POS_NOM_UTIL : Nom de l'utilisateur
 *      POS_PROFIL_UTIL : Profil de l'utilisateur
 *      POS_MAIL_UTIL : Mail de l'utilisateur
 *      POS_OLD_NOM_UTIL : Nom de l'utilisateur avant modif éventuelle
 *      POS_OLD_MAIL_UTIL : Profil de l'utilisateur avant modif éventuelle
 *      POS_OLD_PROFIL_UTIL : Mail de l'utilisateur avant modif éventuelle
 *      B_CREATION : 1 si on est en création d'un util                                                                                                
 * 
 * 31.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
 * 21.02.2011 PL Modification pour la gestion LDAP et ajout de l'orgalisation et de l'unité  
 */  
session_start();                                                                                        
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include("../include/md5.inc.php");
include("../include/fonction_cryptage.php");

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
        $szNomUtil = stripslashes(urldecode($_REQUEST['POS_NOM_UTIL']));
        $szOldNomUtil = stripslashes($_REQUEST['POS_OLD_NOM_UTIL']);
    		
    	$bSuppression = false;
    	
        // Si on est en ajout d'utilisateur
        if(strcmp($_REQUEST['B_CREATION'], "1") == 0)
        {
            $retour = pos_ajoututilisateur($jeton, $szCodeUtil, $szNomUtil, stripslashes($_REQUEST['POS_MAIL_UTIL']), 
                            stripslashes($_REQUEST['POS_UNITE_UTIL']), stripslashes($_REQUEST['POS_ORGANISATION_UTIL']));
    		if($retour)
    		{					
    			$szCreationPwd = decrypt_text($_REQUEST['POS_CREATION_PWD'], $_SESSION["sess_crypt_key"]);
    			$szCopieCreationPwd = decrypt_text($_REQUEST['POS_COPIE_CREATION_PWD'], $_SESSION["sess_crypt_key"]);
    			$retour = pos_changepwdadmin($jeton, $szCodeUtil, $szCreationPwd);
    			if(!$retour)
                {
    				debug($jeton);
        			$retour = pos_delutilisateur($jeton, $szCodeUtil);
        			if(!$retour)
                	   debug($jeton);
    				else
    					$bSuppression = true;
    			}
    		}
        } 		
        else {
            // modification du nom, mail, organisation, unite si nécessaire
            // possible qu'en absence de connexion LDAP 
            if(strcmp($_REQUEST['CONNEXION_LDAP'], "0") == 0)
    	    {
                if(strcmp($szNomUtil, $szOldNomUtil)!=0 || 
    	            strcmp($_REQUEST['POS_MAIL_UTIL'],$_REQUEST['POS_OLD_MAIL_UTIL'])!=0 ||
    	            strcmp($_REQUEST['POS_ORGANISATION_UTIL'],$_REQUEST['POS_OLD_ORGANISATION_UTIL'])!=0 ||
    	            strcmp($_REQUEST['POS_UNITE_UTIL'],$_REQUEST['POS_OLD_UNITE_UTIL'])!=0
    			)
    	        	//$retour = pos_setinfoutil($jeton, $szCodeUtil, $szNomUtil, stripslashes($_REQUEST['POS_MAIL_UTIL']));
    	        	$retour = pos_setinfoutil($jeton, $szCodeUtil, $szNomUtil, stripslashes($_REQUEST['POS_MAIL_UTIL']), stripslashes($_REQUEST['POS_UNITE_UTIL']), stripslashes($_REQUEST['POS_ORGANISATION_UTIL']));
    	        	if(!$retour)
                		debug($jeton);
    		} 
        }
        
        if($retour && $bSuppression == false)
        {
            $newlisteProfilUtil = array();
            if (isset($_REQUEST['POS_LISTE_PROFIL_UTIL']) 
                        && strlen($_REQUEST['POS_LISTE_PROFIL_UTIL']) != 0)
                $newlisteProfilUtil = explode("###",$_REQUEST['POS_LISTE_PROFIL_UTIL']);
          	$oldlisteProfilUtil = array();
          	// si réaffichage aprés création avortée du fait d'un mauvais mot de passe
          	// il ne faut pas tenir compte des profils définis alors
          	if(strcmp($_REQUEST['B_CREATION'], "1") != 0)
                $oldlisteProfilUtil = explode("###",$_REQUEST['POS_OLD_LISTE_PROFIL_UTIL']);
          
          	$newProfilDefaut = $_REQUEST['POS_PROFIL_DEFAUT']; 
    		$oldProfilDefaut = (count($oldlisteProfilUtil) > 0) ? $oldlisteProfilUtil[0] : "";
          	
          	// array_diff ne retourne pas un tableau réindéxé mais concerve les clés
          	$ProfilAjoute = array_diff($newlisteProfilUtil,$oldlisteProfilUtil); 
          	$ProfilSupprime = array_diff($oldlisteProfilUtil,$newlisteProfilUtil);
    
          	// ajout de profils
          	foreach($ProfilAjoute as $key => $newprofil) //et non pas for($i=0; $i<count($ProfilAjoute); $i++) !
          	{
          		$retour = pos_setlienprofilutil($jeton, $szCodeUtil, stripslashes($newprofil));
    		}	 
    		
    		// Boolean : si creation ou utilisateur sans profil, le premier profil est créé par défaut
        	// si on le séléctionne explicitement comme profil par défaut, donc requête redondante => Duplicate record
            $ajouterdefaut = 1;
            if ((strcmp($_REQUEST['B_CREATION'], "1") == 0 || strcmp($oldlisteProfilUtil[0], "") == 0)
            		&& count($newlisteProfilUtil) > 0 && strcmp($newProfilDefaut, $newlisteProfilUtil[0]) == 0)
            	$ajouterdefaut = 0;
          	// défini le profil par défaut
            if($ajouterdefaut == 1)
    			if (strcmp($newProfilDefaut, $oldProfilDefaut) != 0)
    			{
    			  $retour = pos_gestlienutilprofil($jeton, $szCodeUtil, stripslashes($newProfilDefaut), 20, /*pref*/$tab1);
    			}
    
          	// suppression de profils
    		foreach($ProfilSupprime as $key => $oldprofil)
            {
    		    if (strlen(trim($oldprofil)) > 0)
                    $retour = pos_gestlienutilprofil($jeton, $szCodeUtil, stripslashes($oldprofil), 10, /*pref*/$tab2);
            }
            if(!$retour)
                debug($jeton);
        }
        else
            debug($jeton);
            
        if (strcmp($_REQUEST['POS_REAFFICHAGE'],"1") == 0 || $bSuppression == true)
           include("afficher_modif_user.php");
        else
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
