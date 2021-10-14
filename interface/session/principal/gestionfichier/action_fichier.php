<?php
/*
 * DESCRIPTION : action effectués dans la gestion de fichier (ajout, suppression de fichier)
 * 
 *
 * AUTEUR : Fleury Sébastien
 * DATE de CREATION : 08/08/2001
 *
 * Donnees en entree : 
 * POS_NUM_DOC
 *
 * MODIFICATION :
 * 07/02/2002 Marc : gestion des erreurs
 * 25/03/2002 Seb : modif pour revenir sur frame.php et non plus sur gestion.php.
 * 17.02.2004 GG correction pour ajout de fichiers dont le nom contient des apostrophes
 * 11.06.2004 FT rechargement de la fiche d'index
 * 13.12.2004 GG : passage v 10.0.03.001.001
 */

session_start();
include ("../include/connexion.inc.php");
include ("../include/debug.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
$retour = connexion($jeton);

if ($retour)
{
	// on filtre pour recuperer le numero de page et de sous page
	list($page, $souspage) = sscanf($_REQUEST["choixFichier"], "%d.%d");

	if($page !=0)
	{	
	    // selon l'action
		switch ($_REQUEST["choix"])
		{
			// ajout de fichier
			case "ADD":
				if(!isset($_FILES["POS_FICHIER"]))
				    $msgAlert[0] = CST_LIBELLE_AJOUT_IMP_PAS_DEFINI;
				else
					if(strlen(trim($_FILES["POS_FICHIER"]["name"])) == 0)
						$msgAlert[0] = CST_LIBELLE_AJOUT_IMP_PAS_DE_FIC;
					else
						if($_FILES["POS_FICHIER"]["size"] == 0) 
							$msgAlert[0] = CST_LIBELLE_AJOUT_IMP_TAILLE;
						else
						{
							if (file_exists($_FILES["POS_FICHIER"]["tmp_name"]) && filesize($_FILES["POS_FICHIER"]["tmp_name"]) > 0)
							{
                                // verification de la nature car le serveur est pas ok si nature incorrect
                                $retour = pos_getlistnatures($jeton, /*pref*/$tabLstNat);
                                if( !array_key_exists($_REQUEST["nature"], $tabLstNat)) 
                                    $msgAlert[0] = CST_LIBELLE_AJOUT_ERR_NATURE;
                                else
                                {
                                    $iIndConf = (isset($_REQUEST["POS_CONF_HAB"])) ? $_REQUEST["POS_CONF_HAB"] : "0";
                                	$iNivConf = (isset($_REQUEST["POS_CONF_NIV"])) ? $_REQUEST["POS_CONF_NIV"] : "0";
                                	$szCloison = (isset($_REQUEST["POS_CLOISON"])) ? $_REQUEST["POS_CLOISON"] : "";

    								$retour = pos_ajoutepagenumdoc($jeton, $_REQUEST["POS_NUM_DOC"], $page, $souspage, 
                                                $iIndConf, $iNivConf, $szCloison, $_REQUEST["nature"], "", 
    											stripslashes($_FILES["POS_FICHIER"]["name"]), $_FILES["POS_FICHIER"]["tmp_name"]);
                            	                           
    								if(!$retour)
    									debug ($jeton);
    								else
    								{
    									echo "<SCRIPT language='javascript'>";
    									echo "if(parent.fichier!=null)parent.fichier.actualiser();";
    									echo "</SCRIPT>";	
    								}  
                                }
							}
							else 
							{
								$msgAlert[0] = CST_LIBELLE_AJOUT_ERR_CONFIG; 
							}	
						}
			break;

			// suppression d'un fichier
			case "DELETE":
				$retour = pos_effacepage($jeton, $_REQUEST["POS_NUM_DOC"], $page,  $souspage);
				if (!$retour)
					debug($jeton);
				else
				{
                    echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">";
					echo "<SCRIPT language='javascript'>";
					echo "if(parent.fichier!=null)parent.fichier.actualiser();";
					echo "</SCRIPT>";	
				}
			break;
		}
    }
    else
        $msgAlert[0] = "Aucune sélection effectuée dans la liste des pages.";
    
    	// test si existance d'un message d'erreur
	if (isset($msgAlert))
		debug_code_fichier($msgAlert);
	
	// affichage de l'écran de fichier
 	include("afficher_arborescence.php");

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
?>
