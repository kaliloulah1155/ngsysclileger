<?php

/*
 * DESCRIPTION : Numérotation des dossiers d'une séance
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 17/12/2008
 *
 * Modification :
 * SC 20090107 : mis en place du code pour la MAJ des données
 *
 * Donnees en entree : 
 * POS_NUM_DOC : Numéro informatique du document 
 * POS_TYPEDOC : Type de document
 * POS_NUM_LIBELLE :  parametre de numérotation
 * RUB_NUMERO_GLOBAL :	parametre de numérotation
 * RUB_NUMERO_ORDRE : parametre de numérotation
 * COLONNE_RUPTURE_NUM_ORDRE : parametre de numérotation
 * AUTRE_COLONNE_A_NUMEROTER : parametre de numérotation
 * COLONNE_RUPTURE_AUTRE_COLONNE_A_NUMEROTER : parametre de numérotation
 * POS_JSON_STRING : numérotation et dossiers 
 *
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

// la chaine doit être encodée en UTF8
$recordTab = json_decode(utf8_encode(stripslashes($_REQUEST["POS_JSON_STRING"])), true);
// NB : pas de  ereg_replace('\"\"','\\""', => sinon ça plante quand une zone est vide
// NB2 : pas de decodage de l'url car le champs passe par un fomulaire
//$recordTab = json_decode(ereg_replace('\"\"','\\""',urldecode(stripslashes($_REQUEST["POS_JSON_STRING"]))),true);
$ficInfoNumerotation = "../../../../configuration/numerotation.conf";
$tabInfoNumerotation = parse_ini_file ($ficInfoNumerotation, true);
$szActionHermes = $_REQUEST["POS_ACTION_HERMES"];


$retour = connexion($jeton);

if ($retour)
{
	// MAJ du numéro global
	if (isset($tabInfoNumerotation[$szActionHermes]["RUB_NUMERO_GLOBAL"]) &&
        strlen($tabInfoNumerotation[$szActionHermes]["RUB_NUMERO_GLOBAL"]) != 0)
    {
        //echo "Numérotation par numéro global";
        $tabNumDoc = array();
        for($i=0; $i<count($recordTab); $i++)
        {
        	$tabNumDoc[] = $recordTab[$i][0];
        }
    	$retour = pos_majrafale($jeton,  $tabNumDoc, $tabInfoNumerotation[$szActionHermes]["RUB_NUMERO_GLOBAL"],  "", "#INC(1,1)", 0, /*pref*/$dwNbDocsModifies);
    	if(!$retour)
    		debug($jeton);
    }
    
    if (isset($tabInfoNumerotation[$szActionHermes]["COLONNE_RUPTURE_NUM_ORDRE"]) &&
        strlen($tabInfoNumerotation[$szActionHermes]["COLONNE_RUPTURE_NUM_ORDRE"]) != 0 &&
        isset($tabInfoNumerotation[$szActionHermes]["RUB_NUMERO_ORDRE"]) &&
        strlen($tabInfoNumerotation[$szActionHermes]["RUB_NUMERO_ORDRE"]) != 0 )
    {
        //echo "Numérotation par numéro ordre avec rupture";
        // +2 pour les 2 colonnes cachées (numero doc / position)
        $iIndiceRupture = $tabInfoNumerotation[$szActionHermes]["COLONNE_RUPTURE_NUM_ORDRE"] + 2;
        $szValeurRuptureEnCours = "";
        $tabNumDoc = array();
        for($i=0; $i<count($recordTab); $i++)
        {
            $tabNumDoc[] = $recordTab[$i][0];
        	if ($i == (count($recordTab) - 1) || strcmp($recordTab[$i][$iIndiceRupture], $recordTab[$i+1][$iIndiceRupture]) != 0)
        	{
                if (count($tabNumDoc) > 0)
                {
                    //print_r($tabNumDoc);
                    $retour = pos_majrafale($jeton,  $tabNumDoc, $tabInfoNumerotation[$szActionHermes]["RUB_NUMERO_ORDRE"],  "", "#INC(1,1)", 0, /*pref*/$dwNbDocsModifies);
                    if(!$retour)
                        debug($jeton);
                    $tabNumDoc = array();
                }
            }
        }
    }
    
    if($retour)
    {            
	    // on lance l'action hermes de départ pour finir la numérotation
	    $retour = pos_hermes_rempliraction($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$tabActionsHermes);
	    
	    
	    if($retour)
	    {
		    // nom du fichier d'exportation pour la liste des rubriques
			$szFileDonnees = getRepTmpSession(session_id());
			$szFileDonnees .= "exportationHermes_".$POS_NUM_DOC.".txt";
			
			$result=array();
			$retour = pos_hermes_lanceraction($jeton, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_ACTION_HERMES"], 
					$result, $szFileDonnees, /*pref*/$dwAfficheDoc, /*pref*/$dwNumDocAff, /*pref*/$szInfo); 
		}
		else
			debug($jeton);
    }
    else
	    debug($jeton);
    
    
    $MODE = "MODIFICATION";
    include("../consultation/consulter_index.php");

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

//$szUrl = sprintf(URL_PARAM_CONSULTER_INDEX, "MODIFICATION", $POS_NUM_DOC, $POS_TYPEDOC, 0);
//echo "<SCRIPT>location.href='".$szUrl."';</SCRIPT>";

?>
