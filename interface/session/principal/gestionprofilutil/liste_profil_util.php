<?php
/* 
 * Gestion des profils utilisateurs
 *
 * Patrick Legaigneur 21/01/2011
 *
 */
if (!isset($_SESSION))
    session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

function makeTriProfil($szTri, $tabAffiche)
{
	$tabTmp=array();
	$tabTmpFinal=array();
	for($i=0; $i<count($tabAffiche); $i++)
	{
		if(strcmp($szTri,"CODE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->code;
		elseif(strcmp($szTri,"FONCTION")==0)
			$tabTmp[$i]=$tabAffiche[$i]->fonction;
		elseif(strcmp($szTri,"SERVICE")==0)
			$tabTmp[$i]=$tabAffiche[$i]->service;
		elseif(strcmp($szTri,"PROFIL_INDEX")==0)
			$tabTmp[$i]=$tabAffiche[$i]->profilFIP;
		elseif(strcmp($szTri,"PROFIL_HIER")==0)
			$tabTmp[$i]=$tabAffiche[$i]->profilHier;
	}

	asort($tabTmp);
	// on reconstruit le tableau dans l'ordre.
	foreach($tabTmp as $key => $val)
	{
		$tabTmpFinal[]=$tabAffiche[$key];
	}
	
	return $tabTmpFinal;
}

$retour = connexion($jeton);

if ($retour)
{
	if ($_SESSION["sess_droitAdminUtilisateur"] == false && $_SESSION["sess_droitAdministration"] == false)
	{
		echo CST_LIBELLE_NO_ADMIN_USER;
	}
	else
	{		
		$retour = pos_getallprofilutil ($jeton, /*pref*/$tabInfoProfil);
				
		if ($retour)
		{
			$cletri = isset($_REQUEST['POS_TRI_COL']) ? $_REQUEST['POS_TRI_COL'] : "CODE";
			$szObjImg = "<IMG SRC='".URL_SITE."/images/icons/tri_lr_1.png' border=0 align=center>";
			
			// Affichage
			$t = new Template(".");
	
			$t->set_File("liste_profil", REP_TEMPLATE_APPLICATIF."gestionprofilutil/liste_profil.tpl");
	
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_PROFIL_UTIL);
			
			$t->set_block("liste_profil", "BLOC_PROFIL", "bloc_profil");
			
			$iDroitAdminUtil = 0;
			if ($_SESSION["sess_droitAdministration"] || $_SESSION["sess_droitAdminUtilisateur"])
				$iDroitAdminUtil = 1;
			$t->set_var("DROIT_ADMIN_UTIL", $iDroitAdminUtil);
			$t->set_var("LIEN_ACTUALISATION", URL_AFFICHE_PROFIL_UTILISATEUR);
			
			// affichage de l'icone indiquant la clé du tri
			$t->set_var("LIBELLE_CODE_PROFIL", CST_LIBELLE_CODE_PROFIL.(strcmp($cletri, "CODE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_FONCTION", CST_LIBELLE_FONCTION.(strcmp($cletri, "FONCTION") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_SERVICE", CST_LIBELLE_SERVICE.(strcmp($cletri, "SERVICE") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_PROFIL_INDEX", CST_LIBELLE_PROFIL_INDEX.(strcmp($cletri, "PROFIL_INDEX") == 0 ? "&nbsp;".$szObjImg : ""));
			$t->set_var("LIBELLE_PROFIL_HIER", CST_LIBELLE_PROFIL_HIER.(strcmp($cletri, "PROFIL_HIER") == 0 ? "&nbsp;".$szObjImg : ""));
			
			$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
			$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
			$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
			$t->set_var("LIBELLE_COPIER", CST_LIBELLE_COPIER_PROFIL);
			
			$t->set_var("MESSAGE_SELECT_PROFIL", CST_LIBELLE_SELECT_PROFIL);
			$t->set_var("MESSAGE_SUPP_PROFIL", CST_LIBELLE_SUPP_PROFIL);
			$t->set_var("MESSAGE_NO_ADMIN_USER", CST_LIBELLE_NO_ADMIN_USER);
		
            $tabLigne = array();
			for($i=0; $i<count($tabInfoProfil); $i++) // pour chaque profil
    		{
                $tabLigne[$i] = (object) array();
                $tabLigne[$i]->code = $tabInfoProfil[$i]->szProfil;
                $tabLigne[$i]->fonction = $tabInfoProfil[$i]->szFonction; 
                $tabLigne[$i]->service= $tabInfoProfil[$i]->szService;
                $tabLigne[$i]->profilFIP = $tabInfoProfil[$i]->szProfilFIP; 
                $tabLigne[$i]->profilHier= $tabInfoProfil[$i]->szProfilHier;				    
			}
			
			// Tri
			$tabLigne = makeTriProfil($cletri, $tabLigne);
			
			//affichage	
			for($i=0; $i<count($tabLigne); $i++)
			{
				$szInfoProfil = "POS_CODE_PROFIL=".urlencode(addslashes(trim($tabLigne[$i]->code)));
					
				$t->set_var("POS_INFO_PROFIL", $szInfoProfil);
				$t->set_var("POS_CODE_PROFIL", trim($tabLigne[$i]->code));
				$t->set_var("POS_FONCTION", trim($tabLigne[$i]->fonction)."&nbsp;");
				$t->set_var("POS_SERVICE", trim($tabLigne[$i]->service)."&nbsp");
				$t->set_var("POS_PROFIL_INDEX", trim($tabLigne[$i]->profilFIP)."&nbsp;");
				$t->set_var("POS_PROFIL_HIER", trim($tabLigne[$i]->profilHier)."&nbsp;");
				$t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
                
				$t->parse("bloc_profil", "BLOC_PROFIL",true);
			}
	
			$t->pparse("MyOutput", "liste_profil");
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
