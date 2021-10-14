<?php
/*
 * DESCRIPTION : Enregistrement des fichiers numérisés par l'applet
 * AUTEUR : GG
 * DATE de CREATION : 01/06/2012
 *
 * Donnees en entree : 
 * POS_NUM_DOC
 * POS_NUM_PAGE
 * POS_NUM_SSPAGE  
 * POS_NOM_FICHIER 
 * MODIFICATION :
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$iNumDoc = $_REQUEST["POS_NUM_DOC"];
$iNumPage = $_REQUEST["POS_NUM_PAGE"];
$iNumSsPage = $_REQUEST["POS_NUM_SSPAGE"];
$szNomFichier = $_REQUEST["POS_NOM_FICHIER"];

echo "Numéro poseidon : " . $iNumDoc . "<br>\n";
echo "Numéro de page : " . $iNumPage . "<br>\n";
echo "Numéro de sous-page : " . $iNumSsPage . "<br>\n";
echo "Nom de fichier : " . $szNomFichier . "<br>\n";

if ($iNumDoc == 0) 
{
	echo "Erreur lors de la récupération du numéro informatique Poseidon.\n";
	exit;
}

if(!(defined('CST_NATURE_FICHIER_JPG') && defined('CST_NATURE_FICHIER_TIFF')))
{
	echo "Numérisation impossible : les natures JPG et TIFF doivent être configurées dans votre client Web.\n Veuillez contacter votre administrateur GED.";
	exit;
}


if(!defined('CST_NATURE_FICHIER_PDF') && defined('NUMERISATION_PDF_CONVERSION') && 
    NUMERISATION_PDF_CONVERSION == 1)
{
	echo "Numérisation avec conversion PDF impossible : la nature PDF doit être configurée dans le client Web.\n Veuillez contacter votre administrateur GED.";
	exit;
}


$bConvertPdf = false;
if(defined('NUMERISATION_PDF_CONVERSION') && NUMERISATION_PDF_CONVERSION == 1)
{
	$bConvertPdf = true;
}
    
if (strlen($szNomFichier) == 0)
	$szNomFichier = "fichier";
		            
$retour = connexion($jeton);
if(defined('NUMERISATION_PDF_CONVERSION') && !function_exists ("pos_exporteimagesdansunpdf"))
{
    $bConvertPdf = false;
    echo "Votre environnement ne permet pas une conversion en PDF.\n";
}
if ($retour)
{
    $tabFichierAConvertir = array();
    if ($iNumPage == 0 || strcmp($iNumPage, "LAST") == 0)	
    {
        $retour = pos_getlisteinfopage($jeton, $iNumDoc, 0, /*pref*/$tabStruListePage);
        $iNumPage = count($tabStruListePage) + 1;
    }
    
    if ($iNumSsPage == 0)
        $iNumSsPage = 0;

    // tri sur les clés (test1_tiff, test2_tiff)
    ksort ($_FILES);
	foreach ($_FILES as $szCleFichier => $tabInfoFichier) 
    {
        echo "szCleFichier : $szCleFichier\n";
        print_r($tabInfoFichier);
        echo "Nom du fichier : ".$tabInfoFichier["name"];
        echo "Chemin : ".$tabInfoFichier["tmp_name"];
		// nom fichier + extension
        // en mode conversion, on ne calcule le nom du fichier que la première fois
        if (!$bConvertPdf)
        {
            if (strlen($szNomFichier) > 0)
    		{
                $szNomFichierCourant = $szNomFichier.".".substr($tabInfoFichier["name"], strpos($tabInfoFichier["name"], ".") + 1);
            }
    		else
                $szNomFichierCourant = $tabInfoFichier["name"];
        }
        else
            $szNomFichierCourant = $szNomFichier.".pdf";  
        
        if (!$bConvertPdf)
        {
            $szNature = "";
            if (strcmp(substr($tabInfoFichier["name"], -4, 4), "tiff") == 0)
                $szNature = CST_NATURE_FICHIER_TIFF;
    	  
            if (strcmp(substr($tabInfoFichier["name"], -3, 3), "jpg") == 0)
                $szNature = CST_NATURE_FICHIER_JPG;
        
            
            if (strlen($szNature) > 0)
            {
                $retour = pos_ajoutepagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, 0, 0, "", $szNature, "", 
    						$szNomFichierCourant, $tabInfoFichier["tmp_name"]);
    			if ($retour)
                    $iNumPage++;
            }
            if(!$retour)
                debug ($jeton);
        }
        else
            $tabFichierAConvertir[] = $tabInfoFichier["tmp_name"];
    }
    if ($bConvertPdf)
    {
        $pdfFile = tempnam(getRepTmpSession(session_id()), "POS_");
        $retour = pos_exporteimagesdansunpdf($tabFichierAConvertir, $pdfFile);
        if ($retour)
            $retour = pos_ajoutepagenumdoc($jeton, $iNumDoc, $iNumPage, $iNumSsPage, 0, 0, "", CST_NATURE_FICHIER_PDF, "", 
    						$szNomFichierCourant, $pdfFile);
        if(!$retour)
            debug ($jeton);
    }
    
	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
