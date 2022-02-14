<?php
/* 
 * Affichage de liste hiérarchique 
 *
 * PL 29/01/2008
 *
 * Données en entrée :
 *    POS_CODE_LISTHIER : Code de liste hiérarchiques
 *
 * 01.03.2011 PL Modification pour affichage en fonction des profils hiérarchiques 
 */

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
	$szCodeListeHier = stripslashes(urldecode($_REQUEST['POS_CODE_LISTHIER']));
	// liste des profils hièrarchiques
    $retour = pos_gestprofil($jeton, PHP_VULCAIN_GET, PHP_VULCAIN_PROFIL_UTI, /*pref*/$iNbProfils, /*pref*/$szListeProfilHier);
    $tabProfilsHier = explode("\x02", trim($szListeProfilHier, "\x02"));

    // recuperation des valeurs pour chaque profil
    $szChemin = "";
    // pour la lste par défaut.
    array_unshift($tabProfilsHier, "");

    // Affichage
    $t = new Template(".");
    $t->set_File("arbo_listhier", REP_TEMPLATE_APPLICATIF."gestionlisthier/afficher_listhier.tpl");
    $t->set_var("TITRE_PAGE", CST_TITRE_PAGE_ARBO_LISTHIER);
    $t->set_var("POS_LIBELLE_LISTHIER", stripslashes(urldecode($_REQUEST['POS_LIBELLE_LISTHIER'])));
    $t->set_var("POS_CODE_LISTHIER", $szCodeListeHier);
    $t->set_var("LIBELLE_AJOUTER_NOEUD", CST_LIBELLE_AJOUTER);
    $t->set_var("LIBELLE_MODIFIER_NOEUD", CST_LIBELLE_MODIF);
    $t->set_var("LIBELLE_SUPPRIMER_NOEUD", CST_LIBELLE_SUPP);
    $t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
    $t->set_var("URL_FERMER", URL_LIST_LISTHIER);
	
	$t->set_var("LIBELLE_PROFILHIER", CST_LIBELLE_PROFILHIER);
	$t->set_var("LIBELLE_SELECT_NODE_LISTHIER", CST_LIBELLE_SELECT_NODE_LISTHIER);
	$t->set_var("LIBELLE_VALEUR_LISTHIER", CST_LIBELLE_VALEUR_NODE_LISTHIER);
    $t->set_var("CST_MSG_CONFIRM_SUPP_NOEUD", CST_MSG_CONFIRM_SUPP_NOEUD);
    $t->set_var("CST_MSG_SELECT_NODE_LISTHIER", CST_MSG_SELECT_NODE_LISTHIER);
    $t->set_var("CST_MSG_SAISIR_LIBELLE_NOEUD", CST_MSG_SAISIR_LIBELLE_NOEUD);
    $t->set_var("CST_MSG_ERR_MODIFIER_NOM_LISTE", CST_MSG_ERR_MODIFIER_NOM_LISTE);
    $t->set_var("CST_MSG_NOEUD_FILS_EXIST", CST_MSG_NOEUD_FILS_EXIST);
    
    $t->set_block("arbo_listhier", "BLOC_TOUS_PROFILS_HIERARCHIQUES", "bloc_tous_profils_hierarchiques");
	
	 for($i=0;$i<count($tabProfilsHier);$i++)
	{
		$t->set_var("PROFIL_HIERARCHIQUE", $tabProfilsHier[$i]);
        $t->set_var("TOUS_PROFIL_HIERARCHIQUE_SELECTED", ($i == 0) ? "selected" : "");	
		$t->parse("bloc_tous_profils_hierarchiques", "BLOC_TOUS_PROFILS_HIERARCHIQUES",true);
    }
		
    $t->pparse("MyOutput", "arbo_listhier");

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>