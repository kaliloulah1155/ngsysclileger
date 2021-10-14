<?php

/*
 * DESCRIPTION : Affichage des fichiers lies
 *
 * AUTEUR : Frédéric Tramarin
 * DATE de CREATION : 24/06/2002
 *
 * Modification :
 *		31/01/2003 Seb mise en place de la fct pos_getlisteinfopage 
 *		pour remplacer pos_getinfonumdoc.
 *    06/05/2003 Gaby gestion cellule - ajout d'un trim pour ne pas conserver l\n
 *                    + gestion du cas $nbCell=1
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document
 * POS_NUM_DOC : Numéro informatique du document 
 *
 */

// ------------------
//	 Fichiers liés 	
// ------------------

// On récupères le fichier d'initialisation
$fic = "../../../tpl/".$_SESSION["sess_application"]."/$szTypeDoc/initialisation_".$szTypeDoc.".ini";

// Definition des blocs
$t->set_block("consultation", "CELLULE_FICHIERS", "cellule_fichiers");
$t->set_block("consultation", "LISTE_FICHIERS", "liste_fichiers");
$t->set_block("consultation", "BLOC_LISTE_FICHIERS", "bloc_liste_fichiers");

$t->set_var("MODE_FICHIER", ($bDroitModifFic)? "MODIFICATION" : "CONSULTATION");

// On vérifie que le fichier existe
if(file_exists($fic))
{
	// On vérifie que le numéro de document existe
	if(!isset($_REQUEST["POS_NUM_DOC"]))
	{
		afficheMsg(CST_LIBELLE_EREUR_RECUP_NUMDOC_FIC); 
		exit;
	}
	
	// Lecture du fichier d'initialisation.
	$file = file($fic);
	$nbCell=1;
	$afficheFic = false;	
	
	// Récupérer le nombre de cellule dans le tableau des fichiers
	// Ainsi que si on affiche ou non les fichiers
	while (list($numligne, $szLigne) = each($file))
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
				{
					$nbCell = trim($tabCode[1]);	
				}
			}
			
			// On vérifie que le code est bien AFFICHER_LIEN_FICHIER
			if(strpos($tabCode[0], "AFFICHER_LIEN_FICHIER") !== false)
			{
				// Si la valeur est O , on fait le traitement sinon on ne fait rien
				if(strpos($tabCode[1], "O") !== false)
				{
					$afficheFic = true;
				}
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
		
		$end_line = false;

		for($a=0; $a<count($tabStruListePage); $a++)
		{
			$end_line = false;
			
			$url= URL_CONSULTER_FICHIER."?POS_NUM_DOC=";
			$url.=$_REQUEST["POS_NUM_DOC"];
			$url.="&POS_NUM_PAGE=";
			$url.=$tabStruListePage[$a]->wNumPage;
			$url.="&PHPSESSID=".session_id();
			
			$t->set_var("LIEN_FICHIER", $url);
			
		    $t->set_var("EXTENSION_PAGE", $tabStruListePage[$a]->szExtension);
			
			if($tabStruListePage[$a]->szNomFichierOriginal != "")
			{
				$t->set_var("NOM_FICHIER", $tabStruListePage[$a]->szNomFichierOriginal);
			}
			else
			{
				$t->set_var("NOM_FICHIER", "fichier".$tabStruListePage[$a]->wNumPage);
			}
			
			$t->set_var("NUM_FICHIER", $a + 1);
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

// ---------------------
//	Fin Fichiers liés
// ---------------------

?>