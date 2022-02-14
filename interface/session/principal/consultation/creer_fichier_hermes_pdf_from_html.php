<?php
/*
 * Creation des fichiers resultant d'une macro Hermes
 * $szFileDonnees : fichier de donnes contenant toutes les valeurs des rubriques
 */
if(!defined('CST_NATURE_FICHIER_PDF')) {
    afficheMsg("La nature des documents PDF doivent être paramétrés dans le fichier de configuration.");
}
else {
  include ("../include/template.inc.php");
  // on recupere le nom de la macro
  $nom_tpl = substr($szInfo, 4);
  
  $file_tpl = REP_TEMPLATE_APPLICATIF."macro/$nom_tpl.html";
  
  if (file_exists($file_tpl))
  {
  	$bAfficheFichierCree = true;
  	$bFicNoSave = true;
  
  	$t = new Template(".");
  	$t->set_File("macro", $file_tpl);
    
    $retour = pos_getallindexdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$codevalrubHtm);
    // filtre des caracteres speciaux a html
    foreach($codevalrubHtm as $key => $val) {
         $t->set_var("POS_VAL_RUB_$key", htmlspecialchars_currentcharset($val));
    }
    $sContent = $t->parse("Output", "macro");
  	
    $szFichierPdf = $szFileDonnees.".pdf";
    
    // convert in PDF
    require_once(dirname(__FILE__).'/../include/html2pdf/html2pdf.class.php');
    try {
        $html2pdf = new HTML2PDF('P', 'A4', 'fr', false, "ISO-8859-1");
        //      $html2pdf->setModeDebug();
        $html2pdf->setDefaultFont('Arial');
        $content = str_replace("</br>", "", $sContent);
        $content = str_replace("</img>", "", $content);
        $html2pdf->writeHTML($content, false);
        $html2pdf->Output($szFichierPdf, 'F');
    }
    catch(HTML2PDF_exception $e) {
        error_log($e->getMessage());
        $bRetour = false;
    }
  
  	$retour = pos_getinfonumdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$objInfoNumDoc);
  
  	if ($retour && (substr($szInfo, 0, 3) == "WMR" || substr($szInfo, 0, 3) == "WMF"))
  	{
  	    $iNumPageInsertion = 0;
  	    if (substr($szInfo, 0, 3) == "WMR" || $objInfoNumDoc->nb_pagereelle == 0)
  	    {
  	       $iNumPageInsertion = $objInfoNumDoc->nb_pagereelle + 1;
              $retour = pos_ajoutepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], 
  				$iNumPageInsertion, 
  				0, 0,0, "", CST_NATURE_FICHIER_PDF, "", $nom_tpl.".pdf", $szFichierPdf);		
          }
          else
          {
              $iNumPageInsertion = 1;
              $retour = pos_remplacepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], 
  							$iNumPageInsertion, 
  							0, 0,0, "", CST_NATURE_FICHIER_PDF, "", $nom_tpl.".pdf", $szFichierPdf);
          }   
  	}
  }
  else
  	echo CST_LIBELLE_HERMES_MACRO." $file_tpl ".CST_LIBELLE_HERMES_MACRO_NOT_DEFINE;
  
  // on efface les fichiers utilises
//  if (file_exists($szFileDonnees))
//   	unlink($szFileDonnees);
  
  $iNumAOuvrir = $iNumPageInsertion;
  
  if (substr($szInfo, 0, 3) == "WMR" && file_exists($szFileDonnees.".pdf"))
  {
  	$bFicNoSave = false;
  	unlink($szFichierPdf);
  }
  else
  {
  	$bFicNoSave = true;
  	$szNomFichierWordTmp = $szFichierPdf;
  	$szNomFichierWord = strstr($szNomFichierWordTmp, "exportationHermes_");
  }
}
?>
