<?php
/* 
 * Gestion listes hiérarchiques 
 *
 * Patrick 2/01/2008
 *
 * Données en entrée :
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

$retour = connexion($jeton);

if ($retour)
{
	// vérification du droit à gérer les profils hièrarchiques
	if ($_SESSION["sess_droitAdministration"] == false)
	{	
		afficheMsg(CST_LIBELLE_NO_ADMINISTRATION);
	}
	else
	{
		// Requête de récupération des profils Hiérarchiques
		$retour = pos_gestprofil($jeton, PHP_VULCAIN_GET, PHP_VULCAIN_PROFIL_UTI, /*pref*/$iNbProfils, /*pref*/$szListeProfilHier);
	
		if($retour)
		{
			// Affichage
			$t = new Template(".");
	
			$t->set_File("profilhier", REP_TEMPLATE_APPLICATIF."gestionprofilhier/liste_profilhier.tpl");
			$t->set_var("TITRE_PAGE", CST_LIBELLE_TOOLBAR_GEST_PROFIL_HIER);
			$t->set_var("LIBELLE_LISTE_PROFILHIER", CST_LIBELLE_LIBELLE_LISTE_PROFILHIER);
			$t->set_var("MESSAGE_SELECT_PROFILHIER", CST_MESSAGE_SELECT_PROFILHIER);
			$t->set_var("MESSAGE_SUPP_PROFILHIER", CST_MESSAGE_SUPP_PROFILHIER);
			$t->set_var("MESSAGE_CODE_PROFILHIER_OBLIGATOIRE", CST_MESSAGE_PROFILHIER_OBLIGATOIRE);
			$t->set_var("MESSAGE_CODE_PROFILHIER_EXISTANT", CST_MESSAGE_PROFILHIER_EXISTANT);
			$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
			$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
			$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
			$t->set_var("LIBELLE_NOUVEAU_PROFILHIER", CST_LIBELLE_LIBELLE_NOUVEAU_PROFILHIER); 
			$t->set_var("DROIT_ADMINISTRATION", ($_SESSION["sess_droitAdministration"])?1:0);
			$t->set_var("MESSAGE_NO_ADMINISTRATION", CST_LIBELLE_NO_ADMINISTRATION);
			$t->set_var("MESSAGE_VERIF_FORME_LIBELLE", CST_MESSAGE_VERIF_FORME_LIBELLE_1);
			$t->set_block("profilhier", "BLOC_TAB_PROFILS_HIER", "bloc_tab_profils_hier");
			$t->set_block("profilhier", "BLOC_PROFIL_HIER", "bloc_profil_hier");
			
			
			$tabTousProfilsHier = explode("\x02", trim($szListeProfilHier, "\x02"));
			for($j=0; $j<count($tabTousProfilsHier); $j++)
			{
				$szInfoProfil = "POS_PROFIL_HIER=".urlencode(addslashes(trim($tabTousProfilsHier[$j])));					
				$t->set_var("POS_INFO_PROFIL_HIER", $szInfoProfil);
				$t->set_var("PROFIL_HIERARCHIQUE", $tabTousProfilsHier[$j]);
				$t->set_var("CPT_PROFIL_HIER", $j);
                $t->set_var("PAIR_OU_IMPAIR", (($j % 2) == 0) ? "pair" : "impair");					
				$t->parse("bloc_tab_profils_hier", "BLOC_TAB_PROFILS_HIER",true);
				$t->parse("bloc_profil_hier", "BLOC_PROFIL_HIER",true);			
			}
		
			$t->pparse("MyOutput", "profilhier");
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
