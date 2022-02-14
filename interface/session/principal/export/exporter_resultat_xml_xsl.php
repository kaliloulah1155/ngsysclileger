<?php

/*
 * DESCRIPTION : Exportation de la liste des reponses au format xml avec feuille de style xsl
 * 
 * AUTEUR : GG
 * DATE de CREATION : 24/09/2009
 *
 * Donnees en entree : 
 *
 * INUMQUEST : Numero de la question 
 * ou 
 * LISTE_NUMDOC : Liste des numéro informatiques
 * 
 * MODIFICATIONS
 * 
 */

include ("../include/locution.inc.php");
session_start();

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/locution.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

$retour = connexion($jeton);

if($retour) 
{
    $tabLoc = array();
    if (isset($_REQUEST["RADIO"]))
    {
        $verifArgument = 1;
        if (isset($_REQUEST["RADIO"]) && strlen($_REQUEST["RADIO"]))
            $szNomStat = $_REQUEST["RADIO"];
        else
        {  
            $verifArgument = 0;
            $tabInfoDebug[0] = "Impossible de récupérer le code de la statistique";
        }
        $szVarStyleSheet = $szNomStat."_XSLT";
        if (isset($_REQUEST[$szVarStyleSheet]) && strlen($_REQUEST[$szVarStyleSheet]))
            $_REQUEST["FEUILLE_XSL"] = $_REQUEST[$szVarStyleSheet];
        else
        {
            $verifArgument = 0;
            $tabInfoDebug[0] = "Impossible de récupérer le nom de la feuille de style";
        }
        
        // construction du nom de la question.
        $szVarNomQuestion = $szNomStat."_NOM_QUEST";
        if (isset($_REQUEST[$szVarNomQuestion]) && strlen($_REQUEST[$szVarNomQuestion]))
            $szNomQuestion = $_REQUEST[$szVarNomQuestion];
        else
        {
            $verifArgument = 0;
            $tabInfoDebug[0] = "Impossible de récupérer le code de la question";
        }
        
        // --------------------
        // XXX_LIBELLE_QUEST <optionnel>
        // --------------------
        $szLibelleQuestion = $szNomStat."_LIBELLE_QUEST";
        $szNewLibelleQuestion  = (isset($_REQUEST[$szLibelleQuestion])) ? stripslashes($_REQUEST[$szLibelleQuestion]) : "";
        
        $tabValVar = array();
        // pour toutes les variables de la questions
        // association valeur/variables et génération du titre de la question
        // exemple titre : "Prêts sur une période du %STAT3_1 au %STAT3_2"
        for($i=1;$i<10;$i++)
        {
            // construction du nom de la variable du formulaire.
            $szNomVar = $szNomStat."_".$i;
            if (isset($$szNomVar))
            {
                $szNewLibelleQuestion = ereg_replace( "%".$szNomVar, $$szNomVar, $szNewLibelleQuestion);
                // construction du nom de la variable pour la question.
                $szNomVarQuest = "#?".$i;
                // les valeurs des variables
                $tabValVar[$szNomVarQuest] = $_REQUEST[$szNomVar];
            }
        }
        
        if(!$verifArgument)
        {
            debug_code($tabInfoDebug);
            echo "<SCRIPT>javascript:history.back();</SCRIPT>";
            exit;
        }
        else
        {
            $retour = pos_bib_getlocutionsquest($jeton, $szNomQuestion, 1, /*pref*/$tabLocBib);
        }
			
    	if($retour)
    	{
            remplaceVarTabLocutionQuestionBib($tabValVar, $tabLocBib, /*pref*/$tabLoc);
        }
    }
    else
    {
    	if (isset($_REQUEST["INUMQUEST"]) && $_REQUEST["INUMQUEST"] >= 0)
    	{
    		$szStyle = "";
    		$bLier = 0;
    		// recuperation des locutions de la question posée 
    		$tabLoc = array_slice($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]], 0, 
    							count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]));
    	}
    	else
    	{
    	   $listeTabNumDoc = substr($_REQUEST["LISTE_NUMDOC"], 0, strlen($_REQUEST["LISTE_NUMDOC"]) - 1);
    	   $tabTypNumDoc = explode(" ", trim($_REQUEST["LISTE_NUMDOC"]));
            for($i=0;$i<count($tabTypNumDoc);$i++)
            {
                list ($iNumDoc, $szTypeDoc) = explode("|", $tabTypNumDoc[$i]);
    
    			if(strlen($szTypeDoc) == 0)
                	$szTypeDoc = "000";
                	
                // Création de la locution.
    		    $tabLoc[$i] = new Locution(1, $szTypeDoc, "N D", "=", $iNumDoc);
            }
        }
    }

    
    if (count($tabLoc) == 0)
    {
        afficheMsg("Les documents n'ont pas pu être retrouvés.");
        $retour = false;
    }
    else
    {
        $retour = pos_searchdoc($jeton,count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
		if($retour) 
		{
			$wOption = 0;
			$szStyle = "";
			$bLier = 0;
			$rep_export = getRepTmpSession(session_id());
			$file_export = getRepTmpSession(session_id())."export.xml";
			$retour = pos_exportxml($jeton,
					$iAdrPremiereReponse,
					$iNbReponses, 
					$szStyle,
					$bLier,
					$wOption,
					$rep_export);
    		
    		if(!$retour) 
    		  debug($jeton);
            if($retour) 
    		{
    		    
                //include("../include/liste_vocab.inc.php");
                // creation du fichier de vocabulaire
                //$retour = pos_listevocab($jeton, "000", "COR", POS_LIBELLE_DF, 
				//        "", 0, 100, /*pref*/$iNbLu, /*pref*/$szVocab);
				//$tabMotCor = extraireVocab($szVocab, POS_LIBELLE_DF, POS_RUB_ALPHA);
				
                //$file_vocab = getRepTmpSession(session_id())."vocabulaire_df.xml";
                //$fp = fopen($file_vocab, "w");
                //fwrite($fp, "<?xml version=\"1.0\" encoding=\"ISO-8859-1\""."?".">\n");
                //fwrite($fp, "<ROOT>\n");
                
                //fwrite($fp, "<rub code='COR'>\n");
                //while (list($cle, $valeur) = each($tabMotCor))
                //{
                //	fwrite($fp, "<mot code='$cle' libelle='".str_replace("'", " ", $valeur)."' />\n");
                //}
                //fwrite($fp, "</rub>\n");
                //fwrite($fp, "</ROOT>\n");
                //fclose($fp);
                if (!class_exists("XSLTProcessor"))
            	{
            		dl('php_xsl.dll');
            	}
            	
                if (isset($_REQUEST["FEUILLE_XSL"]) && strlen($_REQUEST["FEUILLE_XSL"]) > 0)
            	   $xsltFile = "../../../../xsl/".$_REQUEST["FEUILLE_XSL"];
            	else
            	   $xsltFile = "";
            	
            	$szFichierGenere = getRepTmpSession(session_id())."export.html";
            	$xslt = new XSLTProcessor();
            	// Chargement du fichier XML
            	$xml = new domDocument();
            	$xml->load($file_export);
            	// Chargement du fichier XSL
            	$xsl = new domDocument();
            	$xsl->load($xsltFile);
            
            	// Import de la feuille XSL
            	$xslt->importStylesheet($xsl);
            	
            	// cas des statistiques : on ajoute les paramètres
                if (isset($_REQUEST["RADIO"]))
                {
                	while (list($code, $valeur) = each($tabValVar))
                	{
                		$xslt->setParameter(null, "VAR_".substr($code, 2), $valeur);
                	}
                }
                $fp = fopen($szFichierGenere, "w");
                fwrite ($fp, $xslt -> transformToXml($xml));
                fclose($fp);
                
                $tabArgument = array();
            	$tabArgument[] = "--datadir";
               	$ficInfo = (isset($_SERVER["PATH_TRANSLATED"])) ? $_SERVER["PATH_TRANSLATED"] : $_SERVER["SCRIPT_FILENAME"];
                $ficCode = preg_split("/".NOM_APPLICATION."/i", $ficInfo); 
                $ficCST = $ficCode[0].NOM_APPLICATION."/redaction_web/htmldoc/";
            	$tabArgument[] = $ficCST;
            	$tabArgument[] = "-t";
            	$tabArgument[] = "pdf14";
            	$tabArgument[] = "--header";
            	$tabArgument[] = "...";
            	$tabArgument[] = "--webpage";
            	putenv("HTMLDOC_NOCGI=1");
            	$szFichierGenerePdf = getRepTmpSession(session_id())."export.pdf";
            	$retour = pos_conversionhtml2pdf($tabArgument, $szFichierGenere, $szFichierGenerePdf);
            }
		}
	}

	//On déconnecte ici car si le téléchargement du fichier est annulé cela fait un exit
	//et la connexion au serveur reste persistante
	pos_disconnect($jeton);	

	if ($retour)
	{
		// -----------------------------------------------------
		// Creation du fichier excel et envoi au navigateur 
		// -----------------------------------------------------
		//if (file_exists($szFichierGenere))
		if (file_exists($szFichierGenerePdf))
		{
			// on l'ouvre en lecture
			$fp = fopen($szFichierGenerePdf,"rb");
			
            //if (isset($_REQUEST["MIME_TYPE"]) && strlen($_REQUEST["MIME_TYPE"]) > 0)
            //    header("Content-Type: ".$_REQUEST["MIME_TYPE"]);
            //else
            //    header("Content-Type: text/html");
            header("Content-Type: text/pdf");
            header("Content-Length: ".filesize($szFichierGenerePdf));
            //header("Content-Disposition: attachment; filename=export.html");
            header("Content-Disposition: attachment; filename=export.pdf");
            fpassthru($fp);
			flush();
			// fermeture du fichier
			fclose($fp);
			
			//suppression du fichier
			//unlink($file_export);
		}
	}
	else
		debug($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}

