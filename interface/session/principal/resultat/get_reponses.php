<?php
/* 
 * DESCRIPTION : Module de recherche et d'enregistrement des questions dans la session 
 * Ce module traite differents types de recherche actuellement possible
 * - recherche par locution (recherche elaboree)
 * Cette recherche permet pour un type de document de creer n locutions (pour le moment 5)
 * en choississant un lien, un code rubrique, un operateur et une valeur
 *
 * - recherche simple (recherche par fiche d'index)
 * La recherche simple se fait habituellement a partir d'un modele de fiche d'index
 * Une locution est creee pour chaque valeur de la fiche qui est renseignee. Les locutions
 * sont separees par un lien "ET" a l'exception de la premiere dans laquelle le lien OU est
 * obligatoire. Par defaut, l'operateur de la locution est le "=" mais il peut être specifie dans
 * les donnees en entree avec le tag POS_OP_RUB_RUX ou XXX est le code de la rubrique.
 * 
 * - recherche par numero de question (historique)
 *
 * - Question de bibliothèque
 *
 * - recherche thesaurus : elle s'apparente à une recherche elaboree a laquelle on associe,
 * pour chaque locution, trois champs de recherche supplementaires pour le thesaurus (option
 * du thesaurus, profondeur et synonyme)
 *
 * --> toutes les variables reçues en entrées
 * <-- iNbReponses 
 * <-- iAdrPremReponses
 * <-- bResoVariable
 * <-- retour
 *
 * Modifications :
 * 06.01.2003 GG gestion de plusieurs recherches tous types
 * 19.03.2003 GG les questions de la bibliotheque sont enregistrees dans l'historique
 * suppression de la distinction recherche thesaurus/recherche elaboree
 * 24.03.2003 GG : meme gestion pour les recherches thesaurus et les recherches elaborees
 * et ajout de commentaire
 *
 * TYPE_RECHERCHE : 
 *		Question de la bibliothèque
 *  ou
 * 				- RECHERCHE_ELABOREE
 *					- RECHERCHE_POS_NUM_DOC
 *					- RECHERCHE_CLE
 *					- RECHERCHE_SIMPLE
 * 24.06.2003 GG Correction question bibliothèques - prise en compte thesaurus
 */

include ("../include/form_values.inc.php");
$iSearch = 1;

