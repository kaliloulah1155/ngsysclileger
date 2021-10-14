<?php
/*
* DESCRIPTION : Gestion des Profils de LR (Modif des infos sur les champs du profil)
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 21.11.03
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
    $sInfosChamp = stripslashes(urldecode($_REQUEST["SZ_INFO_CHAMP"]));

    list($zone_type,$zone_titre_col,$zone_align_col,$zone_largeur_col,$zone_code_rub_ref) = explode(SEPARATEUR_CHAMPS_LR, $sInfosChamp);
    
    // zone de type rubrique
    if($zone_type == 1)
    {
        $retour = pos_getinforub($jeton, $zone_code_rub_ref, /*pref*/$tabInfoRub);
        if(!$retour)
            debug($jeton);
    }
    
    // on definit le template utilisé  
    $t = new template(REP_TEMPLATE_APPLICATIF."profillr");
    $t->set_file("champ", "affiche_info_champ.tpl");
    
    $t->set_var("SEPARATEUR_CHAMPS_LR", SEPARATEUR_CHAMPS_LR);
    $t->set_var("LIBELLE_ANNULER", CST_LIBELLE_ANNULER);
	$t->set_var("LIBELLE_VALIDER", CST_LIBELLE_VALIDER_PROFIL);
	$t->set_var("LIBELLE_NOM_RUB", CST_LIBELLE_NOM_RUB_COLONNE_LR);
	$t->set_var("LIBELLE_TITRE", CST_LIBELLE_TITRE_COLONNE_LR);
	$t->set_var("LIBELLE_TAILLE", CST_LIBELLE_TAILLE_COLONNE_LR);
	$t->set_var("LIBELLE_GAUCHE", CST_LIBELLE_GAUCHE_COLONNE_LR);
	$t->set_var("LIBELLE_CENTRE", CST_LIBELLE_CENTRE_COLONNE_LR);
	$t->set_var("LIBELLE_DROIT", CST_LIBELLE_DROIT_COLONNE_LR);
    
    $t->set_var("TITRE_PAGE", CST_TITRE_PAGE_MODIF_INFO_CHAMP_PROFIL);
    
    if($zone_type == 1)
        $t->set_var("SZ_NOM_RUB", $zone_code_rub_ref." - ".$tabInfoRub->libelle);
    else
        $t->set_var("SZ_NOM_RUB", "");
        
    $t->set_var("SZ_TITRE", htmlspecialchars_currentcharset($zone_titre_col));
    $t->set_var("SZ_TAILLE", $zone_largeur_col);
    $t->set_var("SZ_TYPE", $zone_type);
    $t->set_var("SZ_CODE_RUB", $zone_code_rub_ref);
    $t->set_var("OPTION_SELECT", $_REQUEST["OPTION_SELECT"]);
    
    $t->set_var("SELECTED_CENTRE", "");
    $t->set_var("SELECTED_GAUCHE", "");
    $t->set_var("SELECTED_DROITE", "");
    
    switch ($zone_align_col)
    {
        case 1:
            $t->set_var("SELECTED_CENTRE", "CHECKED");
            break;
           
        case 2:
            $t->set_var("SELECTED_GAUCHE", "CHECKED");
            break;
    
        case 3:
            $t->set_var("SELECTED_DROITE", "CHECKED");
            break;
        
        default : 
            break;
    }
    
    // affichage du template
    $t->pparse("Output", "champ");
       
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>