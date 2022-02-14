<?php

/*
 * DESCRIPTION : Affichage des fichiers lies de premier niveau
 *
 * AUTEUR : Frédéric Tramarin
 * DATE de CREATION : 11/06/2004
 *
 * Modification :
 *
 * Donnees en entree : 
 * POS_NUM_DOC : Numéro informatique du document 
 * POS_TYPEDOC : Type de document
 *
 */

// ------------------
//	 Fichiers liés 	
// ------------------

session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/fonction_fichiers.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
$TAB_EXT_AVEC_ICONE = array("DOC", "DOCX", "PDF", "XLS", "XLSX", "TXT", "PPT", "JPG", "PS", "TIF");

// Si il n'y a pas de numero de document, on ne fait rien.
if (!isset($_REQUEST["POS_NUM_DOC"]) || $_REQUEST["POS_NUM_DOC"] <= 0)
{
	afficheMsg(CST_LIBELLE_CONSULTER_NUM_INIT); 
}
else
{
	$retour = connexion($jeton);

	if($retour)
	{
		// On récupères le fichier d'initialisation
		$fic = "../../../tpl/".$_SESSION["sess_application"]."/".$_REQUEST["POS_TYPEDOC"]."/initialisation_".$_REQUEST["POS_TYPEDOC"].".ini";

		$file_tpl = REP_TEMPLATE_APPLICATIF."consultation/fichiers.tpl";
		
		$t = new Template(".");
		$t->set_File("fichier", $file_tpl);
		
		// Definition des blocs
		$t->set_block("fichier", "CELLULE_FICHIERS", "cellule_fichiers");
		$t->set_block("fichier", "LISTE_FICHIERS", "liste_fichiers");
		$t->set_block("fichier", "BLOC_LISTE_FICHIERS", "bloc_liste_fichiers");
        $t->set_block("fichier", "BLOC_AJOUT_FICHIERS", "bloc_ajout_fichiers");
		
		$t->set_var("MODE_FICHIER", $_REQUEST["MODE_FICHIER"]);
		
		$t->set_var("MODE", $_REQUEST["MODE"]);
		$t->set_var("POS_TYPEDOC", $_REQUEST["POS_TYPEDOC"]);
		$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
		$t->set_var("PHPSESSID", session_id());
		$t->set_var("URL_CONSULTER_TOUS_FICHIERS_ZIP", URL_CONSULTER_TOUS_FICHIERS_ZIP);
        $t->set_var("LIBELLE_SELECT_ONE_FILE", CST_LIBELLE_SELECT_ONE_FILE);
		$t->set_var("LIBELLE_SELECT_MANY_FILES", CST_LIBELLE_SELECT_MANY_FILES);
		$t->set_var("LIBELLE_MSG_DND_FILES_OU_CHOIX", CST_LIBELLE_MSG_DND_FILES_OU_CHOIX);
        $t->set_var("LIBELLE_CONFIRM_AJOUT_FICHIER", CST_LIBELLE_CONFIRM_AJOUT_FICHIER);
        $t->set_var("post_max_size_bytes", return_bytes(ini_get('post_max_size')));
        $t->set_var("upload_max_filesize_bytes", return_bytes(ini_get('upload_max_filesize')));
        $t->set_var("post_max_size", ini_get('post_max_size'));
        $t->set_var("upload_max_filesize", ini_get('upload_max_filesize'));
        $t->set_var("MSG_TAILLE_MAX_AVANT_NOM_FICHIER", CST_MSG_TAILLE_MAX_AVANT_NOM_FICHIER);
        $t->set_var("MSG_TAILLE_MAX_AVANT_TAILLE_FICHIER", CST_MSG_TAILLE_MAX_AVANT_TAILLE_FICHIER);
        $t->set_var("MSG_TAILLE_MAX_FIN", CST_MSG_TAILLE_MAX_FIN);
        $t->set_var("MSG_TAILLE_TOTALE_MAX_AVANT_TAILLE", CST_MSG_TAILLE_TOTALE_MAX_AVANT_TAILLE);
        $t->set_var("MSG_TAILLE_TOTALE_MAX_FIN", CST_MSG_TAILLE_TOTALE_MAX_FIN);    
        
        if ($_REQUEST["MODE"] == "MODIFICATION" && $_REQUEST["MODE_FICHIER"] == "MODIFICATION")
            $t->parse("bloc_ajout_fichiers", "BLOC_AJOUT_FICHIERS", true);
        else
            $t->set_var("bloc_ajout_fichiers", "");
            
		// On vérifie que le fichier existe
		if(file_exists($fic))
		{
			// Lecture du fichier d'initialisation.
			$file = file($fic);
			$nbCell=1;
			$afficheFic = false;	
			
			// Récupérer le nombre de cellule dans le tableau des fichiers
			// Ainsi que si on affiche ou non les fichiers
			foreach($file as $numligne => $szLigne)
			{
				// On sépare le code pour l'avoir avec sa valeur
				$tabCode=explode("=",$szLigne);
				for($i=0; $i<count($tabCode)-1; $i++)
				{
					// On vérifie que le code est bien AFFICHER_LIEN_FICHIER
                    if(strpos($tabCode[0], "NB_CELLULES_FICHIERS") !== false)
					{
						// Si la valeur est supérieur à 0
						if($tabCode[1] > 0 && $tabCode[1] < 20)
							$nbCell = trim($tabCode[1]);
					}
					
					// On vérifie que le code est bien AFFICHER_LIEN_FICHIER
                    if(strpos($tabCode[0], "AFFICHER_LIEN_FICHIER") !== false)
					{
						// Si la valeur est O , on fait le traitement sinon on ne fait rien
						if(strpos($tabCode[1], "O") !== false)
							$afficheFic = true;
					}
				}
			}
			
			if($afficheFic) 
			{
				$retour = pos_getlisteinfopage($jeton, $_REQUEST["POS_NUM_DOC"], 0, /*pref*/$tabStruListePage);
			}
			
			//Si la valeur est true , on fait le traitement sinon on ne fait rien
			if($afficheFic && $retour && count($tabStruListePage) > 0)
			{
				//Suivant que l'on ait un ou plusieurs fichiers on met à jour le titre
				$t->set_var("NB_CELLULE",$nbCell);
				
				if(count($tabStruListePage) > 1)
					$t->set_var("TITRE_FICHIER_LIE", CST_LIBELLE_TAB_FICHIERS_LIES);
				else
					$t->set_var("TITRE_FICHIER_LIE", CST_LIBELLE_TAB_FICHIER_LIE);
				
				for($a=0; $a<count($tabStruListePage); $a++)
				{
					$end_line = false;
					
					$url= URL_CONSULTER_FICHIER."?POS_NUM_DOC=";
					$url.=$_REQUEST["POS_NUM_DOC"];
					$url.="&POS_NUM_PAGE=";
					$url.=$tabStruListePage[$a]->wNumPage;
					$url.="&PHPSESSID=".session_id();
					
					$t->set_var("LIEN_FICHIER", $url);
					$t->set_var("NUM_FICHIER", $a + 1);
                    
				    $t->set_var("EXTENSION_PAGE", $tabStruListePage[$a]->szExtension);
                    $t->set_var("ICONE_PAGE", in_array($tabStruListePage[$a]->szExtension, $TAB_EXT_AVEC_ICONE) ? strtolower($tabStruListePage[$a]->szExtension) : "document");
					if($tabStruListePage[$a]->szNomFichierOriginal != "")
						$t->set_var("NOM_FICHIER", $tabStruListePage[$a]->szNomFichierOriginal);
					else
						$t->set_var("NOM_FICHIER", "fichier".$tabStruListePage[$a]->wNumPage);
					
					$t->set_var("NUM_SS_FICHIER", 0);
		
					$t->parse("cellule_fichiers", "CELLULE_FICHIERS", true);
		
					$cptTmp=$a+1;
					if(($a !=0 && $cptTmp%$nbCell == 0) ||  $nbCell == 1 )
					{
						$t->parse("liste_fichiers", "LISTE_FICHIERS", true);
						$t->set_var("cellule_fichiers", "");
						$end_line = true;
					}
				}
				
				// On renvoie des blocs pour compléter les cellules vide donc sans nom et sans url
				if(!$end_line  && $nbCell != 1)
				{
					for($s=0; $s<$nbCell - (count($tabStruListePage)%$nbCell);$s++)
					{
						$end_cellule = true;
						$t->set_var("LIEN_FICHIER", "");
						$t->set_var("NOM_FICHIER", "");
						$t->set_var("NUM_FICHIER", "");
						$t->set_var("EXTENSION_PAGE", "vide");
                        $t->set_var("ICONE_PAGE", "blank");
						$t->parse("cellule_fichiers", "CELLULE_FICHIERS", true);
					}
					$t->parse("liste_fichiers", "LISTE_FICHIERS", true);	
				}
				// On envoie le bloc principal
				$t->parse("bloc_liste_fichiers","BLOC_LISTE_FICHIERS", true);
			}
			else
			{
				if(!$retour)
				{
					debug ($jeton);	
				}
				
				// On libère les blocs
				$t->set_var("cellule_fichiers", "");
				$t->set_var("liste_fichiers", "");
				$t->set_var("bloc_liste_fichiers", "");	
			}
		}

		$t->pparse("MyOutput", "fichier");
		
		// ---------------------
		//	Fin Fichiers liés
		// ---------------------
	}
	else
	{
		debug ($jeton);	
	}
	pos_disconnect($jeton);
}

?>
