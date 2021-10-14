<?php
/*
* DESCRIPTION : Gestion des Profils de LR (Création / modification du profil de LR)
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 20.11.03
*
*/ 

include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
session_start();
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../gestionprofillr/util_profillr.php");
include ("../include/form_values.inc.php");

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    // on récupère les rubriques du type de doc
    $sTypeDoc = stripslashes(urldecode($_REQUEST["SZ_TYPEDOC"]));
	if(strcmp($sTypeDoc, "000") == 0)
		$retour = pos_getlistallrubrmc($jeton, /*pref*/$tabCodeLibRub);
	else
		$retour = pos_getlistrubintype($jeton, $sTypeDoc, /*pref*/$tabCodeLibRub);

    if (!$retour)
        debug($jeton);
    
    // Modification d'un profil
    if(!isset($_REQUEST["B_CREATION"]))
    {
        $sProfil = stripslashes(urldecode($_REQUEST["SZ_PROFIL"]));
        // on récupère le profil de la liste résumée
    	$retour = pos_gestplr($jeton, $sProfil, /*pref*/$objLR, /*pref*/$tabZoneLR);
    	if(!$retour)
    		debug($jeton);	
    }

    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

// AFFICHAGE
if ($retour)
{ 
	// on definit le template utilisé  
	$t = new template(REP_TEMPLATE_APPLICATIF."profillr");
	$t->set_file("profil", "afficher_modif_profil.tpl");
	
	$t->set_block("profil","BLOC_RUB","bloc_rub");
	$t->set_block("profil","BLOC_PROFIL","bloc_profil");
	$t->set_block("profil","BLOC_ADMIN","bloc_admin");
    $t->set_block("profil","BLOC_CHAMP_SPE_LISTE_FICHIERS","bloc_champ_spe_liste_fichiers");
	
	$t->set_var("ACTION", URL_VALIDE_MODIF_PROFIL_LR);
	$t->set_var("URL_ANNULER", URL_AFFICHE_GEST_PROFIL_LR);
	$t->set_var("URL_AFF_VALEUR_CHAMP_PROFIL_LR", URL_AFF_VALEUR_CHAMP_PROFIL_LR);
	$t->set_var("SEPARATEUR_CHAMPS_LR", SEPARATEUR_CHAMPS_LR);

	$t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
	$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER_PROFIL);
	
	$t->set_var("LIBELLE_TITRE", CST_LIBELLE_TITRE_PROFIL_LR);
	$t->set_var("LIBELLE_PROFIL_PUBLIC", CST_LIBELLE_PROFIL_PUBLIC);
	$t->set_var("LIBELLE_LISTE_RUB", CST_LIBELLE_LISTE_RUB);
	$t->set_var("LIBELLE_VISU_PROFIL_LR", CST_LIBELLE_VISU_PROFIL_LR);
	$t->set_var("LIBELLE_LISTE_CHAMP_SPE", CST_LIBELLE_LISTE_CHAMP_SPE);
	$t->set_var("LIBELLE_CREA_OU_MODIF_PROFIL", (isset($_REQUEST["B_CREATION"]))? CST_LIBELLE_CREATION_PROFIL : CST_LIBELLE_MODIF_PROFIL);
	$t->set_var("LIBELLE_SUPPRIMER", CST_LIBELLE_SUPP);
	$t->set_var("LIBELLE_MODIFIER", CST_LIBELLE_MODIF);
	
    $t->set_var("CHAMP_SPE_TYP_DOC", CST_CHAMP_SPE_TYP_DOC);
    $t->set_var("CHAMP_SPE_KH", CST_CHAMP_SPE_KH);
    $t->set_var("CHAMP_SPE_CONF", CST_CHAMP_SPE_CONF);
    $t->set_var("CHAMP_SPE_CLOI", CST_CHAMP_SPE_CLOI);
    $t->set_var("CHAMP_SPE_NUM_DOC", CST_CHAMP_SPE_NUM_DOC);
    $t->set_var("CHAMP_SPE_NB_FICHIERS", CST_CHAMP_SPE_NB_FICHIERS);
    $t->set_var("CHAMP_SPE_DOC_ACCES", CST_CHAMP_SPE_DOC_ACCES);
    $t->set_var("CHAMP_SPE_LIB_TYP_DOC", CST_CHAMP_SPE_LIB_TYP_DOC);
    $t->set_var("CHAMP_SPE_OCCURRENCES", CST_CHAMP_SPE_OCCURRENCES);
    $t->set_var("CHAMP_SPE_LISTE_FICHIERS", CST_CHAMP_SPE_LISTE_FICHIERS);
    
    $t->set_var("MESSAGE_IMPO_CREER_PROFIL_VIDE", CST_MESSAGE_IMPO_CREER_PROFIL_VIDE);
    $t->set_var("MESSAGE_IMPO_CREER_PROFIL_SANS_RUB", CST_MESSAGE_IMPO_CREER_PROFIL_SANS_RUB);
    $t->set_var("MESSAGE_IMPO_CREER_PROFIL_SANS_TITRE", CST_MESSAGE_IMPO_CREER_PROFIL_SANS_TITRE);
    $t->set_var("MESSAGE_IMPO_CREER_PROFIL_AVEC_CARAC_SPE", CST_MESSAGE_IMPO_CREER_PROFIL_AVEC_CARAC_SPE);
    
    $t->set_var("SZ_TYPEDOC", $sTypeDoc);
    $t->set_var("CHECK", (isset($_REQUEST["B_PUBLIC"]) && $_REQUEST["B_PUBLIC"] == 1) ? "checked" : "");
	
	if($_SESSION["sess_droitAdministration"])
	    $t->parse("bloc_admin","BLOC_ADMIN",true);
	else
	    $t->set_var("bloc_admin", "");

	if($_SESSION["sess_obj_infos_appli"]->dwTypeBDD == PHP_VULCAIN_TYPE_BDD_PGSQL)
	    $t->parse("bloc_champ_spe_liste_fichiers","BLOC_CHAMP_SPE_LISTE_FICHIERS",true);
	else
	    $t->set_var("bloc_champ_spe_liste_fichiers", "");
	
	// Tri du tableau des rubriques par libelle
	asort($tabCodeLibRub);
	
	// pour toutes les rubriques
    while(list($code, $valeur) = each($tabCodeLibRub))
    {
        $t->set_var("POS_CODE_RUB", $code);
        $t->set_var("POS_LIBELLE_RUB", $valeur);
        
        $t->parse("bloc_rub","BLOC_RUB",true);
    }
	
    if(isset($_REQUEST["B_CREATION"]))
    {
        $t->set_var("SZ_PROFIL", "");
        $t->set_var("CLASS_READONLY", "");
        $t->set_var("bloc_profil", "");
    }
    else // Modification d'un profil
    {
        $t->set_var("SZ_PROFIL", htmlspecialchars_currentcharset($sProfil));
        $t->set_var("CLASS_READONLY", "READONLY CLASS=NonModif");
        
        for ($i=0;$i<count($tabZoneLR);$i++)
        {
            // faire passer toutes les infos sur les zones
            $szPosCodeProfil = $tabZoneLR[$i]->zone_type.SEPARATEUR_CHAMPS_LR;
            $szPosCodeProfil.= urlencode(addslashes($tabZoneLR[$i]->zone_titre_col)).SEPARATEUR_CHAMPS_LR;
            $szPosCodeProfil.= $tabZoneLR[$i]->zone_align_col.SEPARATEUR_CHAMPS_LR;
            $szPosCodeProfil.= $tabZoneLR[$i]->zone_largeur_col.SEPARATEUR_CHAMPS_LR;
            $szPosCodeProfil.= $tabZoneLR[$i]->zone_code_rub_ref;
            
            $t->set_var("POS_CODE_PROFIL", $szPosCodeProfil);
            $t->set_var("POS_LIBELLE_PROFIL", $tabZoneLR[$i]->zone_titre_col);
            
            $t->parse("bloc_profil","BLOC_PROFIL",true);
        }
    }

	// affichage du template
	$t->pparse("Output", "profil");
}

?>