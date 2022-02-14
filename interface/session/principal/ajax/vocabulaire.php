<?php
/*
 * DESCRIPTION : Module de gestion des associations 
 * Après selection du document choisi pour l'association,
 * permet de retourner les paires codes/valeurs 
 *
 * AUTEUR : Gabrielle Guy, Sébastien Fleury
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document 
 * POS_CODRUB : code de la rubrique associee 
 * POS_NUMDOC : numero du document cible
 *
 * MODIFICATION:
 * 21/08/2001 - Fermeture de la fenêtre après association des valeurs
 * 03/10/2001 - Gestion des caractère spéciaux dans les associations
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

define ("SEPARATEUR", "\x02");

$retour = connexion($jeton);
if ($retour)
{ 
    if (isset($_REQUEST["coderub"]) && isset($_REQUEST["typedoc"]) && isset($_REQUEST["recherche"])) 
	{
		$szVocab = "";
		$szVocabTransmis = "";
		$recherche = strtoupper(stripslashes($_REQUEST["recherche"]));
		$iNbDemande = isset($_REQUEST["nombre"]) ? $_REQUEST["nombre"] : 10;
		$iTypeVocab = isset($_REQUEST["typevocab"]) ? $_REQUEST["typevocab"] : 1;
		$wNextVal = 4; //VOCAB_COMPLETION
        if ($iTypeVocab != 10)
		{
	    	$retour = pos_listevocab($jeton, $_REQUEST["typedoc"], $_REQUEST["coderub"], $iTypeVocab, $recherche, $wNextVal, $iNbDemande, /*pref*/$iNbLu, /*pref*/$szVocab);
        }
        else
        {
            // tester avec des colonnes vides
            $iNbColonnes = 1;
            $sRequete = "select \"COL\"||'|<b>'||\"COL\"||'</b><br>'||\"LFG\"||'<br>'||\"VSI\" from pos_tab_index_COL where \"COL\" like '".$recherche."%' order by 1";
            $retour = pos_sqlselectmulti($jeton, $sRequete, $iNbDemande*$iNbColonnes, $iNbLu, $szVocab);
        }
		$tok = strtok($szVocab, SEPARATEUR);
		while($tok != null && strlen(trim($tok)))
		{
			if (strncmp($tok, $recherche, strlen($recherche)) == 0)
			{ 
				$szVocabTransmis .= $tok."\n";
				$tok = strtok(SEPARATEUR);
			}
			else
				break;
		}
		header("Content-Type: text/html; charset=ISO-8859-1");
		//echo addslashes($szVocabTransmis);
		echo ($szVocabTransmis);
	}
	else
		echo "erreur";

	pos_disconnect($jeton);
}
else
{
    $sMsg = get_erreur_poseidon($jeton);
    echo $sMsg."\n";
}
?>