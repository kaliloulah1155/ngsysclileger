<?php

/*
 * DESCRIPTION : Affichage des fiches liees
 * Les noms sont suivis de Asso car les variables sont déjà utilisées.
 *
 * AUTEUR : Sebastien Costanzo / Gabrielle Guy
 * DATE de CREATION : 30/04/2002
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document
 *
 * on se sert aussi d'un tableau asso $codevalrub qui se trouve sur le fichier 
 * appelant consulter_index.php. Ce tableau est la liste des rub de la fiche d'index.
 *  
 * 28.05.2002 GG correction bug si 0 reponse 
 * 23.07.2002 GG correction bug si plusieurs affichage de liste resumee
 * 30.07.2002 GG correction bug si lignes vides dans le fichier d'initialisation
 * 06.08.2002 GG correction bug quand pas de reponses sur lien simple
 * 17.06.2004 FT Gestion des fiches liés et tableaux pour l'impression des fiches d'index
 * 15.03.2013 GG Suppression de la gestion sans lien
 */

// --------------
//	 Associations 	
// --------------

include ("../include/locution.inc.php");
include ("../include/liste_resumee.inc.php");

$fic = "../../../tpl/".$_SESSION["sess_application"]."/$szTypeDoc/initialisation_".$szTypeDoc.".ini";

if(isset($MODE_IMPRESSION) && $MODE_IMPRESSION == 1)
	define ("LIEN_M", "LIEN_MULT_IMPRESSION");
else
	define ("LIEN_M", "LIEN_MULTIPLE");

$tabListeRubsLiees = array();
$iNbRubLiees = 0;
// -----------------------
// analyse du fichier
// -----------------------
if(file_exists($fic))
{
	// Recherche le parametrage de toutes les rub du type de doc pour trouver les liens.
    $tabRubInTypeAsso = array();
	$retour = pos_getinforubintype($jeton, $szTypeDoc, "", 200, /*pref*/$tabRubInTypeAsso);
	if (!$retour)
	   debug($jeton);
	
	// Lecture du fichier d'initialisation.
	$file = file($fic);
    // pour toutes les lignes du fichier
	foreach($file as $numligne => $szLigne)
	{
		if (!(strpos($szLigne, "=") !== false && strncmp($szLigne, "LIEN_", strlen("LIEN_")) == 0))
		     continue;

		$tabCode_Rub = explode("=",$szLigne);
		$tabCode_Rub = explode(",",$tabCode_Rub[1]);
		// Boucle sur toutes les rubriques du fichier ini.
        // NB : 2 mode de saisie : tout les liens sur une meme ligne séparés par des , ou une ligne par lien
		for($iCodeRub=0;$iCodeRub<count($tabCode_Rub);$iCodeRub++)
		{
			$szCodeRub = rtrim($tabCode_Rub[$iCodeRub]);
            if (strlen(trim($szCodeRub)) != 0)
            {
                // suppression du préfixe _P 
                if (strpos($szCodeRub, "_P") !== false) 
                    $szCodeRub = substr($szCodeRub, 0, 3);
                
                for ($j=0;$j<count($tabRubInTypeAsso);$j++)
                {
					$szCodeTypeLie = null;
                    $szCodeRubLiee = null;
                    if ($tabRubInTypeAsso[$j]->code == $szCodeRub)
                    {
                        $szCodeTypeLie = $tabRubInTypeAsso[$j]->code_typelie;
                        $szCodeRubLiee = $tabRubInTypeAsso[$j]->code_rubliee; 
                        break;
                    }
                }
                $tabListeRubsLiees[$iNbRubLiees]["codeRub"] = $szCodeRub;
                $tabListeRubsLiees[$iNbRubLiees]["codeTypeLie"] = $szCodeTypeLie;
                $tabListeRubsLiees[$iNbRubLiees]["codeRubLiee"] = $szCodeRubLiee;
                $tabListeRubsLiees[$iNbRubLiees]["typeLien"] = (stripos($szLigne, "LIEN_SIMPLE") !== false) ? "LIEN_SIMPLE" : LIEN_M;
                $tabListeRubsLiees[$iNbRubLiees]["profil"] = "";
                $posProfil = strpos($tabCode_Rub[$iCodeRub], ":");
    			if ( $posProfil !== false)
    			     $tabListeRubsLiees[$iNbRubLiees]["profil"] = trim(substr($tabCode_Rub[$iCodeRub], $posProfil + 1));
                $iNbRubLiees++;
            }
		}
	}
}

