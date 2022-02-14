<?php
/*
 * DESCRIPTION : Module d'impression d'une fiche d'index
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 19/06/2001
 *
 * DATE de MODIFICATION : FT 24/03/2003 Fonctionnement par template spécifique par type de document
 * 17/06/2004 : Gestion des rubriques liés et tableaux dans les templates d'impression
 *
 * Donnees en entree : 
 * POS_NUM_DOC : numero informatique du document a modifier/consulter
 * POS_TYPEDOC : type du document (pour trouver le template a utiliser)
 * 01.07.2019 AA Correction affichage des fiches liées quand clic sur bouton "Imprimer"
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if ($retour)
{
// ------------------------------------------------
//         TRAITEMENT
// ------------------------------------------------
	$retour = pos_getallindexdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$codevalrub);

	if ($retour)
	{
        $iNumFiche = (isset($_REQUEST["POS_NUM_FICHE"])) ? $_REQUEST["POS_NUM_FICHE"] : 0;
		$szTypeDoc = $_REQUEST["POS_TYPEDOC"];
		// ------------------------------------------------
		//         DEBUT AFFICHAGE
		// ------------------------------------------------
		$file_tpl = "../../../tpl/".$_SESSION["sess_application"]."/".$szTypeDoc."/impression_".$szTypeDoc."_".$iNumFiche.".tpl";

		//Partie commune
		$t = new Template(".");
		$t->set_var("LIBELLE_IMPRIMER", CST_LIBELLE_IMPRIMER);
		$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
		$t->set_var("URL_CONSULTER_INDEX", URL_CONSULTER_INDEX);
		if (!file_exists($file_tpl))
		{
			//cas de l'utilisation du template par défaut qui prends toutes les rubriques et les affichent
			//à la ligne
			//Permet de récuperer les libellés des rubriques
			$retour = pos_getlistrubintype($jeton, $szTypeDoc, /*pref*/$tabLstRubRmc);

			if($retour)
			{
				$file_tpl = REP_TEMPLATE_APPLICATIF."impression/impression.tpl";
				$t->set_File("consultation", $file_tpl);
				$t->set_block("consultation", "LISTE_RUBRIQUES", "liste_rubriques");
			
				$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
				while (list($key, $val) = each($codevalrub))
				{
					if ($key != "K H")
						$t->set_var("LIBELLE_RUBRIQUE", $tabLstRubRmc["$key"]);
					else
						$t->set_var("LIBELLE_RUBRIQUE", "Clé hierarchique");
					$t->set_var("VALEUR_RUBRIQUE", $val);
					$t->parse("liste_rubriques", "LISTE_RUBRIQUES", true);
				}
			}
			else
				debug($jeton);
			}
		else
		{	
			//Cas ou on a un template dans le répertoire du type de document		
			$t->set_File("consultation", $file_tpl);
			$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);

			while (list($key, $val) = each($codevalrub))
			{			
			 	$t->set_var("POS_VAL_RUB_$key", $val);
			}
		}

			$MODE_IMPRESSION=1;
			
			// on inclu la partie pour les associations.
			if(!file_exists($file_tpl))
			include ("../consultation/afficher_fiche_index_lie.inc.php");
		//On met à jour le template
		$t->pparse("MyOutput", "consultation");
	}
	else
		debug($jeton);
	
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
