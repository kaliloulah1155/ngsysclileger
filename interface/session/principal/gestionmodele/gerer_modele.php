<?php
/*
 * DESCRIPTION : Ajout ou suppression d'un modèle
 * AUTEUR : GG
 * DATE de CREATION : 31/07/2013
 *
 * Donnees en entree : 
 */

session_start();
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$msgAlert = array();
if ($_REQUEST["ACTION"] == "AJOUTER")
{
    if(!isset($_FILES["POS_FICHIER"]) || strlen(trim($_FILES["POS_FICHIER"]["name"])) == 0 || $_FILES["POS_FICHIER"]["size"] == 0 ||
        !file_exists($_FILES["POS_FICHIER"]["tmp_name"]) || filesize($_FILES["POS_FICHIER"]["tmp_name"]) == 0)
    {
        $msgAlert[0] = "Erreur à la récuperation du fichier modèle : ".$_FILES["POS_FICHIER"]["name"];
    }
    else
    {
        $iPos = strrpos($_FILES["POS_FICHIER"]["name"], ".");
        $szNomCompletModifieFichier = CST_REP_MODELES."\\".strtoupper(substr($_FILES["POS_FICHIER"]["name"], 0, $iPos)).".".substr($_FILES["POS_FICHIER"]["name"], $iPos + 1);
        // copie du modele
        if (!copy($_FILES["POS_FICHIER"]["tmp_name"], $szNomCompletModifieFichier)) 
        {
            $tabErreur = error_get_last();
            $msgAlert[0] = "La sauvegarde du nouveau modèle a échoué.";
            $msgAlert[1] =  $tabMsgError["message"];
        }
    }
}
else if ($_REQUEST["ACTION"] == "SUPPRIMER")
{
    $fileOriginal = CST_REP_MODELES."\\".$_REQUEST["POS_NOM_MODELE"];
    $today = getdate();
    $szNomCompletModifieFichierSauv = sprintf("%s_%d%02d%02d_%02d%02d_del", $fileOriginal, $today["year"],$today["mon"],$today["mday"], $today["hours"], $today["minutes"]);
    // sauvegarde du modele existant
    if (!copy($fileOriginal, $szNomCompletModifieFichierSauv)) 
    {
        $tabErreur = error_get_last();
        $msgAlert[0] =  $tabErreur["message"];
    }
    else
    {  
        if (!unlink($fileOriginal))
        {
            $tabErreur = error_get_last();
            $msgAlert[0] =  $tabErreur["message"];
        }
    }
}
if (count($msgAlert))
    debug_code($msgAlert);
include("afficher_liste_modeles.php");
?>
