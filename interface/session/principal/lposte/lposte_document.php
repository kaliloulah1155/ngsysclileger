<?php
/*
 * DESCRIPTION : Affichage des document pris en modification
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 27/03/2006
 *
 * Donnees en entree : Aucune
 */
if (!isset($_SESSION))
	session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("LPOSTEDOC_LISTE", 0);
//define("LPOSTEDOC_EFFACE", 1);
//define("LPOSTEDOC_PURGE", 2);

$retour = connexion($jeton);
if ($retour)
{
	$tabLigneConnexion = array();
	// on lance l'insertion du dossier.
	$retour = pos_gestlpostedocument($jeton, LPOSTEDOC_LISTE, 
							0, /*pref*/$tabLigneConnexion);
	if (!$retour)
		debug($jeton);
	else 
	{
		$szTplName = REP_TEMPLATE_APPLICATIF."lposte/lposte_document.tpl";
		$t = new template(".");
		$t->set_file("lr", $szTplName);
		$t->set_block("lr", "ENTETE", "entete");
		$t->set_block("lr", "LR_REPONSE", "lrreponse");
		$t->set_block("lr", "LISTE_REPONSES", "listereponses");
		$t->set_block("lr", "BOUTON", "bouton");
		$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_DOC_EN_MODIF);
		$t->set_var("MESSAGE_SELECT_DOC_EN_MODIF", CST_LIBELLE_SELECT_DOC_EN_MODIF);
		
		$tabChampsEntete = extraireChampsLR($tabLigneConnexion[0], "\x02");
		for ($i = 0; $i<count($tabChampsEntete); $i++)
		{
			$t->set_var("TITRE_COLONNE", $tabChampsEntete[$i]);
			$t->parse("entete", "ENTETE", true);
		}

		for ($i=1;$i<count($tabLigneConnexion);$i++)
		{
			$tabChamps = extraireChampsLR($tabLigneConnexion[$i], "\x02");
            if (count($tabChamps) > count($tabChampsEntete) && $i == 1)
                $t->parse("entete", "ENTETE", true);   
			if(strcmp($tabChamps[3], $_SESSION["sess_application"]) == 0)
			{
    			$t->set_var("lrreponse", "");
    			for ($j = 0; $j<count($tabChamps); $j++)
    			{
    	        	$t->set_var("ZONE_LR", $tabChamps[$j]."&nbsp;");
    	        	$t->parse("lrreponse", "LR_REPONSE", true);
    			}
    			$t->set_var("NUM_DOCUMENT", $tabChamps[2]);
    			$t->set_var("VALUE_RADIO_NUMDOC", $tabChamps[2]);
                $t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");
    			$t->parse("listereponses", "LISTE_REPONSES", true);
    		}
		}
		$cpt = 0;
		$t->set_var("CPT", $cpt++);
		$t->set_var("FONCTION", "onLibererDocument()");
		$t->set_var("LIBELLE_FONCTION", CST_LIBELLE_LIBERER_DOCUMENT);
		$t->parse("bouton", "BOUTON", true);

		// affichage du template
		$t->parse("Output", "lr"); 
		$t->p("Output");
	}
	pos_disconnect($jeton);	
}
else
{
	debug($jeton);
	echec_connexion();
}
?>