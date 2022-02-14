<?php

/*
 * 
 * DESCRIPTION : Affichage du resultat des statistiques demandé
 * 				Cette page prend les données de la page d'accueil
 *					et lance les fonction de stats.inc.
 *
 * AUTEUR : Sebastien Costanzo 
 * DATE de CREATION : 28/03/2003
 *
 * Modification :
 * 24.05.2005 GG
 * Pas d'affichage des statistiques si pas de réponses ou erreur => retour à l'écran précédent
 * Code : Création/Utilisation de fonctions, gestion des retours d'erreur, passage en mode warning PHP
 * 		et corrections en conséquence
 * Formatage (retour chariot) du fichier généré pour lisibilité
 *
 * Donnees en entree : 
 * SORTIE : (EXCEL ou HTML) format de sortie
 * RADIO : Nom de la stat (STAT1, STAT2, ...)
 * 
 * On remplace RADIO par la valeur de RADIO
 * RADIO_NOM_QUEST : Nom de la question de la bibliothèque
 * RADIO_LIBELLE_QUEST : Libelle de la question que l'on souhaite afficher
 * RADIO_1 : Valeur des variables pour les questions à résolution de variables
 *					RADIO_1 à RADIO_9.
 * RADIO_GROUPBY : Rubrique sur laquelle on souhaite effectuer les statistiques.
 */

session_start();
include ("../include/question.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("stats.php");
include ("../include/liste_vocab.inc.php");
include ("../include/debug.inc.php");
include ("../include/util_html.inc.php");
include ("../include/locution.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../../../../configuration/url.conf.php");

// $time_start = getmicrotime();
$verifArgument = 1;
// --------------------------
// Vérification des arguments
// --------------------------

if (isset($_REQUEST["RADIO"]) && strlen($_REQUEST["RADIO"]))
	$szNomStat = $_REQUEST["RADIO"];
else
{  
	$verifArgument = 0;
	$tabInfoDebug[0] = "Impossible de récupérer le code de la statistique";
}

	// construction du nom de la question.
$szVarNomQuestion = $szNomStat."_NOM_QUEST";
if (isset($_REQUEST[$szVarNomQuestion]) && strlen($_REQUEST[$szVarNomQuestion]))
	$szNomQuestion = $_REQUEST[$szVarNomQuestion];
else
{
	$verifArgument = 0;
	$tabInfoDebug[0] = "Impossible de récupérer le code de la question";
}

// --------------------
// GROUPBY <obligatoire>
// --------------------
$szNomGroupBy = $szNomStat."_GROUPBY";
if (isset($_REQUEST[$szNomGroupBy]) && strlen($_REQUEST[$szNomGroupBy]))
{
	// separation code rubrique / type liee / rubrique liee
	$tabInfoGroupBy = explode("#", $_REQUEST[$szNomGroupBy]);
	$szCodeRub = $tabInfoGroupBy[0];

	if (count($tabInfoGroupBy) > 1)
	{
		$szCodeTypeLie = $tabInfoGroupBy[1];
		$szCodeRubLie  = $tabInfoGroupBy[2];
	}
	else
	{
		$szCodeTypeLie = "";
		$szCodeRubLie  = "";
	}
}
else
{
	$verifArgument = 0;
	$tabInfoDebug[0] = "Impossible de récupérer le code de la rubrique de regroupement";
}

// --------------------
// XXX_GROUPBY2 <optionnel>
// --------------------
$szNomGroupBy2 = $szNomStat."_GROUPBY2";
if (isset($_REQUEST[$szNomGroupBy2]) && strlen($_REQUEST[$szNomGroupBy2]))
{
	// separation code rubrique / type liee / rubrique liee
	$tabInfoGroupBy2 = explode("#", $_REQUEST[$szNomGroupBy2]);
	$szCodeRub2 = $tabInfoGroupBy2[0];
	
	if (count($tabInfoGroupBy2) > 1)
	{
		$szCodeTypeLie2 = $tabInfoGroupBy2[1];
		$szCodeRubLie2  = $tabInfoGroupBy2[2];
	}
	else
	{
		$szCodeTypeLie2 = "";
		$szCodeRubLie2  = "";
	}
}
else
{
	$szCodeRub2 = "";
	$szCodeTypeLie2 = "";
	$szCodeRubLie2  = "";
}

// --------------------
// XXX_LIBELLE_QUEST <optionnel>
// --------------------
$szLibelleQuestion = $szNomStat."_LIBELLE_QUEST";
$szNewLibelleQuestion  = (isset($_REQUEST[$szLibelleQuestion])) ? stripslashes($_REQUEST[$szLibelleQuestion]) : "";

$tabValVar = array();
// pour toutes les variables de la questions
// association valeur/variables et génération du titre de la question
// exemple titre : "Prêts sur une période du %STAT3_1 au %STAT3_2"
	for($i=1;$i<10;$i++)
	{
		// construction du nom de la variable du formulaire.
	$szNomVar = $szNomStat."_".$i;
	if (isset($_REQUEST[$szNomVar]))
	{
		$szNewLibelleQuestion = preg_replace( "/%".$szNomVar."/", $_REQUEST[$szNomVar], $szNewLibelleQuestion);
		// construction du nom de la variable pour la question.
		$szNomVarQuest = "#?".$i;
		// les valeurs des variables
		$tabValVar[$szNomVarQuest] = $_REQUEST[$szNomVar];
	}
	}

if(!$verifArgument)
	{
	debug_code($tabInfoDebug);
	echo "<SCRIPT>javascript:history.back();</SCRIPT>";
	exit;
	}

$retour = connexion($jeton);
if ($retour)
{  
	$retour = genererStatistiques($jeton, $szNomQuestion, 1, $tabValVar, $szCodeRub,
								$szCodeTypeLie, $szCodeRubLie, 
								$szCodeRub2, $szCodeTypeLie2, $szCodeRubLie2,
								/*pref*/$nbRepTotal, /*pref*/$tabRepByVal,/*pref*/$szLibelleRub, /*pref*/$szLibelleRub2);
	
    $t = new template(REP_TEMPLATE_APPLICATIF."statistiques");

	if ($retour)
	{
		if ($nbRepTotal > 0)
		{
			if(strcmp($_REQUEST["SORTIE"],"EXCEL") == 0)
                header("Content-Type: application/vnd.ms-excel");
			
            if (strlen($szCodeRub2) > 0)
			{
                afficherStatistiques2Entrees($nbRepTotal, $tabRepByVal, $szNewLibelleQuestion, $szLibelleRub, $szLibelleRub2);
            }
			else
			{
			    if(strcmp($_REQUEST["SORTIE"],"EXCEL") == 0)
			        $t->set_file("statistiques", "afficher_stats.tpl");
			    else
                    $t->set_file("statistiques", "afficher_stats_histo.tpl");
                
                $t->set_block("statistiques", "BLOC_LIGNE_STAT", "bloc_ligne_stat");
                afficher_statistiques($t, $nbRepTotal, $tabRepByVal, $szNewLibelleQuestion, $szLibelleRub);
                $t->parse("Output", "statistiques");  
                $t->p("Output");
            }		
		}
    	else
    	{
    		$tabInfoDebug[0] = "Il n\'y a pas de document en réponse à la question";
    		debug_code($tabInfoDebug);
    		echo "<SCRIPT>javascript:history.back();</SCRIPT>";
    	}
	}
	else
		echo "<SCRIPT>javascript:history.back();</SCRIPT>";
	
//$time = getmicrotime() - $time_start;
//echo "<BR><B>Temps ecoulé :</B> ".$time;
	closeHtml();
	
    // deconnexion
    pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
	
?>
