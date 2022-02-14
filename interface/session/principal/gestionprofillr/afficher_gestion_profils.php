<?php
/*
* DESCRIPTION : Gestion des Profils de LR
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 19.11.03
*
*/ 

include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
if (!isset($_SESSION))
session_start();
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("MAX_PROFIL", 200);

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    //on récupère les questions de la bib
    $retour = pos_getconfiglr($jeton, MAX_PROFIL, /*pref*/$tabStruConfigLR);
    if (!$retour)
    	debug($jeton);
    else
    {
      	// on definit le template utilisé  
		$t = new template(REP_TEMPLATE_APPLICATIF."profillr");
		$t->set_file("profil", "gestion_profil.tpl");

		if($_SESSION["sess_droitAdministration"])
			$t->set_var("POS_ADMIN", 1);
		else
			$t->set_var("POS_ADMIN", 0);
		
		if($_SESSION["sess_droitAdminProfilLR"])
			$t->set_var("POS_ADMIN_PROFIL", 1);
		else
			$t->set_var("POS_ADMIN_PROFIL", 0);	

		$t->set_block("profil","BLOC_PROFIL","bloc_profil");
		$t->set_block("profil", "BOUTON", "bouton");
		
		// gestion des boutons.
		$cpt = 0;
		if($_SESSION["sess_droitAdminProfilLR"])
		{
			$t->set_var("CPT", $cpt++);
			$t->set_var("FONCTION", "onCreer()");
			$t->set_var("LIBELLE_FONCTION", CST_LIBELLE_AJOUTER_PROFIL);
			$t->parse("bouton", "BOUTON", true);
			
			// SEPARATEUR
			$t->set_var("CPT", $cpt++);
			$t->set_var("FONCTION", "");
			$t->set_var("LIBELLE_FONCTION", "<HR>");
			$t->parse("bouton", "BOUTON", true);
			
			$t->set_var("CPT", $cpt++);
			$t->set_var("FONCTION", "onModifier()");
			$t->set_var("LIBELLE_FONCTION", CST_LIBELLE_MODIFIER_PROFIL);
			$t->parse("bouton", "BOUTON", true);
			
			$t->set_var("CPT", $cpt++);
			$t->set_var("FONCTION", "onSupprimer()");
			$t->set_var("LIBELLE_FONCTION", CST_LIBELLE_SUPPRIMER_PROFIL);
			$t->parse("bouton", "BOUTON", true);
			
            // SEPARATEUR
			$t->set_var("CPT", $cpt++);
			$t->set_var("FONCTION", "");
			$t->set_var("LIBELLE_FONCTION", "<HR>");
			$t->parse("bouton", "BOUTON", true);
		}
		
        $t->set_var("CPT", $cpt++);
        $t->set_var("FONCTION", "onActiveDesactiveProfilType()");
        $t->set_var("LIBELLE_FONCTION", CST_LIBELLE_ACTIVE_PROFIL_TYPE);
        $t->parse("bouton", "BOUTON", true);

        $t->set_var("CPT", $cpt++);
        $t->set_var("FONCTION", "onActiveDesactiveProfilType()");
        $t->set_var("LIBELLE_FONCTION", CST_LIBELLE_DESACTIVE_PROFIL_TYPE);
        $t->parse("bouton", "BOUTON", true);
		
		
		$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_GEST_PROFIL);
		
		$t->set_var("LIBELLE_ENT_PROFIL", CST_LIBELLE_ENT_PROFIL);
		$t->set_var("LIBELLE_ENT_TYPE_DOC", CST_LIBELLE_ENT_TYPE_DOC);
		$t->set_var("LIBELLE_ENT_ACTIF_TYPE", CST_LIBELLE_ENT_ACTIF_TYPE);
		$t->set_var("LIBELLE_ENT_PUBLIC", CST_LIBELLE_ENT_PUBLIC);
		$t->set_var("LIBELLE_ENT_AUTO", CST_LIBELLE_ENT_AUTO);
		
		$t->set_var("LIBELLE_ACTIVE_PROFIL_TYPE", CST_LIBELLE_ACTIVE_PROFIL_TYPE);
		$t->set_var("LIBELLE_DESACTIVE_PROFIL_TYPE", CST_LIBELLE_DESACTIVE_PROFIL_TYPE);
		
		$t->set_var("MESSAGE_SELECT_REP", CST_LIBELLE_SELECT_PROFIL);
		$t->set_var("MESSAGE_NO_DROIT_ACTIVER_PROFIL", CST_LIBELLE_NO_DROIT_ACTIVER_PROFIL);
		
		$t->set_var("MESSAGE_SUPP_PROFIL_LR", CST_LIBELLE_SUPP_PROFIL_LR);
		$t->set_var("MESSAGE_NO_DROIT_SUPP_PROFIL_LR", CST_NO_DROIT_SUPP_PROFIL_LR);
		$t->set_var("MESSAGE_NO_DROIT_AJOU_PROFIL_LR", CST_NO_DROIT_AJOU_PROFIL_LR);
		$t->set_var("MESSAGE_NO_DROIT_MODIF_PROFIL_LR", CST_NO_DROIT_MODIF_PROFIL_LR);
		
		$t->set_var("LIEN_ACTUALISATION", URL_AFFICHE_GEST_PROFIL_LR);
		
		for($i=0;$i<count($tabStruConfigLR);$i++)
		{
			$szInfoProfil = "SZ_PROFIL=".urlencode($tabStruConfigLR[$i]->szProfil)."&B_ACTIF=".$tabStruConfigLR[$i]->bActif."&B_AUTO=".$tabStruConfigLR[$i]->bAuto."&B_PUBLIC=".$tabStruConfigLR[$i]->bPublic."&SZ_TYPEDOC=".urlencode($tabStruConfigLR[$i]->szTypeDoc);
			$t->set_var("POS_INFO_STRU_PROFIL", $szInfoProfil);
			
			// on recupere le libelle de la bib et on traite le bloc
			$t->set_var("POS_LIBELLE_PROFIL", htmlentities_currentcharset($tabStruConfigLR[$i]->szProfil, null));
			$t->set_var("POS_LIBELLE_TYPE_DOC", $tabStruConfigLR[$i]->szLibelleTypeDoc);
			
			$t->set_var("POS_LIBELLE_ACTIF_TYPE", $tabStruConfigLR[$i]->bActif == 0 ? CST_LIBELLE_NON : CST_LIBELLE_OUI);
			$t->set_var("POS_LIBELLE_PUBLIC", $tabStruConfigLR[$i]->bPublic == 0 ? CST_LIBELLE_NON : CST_LIBELLE_OUI);
			$t->set_var("POS_LIBELLE_AUTO", $tabStruConfigLR[$i]->bAuto == 0 ? CST_LIBELLE_NON : CST_LIBELLE_OUI);
			
			$t->set_var("B_ACTIF", $tabStruConfigLR[$i]->bActif);
			$t->set_var("B_AUTO", $tabStruConfigLR[$i]->bAuto);
			$t->set_var("B_PUBLIC", $tabStruConfigLR[$i]->bPublic);
			$t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
			$t->parse("bloc_profil","BLOC_PROFIL",true);
		}
	 
		// affichage du template
		$t->pparse("Output", "profil");
	}
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>