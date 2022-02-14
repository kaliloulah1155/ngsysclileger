<?php
/***********************************
 * Affichage recherche FullText
 *
 * AUTEUR : Sébastien COSTANZO
 *
 * DATE DE CREATION: 09/05/2006
 * 
 */ 
if (!isset($_SESSION))
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/locution.inc.php");
include ("../include/debug.inc.php");
include ("../include/form_values.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
if (file_exists("../../../../configuration/recherche_ftx_locution.conf"))
    include ("../../../../configuration/recherche_ftx_locution.conf");

//print_r($_REQUEST);

//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
    $tabTypeDocFtx = array();
    if (isset($_REQUEST["POS_CHOIX_LIB"]))
    {
        $tabTypeDocFtx = explode(";", trim($_REQUEST["POS_CHOIX_LIB"], ";"));
    }
            
    //print_r($tabTypeDocFtx);
    
    $iCptLoc = 0;
    $tabLocFtx = array();
    // pour chaque type de document    
    for($i=0;$i<count($tabTypeDocFtx);$i++)
    {
        $tabCritereRecherche = get_form_values_with_prefix("CRITERE_VAL1_", false);
        $wParOuvFirstLoc = (count($tabCritereRecherche) == 0) ? 0 : 1;
        $tabLocFtx[$iCptLoc]= new Locution(1, $tabTypeDocFtx[$i], $_REQUEST["TYPE_CHOIX_RUB"], 'X', $_REQUEST["POS_QUESTION"], $wParOuvFirstLoc, 0);
        $tabLocFtx[$iCptLoc++]->wTypeLienMulti = 2;
        
        while(list($codeCritere, $valeurCritere) = each ($tabCritereRecherche))
        {
			$szCodeOperateur = isset($_REQUEST["CRITERE_OP_".$codeCritere]) ? $_REQUEST["CRITERE_OP_".$codeCritere] : "=";
			$valeur = stripslashes($valeurCritere);

			$tabLocFtx[$iCptLoc]= new Locution (2, $tabTypeDocFtx[$i],  $tabAssociationCritereRubriqueType[$codeCritere][$tabTypeDocFtx[$i]], $szCodeOperateur, $valeur);
			if (isset($_REQUEST["CRITERE_VAL2_".$codeCritere]))
			    $tabLocFtx[$iCptLoc]->szValeur2 = stripslashes($_REQUEST["CRITERE_VAL2_".$codeCritere]);
			$iCptLoc++;
        }
        if (count($tabCritereRecherche) != 0)
            $tabLocFtx[count($tabLocFtx) - 1]->wNbParFin++;
    }
    //print_r($tabLocFtx);
    $_REQUEST['TYPE_RECHERCHE'] = "RECHERCHE_FTX_LOC";
    if (count($tabLocFtx) > 0)
        include("../resultat/rechercher_db.php");
    else
        include("../ftx/afficher_rech_ftx.php");
    
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
