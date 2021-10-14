<?php
/*
 * DESCRIPTION : Module de modification d'un document d'un rubrique tableau
 * 
 * AUTEUR : Sebastien Costanzo
 * DATE de CREATION : 02/04/2003
 *
 * POS_VALEUR_TAB_RUB : numero informatique du document
 * POS_TYPEDOC_PERE : type du document
 *
 * Données du nouveau document :
 * POS_TYPEDOC : Type du document
 * POS_CODE_RUB_LIE : Code de la rub liée (rub numérique)
 *
 * POS_VAL_RUB_XXX : ensemble des valeurs des rubriques a modifier 
 *  ou XXX correspond au code d'une rubrique du type de document
 *
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/form_values.inc.php");
include ("../include/debug.inc.php");
include ("../tableau/fonction_tableau.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if ($retour)
{
	// a vérifier : est-ce qu'on ne recupere que les rubriques contenant une valeur ?
	// non au moins pour la clé hierarchique 
	$tabCodeRubModifiee = get_form_values_with_prefix("POS_VAL_RUB_", true);	
	// on recupere les anciennes valeurs des rubriques
	$tabCodeRubOld = get_form_values_with_prefix("POS_OLD_VAL_RUB_", true);
	
	// on etablit la comparaison
	// tous les elements du tableau 1 qui sont pas dans 2 sont les
	// rubriques modifiees
	$result=array();
	while (list($key, $val) = each($tabCodeRubModifiee))
	{
		if (strcmp(rtrim($val), rtrim($tabCodeRubOld[$key])) != 0)
		{
			$result[$key] = $val;
		}
	}
	reset($result);
    if (strcmp($_REQUEST["TYPE_ACTION"], CST_LIBELLE_ACTION) == 0)
	{
		// l'action hermes est bien renseigné 
		if (isset($_REQUEST["POS_ACTION_HERMES"]))
		{
			// Séparation du CODE_ACTION du SEPARATEUR.CODE_RUB_NON_MODIF
			$tabSplitActionHermes=explode("###",$_REQUEST["POS_ACTION_HERMES"]);
			$sActionHermes=$tabSplitActionHermes[0];
            $retour = pos_hermes_rempliraction($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$tabActionsHermes);
            if ($retour)
			{
				$szFileDonnees = "";
				$retour = pos_hermes_lanceraction($jeton, $_REQUEST["POS_NUM_DOC"], $sActionHermes, 
						$result, $szFileDonnees, /*pref*/$dwAfficheDoc, /*pref*/$dwNumDocAff, /*pref*/$szInfo);
            }
        }
    }
    else
	   $retour = pos_modifidx($jeton, $_REQUEST["POS_NUM_DOC"], count($result), $result, /*pref*/$wBadRub);
	
	if ($retour)
	{
		scriptListeTableauCodeHtml($_REQUEST["POS_TYPEDOC_PERE"], $_REQUEST["POS_VALEUR_TAB_RUB"], "MODIFICATION", 
                            $_REQUEST["POS_CODE_RUB"], "1", true);
	}
	else
	{
		// reaffichage pour conserver les valeurs précedemment modifiées
	    $_REQUEST["POS_REAFFICHAGE"] = 1;
		debug ($jeton);
		include("consulter_db.php");
	}

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
	
?>
	
