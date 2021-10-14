<?php
/*
 * PL : 05/01/2009
 * Affichage de l'ecran de recherche par date 
 *
 * Donnees en entree 
 * POS_TYPEDOC : type de document
 * iNumQuest : numero de la question
 *
 *
 */

include ("../include/locution.inc.php");

session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/locution.inc.php");
include ("../include/liste_resumee.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
require("../ajax/JSON.php");

$tabMotsCles = array ("TypeDoc", "CodeRubDate", "NBCritere", "CodeRubCritere", "ValueCritere", "Couleur", "Libelle");
if (strcmp($_SESSION["sess_profil"], "INTRANET") ==0)
	$fic = "../../../../configuration/agenda-intranet.conf";
else
$fic = "../../../../configuration/agenda.conf";

if(file_exists($fic))
{
	// Lecture du fichier.
    $file = file($fic);       

    // Le fichier est parsé et analysé
    
	// On créé un tableau de questions des documents à afficher en
	// fonction des critères requis.
	// C'est un tableau indéxé d'un tableau associatif 
	// cle : "Date" - valeur :Code de la rubrique date affichée :
	// cle : "Question" - valeur : tableau de locutions
	// cle : "Couleur" - valeur : couleur affichée 
	// Il y a une couleur unique pour l'ensembles des dates des documents résultant d'une questions
	//de tableaux de locutions
	$tabQuestions = array();	
	// nombre de questions
	$iNbrQuestions = 0;	
	// numéro de la question courrante
	// (une question correspond à un type de document + un certain nombre de critères)
	$iCptTypeDoc = 0;
	// Valeur du type de document sur lequel porte la qusetion
	$szValueTypeDoc = "";
	// nombre de critères courrant	
	$iNbrCriteres = 0;
	// numéro du critère courrant
	$iNumCritere = 0;
	// Code de la rubrique critère courrant
	$szCodeRubCritere = "";
	// indice dans $tabMotsCles du  mot clé lu 
	$iNumMotCle = 0;
	$Erreur = False;
	$iLigneErreur = 0;
	
	// Tableaux associatifs des résultats
	// clé : couleur - value : tableau indéxé de valeur Numéro Informatique concaténé à la date critère
	$tabSeances = array();
	
    for($iNumLigne=0; $iNumLigne < count($file); $iNumLigne++)
    {
    	$commentPattern = "/^\/\/.+$/";
    	
       	if(!preg_match($commentPattern,$file[$iNumLigne])) {
       
			$tabLigne = split("=",$file[$iNumLigne]);
			
			//NBTypeDoc
			if (strcasecmp($tabLigne[0] , "NBTypeDoc") == 0)
			{
					$iNbrQuestions = trim($tabLigne[1]);
			}
			else if (strcasecmp($tabLigne[0] , "MoisDeDebut") == 0){
				$szMoisDebut = trim($tabLigne[1]);
				
				$szMoisCourant = date("m");	
				
				// pas de mois fourni				
				if(strcmp($szMoisDebut,"")==0) {
					$szMoisDebut = $szMoisCourant;			
				}
				else { // mois fourni	
					$pattern = "/^[0-9]{1,2}$/";
					if(preg_match($pattern, $szMoisDebut) !=0) {
						// mois sur un caractère 
						if(strlen($szMoisDebut) == 1) {
							if(strcmp($szMoisDebut,"0") == 0)
								$szMoisDebut = $szMoisCourant;
							else
								$szMoisDebut =  "0".$szMoisDebut;						
						}
						else { // mois sur deux caractères 
							if(strcmp($szMoisDebut,"00") == 0) {
								$szMoisDebut = $szMoisCourant;
							}
							else if($szMoisDebut[0] != "0" && $szMoisDebut > 12) {
								$bErreur= True;
								$iLigneErreur = $iNumLigne+1;
							}
						}
					}	 						
					else { // syntaxe du mois incorrecte
							$bErreur= True;
							$iLigneErreur = $iNumLigne+1;
					}
				}		
			}
			else if (strcasecmp($tabLigne[0] , "AnneeDeDebut") == 0){
				$szAnneeDebut = trim($tabLigne[1]);
				// pas d'annee fournie				
				if(strcmp($szAnneeDebut,"")==0) {
					$szAnneeDebut = date("Y");		
				}
				// annee fourni	
				else {
					$pattern = "/^[0-9]{4}$/";
					if(preg_match($pattern, $szAnneeDebut) ==0) {
						// syntaxe de l'annee incorrecte
						$bErreur= True;
						$iLigneErreur = $iNumLigne+1;
					}
				}				
			}
			else if (strcasecmp($tabLigne[0] , "NBMois") == 0){
				$nbMois = trim($tabLigne[1]);
				// pas de nombre de mois fourni				
				if(strcmp($nbMois,"")==0) {
					$nbMois = 12;		
				}
				// nombre de mois fourni	
				else {
					$pattern = "/^[0-9]{1,2}$/";
					if(preg_match($pattern, $nbMois) !=0) {
						// mois sur un caractère 
						if(strlen($nbMois) == 1) {
							if(strcmp($nbMois,"0") == 0)
								$nbMois = 12;
							else
								$nbMois =  "0".$nbMois;						
						}
						else { // mois sur deux caractères 
							if(strcmp($nbMois,"00") == 0) {
								$nbMois = 12;
							}
							else if($nbMois[0] != "0" && $nbMois > 12) {
								$bErreur= True;
								$iLigneErreur = $iNumLigne+1;
							}
						}
					}	 						
					else { // syntaxe du mois incorrecte
							$bErreur= True;
							$iLigneErreur = $iNumLigne+1;
					}					
				}				
			}
			else { 
			if (!$bErreur) {
				// autres mots clé
					for($i=0;$i<count($tabMotsCles);$i++) {
						$tabNumPart = spliti($tabMotsCles[$i], $tabLigne[0]);
						// occurence du mot clé trouvée
						if (count($tabNumPart) > 1) {
							switch($tabMotsCles[$i])
							{	
												
								case "TypeDoc":
									if ($tabNumPart[1] > $iNbrQuestions) {						
										$bErreur= True;
									}
									else {
											$iNumMotCle = $i;
										$iCptTypeDoc = $tabNumPart[1];
										$szValueTypeDoc = trim($tabLigne[1]);
										$iNumCritere = 0;
										$szIdent = 0;
										//$tabLocutions = array();
										$tabQuestions[$iCptTypeDoc - 1]["Question"] = array();		
									}
									break;
								
								case "CodeRubDate":
									if ($tabNumPart[1] !=  $iCptTypeDoc) {
										$bErreur= True;							
									}
									else {
										$tabQuestions[$iCptTypeDoc - 1]["Date"]=trim($tabLigne[1]);
									}
									break; 
								
								case "NBCritere":
									if ($tabNumPart[1] !=  $iCptTypeDoc) {
										$bErreur= True;							
									}
									else {
										$iNbrCriteres = trim($tabLigne[1]);
									}						
									break;
									
								case "CodeRubCritere":
									$iNumCritere = $iNumCritere + 1;
									$szIdent = $iCptTypeDoc."-".$iNumCritere;
									if (strcasecmp($tabNumPart[1], $szIdent) != 0) {					
										$bErreur= True;
									}
									else {
										$szCodeRubCritere = trim($tabLigne[1]);		
									}	
									break;
								case "ValueCritere":
									if (strcasecmp($tabNumPart[1], $szIdent) != 0) {
										$bErreur= True;
									}	
									else {
										if ($iNumCritere == 1) 
	 										$tabQuestions[$iCptTypeDoc - 1]["Question"][$iNumCritere - 1] =  new Locution (LIEN_OU, $szValueTypeDoc, $szCodeRubCritere,'=', trim($tabLigne[1]), 0, 0);
	 									else
	 										$tabQuestions[$iCptTypeDoc - 1]["Question"][$iNumCritere - 1] =  new Locution (LIEN_ET, $szValueTypeDoc, $szCodeRubCritere,'=', trim($tabLigne[1]), 0, 0);
										
										if ($iNbrCriteres >  1)
											$tabQuestions[$iCptTypeDoc - 1]["Question"][$iNumCritere - 1]->wTypeLienMulti = 2;		
									}
									break;
								case "Couleur":
									if ($tabNumPart[1] != $iCptTypeDoc) {						
										$bErreur= True;
									}	
									else {
										$szCouleur = trim($tabLigne[1]);
										if(strncasecmp($szCouleur, "class", 5)) {
											$bErreur= True;
										}
										else 
											$tabQuestions[$iCptTypeDoc - 1]["Couleur"]=$szCouleur;
									}
									break;
								
								case "Libelle":
									if ($tabNumPart[1] != $iCptTypeDoc) {						
										$bErreur= True;
									}	
									else {
										$tabQuestions[$iCptTypeDoc - 1]["Libelle"]=trim($tabLigne[1]);		
									}
									break;
								
							}
						}
						if ($bErreur) {
							$iLigneErreur = $iNumLigne+1;
							break;
						}	
					}				
				}
			}
		}
	}
}
if ($bErreur) {
	print "Erreur ligne ".$iLigneErreur." dans le fichier de configuration du calendrier";
}
else {
	//connexion à poseidon
	$retour = connexion($jeton);
	if ($retour) 
	{
		$file_tpl="../../../tpl/applicatif/agenda/afficher_agenda.tpl";
	
		$t = new Template(".");
		$t->set_File("recherche_date", $file_tpl);
		$t->set_block("recherche_date", "BLOC_LEGENDE", "bloc_legende");
		
		//print_r($tabQuestions);

		// boucle sur les questions
		for ($i=0;$i<count($tabQuestions);$i++) {
			$szLibelle = $tabQuestions[$i]["Libelle"];
			$tabNumDoc = array();
 			$retour = pos_searchdoc($jeton, count($tabQuestions[$i]["Question"]), $tabQuestions[$i]["Question"], /*pref*/$iNbReponses, /*pref*/$iAdrPremiereReponse);

			$retour = pos_getreponsestabnumdoc($jeton, $iAdrPremiereReponse, $iNbReponses, /*pref*/$tabNumDoc);
			if ($retour && $iNbReponses >0){
				for ($j = 0; $j<count($tabNumDoc); $j++)
				{
					$numdoc = $tabNumDoc[$j];
					$retour = pos_getrubdoc($jeton, $numdoc, $tabQuestions[$i]["Date"], /*pref*/$szBuffer);
					$tabSeances[$tabQuestions[$i]["Couleur"]][] = array('numdoc' => $numdoc, 'date' => $szBuffer, 'libelle' => utf8_encode($szLibelle));
					//$tabSeances[$tabQuestions[$i]["Couleur"]][] = array('numdoc' => $numdoc, 'date' => $szBuffer);
				}				
				// affichage de la légende
			$t->set_var("CLASSCOULEUR",$tabQuestions[$i]["Couleur"]);
			$t->parse("bloc_legende", "BLOC_LEGENDE", true);
			}		
		}
		if (strcmp($_SESSION["sess_profil"], "INTRANET") ==0)
			$t->set_var("INTRANET", true);
		else
			$t->set_var("INTRANET", false);
			
		$szMoisAnneeDebut = $szMoisDebut."/".$szAnneeDebut;
		$t->set_var("MOIS_ANNEE_DEBUT",$szMoisAnneeDebut);
		$t->set_var("NBMOIS", $nbMois);
		$json = new Services_JSON();
		$t->set_var("SEANCES",addslashes(json_encode($tabSeances)));	
				
		$t->pparse("MyOutput", "recherche_date");
		
		// Déconnexion poseidon.
	pos_disconnect($jeton);
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}
}
?>
