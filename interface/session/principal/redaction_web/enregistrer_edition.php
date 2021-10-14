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

if ($retour)
{
	
	$iNumDoc = $_REQUEST["POS_NUM_DOC"];
	$iNumPage = $_REQUEST["POS_NUM_PAGE"];
	$szModeleHtml = $_REQUEST["MODELE_HTML"].".html";
	
	$prefix = "postext";
	//creer le repertoire de session
	$rep_session = getRepTmpSession(session_id());
		
	//creation du fichier
	$szFichierTexteRicheXml = $rep_session."postext.xml";
	$file_tpl = "../../../../redaction_web/xml/fichier.xml";
	$t = new Template(".");
	$t->set_file("xml", $file_tpl);
	$t->set_block("xml", "LISTE_SECTIONS", "liste_sections");
	$t->set_var("MODELE_HTML", $_REQUEST["MODELE_HTML"]);

	//--------------------------------------------------------------------------
	//creation du fichier de texte riche par récupération du contenu des sections
	//--------------------------------------------------------------------------	
	while (list($code, $valeur) = each($_REQUEST))
	{
		// tous les champs de type "postext sont ajouté dans le fichier xml
		// en tant que section
		if (strncmp($code, $prefix, strlen($prefix)) == 0)
		{
			$t->set_var("HTML_ID", $code);
			$t->set_var("HTML_CONTENU", stripslashes($valeur));
			$t->parse("liste_sections", "LISTE_SECTIONS", true);
		}
	}

	$t->parse("Output", "xml");
	$t->write("Output", $szFichierTexteRicheXml);
	
	//---------------------------------------------
	//Ajout du fichier de texte riche dans Poseidon
	//---------------------------------------------
	$iNumSsPage = 0;
	$retour = phpPosAjouteOuRemplacePage($jeton, $iNumDoc, $iNumPage, $iNumSsPage, NATURE_POSEIDON_REDACTION_WEB, 
						$_REQUEST["MODELE_HTML"], $szFichierTexteRicheXml);
	
	if ($retour)
	{
		//---------------------------------------------
		//Conversion du fichier en PDf et ajout du fichier 
		//---------------------------------------------
		$retour = phpPosExportXml($jeton, $iNumDoc, $rep_session, /*pref*/$szFichierIndexPosXml);
		if ($retour)
		{
			$szFichierPdf = $rep_session."apercu.pdf";
			$retourPdf = genererPdf($szFichierIndexPosXml, $szFichierTexteRicheXml, $szModeleHtml, $szFichierPdf);
			if ($retourPdf)
			{
				$iNumSsPage = 1;
				$retour = phpPosAjouteOuRemplacePage($jeton, $iNumDoc, $iNumPage, $iNumSsPage, NATURE_POSEIDON_PDF, 
							$_REQUEST["MODELE_HTML"].".pdf", $szFichierPdf);
			}
			else
			{
				$tabInfoDebug = array();
				$tabInfoDebug[0] = "Le fichier PDF n\'a pas pu être généré.";
				debug_code($tabInfoDebug);
			}
		}
	}
	if (!$retour)
		debug ($jeton);

    // --------------------------------------------
    // Il ne faut pas faire d'inclusion car l'utilisation multiple de la dll
    // provoque des erreurs surprenantes (dupplciation des balises).
	// --------------------------------------------
	
    echo "<script>\n";
    echo "document.location.href='../redaction_web/afficher_edition_vue.php?POS_NUM_DOC=".$_REQUEST["POS_NUM_DOC"]."&POS_NUM_PAGE=".$_REQUEST["POS_NUM_PAGE"]."&MODELE_HTML=".$_REQUEST["MODELE_HTML"]."';\n";
    echo "</script>";
    
	//if ($retour)
	//{
	//	$tabParam = array('fichier_fiche_index' => $szFichierIndexPosXml, 'fichier_texte_riche' => $szFichierTexteRicheXml,
	//				'modele_html' => $_REQUEST["MODELE_HTML"]);
	//	echo genererTransformationXslt('modele/'.$szModeleHtml, 'xsl/poseidon.edition.xsl', $tabParam);
	//}
	//else
	//	debug($jeton);
	
	pos_disconnect($jeton);		

	// ---------------------------
	//TODO : supprimer le fichier
	// ---------------------------

}
else
{
	debug($jeton);
	echec_connexion();
}
?>