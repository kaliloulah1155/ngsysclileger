<?php
/*
 * Enregistrement des modifications réalisées en mode édition
 * - recuperation de tous les arguments passés en HTTP qui commence par "postext"
 * - création d'un fichier XML de la forme 
 * <?xml version="1.0" encoding="iso-8859-1">
 * <document>
 * <section id="$code">
 * </section>
 * </document>
 * - suppression du premier fichier attaché s'il existe
 * - ajout du fichier
 * Date : 09/03/2007
 * Auteur : GG
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/template.inc.php");
include ("fonction_edition.php");

$retour = connexion($jeton);
$retour = true;
if ($retour)
{
 	$prefix = "postext";
 	//creer le repertoire de session
 	$rep_session = getRepTmpSession(session_id());
 		
 	$file_tpl = "fichier.html";
	$t = new Template("../../../../redaction_web/xhtml/");
 	$t->set_file("xhtml", $file_tpl);

	
	// Information du type de document
	$sztypedoc = $_REQUEST["POS_TYPEDOC"];
	$t->set_var("POS_TYPEDOC", $sztypedoc);

	//--------------------------------------------------------------------------
	//creation du fichier de texte riche par récupération du contenu des sections
	//--------------------------------------------------------------------------
	$szContenuModele = stripslashes($_REQUEST["contenu_modele"]);
 	$patterns[0] = '/\[rubrique \[(\w+)\]\[([\w\s&#;°]+)\]\]/';
	$patterns[1] = '/\[Zone de texte libre : ([^\]]+)\]/';
	$replacements[0] = '<pos:field key="\\1"/>';
 	$replacements[1] = '<pos:text id="postext0">\\1</pos:text>';
	$szContenuModele2 =  preg_replace($patterns, $replacements, $szContenuModele);


	// incrémentation des id=postext des zones de texte de libre
    $i=1;
    while(preg_match('/postext0/', $szContenuModele2)) {
    	$pattern = '/postext0/';
      	$replacement = 'postext'.$i++;
      	$szContenuModele2 = preg_replace($pattern, $replacement, $szContenuModele2, 1);
    }
    
	$_REQUEST["contenu_modele"] = $szContenuModele2;
	$t->set_var("HTML_CONTENU", $szContenuModele2);
	if (strpos($_REQUEST['nomdufichier'], ".html")  === false)
	   $szNomFichier = "../../../../redaction_web/modele/".$_REQUEST['nomdufichier'].".html";
	else
	   $szNomFichier = "../../../../redaction_web/modele/".$_REQUEST['nomdufichier'];
 	$t->parse("Output", "xhtml");;
 	$t->write("Output", $szNomFichier);
 	
 	include("creer_modele.php");
}
else
{
 	debug($jeton);
 	echec_connexion();
}
?>

