<?php
/*
 * DESCRIPTION : Page speciale phototheque pour ajout d'un fichier image
 *				 avec creation de l'imagette via gd.
 * 
 * AUTEUR : Sébastien Costanzo
 * DATE de CREATION : 05/03/2003
 *
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_util.inc.php");
include ("../include/imagette.inc.php");

$retour = connexion($jeton);

if ($retour)
{
    if (!function_exists('imagetypes')){
        $msgAlert[0] = "Ajout impossible : la librairie gd n'est pas accessible dans cette version de PHP.";
    }
    else {
        if(!defined('CST_NATURE_FICHIER_JPG'))
            $msgAlert[0] = "Ajout impossible : la nature JPEG n\'est pas spécifiée dans le fichier de configuration.";
        else
        {
            if(strlen(trim($_FILES["POS_FICHIER"]["name"])) == 0)
    		  $msgAlert[0] = "Ajout impossible : aucun fichier local n\'a été sélectionné.";
        	else if($_FILES["POS_FICHIER"]["size"] == 0) 
        		$msgAlert[0] = "Ajout impossible : La taille du fichier local sélectionné est nulle.";
        	else
        	{
        		$retour = pos_getlisteinfopage($jeton, $_REQUEST["POS_NUM_DOC"], 0, /*pref*/$tabStruListePage);
        		$iNbFichiers = count($tabStruListePage);
        		
        		$retour = pos_ajoutepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $iNbFichiers+1, 0, 0, 0, "", CST_NATURE_FICHIER_JPG, "", 
        							stripslashes($_FILES["POS_FICHIER"]["name"]), $_FILES["POS_FICHIER"]["tmp_name"]);
            	                           
        		if(!$retour)
        			debug ($jeton);
        		else
        		{
        			$fileName = tempnam(getRepTmpSession(session_id()), "POS_");
        			
        			// creation de l'imagette.
        			resize($_FILES["POS_FICHIER"]["tmp_name"], $fileName);
        			
        			$imagette_name = preg_replace("/\.(jpe|jpeg|png)$/i",".jpg",$POS_FICHIER_name);
        			
        			$retour = pos_ajoutepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $iNbFichiers+1, 1, 0, 0, "", CST_NATURE_FICHIER_JPG, "", 
        						"$imagette_name", "$fileName");
        			
        			//unlink($fileName);
        			
        			if(!$retour)
        				debug ($jeton);
        		}
        	}
        }
    }

    
    // test si existance d'un message d'erreur
	if (isset($msgAlert))
		debug_code($msgAlert);
	
	if (!$retour)
		debug($jeton);
	
	$_REQUEST["MODE"] = "MODIFICATION";

	// affichage de la fiche d'index.
 	include("../consultation/consulter_index.php");

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
