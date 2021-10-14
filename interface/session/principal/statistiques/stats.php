<?php

/**
 *
 * Fonction qui prend deux heures en entree et qui renvoie l'intervale de temps
 * en minutes compris entre ces deux heures.
 *
 */
function get_minute_entre_deux_heures($heure1,$heure2)
{
	$tab_heure1=explode(":",$heure1);
	$tab_heure2=explode(":",$heure2);

	$time_heure1 = gmmktime($tab_heure1[0],$tab_heure1[1],$tab_heure1[2],1,1,2000);
	$time_heure2 = gmmktime($tab_heure2[0],$tab_heure2[1],$tab_heure2[2],1,1,2000);

	//return ($time_heure2 - $time_heure1) / 60;
	// en secondes pour affichage avec le format heure.
	return ($time_heure2 - $time_heure1);
	
}

/**
 * Etablit les statistiques à partir d'une question de la bibliotheque et d'une
 * rubrique à domaine fermée
 *
 * Entrée
 * $jeton : jeton de connexion
 * $codeBib : Code de la question de la bibliothèque
 * $bPartage: question partagée
 * $bCache: question cachée
 * $tabValVar : tableau de variables (uniquement pour les questions à résolution de variable (vide sinon)
 *
 * $codeRub : code de la rubrique
 * $codeTypeLie : code du type lié
 * $codeRubLiee : code de la rubrique liée
 *
 * $codeRub2 : code de la rubrique
 * $codeTypeLie2 : code du type lié
 * $codeRubLiee2 : code de la rubrique liée
 *
 * Sortie :
 * $nbRepByVal : Nombre total de réponse de la question de la bibliothèque
 * $tabRepByVal : Renvoie le tableau qui pour chaque valeur du domaine fermé a le
 *                nombre de réponse 
 * $szLibelleRub : le libelle de la rubrique
 */
function genererStatistiques($jeton, $codeBib, $bPublic, $tabValVar, 
					$codeRub, $codeTypeLie, $codeRubLiee,
					$codeRub2, $codeTypeLie2, $codeRubLiee2,
					&$nbRepTotal, &$tabRepByVal, &$szLibelleRub, &$szLibelleRub2)
{
	$tabRepByVal = Array();

	//Poser la question pour avoir le nombre de résultats sur la question
	$retour = pos_bib_getreponsesquest($jeton, $codeBib, 1, $bPublic, $tabValVar, 
							/*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);

    if($retour)
	{
	   $nbRepTotal = $iNbReponses;
					
		// Transformation de la question en locutions
		$retour = pos_bib_getlocutionsquest($jeton, $codeBib, $bPublic, /*pref*/$tabLocBib);
		//$retour = pos_bib_getlocutionsquest($jeton, $codeBib, $bPublic, /*pref*/$tabLocBib);
	}
			
	if($retour)
	{
		remplaceVarTabLocutionQuestionBib($tabValVar, $tabLocBib, /*pref*/$tabLoc);
				
		// Obtention du libelle de la rubrique et verification rubrique DF
		$rubVocab = (strlen($codeRubLiee) > 0) ? $codeRubLiee : $codeRub;
		$retour = pos_getinforub($jeton, $rubVocab, /*pref*/$stInfoRub);
		$szLibelleRub = $stInfoRub->libelle;
    }
	
	if($retour)
	{
		if($stInfoRub->domferme > 0)
        {
			$retour = pos_listevocab($jeton, "000", $rubVocab, POS_LIBELLE_DF, 
						"", 0, 30, /*pref*/$iNbLu, /*pref*/$szVocab);
			if($retour)
				$tabCodeValeurDF = extraireVocab($szVocab, POS_LIBELLE_DF, $stInfoRub->typerub);
			else
				debug($jeton);
        }
    }
	
	$tabCodeValeurDF2 = array();
	if ($retour && strlen($codeRub2) > 0)
    {
		// Obtention du libelle de la rubrique et verification rubrique DF
		$rubVocab2 = (strlen($codeRubLiee2) > 0) ? $codeRubLiee2 : $codeRub2;
		$retour = pos_getinforub($jeton, $rubVocab2, /*pref*/$stInfoRub2);
		$szLibelleRub2 = $stInfoRub2->libelle;
	
	    if($retour)
		{
            if($stInfoRub->domferme > 0)
			{
				$retour = pos_listevocab($jeton, "000", $rubVocab2, POS_LIBELLE_DF, 
							"", 0, 30, /*pref*/$iNbLu, /*pref*/$szVocab);
				if($retour)
					$tabCodeValeurDF2 = extraireVocab($szVocab, POS_LIBELLE_DF, $stInfoRub2->typerub);
				else
					debug($jeton);	
			}
	   }
	}
	
	if(!$retour)
		debug($jeton);
	else
	{
	   getNbReponsesParValeur($jeton, $tabLoc, $tabCodeValeurDF, $codeRub, $codeTypeLie, $codeRubLiee,
	       /*pref*/$tabRepByVal, $tabCodeValeurDF2, $codeRub2, $codeTypeLie2, $codeRubLiee2);
    }
			
	return $retour;
}

				
				
