<?php
/*
 * DESCRIPTION : Module de creation d'une ligne des rub tableaux
 *
 * AUTEUR : Sebastien Costanzo
 * DATE de CREATION : 07/03/2003
 *
 * Donnees en entree : 
 * Données du document principal :
 * POS_VALEUR_TAB_RUB : valeur de la rubrique
 * POS_TYPEDOC_PERE : type du document
 * POS_CODE_RUB : Code de la rub liée
 *
 * Données du nouveau document :
 * POS_TYPEDOC : Type du document
 * POS_CODE_RUB_LIE : Code de la rub liée (rub numérique)
 * POS_VALEUR_RUB_LIE : Valeur de la rub liée 
 * 
 * ENCHAINER : 1 ou 0 pour l'enchainement automatique de la creation.
 *
 * POS_VAL_RUB_XXX : Rubriques du document tableau.
 *
 */
 
session_start();
include ("../include/connexion.inc.php");
include ("../include/form_values.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration/url.conf.php");
include ("../tableau/fonction_tableau.php");

$retour = connexion($jeton);

if ($retour)
{
	// a vérifier : est-ce qu'on ne recupere que les rubriques contenant une valeur ?
	$tabCodeRubToCreate = get_form_values_with_prefix("POS_VAL_RUB_", true);
	$tabCodeRubToCreate[$_REQUEST["POS_CODE_RUB_LIE"]] = $_REQUEST["POS_VALEUR_RUB_LIE"];
	
	// creation du document
	$retour = pos_createidx($jeton, 0, 0, "", $_REQUEST["POS_TYPEDOC"], count($tabCodeRubToCreate), $tabCodeRubToCreate, /*pref*/$iNumDoc);

	// creation OK -> affichage du document en modification
	if ($retour)
	{
		scriptListeTableauCodeHtml($_REQUEST["POS_TYPEDOC_PERE"], $_REQUEST["POS_VALEUR_TAB_RUB"], 
                                        "MODIFICATION", $_REQUEST["POS_CODE_RUB"], "1", true);
	}
	else
	{
	    $_REQUEST["POS_REAFFICHAGE"]=1;
		debug ($jeton);
		include("afficher_creation.php");
	}
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