$tabLoc = array();
/*echo "szTypeRecherche::$szTypeRecherche"."<br>";
echo "isset(szTypeRecherche)::".(isset($szTypeRecherche) ? "true" : "false")."<br>";
echo "nom question:".(isset($_REQUEST["POS_QUEST_NOM"]) ? $_REQUEST["POS_QUEST_NOM"] : "")."<br>";
echo "iNumQuest:".(isset($iNumQuest) ? $iNumQuest : "")."<br>";
echo "POS_QUEST_RES_VAR:".(isset($_REQUEST["POS_QUEST_RES_VAR"]) ? $_REQUEST["POS_QUEST_RES_VAR"] : "")."<br>";
echo "POS_NUMDOS:".(isset($_REQUEST["POS_NUMDOS"]) ? $_REQUEST["POS_NUMDOS"] : "")."<br>";
*/
// cas d'une question de la bibliothèque ou BAL posee pour la 1ere fois
if ((strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0 || strcmp($szTypeRecherche, "RECHERCHE_BIB") == 0) 
    && !isset($iNumQuest) || (isset($_REQUEST["POS_QUEST_RES_VAR"]) && $_REQUEST["POS_QUEST_RES_VAR"]==1)) 
{
	$_REQUEST["POS_QUEST_NOM"] = stripslashes(urldecode($_REQUEST["POS_QUEST_NOM"]));
	$retour = pos_bib_getlocutionsquest($jeton, $_REQUEST["POS_QUEST_NOM"], $_REQUEST["POS_QUEST_PUBLIC"], /*pref*/$tabLocBib);

    if(!$retour)
        debug($jeton);

	// teste, dans le cas de la presence de variables, si elles ont ete renseignees.
	if (isset($_REQUEST["POS_QUEST_RES_VAR"]) && $_REQUEST["POS_QUEST_RES_VAR"]==1)
	{
	    // pour insérer dans l'historique;
	    $szTypeRecherche = "RECHERCHE_ELABOREE";
		// Recherche de toutes les valeurs.
		for($k=1 ; $k<10 ; $k++)
		{
			$szNomVarRech = "POS_VAR_RECH_".$k;
			if(isset($_REQUEST[$szNomVarRech]) && $_REQUEST[$szNomVarRech] != "")
				$tabValVar["#?".$k]=stripslashes($_REQUEST[$szNomVarRech]);
		}
		// parcourt des locutions de la question pour rechercher des codes à remplacer
		remplaceVarTabLocutionQuestionBib($tabValVar, $tabLocBib, /*pref*/$tabLoc);
	}
	// sinon on teste si la question comporte une ou plusieurs variables
	else
	{
	    //$tabQuestVar : [code_typ] => DOS, [code_rub] => NUP, [code_ope] => =, [id_var] => 1
		$retour = pos_bib_getvariablesquest($jeton, $_REQUEST["POS_QUEST_NOM"], $_REQUEST["POS_QUEST_PUBLIC"], /*pref*/$tabQuestVarPar);
        $_SESSION["tabQuestVar"] = $tabQuestVarPar;
		if(count($_SESSION["tabQuestVar"]) > 0)
		{
			$bResoVariable = true;
			// on redirige vers un ecran intermediaire
			include("afficher_resolution_variable.php");
		}
		else
		{
			// ce n'est pas une question avec variables : 
			// on libere la variable de session tabQuestVar
			unset($_SESSION["tabQuestVar"]);
			for($i=0;$i<count($tabLocBib);$i++)
				copyLocutionBibToLocutionPhp($tabLocBib[$i], /*pref*/$tabLoc[$i]);
		}
	}
}
// ce n'est pas une question de la bibliothèque
else
{
    if (isset($_REQUEST["FILTRE"]) && strcmp($_REQUEST["FILTRE"], "1") == 0) 
    {
        $szTypeRecherche = "RECHERCHE_ELABOREE";
        $iSearch = getTabLocRechercheFiltre($jeton, (isset($iNumQuest) ? $iNumQuest : (-1)), 
                                            $_REQUEST, $_SESSION, $tabLoc);
        // important, c'est ce qui permet de relancer la question
        unset($iNumQuest);
	}
	// recherche
	else
	{
        if (!isset($iNumQuest)) {
        
            if (strcmp($szTypeRecherche, "RECHERCHE_ELABOREE") == 0
    			|| strcmp($szTypeRecherche, "RECHERCHE_BIB") == 0
    			|| strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0 )
        	{
                $iSearch = getTabLocRechercheElaboree($_REQUEST, $tabLoc);
        	}
        	// RECHERCHE PAR NUMERO DE DOC
        	else if($szTypeRecherche == "RECHERCHE_POS_NUM_DOC")
        	{
        		$tabLoc[0] = new Locution(1, "000", "N D", "=", $_REQUEST["POS_NUM_DOC"]);
        	}
        	// RECHERCHE PAR CLE HIERARCHIQUE
        	else if($szTypeRecherche == "RECHERCHE_CLE")
        	{
    			$tabLoc[0] = new Locution(1,$_REQUEST["POS_TYPEDOC"], "K H", ":", trim($_REQUEST["POS_VAL_RUB_K_H"]));
        	}
        	else if($szTypeRecherche == "RECHERCHE_PANIER")
        	{
                include ("../panier/fct_panier.inc.php");
        	    $iSearch = getTabLocRecherchePanier($jeton, $_SESSION, $tabLoc);
        	}
        	else if($szTypeRecherche == "RECHERCHE_HISTORIQUE")
        	{
                $iSearch = getTabLocRechercheHistorique($_SESSION, $tabLoc);
        	}
        	else if($szTypeRecherche == "RECHERCHE_FTX_LOC")
        	{
        	   $tabLoc = $tabLocFtx;
            }
            // RECHERCHE SIMPLE
        	else
        	{ 
    			$szTypeRecherche = "RECHERCHE_SIMPLE";
    			$iSearch = getTabLocRechercheSimple($_REQUEST, $tabLoc);
        	}
        }
	}
}
/*
 * A ce point,
 * soit on a un numero de question enregistre
 * soit un tableau de locution est contruit
 * soit c'est une question a resolution de variable
 */
