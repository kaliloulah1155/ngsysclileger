<?php

/*
 * DESCRIPTION : Affichage de l'écran de mise à jour en rafale
 * 
 * AUTEUR : GG
 * DATE de CREATION : 04/10/2011
 *
 * Donnees en entree : 
 * INUMQUEST -> numéro de la question
 * POS_NUMDOS -> numéro du dossier 
 * LISTE_NUMDOC -> liste des numéros infos
 * MODIFICATIONS
 * 
 */
 
session_start();

include ("../include/connexion.inc.php");
include ("../include/locution.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/profil.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);

if($retour) {

	$t = new template(REP_TEMPLATE_APPLICATIF."majrafale");
	$t->set_file("export", "majrafale.tpl");
	
	$t->set_block("export", "BLOC_RUB", "bloc_rub");
	
	$t->set_var("PHPSESSID", session_id());
	$t->set_var("CST_MAJRAF_BOUTON", CST_MAJRAF_BOUTON);
	$t->set_var("CST_MAJRAF_TITRE_FENETRE", CST_MAJRAF_TITRE_FENETRE);
	$t->set_var("CST_MAJRAF_LISTE_RUBRIQUE", CST_MAJRAF_LISTE_RUBRIQUE);
	$t->set_var("CST_MAJRAF_VALEUR_INITIALE", CST_MAJRAF_VALEUR_INITIALE);
	$t->set_var("CST_MAJRAF_VALEUR_FINALE", CST_MAJRAF_VALEUR_FINALE);
	$t->set_var("CST_MAJRAF_TOUTES_VALEURS", CST_MAJRAF_TOUTES_VALEURS);
	$t->set_var("CST_MAJRAF_VALEUR_SAISIE", CST_MAJRAF_VALEUR_SAISIE);
    $t->set_var("CST_MAJRAF_MESSAGE_NO_SELECTION", CST_MAJRAF_MESSAGE_NO_SELECTION);
	$t->set_var("LIB_EXPORT_VALID", CST_LIBELLE_VALIDER);
	$t->set_var("LIB_EXPORT_CANCEL", CST_LIBELLE_ANNULER);
	$t->set_var("LIB_EXPORT_XML", CST_EXPORT_XML);
	
	$t->set_var("URL_METTREAJOURRAFALE", URL_METTREAJOURRAFALE);
	
	$t->set_var("LIB_EXPORT_SELECTION_REPONSE", CST_EXPORT_SELECTION_REPONSE);
	$t->set_var("LIB_EXPORT_SELECTION_REPONSE_REP_SEL", CST_EXPORT_SELECTION_REPONSE_REP_SEL);
	$t->set_var("LIB_EXPORT_SELECTION_REPONSE_TOUTES", CST_EXPORT_SELECTION_REPONSE_TOUTES);
	
   	$t->set_var("INUMQUEST", $_REQUEST["INUMQUEST"]);
    $t->set_var("INUMDOS", $_REQUEST["POS_NUMDOS"]);
    $t->set_var("LISTE_NUMDOC", $_REQUEST["LISTE_NUMDOC"]);
            
    // GET_LISTE_RUB_TOUTES = 10;
    $retour = pos_getlisteinfo($jeton, 10, /*pref*/$tabLibRub); 
    asort($tabLibRub);
    $bPrevValIdentique = 0;
    foreach($tabLibRub as $code => $valeur)
    {				
        $t->set_var("CODE", $code);
        $nextVal = current($tabLibRub);
		// concatenation libelle (code) si le libelle est identique au suivant
		// ou si le libelle precedent etait identique
		if (strcmp($valeur, $nextVal) == 0 || $bPrevValIdentique)
		{
			$t->set_var("LIBELLE", $valeur." (".$code.")");
			$bPrevValIdentique = ($bPrevValIdentique && strcmp($valeur, $nextVal) != 0) ? 0 : 1;
		}
		else
			$t->set_var("LIBELLE", $valeur);
		$t->parse("bloc_rub", "BLOC_RUB", true);
    }
	
	$t->parse("Output", "export");  
	$t->p("Output");             

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}


?>
