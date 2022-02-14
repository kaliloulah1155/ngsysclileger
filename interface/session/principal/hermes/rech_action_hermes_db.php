<?php
/*
 * DESCRIPTION : Module d'affichage des resultats avec affichage des actions
 * hermès 
 * 
 * Recherche des reponses à la question posee (get_reponses.php)
 * Si type dossier
 * 	Affichage de la gestion des pages
 *	Affichage de la liste resumée normale
 *
 * AUTEUR : Sebastien Costanzo
 * DATE de CREATION : 19/12/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document
 * POS_VAL_RUB_RUX ou RUX correspond au code d'une rubrique du type de document
 * POS_NUMLOC nombre de locutions de la recherche élaborée
 *
 * POS_HERM_CODEACT : tableau des codes des actions Hermes a afficher
 * POS_HERM_LIBACT : tableau des libellés des actions Hermès à afficher
 * 
 * POS_HERM_CODES_<code action> : pour chaque action tableau des code rubriques 
 * à transmettre à l'action Hermès
 * POS_HERM_VAL_RUB_<code rubrique> : tableau des valeurs des rubriques
 *
 * MODIFICATIONS
 * 07.01.2002 GG passage des codes rubriques en arguments
 * 06.08.2002 : mise a jour pour reaffichage de l'ecran dans tous les cas
 * 18.02.2003 GG separation du test du retour de la connexion et de get_reponses 
 */

include ("../include/locution.inc.php");
session_start();

include ("../include/connexion.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define("RECHERCHE_SIMPLE", "RECHERCHE_SIMPLE"); 

$retour = connexion($jeton);

if ($retour)
{
	// recuperation des reponses
	// --> toutes les variables reçues en entrées
	// <-- $retour (true ou false)
	// <-- $iNbReponses && $iAdrPremReponses
	include("../resultat/get_reponses.php");

	if ($retour)
	{
		// ------------------------------------------------
		//         DEBUT DE L'AFFICHAGE
		// ------------------------------------------------
		if ($iNbReponses > 0)
		{
			$szProfilLR = isset($_REQUEST["POS_PROFIL_LR"]) ? $_REQUEST["POS_PROFIL_LR"] : "";	
		
			// Affichage de la liste résumée des réponses
			$retour = pos_getreponseslrd($jeton, $iAdrPremiereReponse, $iNbReponses, $iNbReponses, 1, 
				CST_TYPE_TRI, /*pref*/$szProfilLR, /*pref*/$tabReponseLR);

			// recuperation LR reponses OK
   	 	if ($retour)
			{
				$retour = pos_gestplr($jeton, "$szProfilLR", /*pref*/$objLR, /*pref*/$tabZoneLR);

				$szTplName = REP_TEMPLATE_APPLICATIF."hermes/liste_resumee.tpl";
				$tabReponses = $tabReponseLR;
	
				// Afficher reponses
				$t = new template(".");
				$t->set_file("lr", $szTplName);
				$t->set_var("NB_REPONSES", $iNbReponses);
				
				//URL
				$t->set_var("URL_RECH_ACTION", URL_RECHERCHER_ACT_HERMES."?");
				$t->set_var("URL_CONSULT", URL_CONSULTER_INDEX);
				$t->set_var("URL_LANCER", URL_LANCER_NACTIONS);
				$t->set_var("URL_ATTENTE", URL_ATTENTE);
				$t->set_var("POS_QUERY", $_SERVER['QUERY_STRING']); // numéro de fiche de la DA
			
				$t->set_block("lr", "ENTETE", "entete");
				$t->set_block("lr", "LR_REPONSE", "lrreponse");
				$t->set_block("lr", "LISTE_REPONSES", "listereponses");
				$t->set_block("lr", "LISTE_ACTIONS", "listeactions");
				$t->set_block("lr", "LISTE_HERM_VALRUB", "listevalrub");
		
				// pour toutes les actions hermès possibles	
				for ($i=0;$i<count($_REQUEST["POS_HERM_CODEACT"]);$i++)
				{
					// code de l'action
					$szCodeAction = $_REQUEST["POS_HERM_CODEACT"][$i];

					// libelle de l'action
					$szLibelleAction =  $_REQUEST["POS_HERM_LIBACT"][$i];

					// pour chaque action, des valeurs de rubriques peuvent être préciséees
					$szTabCodeRubAction = "POS_HERM_CODES_".$szCodeAction;
					$tabCodeRubAction = $$szTabCodeRubAction;

					for ($j=0;$j<count($tabCodeRubAction);$j++)
					{
						$szCodeRub = $tabCodeRubAction[$j];
						$t->set_var("POS_HERM_CODE_RUB", "POS_HERM_".$szCodeAction."_".$szCodeRub);
						$szTagValeurRub="POS_HERM_VAL_RUB_".$szCodeRub;
						$t->set_var("POS_HERM_VAL_RUB", $$szTagValeurRub);
						$t->parse("listevalrub", "LISTE_HERM_VALRUB", true);
					}

					$t->set_var("POS_HERM_LIBACT", $szLibelleAction);
					$t->set_var("POS_HERM_CODEACT", $szCodeAction);
					$t->parse("listeactions", "LISTE_ACTIONS", true);
				}
			
			
				for ($i=0;$i<count($tabZoneLR);$i++) 
				{
					$t->set_var("TITRE_COLONNE", $tabZoneLR[$i]->zone_titre_col);
					$t->parse("entete", "ENTETE", true);
				}

                $iNumFiche = 0;
				if (isset($_REQUEST["POS_NUM_FICHE"]))
					$iNumFiche = $_REQUEST["POS_NUM_FICHE"];
				for ($i = 0; $i<count($tabReponses); $i++)
				{
					if (($i % 2) == 0)
						$t->set_var("PAIR_OU_IMPAIR",  "pair");
					else
						$t->set_var("PAIR_OU_IMPAIR",  "impair");
					$t->set_var("POS_NUM_DOC", $tabReponses[$i]->numdoc);
					$t->set_var("POS_NUM_FICHE", $iNumFiche);
					$t->set_var("MODE", isset($_REQUEST["MODE"]) ? $_REQUEST["MODE"] : "CONSULTATION");

					$t->set_var("lrreponse", "");
			
					$tabChamps = extraireChampsLR($tabReponses[$i]->lr, "\x02");
					for ($j = 0; $j<count($tabChamps); $j++)
					{
						$t->set_var("ZONE_LR", $tabChamps[$j]."&nbsp;");
						$t->parse("lrreponse", "LR_REPONSE", true);
					}
					$t->parse("listereponses", "LISTE_REPONSES", true);
				}
				$t->parse("Output", "lr"); 
				$t->p("Output");

    		} // pos_getreponseslrd
    		else 
				debug($jeton);

		} // pas de reponses
		else
		{
			afficheMsg(CST_LIBELLE_ACTION_HERMES_NO_DOCUMENT);
		}
	} // recuperation des reponses OK
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
	
?>
