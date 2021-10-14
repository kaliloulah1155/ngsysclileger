<?php
/*
 * AUTEUR : Seb COSTANZO le 26/07/2005
 * DESCRIPTIF : Recherche du nombre de réponses à une question de la bib
 *				Pour le chargement des BAL en dynamique.
 * ENTREE:
 * SZ_CODE_BAL : Code de la question de la bib
 *
 */
session_start();
session_write_close();
include ("../include/json/JSON.php");
include ("../include/util_headers.php");
include ("../include/connexion.inc.php");

writeHeadersNoCache();
$json = new Services_JSON();
$objRetour = array();
$objRetour["code_retour"] = 1;
$objRetour["msg_erreur"] = "";
$objRetour["tab_nb_reponses"] = array();
// ce code est inutile car la session est fermée en ecriture
// $sauvTempsRestant = $_SESSION['decotime'];

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
    for($i=0;$i<$_REQUEST["NB_BAL"];$i++)
    {
        $tabValVar = array();
    	$retour = pos_bib_getreponsesquest($jeton, $_GET["SZ_CODE_BAL_".$i], 0, 1, $tabValVar, 
    							/*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
        $objRetour["tab_nb_reponses"][$i]['codebal'] = $_GET["SZ_CODE_BAL_".$i];
        if ($retour)
        {
            $objRetour["tab_nb_reponses"][$i]['nbrep'] = $iNbReponses;
        }
        else
        {
        	$objRetour["code_retour"] = 0;
        	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
        }
    }

    
    //deconnexion
    pos_disconnect($jeton);
}
else
{      
	for($i=0;$i<$_REQUEST["NB_BAL"];$i++)
    {
        $objRetour["tab_nb_reponses"][$i]['codebal'] = $_GET["SZ_CODE_BAL_".$i];
    }
	$objRetour["code_retour"] = -1;
	$objRetour["msg_erreur"] = get_erreur_poseidon($jeton);
}
// inutile car la session est fermée en ecriture
// $_SESSION['decotime'] = $sauvTempsRestant;
$output = $json->encode($objRetour);
print($output);
?>