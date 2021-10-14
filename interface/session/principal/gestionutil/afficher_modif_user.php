<?php
/* 
 * Modifications de paramètres de l'utilisateur
 * (Nom, Email, Profil)
 *
 * Seb 10/2004
 *
 * Données en entrée :
 *		POS_CODE_UTIL : Code de l'utilisateur
 *      POS_NOM_UTIL : Nom de l'utilisateur
 *      POS_PROFIL_UTIL : Profil de l'utilisateur
 *      POS_MAIL_UTIL : Mail de l'utilisateur
 *                                                                                                      
 * 31.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
 * 				 urldecodage des donnees en entrees
 * 				 le repertoire du template appelé est renommé (utilisateur --> gestionutil)
 * 13.08.2007 PL Modifications pour pouvoir ajouter et supprimer des profils, redéfinir le profil par défaut
 * 21.02.2011 PL Modification pour la gestion LDAP et ajout de l'orgalisation et de l'unité 
 */
if (!isset($_SESSION))
    session_start();                                                                                  
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

if ($_SESSION["sess_droitAdminUtilisateur"] == false && $_SESSION["sess_droitAdministration"] == false)
{
	echo CST_LIBELLE_NO_ADMIN_USER;
}
else
{
    $retour = connexion($jeton);
    
    if ($retour)
    {
        // vide dans le cas d'une creation
        $szCodeUtil = isset($_REQUEST['POS_CODE_UTIL']) ? stripslashes(urldecode($_REQUEST['POS_CODE_UTIL'])) : "";
        $szNomUtil = isset($_REQUEST['POS_NOM_UTIL']) ? stripslashes(urldecode($_REQUEST['POS_NOM_UTIL'])) : "";
        
        // $tabInfoProfil : les propriétés des profils de l'application
        $retour = pos_getallprofilutil($jeton, /*pref*/$tabInfoProfil);
        
        // $tabLienUtilProfil : toutes les occurences utilisateurs-profils pour l'application
    	if($retour)
    		$retour = pos_gestlienutilprofil($jeton, $szCodeUtil, null, 11 , /*pref*/$tabLienUtilProfil);
    		
        if($retour)
        {
        	// construction du tableau des profils de l'utilisateur
        	// !!! à l'indice 0 on a le profil par défaut !!!
        	$j=0;
        	$tabProfil = array();
        	if(!isset($_REQUEST['B_CREATION']) || $_REQUEST['B_CREATION'] != 1)
        	{
        		for($i=0;$i<count($tabLienUtilProfil);$i++)
        		{
        			if(strcmp(trim($tabLienUtilProfil[$i]->szApplication), $_SESSION["sess_application"]) == 0)
        			{
        				if($tabLienUtilProfil[$i]->dwParDefaut == 1)
        				{
        					if($j==0)
        						$tabProfil[$j] = trim($tabLienUtilProfil[$i]->szProfil);
        					else
        					{
        						$tmp = $tabProfil[0];
        						$tabProfil[0] = trim($tabLienUtilProfil[$i]->szProfil);
        						$tabProfil[$j] = $tmp;
        					}	
        				}
    					else
    					    $tabProfil[$j] = trim($tabLienUtilProfil[$i]->szProfil);
    					$j++;
        			}
        		}
        	}
        	// réaffichage en création aprés soumission d'un mot de passe incorrecte
        	else if (isset($_REQUEST['B_CREATION']) && $_REQUEST['B_CREATION'] == 1 && isset($_REQUEST['POS_CODE_UTIL']))
        	{
    			$tabProfil = explode("###", $_REQUEST['POS_LISTE_PROFIL_UTIL']);
    		
    		}
            // Affichage
    		$t = new Template(".");
    
    		$t->set_File("utilisateur", REP_TEMPLATE_APPLICATIF."gestionutil/modif_utilisateur.tpl");
    		
    		$t->set_block("utilisateur", "BLOC_TOUS_PROFIL", "bloc_tous_profil");
    		$t->set_block("utilisateur", "BLOC_CREATION_PWD", "bloc_creation_pwd");
    		$t->set_block("utilisateur", "BLOC_PROFIL_UTIL", "bloc_profil_util");
    		$t->set_block("utilisateur", "BLOC_MODIF_PWD", "bloc_modif_pwd");
    		
    		if((isset($_REQUEST['B_CREATION']) && strcmp($_REQUEST['B_CREATION'], "1") == 0) && 
                    (!isset($_REQUEST['POS_REAFFICHAGE']) || strcmp($_REQUEST['POS_REAFFICHAGE'], "1") != 0))
    			$bCreation = true;
    		else
    		 	$bCreation = false;
    		
    		// modification car au réaffichage la variable était créée = 0 et il y avait tentative d'ajout de l'utilisateur 
    		if($bCreation)               
    		{
    		    $t->set_var("B_CREATION", "1");
    			$t->set_var("TITRE_PAGE", CST_LIBELLE_PAGE_CREATE_USER);
    			$t->set_var("LIBELLE_PWD_UTIL", CST_LIBELLE_PWD);
    			$t->set_var("LIBELLE_CONFIRM_PWD_UTIL", CST_LIBELLE_CONFIRM_PWD);
    			$t->set_var("SESS_CRYPTKEY", $_SESSION["sess_crypt_key"]);	
    			
    			
    		    $t->set_var("CLASS_READONLY_CODE", "CLASS='inputChamp'");
    			$t->set_var("LIBELLE_REINITIALISER_PWD", CST_LIBELLE_VALIDER);
    			$t->parse("bloc_creation_pwd", "BLOC_CREATION_PWD",true);
    		}
    		else
    		{
        		// ici on est en modification donc on ne peut pas modifier le code util
    		    $t->set_var("CLASS_READONLY_CODE", "READONLY CLASS='verrouille'");
    		    $t->set_var("B_CREATION", "0");
                $t->set_var("TITRE_PAGE", CST_LIBELLE_PAGE_MODIF_USER);
                $t->set_var("LIBELLE_PWD_UTIL", CST_LIBELLE_NEW_PWD);
                $t->set_var("LIBELLE_CONFIRM_PWD_UTIL", CST_LIBELLE_CONFIRM_NEW_PWD);
                
                $t->set_var("bloc_creation_pwd", "");
                
                if (strcmp($_REQUEST['CONNEXION_LDAP'], "1") == 0)
    				 $t->set_var("CLASS_READONLY_INFO", "READONLY CLASS='verrouille'");
                else 
                	 $t->set_var("CLASS_READONLY_INFO", "CLASS='inputChamp'");
    		}
    
            $t->set_var("URL_ATTENTE", URL_ATTENTE);
            $t->set_var("CODE_ACTION", URL_MODIFIE_UTILISATEUR);
            $t->set_var("URL_ANNULER", URL_ATTENTE."?URL=URL_AFFICHE_UTILISATEUR");
    
            $t->set_var("GEST_PARAM_UTILISATEUR", CST_LIBELLE_UTILISATEUR);
    
            $t->set_var("LIBELLE_CODE_UTIL", CST_LIBELLE_CODE_USER);
            $t->set_var("LIBELLE_NOM_UTIL", CST_LIBELLE_NOM_USER);
            $t->set_var("LIBELLE_MAIL_UTIL", CST_LIBELLE_MAIL_USER);
            $t->set_var("LIBELLE_ORGANISATION_UTIL", CST_LIBELLE_ORGANISATION_USER);
            $t->set_var("LIBELLE_UNITE_UTIL", CST_LIBELLE_UNITE_USER);        
            $t->set_var("LIBELLE_TITRE_PWD_UTIL", CST_LIBELLE_PWD);
            $t->set_var("LIBELLE_LISTE_PROFIL", CST_LIBELLE_LISTE_PROFIL);
            $t->set_var("LIBELLE_PROFIL_UTIL", CST_LIBELLE_PROFIL_USER);
            
            $t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
            $t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER);
            $t->set_var("LIBELLE_DEFINIR_PROFIL_DEFAUT", CST_LIBELLE_DEFINIR_PROFIL_DEFAUT_1);
            $t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
            $t->set_var("MESSAGE_REMPLIR_CODE_UTIL", CST_LIBELLE_REMPLIR_CODE_UTIL);
            $t->set_var("MESSAGE_REMPLIR_NOM_UTIL", CST_LIBELLE_REMPLIR_NOM_UTIL);
            $t->set_var("MESSAGE_PROFIL_DEJA_ASSOCIE", CST_LIBELLE_PROFIL_DEJA_ASSOCIE);
            $t->set_var("MESSAGE_DEFINIR_PROFIL_DEFAUT", CST_LIBELLE_DEFINIR_PROFIL_DEFAUT_2);
            $t->set_var("MESSAGE_MOTS_DE_PASSE_DIFFERENTS", CST_MESSAGE_MDPS_DIFFERENTS);
    		
    		$t->set_var("CONNEXION_LDAP",$_REQUEST['CONNEXION_LDAP']);
    
            $t->set_var("CODE_UTIL", htmlentities_currentcharset($szCodeUtil, ENT_QUOTES));
            $t->set_var("NOM_UTIL", htmlentities_currentcharset($szNomUtil, ENT_QUOTES));
            	
            if (isset($_REQUEST['POS_MAIL_UTIL']))
            	$t->set_var("MAIL_UTIL", htmlentities_currentcharset(stripslashes(urldecode($_REQUEST['POS_MAIL_UTIL'])), ENT_QUOTES));
    		else
    			$t->set_var("MAIL_UTIL", "");
    
    		if (isset($_REQUEST['POS_ORGANISATION_UTIL']))
            	$t->set_var("ORGANISATION_UTIL", htmlentities_currentcharset(stripslashes(urldecode($_REQUEST['POS_ORGANISATION_UTIL'])), ENT_QUOTES));
    		else
    			$t->set_var("ORGANISATION_UTIL", "");
    			
    		if (isset($_REQUEST['POS_UNITE_UTIL']))
            	$t->set_var("UNITE_UTIL", htmlentities_currentcharset(stripslashes(urldecode($_REQUEST['POS_UNITE_UTIL'])), ENT_QUOTES));
    		else
    			$t->set_var("UNITE_UTIL", "");
    
            for($i=0; $i<count($tabInfoProfil); $i++)
            {
                $t->set_var("CODE_PROFIL", htmlspecialchars_currentcharset(trim($tabInfoProfil[$i]->szProfil)));
                $t->parse("bloc_tous_profil", "BLOC_TOUS_PROFIL",true);
            }
            
            $tailletabProfil = count($tabProfil);
            $tousProfilUtil = "";
            for($i=0; $i<$tailletabProfil; $i++)
            {
            	// on concerve les profils avant modification.
            	$tousProfilUtil = $tousProfilUtil.$tabProfil[$i];
            	if($i != $tailletabProfil - 1)
                	$tousProfilUtil = $tousProfilUtil."###";
                	
                $t->set_var("PROFIL_UTIL", htmlspecialchars_currentcharset($tabProfil[$i]));
    			
    			// IE(et non Mozilla) ne permettant pas de distinguer des graisses de polices différentes pour
    			// les BALISE OPTION d'un même SELECT,
    			// on applique une classe de style pour la couleur du texte
    			
    			if($i==0)	// profil par défaut en violet 
    				$profilColor = "violet";
    			else
    				$profilColor = "standard";
                $t->set_var("PROFIL_COLOR", $profilColor);
                
                $t->parse("bloc_profil_util", "BLOC_PROFIL_UTIL",true);
            }
       		$t->set_var("OLD_LISTE_PROFIL_UTIL", htmlspecialchars_currentcharset($tousProfilUtil));
       		// initialisation du profil par défaut, pourra être redéfini par la suite
       		if(isset($tabProfil[0]))
       		   $t->set_var("PROFIL_DEFAUT",$tabProfil[0]);
     		else
     			$t->set_var("PROFIL_DEFAUT","");
        	 // gestion mot de passe par requête Ajax: 
        	 // ne se fait pas :
        	 // si en création ou si  en connexion LDAP 
    		if (strcmp($_REQUEST['CONNEXION_LDAP'], "1") == 0 || ($bCreation))
    		{
    			$t->set_var("bloc_modif_pwd", "");
    		}
    		else
    		{
    			$t->set_var("GEST_PWD_UTILISATEUR", CST_PWD_UTILISATEUR);
    			$t->set_var("SESS_CRYPTKEY", $_SESSION["sess_crypt_key"]);
    			$t->set_var("LIBELLE_REINITIALISER_PWD", CST_LIBELLE_VALIDER);
    			$t->parse("bloc_modif_pwd", "BLOC_MODIF_PWD",true);		
    		}
        	
        }
        else
            debug($jeton);
    
        $t->pparse("MyOutput", "utilisateur");
    
    	pos_disconnect($jeton);
    }
    else
    {
    	debug($jeton);
    	echec_connexion();
    }
}
?>
