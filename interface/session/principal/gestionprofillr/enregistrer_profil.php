<?php
/*
* DESCRIPTION : Enregistrement du profil de liste résumée
* 
* AUTEUR: Sébastien Costanzo
*
* DATE DE CREATION: 21.11.03
*
*/ 
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../gestionprofillr/util_profillr.php");
session_start();

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    $b_public = (isset($_REQUEST["B_PUBLIC"]))? 1 : 0;
    // on remplis le tableau LR (infos sur le profil)
    $tabLR = array( "nom_profil" => $_REQUEST["SZ_PROFIL"],
                    "nb_zones" => $_REQUEST["NB_ZONE"],
                    "b_partage" => $b_public,
                    "nom_util_createur_profil" => $_SESSION["sess_user_name"],
                    "type_doc_ref" => $_REQUEST["SZ_TYPEDOC"],
                    "b_gestion_conf" => "0");
    
    
    // Ensuite on remplis le tableau contenant les infos sur les rub du profil.
    // SZ_ZONE est la chaine qui contient toutes les infos sur les zones
    // si une zone 1#Ville#2#100#VIL
    // si x zone 1#Ville#2#100#VIL[-]1#Ville#2#100#VIL[-]...
    $sZoneLr = urldecode($_REQUEST["SZ_ZONE"]);
    if($_REQUEST["NB_ZONE"] > 1)
        $tabSzZone = explode("|-|", $sZoneLr);
    else
        $tabSzZone[] = $sZoneLr;
    
    $tabZonesLR = array();    
    for($i=0;$i<count($tabSzZone);$i++)
    {
        list($tabZonesLR[$i]["zone_type"],$tabZonesLR[$i]["zone_titre_col"],
                $tabZonesLR[$i]["zone_align_col"],$tabZonesLR[$i]["zone_largeur_col"],
                $tabZonesLR[$i]["zone_code_rub_ref"]) = explode(SEPARATEUR_CHAMPS_LR, $tabSzZone[$i]);

        $tabZonesLR[$i]["zone_conf_aff"] = "0";
        $tabZonesLR[$i]["zone_titre_col"] = stripslashes($tabZonesLR[$i]["zone_titre_col"]);
    }
        
    //print_r($tabSzZone);    
    
    // exemple de tableau que l'on vient de remplir
    //$tabZonesLR = array(
    //                    0 => array( "zone_type"=>"ZONE_RUB", 
    //                                "zone_titre_col"=>"titre col 1", 
    //                                "zone_align_col"=>1, //CENTRE
    //                                "zone_largeur_col"=>"100", 
    //                               "zone_code_rub_ref"=>"NOM", 
    //                               "zone_conf_aff"=>"0"
    //                            ),
    //                );

    $retour = pos_putplr($jeton, $tabLR, $tabZonesLR);

	if (!$retour)
		debug($jeton);
	
	include("afficher_gestion_profils.php");
	
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

?>