// Boucle sur toutes les rubriques du fichier ini.
for($k=0;$k<count($tabListeRubsLiees);$k++)
{
    $szCodeRub = $tabListeRubsLiees[$k]["codeRub"];
    $szCodeTypeLie = $tabListeRubsLiees[$k]["codeTypeLie"];
    $szCodeRubLiee = $tabListeRubsLiees[$k]["codeRubLiee"];
    // Si la valeur de la rub lie sur la fiche d'index n'est pas vide
    // on construit la locution qui va nous ramener toutes les fiches lies.
    $dwNbReponsesAsso = 0;
    $dwAdrPremiereReponseAsso = 0;
    $tabLocAsso = array();
    if (isset($szCodeTypeLie) && strlen($szCodeTypeLie) != 0 && 
        isset($szCodeRubLiee) && strlen($szCodeRubLiee) != 0 && strlen($codevalrub[$szCodeRub]) != 0)
	{
		// Création de la locution.
		// htmlspecialchars_decode car les valeurs ont été encodées dans consulter_index
		$tabLocAsso[0] = new Locution(1,$szCodeTypeLie,$szCodeRubLiee,"=",
						htmlspecialchars_decode($codevalrub[$szCodeRub]));
		// Récupération des réponses.
		//$retour = pos_searchdoc($jeton,count($tabLocAsso),$tabLocAsso,
		//					/*pref*/$dwNbReponsesAsso, /*pref*/$dwAdrPremiereReponseAsso);
		$retour = pos_getfichesliees($jeton, $szTypeDoc, $szCodeRub, htmlspecialchars_decode($codevalrub[$szCodeRub]), /*pref*/$dwAdrPremiereReponseAsso, /*pref*/$dwNbReponsesAsso);
	}
	
    if($retour)
	{
		if ($tabListeRubsLiees[$k]["typeLien"] == "LIEN_SIMPLE")
		{
		    if($dwNbReponsesAsso != 0)
	        {
			    $tabRepLR = array();
				$retour = pos_getreponseslrd($jeton, $dwAdrPremiereReponseAsso, $dwNbReponsesAsso,
												$dwNbReponsesAsso, 1, 1, /*pref*/$szProfilLR, /*pref*/$tabRepLR);
				if($retour)
				{
    			    $tabCodeValRubAsso = array();
					$retour=pos_getallindexdoc($jeton,$tabRepLR[0]->numdoc,/*pref*/$tabCodeValRubAsso);
					if($retour)
					{
						while (list($key, $valeur) = each($tabCodeValRubAsso))
							$t->set_var("POS_VAL_RUB_".$szCodeRub."_".$key, $valeur);
						$t->set_var("POS_NUMDOC_LIE_".$szCodeRub, $tabRepLR[0]->numdoc);
						$t->set_var("POS_TYPEDOC_LIE_".$szCodeRub, $tabRepLR[0]->typedoc);
					}
				}
			}
			else
			{
				$retour = pos_getlistrubintype($jeton, $szCodeTypeLie, /*pref*/$tabListeRubriquesInType);
				while (list($code1, $lib1) = each($tabListeRubriquesInType))
				{
				    $t->set_var("POS_VAL_RUB_".$szCodeRub."_".$code1,"");
				}
			}	
		} // lien simple

		// Lien multiple.(soit avec demande de profil LR "_P", soit normale)
		elseif ($tabListeRubsLiees[$k]["typeLien"] == LIEN_M)
		{
    		$szNomBloc = "LIEN_MULTIPLE_PROFIL_LISTE_".$szCodeRub;
		    if($dwNbReponsesAsso != 0)
	        {
    			$t->set_block("consultation", "ENTETE_".$szCodeRub, strtolower("ENTETE_".$szCodeRub));
				$t->set_block("consultation", "LR_REPONSE_".$szCodeRub, "lr_reponse".$szCodeRub);
				$t->set_block("consultation", "LISTE_REPONSES_".$szCodeRub, "liste_reponses".$szCodeRub);
				$t->set_block("consultation", $szNomBloc, strtolower($szNomBloc));

				// On va chercher la lr si XXX_P sinon fonctionnement normal.
    			$szProfilLR = $tabListeRubsLiees[$k]["profil"];
				$tabReponseLR = "";
    			
				// recuperation de l'ensemble des listes resumees
				$retour = pos_getreponseslrd($jeton, $dwAdrPremiereReponseAsso, 
					$dwNbReponsesAsso, $dwNbReponsesAsso, 1, 1, /*pref*/$szProfilLR, /*pref*/$tabReponseLR);
	
				if ($retour)
				{
    				$retour = afficheEnteteTableau($jeton, $szProfilLR, "ENTETE_".$szCodeRub, /*pref*/$t);
    			}	
				if ($retour)
				{	
					// ensuite on traite les reponses.
					$t->set_var("liste_reponses".$szCodeRub, "");
					for ($i=0; $i<count($tabReponseLR); $i++) 
					{
						$iNumDoc = $tabReponseLR[$i]->numdoc;

						$t->set_var("POS_NUMDOC_LIE", $iNumDoc);
						$t->set_var("lr_reponse".$szCodeRub, "");
						$t->set_var("COMPT", $i);
                        $t->set_var("PAIR_OU_IMPAIR", (($i % 2) == 0) ? "pair" : "impair");

						$champs = extraireChampsLR($tabReponseLR[$i]->lr, "\x02");
						for ($j=0; $j<count($champs); $j++)
						{
							$t->set_var("ZONE_LR", ($champs[$j] != "") ? $champs[$j] : "&nbsp;");
							$t->set_var("ZONE_LR_SLASH", ($champs[$j] != "") ? addslashes($champs[$j]) : "&nbsp;");
							$t->parse("lr_reponse".$szCodeRub, "LR_REPONSE_".$szCodeRub, true);
						}
						$t->parse("liste_reponses".$szCodeRub, "LISTE_REPONSES_".$szCodeRub, true);
					}
				}
				else
				  debug($jeton);

				$t->parse(strtolower($szNomBloc), $szNomBloc, true);
		     }
		     else
		     {
			    $t->set_block("consultation", "LIEN_MULTIPLE_PROFIL_LISTE_".$szCodeRub, "lmpl");
			    $t->set_var("lmpl", "");
		     }
		} // lien multiple
	} // retour possearchdoc OK
} // boucle sur les rubriques

// -----------------
//	Fin Associations
// -----------------

?>
