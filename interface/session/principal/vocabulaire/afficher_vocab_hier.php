<?php
/*
 *	Recherche du vocabulaire hierarchique.
 *
 *	Seb : 24/06/2002
 *
 *
 */

session_start();

include ("../include/connexion.inc.php");
include ("../include/liste_vocab.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

//connexion à poseidon
$retour = connexion($jeton);

if ($retour)
{
	// on recupere les info sur la rubrique passee...
	$retour = pos_getinforub($jeton, $_REQUEST["POS_CODERUB"], /*pref*/$stInfoRub);
	
	// choix du type de vocabulaire
	// si le type est passée en entrée -> ce type est appliqué
	// sinon vocabulaire hierarchique trie par code. 
	$iTypeVocab = isset($_REQUEST['POS_TYPE_VOCAB']) ? $_REQUEST['POS_TYPE_VOCAB'] : (($stInfoRub->domferme > 0) ? POS_VOCAB_HIE_LIBELLE : POS_VOCAB_HIE_CODE);
	$szDebutMot = stripslashes(urldecode($_REQUEST["POS_DEBUTMOT"]));

	$retour = pos_listevocab($jeton, $_REQUEST["POS_TYPEDOC"], $_REQUEST["POS_CODERUB"], $iTypeVocab, 
				$szDebutMot, 0, 100, /*pref*/$iNbLu, /*pref*/$szVocab);
		
	$liste_mots = extraireVocab($szVocab, $iTypeVocab, $stInfoRub->typerub);
    
    //---------------
    //   AFFICHAGE
    //---------------
	$t=new template(REP_TEMPLATE_APPLICATIF."vocabulaire");
	$t->set_file("vocabulaire", "vocabulaire_hier.tpl");
	$t->set_var("POS_TYPEDOC", $_REQUEST["POS_TYPEDOC"]);
	$t->set_var("POS_CODERUB", $_REQUEST["POS_CODERUB"]);
	$t->set_var("POS_DEBUTMOT", $szDebutMot);
	$t->set_var("POS_TYPERUB", $stInfoRub->typerub);
	$t->set_var("POS_LIBELLERUB", $stInfoRub->libelle);
	$t->set_var("POS_CHAMP", $_REQUEST["POS_CHAMP"]);
	$t->set_var("POS_SZLISTRUB", $_REQUEST["POS_SZLISTRUB"]);
	$t->set_var("POS_AUTORUBFILLE", $_REQUEST["POS_AUTORUBFILLE"]);
	$t->set_var("POS_MULTI", $_REQUEST["POS_MULTI"]);
	
	$t->set_var("ACTION_AFFICHER_VOCAB", URL_AFFICHER_VOCAB_HIER);
	$t->set_var("URL_VOCAB_AJAX", URL_VOCAB_AJAX);
	$t->set_var("LIBELLE_VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
	$t->set_var("LIBELLE_CHAMP", CST_LIBELLE_VOCAB_DU_CHAMP);//w: ajout
	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
	$t->set_var("LIBELLE_AJOUTER", CST_LIBELLE_AJOUTER);
	$t->set_var("LIBELLE_DEBUT_MOT_VOC", CST_LIBELLE_DEBUT_MOT_VOC);
    $t->set_var("LIBELLE_VOCAB_DF_CODE", CST_LIBELLE_VOCAB_CODE);
    $t->set_var("LIBELLE_VOCAB_DF_LIBELLE", CST_LIBELLE_VOCAB_LIBELLE);
	
	// bloc pour les différents vocabulaires.
	$t->set_block("vocabulaire", "DOMAINE", "domaine");
	$t->set_block("vocabulaire", "LISTE_MOTS", "listemots");
	
    $t->set_var("CODE_DOM", POS_VOCAB_HIE_CODE);
    $t->set_var("VALEUR_DOM", CST_LIBELLE_VOCAB_HIER_PAR_CODE);
    $t->set_var("SELECTED", ($iTypeVocab == POS_VOCAB_HIE_CODE) ? "SELECTED" : "");
    $t->parse("domaine", "DOMAINE", true);
		
	if($stInfoRub->domferme > 0)
	{
		$t->set_var("CODE_DOM", POS_VOCAB_HIE_LIBELLE);
		$t->set_var("VALEUR_DOM", CST_LIBELLE_VOCAB_HIER_PAR_LIB);
		$t->set_var("SELECTED", ($iTypeVocab == POS_VOCAB_HIE_LIBELLE) ? "SELECTED" : "");
		$t->parse("domaine", "DOMAINE", true);
        $t->set_var("DISPLAY_SI_EXST_LIB", "");
	}
    else
        $t->set_var("DISPLAY_SI_EXST_LIB", "none");
	
    if(count($liste_mots) > 0)
	{
		while (list($cle, $valeur) = each($liste_mots))
		{		
			$t->set_var("CODE_MOT", $cle);
			$t->set_var("VALEUR_MOT", ($iTypeVocab == POS_VOCAB_HIE_LIBELLE) ? $valeur : $cle);
            $t->set_var("LIBELLE_MOT", $valeur);
			$t->parse("listemots", "LISTE_MOTS", true);
		}
	}	
	$t->parse("Output", "vocabulaire");
	$t->p("Output");
	
	pos_disconnect($jeton);
}
else 
{
	echec_connexion();
	debug ($jeton);
}
?>