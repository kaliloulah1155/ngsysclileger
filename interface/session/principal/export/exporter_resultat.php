<?php

/*
 * DESCRIPTION : Exportation de la liste des reponses au format excel
 * 
 * AUTEUR : Frederic Tramarin
 * DATE de CREATION : 05/02/2003
 *
 * Donnees en entree : 
 *
 * CAR_SEP : caractère separateur (tabulation ou separateur)
 * SEPARATEUR : separateur
 * PROFIL_LR : profil de liste résumee par défaut
 * INUMQUEST : Numero de la question
 * SELECTION : Selection du type d'export
 * INUMDOS : Numero de dossier
 * 
 *
 * MODIFICATIONS
 * 
 */

include ("../include/locution.inc.php");
session_start();

include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/template.inc.php");
include ("../include/question.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/fonction_util_zip.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");

if ((isset($_REQUEST["EXPORT_FICHIER"]) && strcmp($_REQUEST["EXPORT_FICHIER"], "AUCUN") != 0) 
        && (strlen(trim($_REQUEST["LISTE_NUMDOC"])) == 0 || strcmp($_REQUEST["SELECTION_REPONSE"], "toutes") == 0))
{
    afficheMsg("L'exportation des fichiers ne peut être lancée que sur une sélection de documents.");
    exit;
}

if ((isset($_REQUEST["EXPORT_FICHIER"]) && strcmp($_REQUEST["EXPORT_FICHIER"], "AUCUN") != 0) && strcmp($_REQUEST["SELECTION"], "XML") == 0)
{
    afficheMsg("L'exportation des fichiers ne peut pas être lancée avec une exportation XML.");
    exit;
}
          
