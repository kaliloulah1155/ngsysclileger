<?php
/*
 * DESCRIPTION : Partage d'une question de la bibliothèque
 * AUTEUR: GG
 * DATE DE CREATION: 19/02/2007
 *
 * Données en entrée
 * POS_QUEST_NOM : nom de la question
 * POS_LISTE_PARTAGE : la liste des partage à affecter
 */ 
session_start();
include ("../include/partage_question.inc.php");
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");

include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");                

if (isset($_REQUEST["POS_QUEST_NOM"]))
	$szNomQuestion = trim(stripslashes($_REQUEST["POS_QUEST_NOM"]));
else {
    afficheMsg(out, "Le nom de la question n'a pas ete retrouve.");
    return;
}
$szListePartage = stripslashes($_REQUEST["POS_LISTE_PARTAGE"]);
 
//connexion à poseidon
$retour = connexion($jeton);
if ($retour)
{
	$isAdmin = $_SESSION["sess_droitAdministration"] ? true : false;
    if($isAdmin)
    {
        $tabStQuest = array();
		$retour = pos_bib_getassopartage($jeton, $szNomQuestion, /*pref*/$tabStQuest);
        for ($i=0;$i<count($tabStQuest);$i++) 
		{
			if ($tabStQuest[$i]->wTypeProprietaire != 0)
			{
				$retour = pos_bib_delassopartage($jeton, $szNomQuestion, $tabStQuest[$i]);
				if (!$retour)
					debug($jeton);
			}
        }
        
		// ajouter les nouveaux partages
        $i = 0;
        $iTypeProprietaire = 0;
        $cache = 0;
        $szProprietaire = "";
        $iLg = 0;
        $compt = 0;
		while ($compt < 100 && $i < strlen($szListePartage) && strpos($szListePartage, ':', $i) !== false)
		{
			$compt ++;
            $tmp = substr($szListePartage, $i, strpos($szListePartage, ':', $i) - $i);
            $iTypeProprietaire = $tmp;
            $i = strpos($szListePartage, ':', $i) + 1;

            $tmp = substr($szListePartage, $i, strpos($szListePartage, ':', $i) - $i);
            $cache = $tmp;
            $i = strpos($szListePartage, ':', $i) + 1;

            $tmp = substr($szListePartage, $i, strpos($szListePartage, ':', $i) - $i);
            $iLg = $tmp;
            $i = strpos($szListePartage, ':', $i) + 1;
            $szProprietaire = substr($szListePartage, $i, $iLg);
            $i += $iLg + 1;
                    
            $struQuest = new PartageQuestion($szNomQuestion, $iTypeProprietaire,
							 $cache, $szProprietaire); 
			$retour = pos_bib_setassopartage($jeton, $szNomQuestion, $struQuest);
			if (!$retour)
				debug($jeton);
		}
	}
	
	$msg = "<script>parent.center.document.location.href='".URL_AFFICHE_QUEST_BIB."?MODIFPARTAGE=1&POS_NOM_QUEST=".urlencode($szNomQuestion)."';\nparent.parent.closeFileModif();;</script>";
	afficheMsg($msg);
   
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>