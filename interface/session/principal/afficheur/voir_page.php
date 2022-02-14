<?php
/*
 * DESCRIPTION : Affichage du visualiseur de page
 * 2012.06.07 : reprise pour éviter chargement du fichier pDF 2 fois 
 */
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration/url.conf.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/posdav.inc.php");
include ("../include/imagette.inc.php");
include ("../include/pdf_info.php");

define("PATH_IMAGETTE_NON_DISPO", "../../../../images/afficheur/image_non_dispo.jpg");
define("URL_IMAGETTE_NON_DISPO", PATH_IMAGETTE_NON_DISPO);

if (isset($_REQUEST["NB_PAGES"]) && $_REQUEST["NB_PAGES"] != 0)
{
    $szUrlImagette = URL_IMAGETTE_NON_DISPO;
    $time_start = getmicrotime();
    $retour = connexion($jeton);
	$time = getmicrotime() - $time_start;
	$szTaille = "0";
	$iNbPages = 0;
    //error_log("Temps ecoule connexion : ".$time);
    if ($retour)
    {
    	$fileName = tempnam(getRepTmpSession(session_id()), "POS_");
    	$retour = pos_dmdpagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $_REQUEST["POS_NUM_FICHIER"], $_REQUEST["POS_NUM_SSFICHIER"], $fileName, /*pref*/$objInfoPage);
    	pos_disconnect($jeton);
    	$time = getmicrotime() - $time_start;
        //error_log("Temps ecoule recuperation page : ".$time);
        if ($retour)
        {
            $szNaturePage = $objInfoPage->szNature;
            
            if (strcmp($szNaturePage, CST_NATURE_FICHIER_JPG) == 0 || strcmp($szNaturePage, CST_NATURE_FICHIER_TIFF) == 0) 
            {
                $szTaille = isset($_REQUEST["POS_TAILLE"]) ? $_REQUEST["POS_TAILLE"] : TAILLE_IMAGETTE;
                $iNumPage = isset($_REQUEST["NUM_PAGE"]) ? $_REQUEST["NUM_PAGE"] : 1;
                $fileNameImagetteTmp = getRepDavSession(session_id())."imagette.jpg";
                if (file_exists($fileNameImagetteTmp))
                    unlink($fileNameImagetteTmp);
                //error_log("fileNameImagette:".$fileNameImagette);
                //copy($fileName, getRepTmpSession(session_id())."image".$objInfoPage->szExtension);
                //$fileName = getRepTmpSession(session_id())."image".$objInfoPage->szExtension;
                $time_start = getmicrotime();
                resizeTaille($fileName, $fileNameImagetteTmp, $szNaturePage, $iNumPage, $szTaille);
                $time = getmicrotime() - $time_start;
                //error_log("Temps ecoule : ".$time);
                if (file_exists($fileNameImagetteTmp))
                {
                    //$fileNameImagette = $fileNameImagetteTmp;
                    $szUrlImagette = getUrlDavSession(session_id())."imagette.jpg";
                    $szUrlImagette.= "?random=".rand();
                    $iNbPages = 1;
                }
            }
        }
    }

    if (strcmp($szNaturePage, CST_NATURE_FICHIER_PDF) == 0) {

		$fp= fopen($fileName,"rb");
		header("Cache-Control: ");// leave blank to avoid IE errors
		header("Pragma: ");// leave blank to avoid IE errors
        header("Content-Type: application/pdf");
		header("Content-Length: ".filesize($fileName)."");
		$szNomFichierOrigine = "document.".$objInfoPage->szExtension;
		header("Content-Disposition: inline; filename=\"".$szNomFichierOrigine."\";");
		    
		//affichage du fichier, on passe l'ID du fichier
		fpassthru($fp);
		flush();
		fclose($fp);
    }
    else {
        $t = new template(REP_TEMPLATE_APPLICATIF."afficheur");
        $t->set_file ("visualiseur_page", "visualiseur_page.tpl");
        $t->set_var("URL_IMAGE_FICHIER", $szUrlImagette);
        $t->pparse("Output", "visualiseur_page");
    }    
}
else
    afficheMsg("Ce document n'est pas disponible en visualisation interne")
?>