$retour = connexion($jeton);
if($retour) 
{
	$file_export = tempnam(getRepTmpSession(session_id()), "POS_");
	$szSeparateur = (strcmp($_REQUEST["CAR_SEP"], "tabulation") == 0) ? "\t" : $_REQUEST["SEPARATEUR"];
	if(strcmp($_REQUEST["CAR_SEP"], "tabulation") != 0 && strlen(trim($szSeparateur)) == 0)
		$szSeparateur = ";";
	$szProfilLR = stripslashes($_REQUEST["PROFIL_LR"]);

	//Variable permettant de savoir si tout se passe normalement: dans le cas ou on ne rentre
	//pas dans le traietement normal on mettra la variable à false
	$export = true;
	$bExportZip = false;
	$isQuestion = false;
	$isDossier = false;
	if (isset($_REQUEST["SELECTION"]) && strcmp($_REQUEST["SELECTION"], "XML") == 0)
	{
		if (isset($_REQUEST["INUMQUEST"]) && strlen($_REQUEST["INUMQUEST"]) > 0)
		{
            // recuperation des locutions de la question posée 
			$tabLoc = array_slice($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]], 0, count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]));
			$retour = pos_searchdoc($jeton,count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
			if($retour) 
			{
				$wOption = 0;
				$szStyle = "";
			    $bLier = 0;
				$rep_export = getRepTmpSession(session_id());
				$file_export = getRepTmpSession(session_id())."export.xml";
				$retour = pos_exportxml($jeton, $iAdrPremiereReponse, $iNbReponses, $szStyle, $bLier, $wOption, $rep_export);
			}
		}
		else
		{
			$export = false;
			afficheMsg("L'export XML n'est possible que sur le resultat d'une question, pas sur le contenu d'un dossier.");
		}
	}
	else
	{
		if (isset($_REQUEST["INUMQUEST"]) && strlen($_REQUEST["INUMQUEST"]) > 0)
		{
	        $isQuestion = true;
			// recuperation des locutions de la question posée 
			$tabLoc = array_slice($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]], 0, count($_SESSION["sess_tabHistQuest"][0][$_REQUEST["INUMQUEST"]]));
			$retour = pos_searchdoc($jeton,count($tabLoc), $tabLoc, /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
		} // cas du resultat d'une question
		else
		{
    		if (isset($_REQUEST["INUMDOS"]) && $_REQUEST["INUMDOS"] >= 0)
    	       $isDossier = true;
        }
				
        // cas d'une question
        if ($isQuestion && strcmp($_REQUEST["SELECTION_REPONSE"], "toutes") == 0) 
        {
            if(strcmp($_REQUEST["SELECTION"], "TOUTES_RUBRIQUES") == 0)
                $retour = pos_exportexcelttsrep($jeton, $iAdrPremiereReponse, $iNbReponses, 0, $szSeparateur, $file_export);
            else
                $retour = pos_exportexcellisteresumeettsrep($jeton, $iAdrPremiereReponse,$iNbReponses, $szSeparateur,
            		$szProfilLR, $file_export);
        } // fin cas du resultat d'une question
        else 
        {
            // cas d'un dossier
			$tabNumDoc = array();
            if ($isDossier && strcmp($_REQUEST["SELECTION_REPONSE"], "toutes") == 0)  
            {
		        $retour = pos_dosinfocontenu($jeton, $_REQUEST["INUMDOS"], /*pref*/$tabFils);
		        //print_r($tabFils);
                for ($i=0; $i < count($tabFils); $i++)
                    $tabNumDoc[$i] = $tabFils[$i]->doc_numero;
		    }
		    else 
            {
		    	$listeTabNumDoc = $_REQUEST["LISTE_NUMDOC"];
		        if (isset($_REQUEST["LISTE_NUMDOC"]) && strlen($_REQUEST["LISTE_NUMDOC"]) > 0) 
                {
		        	// suppression du dernier ;
		        	$listeTabNumDoc = substr($_REQUEST["LISTE_NUMDOC"], 0, strlen($_REQUEST["LISTE_NUMDOC"]) - 1);
		        	$tabNumDoc = explode (";", $listeTabNumDoc);
		        }
		    }
    
		    if (count($tabNumDoc) != 0)
		    {
			 	if(strcmp($_REQUEST["SELECTION"], "TOUTES_RUBRIQUES") == 0)
					$retour = pos_exportexcel($jeton,
								$tabNumDoc, count($tabNumDoc), $_REQUEST["INUMDOS"], $szSeparateur, $file_export);
				else
					$retour = pos_exportexcellisteresumee($jeton,
								$tabNumDoc, count($tabNumDoc),  $szSeparateur, $szProfilLR, $file_export);
            }
            else
            {
    			$export = false;
    			afficheMsg("Aucun document à exporter.");
            }
	    }
		    
        // EXPORT_FICHIER : AUCUN, FICHIERS, FICHIER_SOUS_FICHIERS,  SOUS_FICHIERS_SEULS (??)
        if (isset($_REQUEST["EXPORT_FICHIER"]) && 
                    (strcmp($_REQUEST["EXPORT_FICHIER"], "FICHIERS") == 0 || strcmp($_REQUEST["EXPORT_FICHIER"], "FICHIER_SOUS_FICHIERS") == 0))
    	{
            $szZipFileName = sprintf("export_".$_SESSION["sess_application"].".%s", "zip");
            $szDirZipFileName = sprintf("%s%s", getRepTmpSession(session_id()), $szZipFileName);
            if (class_exists("ZipArchive"))
            {
                $zip = new ZipArchive;
                if ($zip->open($szDirZipFileName, ZipArchive::CREATE) === TRUE) 
                {
                    $iNbFichierTotal = 0;
            	    for($i=0;$i<count($tabNumDoc);$i++)
                    {	
                        $bAjouteFichier = (strcmp($_REQUEST["EXPORT_FICHIER"], "FICHIERS") == 0 || strcmp($_REQUEST["EXPORT_FICHIER"], "FICHIER_SOUS_FICHIERS") == 0) ? true : false;
                        $bAjouteSousFichier = (strcmp($_REQUEST["EXPORT_FICHIER"], "SOUS_FICHIERS_SEULS") == 0 || strcmp($_REQUEST["EXPORT_FICHIER"], "FICHIER_SOUS_FICHIERS") == 0) ? true : false;
                        $tabNumPage = array();
                        $iNbFichierDoc = ajouteFichiersDocumentToZipFile($jeton, $zip, $tabNumDoc[$i], $tabNumPage, $bAjouteFichier, $bAjouteSousFichier);
                        $iNbFichierTotal += $iNbFichierDoc;
                    }
                    //if ($iNbFichierTotal != 0)
                    {
                        $szNomFichierExportInArchive = (isset($_REQUEST["SELECTION"]) && strcmp($_REQUEST["SELECTION"], "XML") != 0) ? "export.csv" : "export.xml";  
                        //ajoute le fichier d'export des rubriques (csv ou XML)
                        $zip->addFile($file_export, $szNomFichierExportInArchive);
                        $zip->close();
                        delRepZip(session_id());
                        unlink($file_export);
                        // remplacement du fichier d'export par le fichier zip
                        $file_export = $szDirZipFileName;
                        $bExportZip = true;
                    }
                }
                else {
                    echo 'échec, code:' . $res;
                }
            }
            else
            {
                debug_code(array("La librairie php_zip n\'est pas disponible sur cette version de php."));
            }
    	}
    }
	//On déconnecte ici car si le téléchargement du fichier est annulé cela fait un exit
	pos_disconnect($jeton);	

	if ($retour)
	{
		// -----------------------------------------------------
		// Creation du fichier excel et envoi au navigateur 
		// -----------------------------------------------------
		if (file_exists($file_export) && $export)
		{
			// on l'ouvre en lecture
			$fp= fopen($file_export,"rb");

            header("Cache-Control: ");// leave blank to avoid IE errors
			header("Pragma: ");// leave blank to avoid IE errors
			//definition du type MIME du fichier si excel, rien si XML
			if ($bExportZip)
			{
                header("Content-Type: application/x-gzip");
                header("Content-Disposition: attachment; filename="."export.zip".";");
            }
			else
			{
    			if (isset($_REQUEST["SELECTION"]) && strcmp($_REQUEST["SELECTION"], "XML") != 0)
    			{
                	header("Content-Type: text/csv");
                	header("Content-Disposition: inline; filename="."export.csv".";");
                }
    			else
    				header("Content-Type: text/xml");
            }
				
			header("Content-Length: " . filesize($file_export));
			//affichage du fichier, on passe l'ID du fichier
			fpassthru($fp);
			flush();
			// fermeture du fichier
			fclose($fp);
			
			//suppression du fichier
			unlink($file_export);
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
?>