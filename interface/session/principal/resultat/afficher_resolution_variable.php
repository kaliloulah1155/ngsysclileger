<?php
/*
 * DESCRIPTION : Module de résolution des variables d'une question de la bib ou des BAL
 *
 * AUTEUR : SABONNADIERE Marc
 * DATE de CREATION : 25/07/2001
 * MODIFICATIONS :
 */
if (!isset($_SESSION))
session_start();

include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/libelle_operateur.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

if(isset($_SESSION["tabQuestVar"]))
{
	$retour = connexion($jeton);
	
	// on s'assure que le tableau tabQuestVar contenant les infos sur les variables à renseigner existe
	if ($retour) 
	{
		$t=new template(REP_TEMPLATE_APPLICATIF."variable");
		$t->set_file("variable", "variable.tpl");
	
		// on cree un formulaire pour renseigner chaque variable
		$url= URL_RESULTAT."?";
	
		$t->set_var("POS_ACTION", $url);
        $t->set_var("URL_ATTENTE", URL_ATTENTE);
		$t->set_var("POS_QUEST_NOM", stripslashes($_REQUEST["POS_QUEST_NOM"]));
		$t->set_var("POS_QUEST_PUBLIC", $_REQUEST["POS_QUEST_PUBLIC"]);
		$t->set_var("POS_QUEST_RES_VAR", "1");
		$t->set_var("POS_QUEST_NB_VAR", count($_SESSION["tabQuestVar"]));
		$t->set_var("POS_PROFIL_LR", isset($_REQUEST["POS_PROFIL_LR"]) ? stripslashes($_REQUEST["POS_PROFIL_LR"]) : "");
		
		$t->set_var("LIBELLE_BOUTON_RECHERCHER", CST_LIBELLE_RECHERCHER);
		$t->set_var("LIBELLE_BOUTON_FERMER", CST_LIBELLE_FERMER);
        $t->set_var("LIBELLE_MSG_VARIABLES_NON_VIDE", CST_LIBELLE_MSG_VARIABLES_NON_VIDE);
		$t->set_var("TITRE_RESOLUTION", CST_LIBELLE_TITRE_RESOLUTION_VAR);

		$t->set_block("variable", "LISTE_VARIABLES", "liste_variables");
		// on boucle sur toutes les variables de la questions...
		for($i=0;$i<count($_SESSION["tabQuestVar"]);$i++) 
		{
		    
			$libelleOpe = get_libelle_operateur($_SESSION["tabQuestVar"][$i]->code_ope, $jeton, $_SESSION["tabQuestVar"][$i]->code_rub);
            $szLibelleRub = getLibelleChampsSpeciaux($_SESSION["tabQuestVar"][$i]->code_rub);
		    if (strlen($szLibelleRub) == 0)
		    {
		      $retour = pos_getinforub($jeton, $_SESSION["tabQuestVar"][$i]->code_rub, /*pref*/$objInfoOneRub);
              $szLibelleRub = $objInfoOneRub->libelle;
            }
		      
			$t->set_var("POS_LIBELLE_RUB", $szLibelleRub);
			$t->set_var("POS_LIBELLE_OPE", $libelleOpe);
			$t->set_var("POS_NUM_LIGNE", $i);
			$t->set_var("POS_NUM_VARIABLE", $_SESSION["tabQuestVar"][$i]->id_var);
			$t->set_var("POS_CODE_RUB", $_SESSION["tabQuestVar"][$i]->code_rub);
			$t->set_var("POS_CODE_TYP", $_SESSION["tabQuestVar"][$i]->code_typ);

		    $t->set_var("DISPLAY_CALENDRIER", (isset($objInfoOneRub) && $objInfoOneRub->typerub == 2) ? "inline" : "none");
			$t->parse("liste_variables", "LISTE_VARIABLES", true);
		}
		
		// on libere la variable de session
		$t->parse("Output", "variable");
		$t->p("Output");
		
		pos_disconnect($jeton);
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}
}

?>