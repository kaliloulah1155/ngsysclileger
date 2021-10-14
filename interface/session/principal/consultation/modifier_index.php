<?php
/*
 * DESCRIPTION : Module de modification d'un document
 * et permettant de lancer une action Hermès
 * 
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_NUM_DOC : numero informatique du document a modifier/consulter
 * POS_TYPEDOC : type du document
 * POS_VAL_RUB_RUX : ensemble des valeurs des rubriques a modifier 
 *  ou RUX correspond au code d'une rubrique du type de document
 *
 * Modification :
 * Guillaume : gestion des rubriques non modifiées
 * Guillaume : ajout de la prise en modification
 * Sébastien : 13.11.2001 : gestion des rubriques non modifiables hermès
 * Gaby : 29.11.2001 : gestion des rubriques modifiées
 * Gaby : 19.12.2001 : conservation des rubriques modifiées si erreur
 * Gaby : 06.05.2002 : ajout d'un rtrim avant de comparer les nv et anciennes valeurs
 */     
session_start();
include ("../include/connexion.inc.php");
include ("../include/form_values.inc.php");
include ("../include/debug.inc.php");
include ("../include/pos_dmdmodifdoc.inc.php");
include ("../include/fonction_util.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

define ("HERM_AFFICHE_DOC_CONSULT", 1);
define ("HERM_AFFICHE_DOC_MODIF", 2);

$retour = connexion($jeton);

if ($retour)
{
	// a vérifier : est-ce qu'on ne recupere que les rubriques contenant une valeur ?
	// non au moins pour la clé hierarchique 
	$tabCodeRubModifiee = get_form_values_with_prefix("POS_VAL_RUB_", true);
	
	// on recupere les anciennes valeurs des rubriques
	$tabCodeRubOld = get_form_values_with_prefix("POS_OLD_VAL_RUB_", true);
	
	// on etablit la comparaison
	// tous les elements du tableau 1 qui sont pas dans 2 sont les
	// rubriques modifiees
	$result=array();
	while (list($key, $val) = each($tabCodeRubModifiee))
	{
		if (strcmp(rtrim($val), rtrim($tabCodeRubOld[$key])) != 0 && strcmp($key, "K H") !=0 )
		{
			$result[$key] = $val;
		}
	}
	reset($result);

	if ($retour)
	{
		// traitements spéciaux
		$file = "special_modification_".$_SESSION["sess_application"].".php";
		if (file_exists($file))
		{
			include($file);
		}
	
		if ($retour)
		{
			if (strcmp($_REQUEST["TYPE_ACTION"], CST_LIBELLE_ACTION) == 0)
			{
				// l'action hermes est bien renseigné 
				if (isset($_REQUEST["POS_ACTION_HERMES"]))
				{
					// Séparation du CODE_ACTION du SEPARATEUR.CODE_RUB_NON_MODIF
					$tabSplitActionHermes = explode("###",$_REQUEST["POS_ACTION_HERMES"]);
					$sActionHermes=$tabSplitActionHermes[0];

					$retour = pos_hermes_rempliraction($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$tabActionsHermes);
	
					if ($retour)
					{
						// nom du fichier d'exportation pour la liste des rubriques
						$szFileDonnees = getRepTmpSession(session_id());
						$szFileDonnees .= "exportationHermes_".$_REQUEST["POS_NUM_DOC"].".txt";
	
						$retour = pos_hermes_lanceraction($jeton, $_REQUEST["POS_NUM_DOC"], $sActionHermes, 
								$result, $szFileDonnees, /*pref*/$dwAfficheDoc, /*pref*/$dwNumDocAff, /*pref*/$szInfo); 
					
						// si c'est le bon type d'action
						if ($retour && substr($szInfo, 0, 2) == "WM")
						{
                            if(strcasecmp(CST_MACRO_WORD, "rtf") == 0)
						      include("../consultation/creer_fichier_hermes_rtf.inc.php");
						    else if(strcasecmp(CST_MACRO_WORD, "opendocument") == 0)
							    include("../consultation/creer_fichier_hermes_word_open_document.inc.php");
						    else if(strcasecmp(CST_MACRO_WORD, "pdffromhtml") == 0)
							    include("../consultation/creer_fichier_hermes_pdf_from_html.php");
							else
                                include("../consultation/creer_fichier_hermes_word_open_xml.inc.php");
						}
						if ($retour && substr($szInfo, 0, 3) == "XMD")
							include("../consultation/creer_fichier_hermes_xml.inc.php");
	
						if ($retour)
						{
							if ($dwNumDocAff != 0 && 
								(strcmp(substr($szInfo, 0, 2), "ML") != 0 && strcmp(substr($szInfo, 0, 3), "XMR") != 0))
							{
								$Iinclude = "consulter_index.php";
	
								switch($dwAfficheDoc)
								{
									case HERM_AFFICHE_DOC_CONSULT:
										// ouverture du document en modification ou consultation
										$_REQUEST["MODE"] = "CONSULTATION";
										$_REQUEST["POS_TYPEDOC"] = "";
									break;
						
									case HERM_AFFICHE_DOC_MODIF:
										// ouverture du document en modification ou consultation
										$_REQUEST["MODE"] = "MODIFICATION";
										$_REQUEST["POS_TYPEDOC"] = "";
									break;
								}
							}
							else
							{
								if (strcmp(substr($szInfo, 0, 2), "ML") != 0 && strcmp(substr($szInfo, 0, 2), "XM") != 0) 
								{
									// pas de reaffichage du document, on revient a l'ecran d'accueil
									$_REQUEST["MODE"] = "MODIFICATION";
									$Iinclude = "fermer_index.php";
								}
							}
						}
						else
						{
							debug($jeton);
							$_REQUEST["MODE"] = "MODIFICATION";
							$_REQUEST["POS_REAFFICHAGE"]=1;
							$Iinclude = "consulter_index.php";
						}
					}
					else 
					{
						debug($jeton);
						$_REQUEST["POS_REAFFICHAGE"]=1;
					}
				}
				else
				{	
					$_REQUEST["MODE"] = "MODIFICATION";
					$Iinclude = "consulter_index.php";
				}
			}
			else
			{
				// modification du document 
				$retour = pos_modifidx($jeton, $_REQUEST["POS_NUM_DOC"], count($result), $result, /*pref*/$wBadRub);
	
				// reaffichage pour conserver les valeurs précedemment modifiées
				if (!$retour)
				{
					debug($jeton);
					$_REQUEST["POS_REAFFICHAGE"]=1;
				}
				$_REQUEST["MODE"] = "MODIFICATION";
		
				$Iinclude = "consulter_index.php";
			}
	
			// liberation du document
			$retour = libere_doc($jeton, $_REQUEST["POS_NUM_DOC"]);
		} 
		// erreur dans les traitements specifiques
		else
		{
			$_REQUEST["MODE"] = "MODIFICATION";
			$_REQUEST["POS_REAFFICHAGE"] = 1;
			$Iinclude = "consulter_index.php";
		}
	
		// reaffichage apres modification/action hermes
		if (isset($Iinclude))
		{
            $oldNumDoc =$_REQUEST["POS_NUM_DOC"];
			// cas d'une action Hermes
			if (isset($dwNumDocAff) && $dwNumDocAff > 0) $_REQUEST["POS_NUM_DOC"] = $dwNumDocAff;
            include($Iinclude);
            
            if (isset($dwNumDocAff) && $dwNumDocAff > 0 
                            && $dwNumDocAff != $oldNumDoc) {
                echo "<script>\n";
                echo "parent.changeIdFramePosDocument($oldNumDoc, $dwNumDocAff);\n";
                echo "</script>\n";
            }
		}
	
	} // connexion ok 
	else
		debug($jeton);
	
	// creation d'un fichier XML/PDF
	if ($retour && (isset($szInfo) && (strcmp(substr($szInfo, 0, 2), "ML") == 0 || strcmp(substr($szInfo, 0, 3), "XMR") == 0)))
	{
		include("../consultation/creer_fichier_hermes_xml.inc.php");
	}

	pos_disconnect($jeton);
}
else
{
	debug($jeton);
	echec_connexion();
}
	
?>
	
