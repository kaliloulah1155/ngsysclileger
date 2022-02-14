<?php
/* Création de modèle pour la rédaction web
* Date : 11/03/2008
* Auteur : PL
*/

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/template.inc.php");
include ("fonction_edition.php");
include ("fct_gerer_modele.php");

include ("../../../../configuration/url.conf.php");

$retour = connexion($jeton);
if ($retour) {

	$t = new Template(REP_TEMPLATE_APPLICATIF."/redaction_web");
	$t->set_File("creation_modele", "creer_modele.tpl");
	$t->set_Block("creation_modele","BLOC_RUBINFO", "bloc_rubinfo");
	
	
	if (isset($_REQUEST["POS_TYPE_ACTION"]))
	{
		$type_action = $_REQUEST["POS_TYPE_ACTION"];
		if ($type_action == "creer") {
		// création	à partir d'un document
				$sztypedoc = $_REQUEST["DOCUMENT"];
				$t->set_var("POS_TYPEDOC", $sztypedoc);
		}		
		else {
		// modification d'un modèle
			$szNomModele =  "../../../../redaction_web/modele/".$_REQUEST["MODELE"];
			$szFileModele=file_get_contents($szNomModele);
			$pattern_typedoc = '/<type_doc>(\w{3})<\/type_doc>/';
			preg_match($pattern_typedoc,$szFileModele,$matches);
			$sztypedoc = $matches[1];
			
			$pattern_contenu = '/<contenu>([\w\W\d\s\r\n]+)<\/contenu>/';
			preg_match($pattern_contenu,$szFileModele,$matches);
			$szContenuModeleTmp = $matches[1];

			$t->set_var("POS_TYPEDOC", $sztypedoc);
            $szContenuModele = replaceContenuModeleHtmlToTiny_MCE($szContenuModeleTmp);			
		}
	}
	elseif (isset($_REQUEST["contenu_modele"]))
	{
		$sztypedoc = $_REQUEST["POS_TYPEDOC"];
		$t->set_var("POS_TYPEDOC", $sztypedoc);
		$szContenuModele = replaceContenuModeleHtmlToTiny_MCE($_REQUEST["contenu_modele"]);
	}
	
	$retour = pos_getinforubintype($jeton, $sztypedoc,"",999, /*pref*/$tabInfoRub);
	if ($retour) {
		for ($i=0;$i<count($tabInfoRub);$i++)
			$tabInfoRubTrie[$tabInfoRub[$i]->code] =  $tabInfoRub[$i]->libelle;
		asort($tabInfoRubTrie);
						
		foreach ($tabInfoRubTrie as $key => $value) 
		{
			$pattern = '/\[XXX'.$key.'XXX\]/';
			$replacement = '['.$value.']';
			$szContenuModele =  preg_replace($pattern, $replacement, $szContenuModele);
			
			$t->set_var("CODERUB", $key);
			$t->set_var("LIBELLERUB", $value);
			$t->parse("bloc_rubinfo", "BLOC_RUBINFO", true);
		}
	}
	else
		debug($jeton);
	$t->set_var("HTML_CONTENU",$szContenuModele);		
	$t->set_var("NOM_FICHIER", $_REQUEST["MODELE"]);
	
	$t->pparse("MyOutput", "creation_modele");

}
else {
 	debug($jeton);
 	echec_connexion();
}
?>
