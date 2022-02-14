<?php
/*
 * Affichage du modèle en mode édition
 * - recuperation des valeurs de la fiche d'index et du fichier associé s'il existe
 * - application de la feuille de style d'édition pour générer le rendu html.
 * Date : 09/03/2007
 * Auteur : GG
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("fonction_edition.php");

$retour = connexion($jeton);

if ($retour)
{
	$rep_session = getRepTmpSession(session_id());
	$nomCompletFichier = $rep_session."document.texte-riche.xml";
	$iNumDoc = $_REQUEST["POS_NUM_DOC"];
	$iNumPage = $_REQUEST["POS_NUM_PAGE"];
	$szNomModele = "";
	
	
	// recuperation des informations sur les fichiers associés
	$retour = phpPosExtraitFichier($jeton, $iNumDoc, $iNumPage, $_REQUEST["MODELE_HTML"], $nomCompletFichier);
	
	if ($retour)
	{
	   // le modele est specifie dans l'URL (cas d'une action Hermes ou autre...)
	   if (isset($_REQUEST["MODELE_HTML"]) && strlen($_REQUEST["MODELE_HTML"]) > 0)
	$szNomModele = $_REQUEST["MODELE_HTML"];
	   // le modele n'est pas specifie dans l'URL (réouverture d'un fichier...)
       else
	   {
            $fp = fopen($nomCompletFichier, 'r');
            $szDebutFic = fread($fp, 300);
            $pattern = "/<modele>.*<\/modele>/";
            $tabMatches = array();
            preg_match($pattern, $szDebutFic, /*pref*/$tabMatches);
            $szNomModele = substr($tabMatches[0], strlen("<modele>"), strlen($tabMatches[0]) - strlen("<modele>") - strlen("</modele>"));
            fclose($fp);
	   }
	}
	$szModeleHtml = $szNomModele.".html";
	
	if ($retour)
	{
		$retour = phpPosExportXml($jeton, $iNumDoc, $rep_session, /*pref*/$fileXmlPos);
	}
	
	pos_disconnect($jeton);
			
	if ($retour)
	{
        try {
			$tabParam = array('fichier_fiche_index' => $fileXmlPos, 'fichier_texte_riche' => $nomCompletFichier,
					'modele_html' => $szNomModele);
    					
            // tester la validite du XML
            // Chargement du fichier XML
            $old_error_handler = set_error_handler("posErrorHandler");
        	$xmlRiche = new domDocument();
        	$bRetourXml = $xmlRiche->load($nomCompletFichier);
            restore_error_handler();
            if ($bRetourXml) {
				echo genererTransformationXslt('../../../../redaction_web/modele/'.$szModeleHtml, '../../../../redaction_web/xsl/poseidon.edition.xsl', $tabParam);
            }
    		
        } catch (Exception $e) {
            echo 'Exception reçue : ',  $e->getMessage(), "\n";
        }
	}
	else
		debug($jeton);
	// ---------------------------
	//TODO : supprimer le fichier
	// ---------------------------
}
else
{
	debug($jeton);
	echec_connexion();
}

// Gestionnaire d'erreurs
function posErrorHandler($errno, $errstr, $errfile, $errline)
{
    switch ($errno) {
        case E_ERROR:
            echo "<b>ERREUR</b> [$errno] $errstr<br />\n";
            break;
    
        case E_WARNING:
            echo "<b>ALERTE</b> [$errno] $errstr<br />\n";
            break;
    
        case E_NOTICE:
            echo "<b>AVERTISSEMENT</b> [$errno] $errstr<br />\n";
            break;
    
        default:
            echo "Type d'erreur inconnu : [$errno] $errstr<br />\n";
            break;
    }

    // Ne pas exécuter le gestionnaire interne de PHP
    return true;
}

?>