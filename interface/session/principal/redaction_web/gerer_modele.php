<?php
/* Gestion de modèle pour la rédaction web
* Date : 18/03/2008
* Auteur : PL
*/

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/url.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
//include ("../interface/session/principal/include/fonction_util.inc.php");
//include ("fonction_edition.php");

$retour = connexion($jeton);
if ($retour) {

	$t = new Template(REP_TEMPLATE_APPLICATIF."redaction_web");
	$t->set_File("gestion_modele", "gerer_modele.tpl");
	
	$t->set_var("TITRE_PAGE", CST_TITRE_PAGE_GESTION_MODELE);
	$t->set_var("MODIFIER_MODELE", CST_LIBELLE_MODIF);
	$t->set_var("CREER_MODELE", CST_LIBELLE_CREER);
	$t->set_var("MODIFICATION_MODELE", CST_LIBELLE_MODIFICATION_MODELE);
	$t->set_var("CREATION_MODELE", CST_LIBELLE_CREATION_MODELE);
	
	$t->set_var("MODELES_PREEXISTANT", CST_LIBELLE_MODELE_PREEXISTANT);
	$t->set_var("TYPES_DOCUMENT", CST_LIBELLE_TYPES_DOCUMENT);
	
	$t->set_var("NO_MODELE_SELECTIONNE", CST_MESSAGE_NO_MODELE_SELECTIONNE);
	$t->set_var("NO_TYPEDOC_SELECTIONNE", CST_MESSAGE_NO_TYPEDOC_SELECTIONNE);
	$t->set_Block("gestion_modele","LISTE_MODELE", "liste_modele");
	$t->set_Block("gestion_modele","LISTE_TYPE_DOCUMENT", "liste_type_document");
	
	// Affichage des modèles existatnts
	chdir('../../../../redaction_web/modele');
	$i=0;
	if ($handle = opendir('.')) {
	   while (false !== ($file = readdir($handle))) {
	   		 if ($file != "." && $file != "..")
			 	//echo "$file\n";
				 $tabNomModele[$i++] = $file;	
		}
	closedir($handle);
	}
	for($i=0;$i<count($tabNomModele);$i++) {
		$t->set_var("NOM_MODELE",$tabNomModele[$i]);
		$t->parse("liste_modele", "LISTE_MODELE", true);
	}
	
	// Affichage des types de documents
	$retour = pos_getlistalltypes($jeton, /*pref*/$tabTousTypDoc);
	if ($retour) {
		foreach ($tabTousTypDoc as $key => $value) {
			$t->set_var("CODE_DOCUMENT",$key);
			$t->set_var("LIBELLE_DOCUMENT",$value);
			$t->parse("liste_type_document", "LISTE_TYPE_DOCUMENT", true);
		}	
	}
	else
		debug($jeton);
		
	//chdir('..');
	$t->pparse("MyOutput", "gestion_modele");
}
else {
 	debug($jeton);
 	echec_connexion();
}
?>
