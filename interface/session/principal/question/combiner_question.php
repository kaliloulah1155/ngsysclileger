<?php
/*
 * AUTEUR : Seb le 24/03/2005
 * Combinaison des questions avec ajout de la new question dans la session
 *
 * ENTREE:
 *	POS_QUESTION : tab de num de question
 *	POS_LIEN : lien entre les question
 *	POS_TITRE : titre de la new question
 *
 */
include ("../include/locution.inc.php");
session_start();
include ("../include/debug.inc.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

if (count($_REQUEST["POS_QUESTION"]) != 2)
{
	$tabInfoDebug[0] = CST_LIBELLE_MESS_SELECT_QUESTION;
	debug_code($tabInfoDebug);
    include ("../recherche/historique.php");
    exit;
}

// on récupère les locutions dans la session
copyTabLocution($_SESSION["sess_tabHistQuest"][0][$_REQUEST["POS_QUESTION"][0]], $firstTabLoc);
copyTabLocution($_SESSION["sess_tabHistQuest"][0][$_REQUEST["POS_QUESTION"][1]], $lastTabLoc);

$lastTabLoc[0]->wTypeLien = $_REQUEST["POS_LIEN"];
if(count($firstTabLoc) > 1)
{
	$firstTabLoc[0]->wNbParDeb++;
	$firstTabLoc[(count($firstTabLoc)-1)]->wNbParFin++;
}
if(count($lastTabLoc) > 1)
{
	$lastTabLoc[0]->wNbParDeb++;
	$lastTabLoc[(count($lastTabLoc)-1)]->wNbParFin++;
}


$newTabLoc = $firstTabLoc;
for($i=0; $i<count($lastTabLoc); $i++)
{
    $newTabLoc[]= $lastTabLoc[$i];
}

$iNumQuest = count ($_SESSION["sess_tabHistQuest"][0]);

// on rajoute une question dans l'historique qui est la combinaison des x question
$_SESSION["sess_tabHistQuest"][0][$iNumQuest] = array_slice($newTabLoc, 0, count($newTabLoc));
$_SESSION["sess_tabHistQuest"][2][$iNumQuest] = date("d/m/y  H:i"); 
$_SESSION["sess_tabHistQuest"][3][$iNumQuest] = "RECHERCHE_COMBINE"; 
$_SESSION["sess_tabHistQuest"][4][$iNumQuest] = stripslashes($_REQUEST["POS_TITRE"]);
  
$_REQUEST["POS_NEW_QUESTION"] = "1";
include("../resultat/rechercher_db.php");
?>