<?php
/*
 * DESCRIPTION : Module de creation d'une fiche d'index
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document 
 * POS_VAL_RUB_RUX : valeur de la rubrique de code RUX
 * Reste a gerer :
 * POS_TYPE_CLOI : le cloisonnement
 * POS_NIV_HAB : le niveau d'habilitation
 * POS_IND_HAB : l'indice d'habilitation
 * Gaby : 26.10.2001 : reaffichage après une création infructueuse
 * PL 	: 27.07.2007 : les variables issues de GET et POST sont recuperees par $_REQUEST
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/form_values.inc.php");
include ("../include/debug.inc.php");

$retour = connexion($jeton);

if ($retour)
{
	// a vérifier : est-ce qu'on ne recupere que les rubriques contenant une valeur ?
	$tabCodeRubToCreate = get_form_values_with_prefix("POS_VAL_RUB_", true);
	while (list($key, $val) = each($tabCodeRubToCreate))
		$tabCodeRubToCreate[$key] = trim($val);

	// traitements spéciaux
	$file = "special_creation_".$_SESSION["sess_application"].".php";
	if (file_exists($file))
	{
		include($file);
	}

	$iIndConf = (isset($_REQUEST["POS_CONF_HAB"])) ? $_REQUEST["POS_CONF_HAB"] : "0";
	$iNivConf = (isset($_REQUEST["POS_CONF_NIV"])) ? $_REQUEST["POS_CONF_NIV"] : "0";
	$szCloison = (isset($_REQUEST["POS_CLOISON"])) ? $_REQUEST["POS_CLOISON"] : "";
		
	// creation du document
	$retour = pos_createidx($jeton, $iIndConf, $iNivConf, $szCloison, 
					$_REQUEST['POS_TYPEDOC'], count($tabCodeRubToCreate), $tabCodeRubToCreate, /*pref*/$iNumDoc);

	// creation OK -> affichage du document en modification
	if ($retour)
	{
		$_REQUEST["POS_NUM_DOC"] = $iNumDoc;
        
        if (isset($_REQUEST["NUM_PERE_INSERT_DOS"]) && strlen($_REQUEST["NUM_PERE_INSERT_DOS"]) != 0) {
            $retour = pos_dosajouterfilsdossier($jeton, $_REQUEST["NUM_PERE_INSERT_DOS"], $_REQUEST["POS_NUM_DOC"],/*pref*/$objdos);
            if (!$retour) {
            	debug($jeton);
            }
        }

		// traitements spéciaux
		$file = "special_creation_apres_".$_SESSION["sess_application"].".php";
		if (file_exists($file))
		{
			include($file);
		}
	
		if($_SESSION["sess_droitModification"])
			$_REQUEST["MODE"] = "MODIFICATION";
		else
			$_REQUEST["MODE"] = "CONSULTATION";

		include("../consultation/consulter_index.php");
        echo "<script>\n";
        echo "parent.changeIdFrameCreationToDocument($iNumDoc);\n";
        echo "</script>\n";
	}
	// creation NOK -> réaffichage du formulaire de saisie avec 
	// les valeurs déjà renseignées
	else
	{
		$_REQUEST["POS_REAFFICHAGE"]=1;
		
		pos_geterreur($jeton, /*pref*/$tabErreur);
		// gestion du message d'erreur.
		$szMsg = $tabErreur["msg2"];
		
		$szMsg = strrchr($szMsg,"(");
		$szRubErreur = substr($szMsg,1,strrpos($szMsg,")")-1);
		
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
