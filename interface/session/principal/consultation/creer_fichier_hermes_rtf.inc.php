<?php
/*
 * Creation des fichiers resultant d'une macro Hermes
 * $szFileDonnees : fichier de donnes contenant toutes les valeurs des rubriques
 * 13.12.2004 GG : passage v 10.0.03.001.001
 */
if (!defined("FUNCTION_DEFINE"))
{
	define("FUNCTION_DEFINE", 1); 
	function writeLineRtf($tabDimension, $tabContenu, &$rtf)
	{
		$rtf->rtf_set_ligne_tab("l",10,0,0,0);
		$decalage = 0;
		for($iCol=0;$iCol<count($tabDimension);$iCol++)
		{
			$decalage += $tabDimension[$iCol];
			$rtf->rtf_set_cell_tab($decalage, "c", 1, 0,-1);
			$rtf->rtf_set_para_format();
			$rtf->rtf_set_para_texte($tabContenu[$iCol], -1, 20);
			// $rtf->rtf_set_para_texte($tabContenu[$i]);
			$rtf->rtf_get_cell_tab();
		}
		$rtf->rtf_get_ligne_tab();
	}
}
if(!defined('NATURE_POSEIDON_RTF')) {
    afficheMsg("La nature des documents Rtf doivent être paramétrés dans le fichier de configuration.");
}
else {
  include ("../include/templateII.inc.php");
  include ("../include/php/lib_2rtf.php");
  
  // on recupere le nom de la macro
  $nom_tpl = substr($szInfo, 4);
  
  $file_tpl = REP_TEMPLATE_APPLICATIF."macro/$nom_tpl.rtf";
  
  
  if (file_exists($file_tpl))
  {
  	$bAfficheFichierCree = true;
  	$bFicNoSave = true;
  
  	$t = new TemplateII(".");
  	$t->set_File("macro", $file_tpl);
  
  	$filect = file($szFileDonnees);
  	
  	// on construit la valeur de chaque rubrique
  	while (list($numligne, $ligne) = each($filect))
  	{
  		if (strpos($ligne, "<") !== false)
  		{
  			// On recupère le code de la rubrique.
  			$szCodeRubrique = substr($ligne, 1, 6);
  			$szCodeRubrique = rtrim($szCodeRubrique);
  			
  			// cas des rubriques sur plusieurs lignes.
  			if (isset($szCodeRubriquePrecedent) && (strcmp($szCodeRubriquePrecedent, $szCodeRubrique) ==  0))
  			{
  				// concatenation de la valeur 
  				$szValeurRubrique .= "\par ";
  				$szValeurRubrique .= substr($ligne, 9);
  			}	
  			else
  			{
  				// remplacement d'une valeur
                if (isset($szCodeRubriquePrecedent) && isset($szValeurRubrique))
  				  $t->set_var($szCodeRubriquePrecedent, $szValeurRubrique);
  				$szValeurRubrique = "";
  				$szValeurRubrique .= substr($ligne, 9);
  				$szCodeRubriquePrecedent = $szCodeRubrique;
  			}
  		}
  	}
      $t->set_var($szCodeRubriquePrecedent, $szValeurRubrique);
  	$t->parse("Output", "macro");
  	// on ecrit le tpl
  	$t->write("Output", $szFileDonnees.".rtf");
  
  	$retour = pos_getinfonumdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$objInfoNumDoc);
  
  	if ($retour && (substr($szInfo, 0, 3) == "WMR" || substr($szInfo, 0, 3) == "WMF"))
  	{
  	    $iNumPageInsertion = 0;
  	    if (substr($szInfo, 0, 3) == "WMR" || $objInfoNumDoc->nb_pagereelle == 0)
  	    {
  	       $iNumPageInsertion = $objInfoNumDoc->nb_pagereelle + 1;
              $retour = pos_ajoutepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], 
  				$iNumPageInsertion, 
  				0, 0,0, "", NATURE_POSEIDON_RTF, "", $nom_tpl.".rtf", $szFileDonnees.".rtf");		
          }
          else
          {
              $iNumPageInsertion = 1;
              $retour = pos_remplacepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], 
  							$iNumPageInsertion, 
  							0, 0,0, "", NATURE_POSEIDON_RTF, "", $nom_tpl.".rtf", $szFileDonnees.".rtf");
          }   
  	}
  }
  else
  	echo CST_LIBELLE_HERMES_MACRO." $file_tpl ".CST_LIBELLE_HERMES_MACRO_NOT_DEFINE;
  
  // on efface les fichiers utilises
//  if (file_exists($szFileDonnees))
//   	unlink($szFileDonnees);
  
  $iNumAOuvrir = $iNumPageInsertion;
  
  if (substr($szInfo, 0, 3) == "WMR" && file_exists($szFileDonnees.".rtf"))
  {
  	$bFicNoSave = false;
  	unlink($szFileDonnees.".rtf");
  }
  else
  {
  	$bFicNoSave = true;
  	$szNomFichierWordTmp = $szFileDonnees.".rtf";
  	$szNomFichierWord = strstr($szNomFichierWordTmp, "exportationHermes_");
  }
}
?>