if (isset($iNumQuest) && !$bResoVariable) {

	$szTypeRecherche = $_SESSION["sess_tabHistQuest"][3][$iNumQuest];
	// recuperation des locutions de la question posée 
	$tabLoc = array_slice($_SESSION["sess_tabHistQuest"][0][$iNumQuest], 0, count($_SESSION["sess_tabHistQuest"][0][$iNumQuest]));
	// dans le cas d'une recherche BAL, pos_lancebal pour passer outre 
	// les questions de restriction
	if(strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0)
	{
		$szCodeBal = $_SESSION["sess_tabHistQuest"][4][$iNumQuest];
	    $iSearch = pos_lancebal($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
	    // si la question est enregistrée, on met à jour le nombre de réponses	    
    	if (isset($_SESSION["sess_tab_reponses_bal"]) && array_key_exists($szCodeBal, $_SESSION["sess_tab_reponses_bal"]))
			$_SESSION["sess_tab_reponses_bal"][$szCodeBal] = $iNbReponses;
	}
    else
	{
		$iSearch = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
		$_SESSION["sess_tabHistQuest"][1][$iNumQuest] = $iNbReponses; 
    }
    if (isset($_REQUEST["POS_NEW_QUESTION"]) && strcmp($_REQUEST["POS_NEW_QUESTION"], "1") == 0)
		$bNewQuestion = true;
	else
		$bNewQuestion = false;
    if (!$iSearch)
	   debug ($jeton);
}
/*
 * si la question en cours n'a pas deja ete enregistre (ie $iNumQuest non positionne)
 * on l'enregistre en stockant
 * le tableau de locutions
 * la date
 * le nombre de reponses
 */
else if (!isset($iNumQuest) && isset($tabLoc) && count($tabLoc) && !$bResoVariable)
{         
	$bNewQuestion = true;
	if (isset($_SESSION["sess_tabHistQuest"][0]) )
		$iNumQuest = count($_SESSION["sess_tabHistQuest"][0]);
	else
		$iNumQuest = 0;

    // la question n'était pas dans l'historique -> on la rentre
	$_SESSION["sess_tabHistQuest"][0][$iNumQuest] = array_slice($tabLoc, 0, count($tabLoc));

	// dans le cas d'une recherche BAL, pos_lancebal pour passer outre 
	// les questions de restriction
	if(strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0)
	{
	    $iSearch = pos_lancebal($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
	}
	else 
	    $iSearch = pos_searchdoc($jeton, count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);

	// conservation du nombre de réponses et de la date
	$_SESSION["sess_tabHistQuest"][1][$iNumQuest] = $iNbReponses; 
	$_SESSION["sess_tabHistQuest"][2][$iNumQuest] = date("d/m/y  H:i"); 
	$_SESSION["sess_tabHistQuest"][3][$iNumQuest] = $szTypeRecherche;
	
	if(strcmp($szTypeRecherche, "RECHERCHE_BAL") == 0 || strcmp($szTypeRecherche, "RECHERCHE_BIB") == 0 || 
        (isset($_REQUEST["POS_QUEST_NOM"]) && strlen($_REQUEST["POS_QUEST_NOM"]) > 0)) 
		$_SESSION["sess_tabHistQuest"][4][$iNumQuest] = $_REQUEST["POS_QUEST_NOM"];
    
    if(strcmp($szTypeRecherche, "RECHERCHE_PANIER") == 0)
        $_SESSION["sess_tabHistQuest"][4][$iNumQuest] = CST_LIBELLE_PANIER;
        
    if(strcmp($szTypeRecherche, "RECHERCHE_HISTORIQUE") == 0)
        $_SESSION["sess_tabHistQuest"][4][$iNumQuest] = CST_LIBELLE_DOSS_HISTORIQUE;

	if (isset($_REQUEST["POS_NUM_FICHE"]))
		$_SESSION["sess_tabHistQuest"][5][$iNumQuest] = $_REQUEST["POS_NUM_FICHE"];
	else
		$_SESSION["sess_tabHistQuest"][5][$iNumQuest] = 0;

	if (!$iSearch)
		debug ($jeton);
}
else
{
	if (isset($_REQUEST["POS_NEW_QUESTION"]) && strcmp($_REQUEST["POS_NEW_QUESTION"], "1") == 0)
		$bNewQuestion = true;
	else
		$bNewQuestion = false;
}
?>