/**
 * Etablit les statistiques à partir d'une question de la bibliotheque et d'une
 * rubrique à domaine fermée
 * 
 * Entrée : 
 * $jeton : jeton de connexion
 * $tabLocution : tableau des locutions pour de la question
 * $tabCodeValeurDF : tableau associatif code/valeur
 * $codeRub : rubrique de regroupement
 * $tabValVar : tableau de variable (uniquement pour les questions à résolution de variable (vide sinon)
 * $codeTypeLie : type lié 
 * $codeRubLiee : rubrique liée
 *
 * Sortie
 * $tabRepByVal : Renvoie le tableau qui pour chaque valeur du domaine fermé a le
 *                nombre de réponse 
 */
function getNbReponsesParValeur($jeton, $tabLocution, $tabCodeValeurDF, $codeRub, $codeTypeLie, $codeRubLiee,
					&$tabRepByVal,
					$tabCodeValeurDF2 = "", $codeRub2 = "", $codeTypeLie2 = "", $codeRubLiee2 = "")
{
    $tabRepByVal = Array();
				
	// Ajouter pour chaque valeur du domaine fermée la locution 
	// limitant à la valeur du DF
	copyTabLocution($tabLocution, /*pref*/$tabLocByValue);
	$iNbLoc = count($tabLocution);
				
	//On ajoute une parenthèse dans la première locution si plus d'une locution
	// sinon erreur serveur
	if(count($tabLocution) > 1)
    {
		$tabLocByValue[0]->wNbParDeb = $tabLocByValue[0]->wNbParDeb + 2;
		$tabLocByValue[$iNbLoc-1]->wNbParFin = $tabLocByValue[$iNbLoc-1]->wNbParFin + 1;
    }
	
	while (list($cle, $valeur) = each($tabCodeValeurDF))
	{
		//On ajoute la dernière locution
		$tabLocByValue[$iNbLoc] = new Locution(2, $tabLocution[0]->szCodeType, $codeRub, "=", "$cle");
		$tabLocByValue[$iNbLoc]->szCodeTypeLie = $codeTypeLie;
		$tabLocByValue[$iNbLoc]->szCodeRubLie = $codeRubLiee;

		if (strlen($codeRub2) > 0)
		{
			while (list($cle2, $valeur2) = each($tabCodeValeurDF2))
            {
				$tabLocByValue[$iNbLoc + 1] = new Locution(2, $tabLocution[0]->szCodeType, $codeRub2, "=", "$cle2");
				$tabLocByValue[$iNbLoc + 1]->szCodeTypeLie = $codeTypeLie2;
				$tabLocByValue[$iNbLoc + 1]->szCodeRubLie = $codeRubLiee2;

				if(count($tabLocution) > 1)
					$tabLocByValue[$iNbLoc + 1]->wNbParFin = 1;

				// Lancement de la recherche avec la valeur du domaine fermé
				// pas de gestion de l'erreur : on passe à la suivante
				$iSearch = pos_searchdoc($jeton, count($tabLocByValue), $tabLocByValue, 
										/*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
				$tabRepByVal[$valeur][$valeur2] = $iNbReponses;
			}
			reset($tabCodeValeurDF2);
		}
		else
		{
			if(count($tabLocution) > 1)
				$tabLocByValue[$iNbLoc]->wNbParFin = 1;
	
			// Lancement de la recherche avec la valeur du domaine fermé
			// pas de gestion de l'erreur : on passe à la suivante
			$iSearch = pos_searchdoc($jeton, count($tabLocByValue), $tabLocByValue, 
									/*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);
					
			$tabRepByVal[$valeur] = $iNbReponses;	
		}
					
	} // boucle sur tous les mots du DF
}


function afficheLigneStat($t, $nombre, $total, $chaine, $bAfficheImg, &$totalValAff)
{
	$totalValAff += $nombre;
	$t->set_var("LIGNE_VALEUR", $chaine);
	$t->set_var("LIGNE_NOMBRE", $nombre);
	$t->set_var("LIGNE_POURCENT", sprintf("%.2f", ($nombre / $total)* 100));
	$t->parse("bloc_ligne_stat", "BLOC_LIGNE_STAT", true);
}

/**
 * Affiche en HTML le diagramme des statistiques à partir des résultats de la fonction getStats
 * Le code HTML ne concerne qu'une table, il faut donc l'appeler dans une structure HTML
 * déjà existante avec <HTML><BODY> .... ce qui permet de faire appel plusieurs fois
 * à la fonction dans la même page
 *
 * $nbRepTotal : Nombre de réponse totale sur laquelle il faut calculer le pourcentage
 * $tabRepByVal : Tableau associatif
 * $szLibelleQuestion : libelle de la question
 * $szLibelleRub : libelle de la rubrique 
 *
 * Il faudrait peut être ajouter un paramètre pour le libellé de la question
 */
function afficher_statistiques($t, $nbRepTotal,$tabRepByVal, $szLibelleQuestion, $szLibelleRub)
{
    $t->set_var("LIBELLE_QUESTION", getTitre($szLibelleQuestion, $szLibelleRub));
    $t->set_var("LIBELLE_RUBRIQUE", $szLibelleRub);
	$totalPourcent = 0;
	$i = 0;
	// pour affichage si rub non rensegnée.
	$totalValAff = 0;
	//calcul des pourcentages
	while(list($chaine, $nombre) = each($tabRepByVal))
		afficheLigneStat($t, $nombre, $nbRepTotal, $chaine, 1, /*pref*/$totalValAff);
		
	// Affichage d'une ligne pour les documents qui n'ont pas les rubriques renseignées.
	if(($nbRepTotal-$totalValAff) != 0)
		afficheLigneStat($t, $nbRepTotal-$totalValAff, $nbRepTotal, "Divers", 1, /*pref*/$totalValAff);
    $t->set_var("LIGNE_TOTAL_NOMBRE", $nbRepTotal);
}

function afficherStatistiques2Entrees($nbRepTotal, $tabRepByVal, $szLibelleQuestion, $szLibelleRub, $szLibelleRub2)
{
echo "<HEAD>";
echo "<TITLE>{TITRE_FENETRE}</TITLE>";
echo "<LINK REL=\"stylesheet\" type='text/css' href='../../../../include/style/style.css'>";
echo "<LINK REL=\"stylesheet\" type='text/css' href='../../../../include/style/lrstyle.css'>";
echo "<base target=\"_self\">";
echo "</HEAD>";



	echo "".getTitre($szLibelleQuestion, $szLibelleRub);
	echo "<BR><TABLE border=\"0\" CELLPADDING=0 CELLSPACING=0 align=\"center\"><TR><TD align=\"center\">\n";
	echo "<TABLE border=\"1\" CELLPADDING=3 CELLSPACING=0 class=titrepage>\n";
	$tabSommeColonne = array();
	$bPremiereLigne = 1;

	// pour toutes les lignes
	while(list($valeurLigne, $tabValeur2) = each($tabRepByVal))
	{
		$sommeLigne = 0;
			
		// affichage en-tête colonnes
		if($bPremiereLigne)
    	{
    		$bPremiereLigne = 0;
            echo "<TR>\n";
    		echo "<TD CLASS=\"labelImportant2ps\">$szLibelleRub</TD>\n";
    		
    		while(list($valeurColonne, $iNbReponses) = each($tabValeur2))
    		{
    		      echo "<TD CLASS=\"labelImportant2ps\">$valeurColonne</TD>\n";
    		      $tabSommeColonne[$valeurColonne] = 0;
    		}
            echo "<TD CLASS=\"labelImportant1ps\">Total</TD>\n";
            echo "<TD CLASS=\"labelImportant1ps\">En %</TD>\n";
            reset($tabValeur2);
            echo "</TR>";
    	}
		
		echo "<TR>\n";
		echo "<TD CLASS=\"labelPS\">$valeurLigne</TD>\n";	
		// affichage des colonnes pour la ligne
		while(list($valeurColonne, $iNbReponses) = each($tabValeur2))
		{
			$sommeLigne += $iNbReponses;
			$tabSommeColonne[$valeurColonne] += $iNbReponses;
			echo "<TD CLASS=\"labelPS\">$iNbReponses</TD>\n";	
		}
		// total sur la ligne
		echo "<TD CLASS=\"labelImportant1ps\">$sommeLigne</TD>\n";
	
		// % sur la ligne
		printf("<TD CLASS=\"labelImportant1ps\">%.2f%%</TD>", ($sommeLigne/$nbRepTotal)*100);
		echo "</TR>\n";
	}
	
	// affichage de la somme par colonne
	echo "<TR>\n";
	echo "<TD CLASS=\"labelImportant1ps\">Total</TD>\n";
	while(list($valeur, $somme) = each($tabSommeColonne))
		{
		echo "<TD CLASS=\"labelImportant1ps\">$somme</TD>\n";
		}
	reset($tabSommeColonne);
	echo "<TD CLASS=\"labelImportant1ps\">$nbRepTotal</TD>\n";
	echo "<TD CLASS=\"labelImportant1ps\">100.00%</TD>\n";
	echo "</TR>";

	// affichage du % par colonne
	echo "<TR>\n";
	echo "<TD CLASS=\"labelImportant1ps\">En %</TD>\n";
	while(list($valeur, $sommeColonne) = each($tabSommeColonne))
	{
		printf("<TD CLASS=\"labelImportant1ps\">%.2f%%</TD>", ($sommeColonne/$nbRepTotal)*100);
	}
	echo "<TD CLASS=\"labelPS\">&nbsp;</TD>\n";
	echo "<TD CLASS=\"labelImportant1ps\">100.00%</TD>\n";
	echo "</TR>";

	
	echo "</TR>\n";
	echo "</TABLE>\n";
	echo "</TD></TR></TABLE>";
}

				
function getTitre($szLibelleQuestion, $szLibelleRub)
{
	$szTitre = "<BR><TABLE border=\"0\" align=\"center\"><TR><TH class=titreAccueil><U>".$szLibelleQuestion."</U></TH></TR></TABLE>";
	return $szTitre;
}
	
/**
 * Fonction permettant de déterminer quel image d'histogramme appelé
 */
function getNomImage($stat)
{
	$stat = ceil($stat);

	if($stat>=0)
    {
        // retourne le dernier chiffre
        $reste=$stat%5;
        $pourcentage = ($reste >= 2.5) ? $stat-$reste+5 : $stat-$reste;
	    $nom_img = $pourcentage;
    }
    
    $nom_img = sprintf("%02d.gif", $nom_img);
    
    return $nom_img;	
}

/**
 *  Cette fonction permet de dessiner une portion de camembert
 */

function Portion($xc,$yc,$diametre,$epaisseur,$dep,$couleur,$image,$caption)
{
	// Définition de la couleur du fond (R,V,B)
 $bgcolor = imagecolorallocate($image, 0, 0, 0);

 for( $i=$diametre ; $i>=0 ; $i-- )
     imagearc($image,$xc,$yc,$i,$i,$dep,$dep+$epaisseur,$couleur);
    
 $alpha = ($dep + ($epaisseur/2)) * ((2*M_PI)/360);

 $cs    = 95 * cos($alpha);
 $sn    = 95 * sin($alpha);
 $xt    = $xc + $cs;
 $yt    = $yc + $sn;

 imagestring($image, 2, $xt, $yt, $caption, $bgcolor);
}


/**
 * Cette fonction construit le camembert à partir du tableau des valeurs ($tb)
 */

function Camembert($tabval)
{
 $img           = imagecreate(230,200);

 /* Définition de la couleur de la police (R,V,B) */
 $fontcolor     = imagecolorallocate($img, 255, 255, 255);

 imagefill($img, 0, 0, $fontcolor);

 $total = 0;
 for( $i=0 ; $i<sizeof($tabval) ; $i++ )
    {
     $total = $total + $tabval[$i];     
    }
 $unite = 360/$total;
 $begin = 190;

 for( $i=0 ; $i<sizeof($tabval) ; $i++ )
    {
     /*
       Définition des couleurs des portions (ici 5 couleurs sont définies).
       Veillez à définir autant de couleurs que de valeurs entrantes dans "$tb".
     */ 
     if( $i == 0 )
         { $col1 = "255";  $col2 = "0"; $col3 = "0"; }  # rouge  (1e portion)
     if( $i == 1 )
         { $col1 = "0"; $col2 = "0"; $col3 = "255";  }  # bleu   (2e portion)
     if( $i == 2 )
         { $col1 = "255"; $col2 = "255"; $col3 = "0"; } # jaune  (3e portion)
     if( $i == 3 )
         { $col1 = "0";  $col2 = "255"; $col3 = "0"; }  # vert   (4e portion)
     if( $i == 4 )
         { $col1 = "255"; $col2 = "0"; $col3 = "255"; } # violet (5e portion)
     if( $i == 5 )
         { $col1 = "0"; $col2 = "255"; $col3 = "255"; } # ??? (6e portion)
     if( $i == 6 )
         { $col1 = "100"; $col2 = "0"; $col3 = "0"; } # ??? (7e portion)
     if( $i == 7 )
         { $col1 = "0"; $col2 = "100"; $col3 = "0"; } # ??? (8e portion)
     if( $i == 8 )
         { $col1 = "0"; $col2 = "0"; $col3 = "100"; } # ??? (9e portion)
         
     if( $i >= 9 )
         { $col1 = "0"; $col2 = "0"; $col3 = "0"; }     # noir   (au dela)
     
     $coul      = imagecolorallocate($img,$col1,$col2,$col3);
     $part  = $tabval[$i]*$unite;
     portion(110, 100, 120, $part, $begin, $coul, $img, number_format($tabval[$i],1)." %");
     $begin = $begin + $part;   
    }
    
  $Camembert = imageJpeg($img);
}
	
?>
