<?php
/* 
 * Gestion des utilisateurs
 *
 * Seb 10/2004
 *
 * Données en entrée :
 *		POS_TRI_COL : Libellé de la colonne sur laquelle va s'effectuer le tri (CODE, NOM, PROFIL, MAIL)
 * 
 *  
 * 31.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
 * 				 le repertoire du template appelé est renommé (utilisateur --> gestionutil)
 * 02.07.2007 PL modification des fonctions d'accés au serveur poseidon utilisées. Auparavant les utilisateurs
 * 				sans profils (exemple : échec à la création avec un profil ADMIN) n'étaient pas récupérés. 
 * 07.07.2007 PL modification de l'affichage selon le tri éffectué (profil ou non)
 * 				 profil : une ligne/utilsateur/profil
 * 				 non profil : une ligne/utilisateur (profils affichés dans la même cellule, défaut en gras)
 * 				 --> deux tableaux différents appliqués au même template
 * 				 et modifications pour le tri
 * 	21.02.2011 PL Modification pour la gestion LDAP et ajout de l'orgalisation et de l'unité  
 */
if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

function makeTriUtil($szTri, $tabAffiche)
{
	$tabTmp=array();
	$tabTmpFinal=array();
	for($i=0; $i<count($tabAffiche); $i++)
	{
		if(strcmp($szTri,"CODE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->stUtilisateur->szUtilisateur;
		elseif(strcmp($szTri,"NOM")==0)
			$tabTmp[$i]=$tabAffiche[$i]->stUtilisateur->szNomUtil;
		elseif(strcmp($szTri,"MAIL")==0)
			$tabTmp[$i]=$tabAffiche[$i]->stUtilisateur->szAdrEmail;
		elseif(strcmp($szTri,"PROFIL")==0)
			$tabTmp[$i]=$tabAffiche[$i]->profil;
	}
    asort($tabTmp);
	// on reconstruit le tableau dans l'ordre.
	foreach($tabTmp as $key => $val)
	{
		$tabTmpFinal[]=$tabAffiche[$key];
	}
	return $tabTmpFinal;
}

//
$retour = connexion($jeton);

if ($retour)
{
	if ($_SESSION["sess_droitAdminUtilisateur"] == false && $_SESSION["sess_droitAdministration"] == false)
	{
		echo CST_LIBELLE_NO_ADMIN_USER;
	}
	else
	{
		
		// Si l'application est connecté à un annuaire,
		// pas de création/suppression d'utilisateur.
		// La modification possible des données utilisateurs ne concernera que 
		// l'attribution des profils
		$szLDAP = "0";
		$retour = pos_getinfoappli($jeton, /*pref*/$objInfoAppli);
	    if (!$retour)
	    {
	        debug($jeton);
	    }
	    else
	    {
	    	if($objInfoAppli->dwLDAP != 0)
	    		$szLDAP = "1";
	    }
 	
		//$retour = pos_getallutilprofil($jeton, /*pref*/$tabStUtil, /*pref*/$tabStProfil);
		// $tabSUtil : autant de structures d'information d'utilisateur
		// que de relation utilisateur/profil
		
		// $tabStProfil : autant de structures d'information de profils
		// que de relation utilisateur/profil
		
		$retour = pos_gestutilisateur($jeton,"",3,/*pref*/$tabStAllUtil);
		// $tabStAllUtil : autant de structures d'information que d'utilisateur
		if ($retour)
			$retour = pos_gestlienutilprofil($jeton, null, null, 15, /*pref*/$tabLienUtilProfil);
			// $tabLienUtilProfil : toutes les occurences utilisateurs-profils pour l'application

		if ($retour)
		{
			if(isset($_REQUEST['POS_TRI_COL']))
				{
					if(strcmp($_REQUEST['POS_TRI_COL'],"PROFIL") != 0)
						$triprofil = 0;
					else 
						$triprofil = 1;
					
					$cletri = $_REQUEST['POS_TRI_COL'];
				}
			else
				{
					$triprofil = 0;
					$cletri = "CODE";
				}
			$triOrdre="1"; // le tri inverse ne fonctionne pas
			$szObjImg = "<IMG SRC='".URL_SITE."/images/icons/tri_lr_$triOrdre.png' border=0 align=center>";
			
			// Affichage
			$t = new Template(".");
			$t->set_File("utilisateur", REP_TEMPLATE_APPLICATIF."gestionutil/liste_utilisateur.tpl");
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_UTIL);
			
			$t->set_block("utilisateur", "BLOC_MENU_AVEC_LDAP", "bloc_menu_avec_ldap");
			$t->set_block("utilisateur", "BLOC_MENU_SANS_LDAP", "bloc_menu_sans_ldap");
			if (strcmp($szLDAP, "1") == 0)
			{	
				$t->parse("bloc_menu_avec_ldap", "BLOC_MENU_AVEC_LDAP",true);	
				$t->set_var("bloc_menu_sans_ldap", "");
			}
			else
			{
				$t->parse("bloc_menu_sans_ldap", "BLOC_MENU_SANS_LDAP",true);	
				$t->set_var("bloc_menu_avec_ldap", "");
			}
			// En LDAP, seules les modifications de profils seront possibles
			$t->set_var("CONNEXION_LDAP", $szLDAP);
			
			$t->set_block("utilisateur", "BLOC_UTILISATEUR", "bloc_utilisateur");
			
			$iDroitAdminUtil = 0;
			if ($_SESSION["sess_droitAdministration"] || $_SESSION["sess_droitAdminUtilisateur"])
				$iDroitAdminUtil = 1;
			$t->set_var("DROIT_ADMIN_UTIL", $iDroitAdminUtil);
			$t->set_var("LIEN_ACTUALISATION", URL_AFFICHE_UTILISATEUR);
			
			// affichage de l'icone indiquant la clé du tri
			$t->set_var("LIBELLE_CODE_UTIL", CST_LIBELLE_CODE_USER.(strcmp($cletri, "CODE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_NOM_UTIL", CST_LIBELLE_NOM_USER.(strcmp($cletri, "NOM") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_PROFIL_UTIL", CST_LIBELLE_PROFIL_USER.(strcmp($cletri, "PROFIL") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_MAIL_UTIL", CST_LIBELLE_MAIL_USER.(strcmp($cletri, "MAIL") == 0 ? "&nbsp;".$szObjImg : ""));
			
			$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
			$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
			$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
			
			$t->set_var("MESSAGE_SELECT_UTIL", CST_LIBELLE_SELECT_USER);
			$t->set_var("MESSAGE_SUPP_UTILISATEUR", CST_LIBELLE_SUPP_USER);
			$t->set_var("MESSAGE_NO_ADMIN_USER", CST_LIBELLE_NO_ADMIN_USER);
		
			//print_r($tabStAllUtil);
			//print_r($tabLienUtilProfil);
			$tabLigne = array();
			if ($triprofil == 0)
			{
				// construit la liste des profils par utilisateur
    			for($i=0; $i<count($tabLienUtilProfil); $i++) // pour chaque utilisateur
				{	
    			    if($tabLienUtilProfil[$i]->dwParDefaut == 1)
    			         $szChaineProfil = "<font color=\"#9900FF\">".$tabLienUtilProfil[$i]->szProfil."</font>";
    			    else
    			         $szChaineProfil = $tabLienUtilProfil[$i]->szProfil;
    			         
    			    if (isset($tabCodeUtilisateurProfil[trim($tabLienUtilProfil[$i]->szUtilisateur)]))
					{
    			        if($tabLienUtilProfil[$i]->dwParDefaut == 1)
                            $tabCodeUtilisateurProfil[trim($tabLienUtilProfil[$i]->szUtilisateur)] = $szChaineProfil."<br>".$tabCodeUtilisateurProfil[trim($tabLienUtilProfil[$i]->szUtilisateur)];
						else 
                            $tabCodeUtilisateurProfil[trim($tabLienUtilProfil[$i]->szUtilisateur)] = $tabCodeUtilisateurProfil[trim($tabLienUtilProfil[$i]->szUtilisateur)]."<br>".$szChaineProfil;
                    }
					else
				        $tabCodeUtilisateurProfil[trim($tabLienUtilProfil[$i]->szUtilisateur)] = $szChaineProfil;
				}
    			//print_r($tabCodeUtilisateurProfil);
                $tabLigne = array();
    			for($i=0; $i<count($tabStAllUtil); $i++) // pour chaque utilisateur
    			{
                    $tabLigne[$i] = (object) array();
                    $tabLigne[$i]->stUtilisateur = $tabStAllUtil[$i];
                    if (isset($tabCodeUtilisateurProfil[trim($tabStAllUtil[$i]->szUtilisateur)]))
						$tabLigne[$i]->profil = $tabCodeUtilisateurProfil[trim($tabStAllUtil[$i]->szUtilisateur)];
			         else
					    $tabLigne[$i]->profil = "";
				}
			}
            else
            {
            	// construit une table liant le code de l'utilisateur a sa structure
            	$tabCodeUtilisateurInfosUtil = array();
    			for($i=0; $i<count($tabStAllUtil); $i++)
    			{
    			     $tabCodeUtilisateurInfosUtil[trim($tabStAllUtil[$i]->szUtilisateur)] = $tabStAllUtil[$i];
				}
    			
				for($i=0; $i<count($tabLienUtilProfil); $i++) //et chaque occurence de utilisateur/profil 
				{
                    $tabLigne[$i] = (object) array();
					$tabLigne[$i]->stUtilisateur = isset($tabCodeUtilisateurInfosUtil[trim($tabLienUtilProfil[$i]->szUtilisateur)]) ? $tabCodeUtilisateurInfosUtil[trim($tabLienUtilProfil[$i]->szUtilisateur)] : NULL;
                    $tabLigne[$i]->profil = $tabLienUtilProfil[$i]->szProfil;
				}
			}
			
			// Tri
			$tabLigne = makeTriUtil($cletri, $tabLigne);
			
			//affichage	
			for($i=0; $i<count($tabLigne); $i++)
			{
                if ($tabLigne[$i]->stUtilisateur) {

    				$szInfoProfil = "POS_CODE_UTIL=".urlencode(addslashes(trim($tabLigne[$i]->stUtilisateur->szUtilisateur)));
    				$szInfoProfil.= "&POS_NOM_UTIL=".urlencode(addslashes(trim($tabLigne[$i]->stUtilisateur->szNomUtil)));
    				$szInfoProfil.= "&POS_PROFIL_UTIL=".urlencode(addslashes(trim($tabLigne[$i]->profil)));
    				$szInfoProfil.= "&POS_MAIL_UTIL=".urlencode(addslashes(trim($tabLigne[$i]->stUtilisateur->szAdrEmail)));
    				// récupéré ici pour être affichés seulement dans la consultation de l'utilisateur
    				$szInfoProfil.= "&POS_ORGANISATION_UTIL=".urlencode(addslashes(trim($tabLigne[$i]->stUtilisateur->szOrganisation)));
    				$szInfoProfil.= "&POS_UNITE_UTIL=".urlencode(addslashes(trim($tabLigne[$i]->stUtilisateur->szUnite)));
    	
    				$t->set_var("POS_INFO_UTIL", $szInfoProfil);
    				$t->set_var("POS_CODE_UTIL", trim($tabLigne[$i]->stUtilisateur->szUtilisateur));
    				$t->set_var("POS_NOM_UTIL", trim($tabLigne[$i]->stUtilisateur->szNomUtil)."&nbsp;");
    				$t->set_var("POS_PROFIL_UTIL", trim($tabLigne[$i]->profil)."&nbsp");
    				$t->set_var("POS_MAIL_UTIL", trim($tabLigne[$i]->stUtilisateur->szAdrEmail)."&nbsp;");
    				$t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
                    
    				$t->parse("bloc_utilisateur", "BLOC_UTILISATEUR",true);
                }
			}
	
			$t->pparse("MyOutput", "utilisateur");
		}
		else
			debug($jeton);
				
	}
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
