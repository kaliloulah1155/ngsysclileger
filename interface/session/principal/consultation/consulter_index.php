<?php
/*
 * DESCRIPTION : Module d'affichage de la fiche d'index en mode consultation 
 * ou modification.
 * Les valeurs de la fiche proviennent soit des valeurs enregistr�es dans 
 * Poseidon soit des donn�es transmises du formulaire (cas d'une erreur 
 * lors de la modification).
 *
 * AUTEUR : Gabrielle Guy
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_NUM_DOC : numero informatique du document a modifier/consulter
 * MODE : type de consultation (CONSULTATION ou MODIFICATION) (par defaut CONSULTATION)
 * POS_NUM_FICHE : numero du template utilis� (optionnel, par defaut 0)
 * POS_TYPEDOC : type du document
 * POS_REOUVERTURE : optionnel  
 * POS_REAFFICHAGE : optionnel
 *
 *------------------------------------------------------------------
 * Modifications :
 * Ajout de la gestion des actions herm�s
 */
if (!isset($_SESSION))	
session_start();
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/debug.inc.php");
include ("../include/pos_dmdmodifdoc.inc.php");
include ("../include/get_template.inc.php");
include ("../include/form_values.inc.php");
include ("../include/get_infoparam.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");

include ("../../../../configuration_w/mabd.php"); //add by ibson
// gestion de l'historique des documents consult�s
     
     

$time_start = getmicrotime();

define("SEPARATEUR_CONSULT", "###");	
define("SEPARATEUR_KH", "/");
define("TYPE_FORMAT_KH_NO_FORMAT", 0); // pas de formatage
// affichage en espace : si copier-coller pas de conservation de plusieurs espaces
define("TYPE_FORMAT_KH_ESPACE", 1);    
// affichage en espace html : si copier-coller conservation de plusieurs espaces
define("TYPE_FORMAT_KH_ESPACE_HTML", 2);
define("FORMAT_KH", TYPE_FORMAT_KH_NO_FORMAT);

define("MODIFIER_AUCUN", 0);
define("MODIFIER_DOC_ET_PAGE", 1);
define("MODIFIER_DOC_SEUL", 2);
define("MODIFIER_PAGE_SEUL", 3);

/*
echo($_POST["myname"]);
 exit;*/


// Si il n'y a pas de numero de document, on ne fait rien.
if (!isset($_REQUEST["POS_NUM_DOC"]) || $_REQUEST["POS_NUM_DOC"] <= 0)
{
	afficheMsg(CST_LIBELLE_CONSULTER_NUM_INIT); 
}
else
{
	// ------------------
	// Actions vulcain
	// ------------------
	$retour = connexion($jeton);
	if ($retour)
	{
		$isDroitEnreg = false;
		$isDroitSuppr = false;
		$szTypeDoc = "";
		
		// Numero de la fiche pour construire le nom du template.
		$iPosNumFiche = (isset($_REQUEST["POS_NUM_FICHE"])) ? $_REQUEST["POS_NUM_FICHE"] : "0";
		
		// si on n'a pas la variable MODE on la fixe en consultation
        $szMode = (isset($_REQUEST["MODE"]) && strlen($_REQUEST["MODE"]) != 0) ? $_REQUEST["MODE"] : "CONSULTATION";
		
		// Si on ne connait pas le type de doc on va le chercher.
		if (!isset($_REQUEST["POS_TYPEDOC"]) || $_REQUEST["POS_TYPEDOC"] == "")
		{
			$retour = pos_getinfonumdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$objInfoNumDoc);
			$szTypeDoc = $objInfoNumDoc->type_doc;
		}
		else
		    $szTypeDoc = $_REQUEST["POS_TYPEDOC"];

		if(!in_array($_REQUEST["POS_NUM_DOC"]."|".$szTypeDoc, $_SESSION["sess_tab_doc_historique"]))
		{
			$_SESSION["sess_tab_doc_historique"][] = $_REQUEST["POS_NUM_DOC"]."|".$szTypeDoc;
		}
			
		// Nom du template.
		$retour_file = get_file_tpl("CONSULTATION", $szTypeDoc, $iPosNumFiche, /*pref*/$file_tpl);
	
		 //echo ($file_tpl);exit; affiche le template de consultation
		
		if (!$retour_file)
		{
			afficheMsg(CST_LIBELLE_CONSULTER_RECHERCHE_EXIST);
			pos_disconnect($jeton);
			exit;
		}
		
		if ($retour && $szMode == "MODIFICATION")
		{
            if (isset($_REQUEST["POS_OLD_NUMDOC"]) && strlen($_REQUEST["POS_OLD_NUMDOC"]) != 0)
            {
                $retour	 = libere_doc($jeton, $_REQUEST["POS_OLD_NUMDOC"]);
            }
			// maintenant on prends le document en modification
			$retour	 = prend_doc($jeton, $_REQUEST["POS_NUM_DOC"]);
	
			// Le document est en cours de modification";
			if (!$retour)
			{
				$szMode = "CONSULTATION";
				debug($jeton);
				$retour = 1;
			}
			else
			{
			    $retour = pos_getrestrictionacces($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$dwDroits);
			    if (!$retour)
			    {
				    debug($jeton);
				    $retour = 1;
			    }
			    else
			    {
			        define("POS_ACCES_MODIF_IDX", 0x00000004);
 			        define("POS_ACCES_SUPPR_IDX", 0x00000010);
                    define("POS_ACCES_MODIF_FIC", 0x00000008);
                    define("POS_ACCES_SUPPR_FIC", 0x00000020);
			        
			        if((POS_ACCES_MODIF_IDX & $dwDroits) && ($_SESSION["sess_droitModification"] == MODIFIER_DOC_ET_PAGE || 
						$_SESSION["sess_droitModification"] == MODIFIER_DOC_SEUL))
			            $isDroitEnreg = true;
			        else
			            $isDroitEnreg = false;
			            
			        if((POS_ACCES_SUPPR_IDX & $dwDroits) && ($_SESSION["sess_droitSuppression"] == 1))
			            $isDroitSuppr = true;
			        else
			            $isDroitSuppr = false;

			        if((POS_ACCES_MODIF_FIC & $dwDroits) && ($_SESSION["sess_droitModification"] == MODIFIER_DOC_ET_PAGE || 
						$_SESSION["sess_droitModification"] == MODIFIER_PAGE_SEUL))
			            $bDroitModifFic = true;
			        
			        if(POS_ACCES_SUPPR_FIC & $dwDroits)   
			            $bDroitSuppFic = true;
			    }
			}
		}
		
		if ($retour)
		{
			// premier affichage : les valeurs des rubriques sont demand�es   // find by ibson (recuperation de toutes les rubriques envoy�s depuis la requete du formulaire de consultation)
			// au serveur Poseidon.
			if (!isset($_REQUEST["POS_REAFFICHAGE"]))
			{
				$retour = pos_getallindexdoc($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$codevalrub);
				// filtre des caracteres speciaux a html
				//var_dump($codevalrub);exit;
				
				foreach($codevalrub as $key => $val){
					$codevalrub[$key] = htmlspecialchars_currentcharset($val);
				}
			}
			
			// reaffichage : les valeurs sont r�affich�es, utilis� si erreur
			// lors de la modification, il faut alors r�afficher les valeurs saisies
			// par l'utilisateur
			else
			{
				$codevalrub = get_form_values_with_prefix("POS_VAL_RUB_", true);
				$codeoldvalrub = get_form_values_with_prefix("POS_OLD_VAL_RUB_", true);
				
				// les donnees proviennent du formulaire de modification
				// il faut supprimer les slashes ajoutes par le serveur http
				// filtre des caracteres speciaux a html
				while (list($key, $val) = each($codevalrub))
				{
					$codevalrub[$key] = htmlspecialchars_currentcharset($val);
				}
			
				// ajout des rubriques non envoyees 	
				while (list($key, $val) = each($codeoldvalrub))
				{
					if (!isset($codevalrub[$key]))
					{
						$codevalrub[$key] = htmlspecialchars_currentcharset($val);
					}
				}
			}
			reset($codevalrub);
		}

		// Recherche des actions hermes
		$retour_hermes = 0;
		if ($retour && $szMode == "MODIFICATION")
		{
			$retour_hermes = pos_hermes_rempliraction($jeton, $_REQUEST["POS_NUM_DOC"], /*pref*/$tabActionHermes);
		}
	}
	else
	{
		debug($jeton);
		echec_connexion();
	}

	// ------------------------------------------------
	//         DEBUT AFFICHAGE
	// ------------------------------------------------
	
	// lien pour la gestion de fichier.
	if(!isset($bDroitModifFic)) $bDroitModifFic = false;
	if(!isset($bDroitSuppFic)) $bDroitSuppFic = false;
	
	// Si on a ni le droit de suppression ni de modification des fichiers
	// on ouvre la fenetre de gestion des fichiers en consultation.
	if(!$bDroitModifFic && !$bDroitSuppFic)
	    $modeFichier = "CONSULTATION";
	else
	    $modeFichier = $szMode;
	
	$szCodeActionFichier = "modelesswin_fichier('".URL_SITE."/interface/session/principal/gestionfichier/afficher_arborescence.php?POS_TYPEDOC=$szTypeDoc&POS_NUM_DOC=".$_REQUEST["POS_NUM_DOC"]."&MODE=$modeFichier&DROIT_MODIF=$bDroitModifFic&DROIT_SUPP=$bDroitSuppFic','".CST_LIBELLE_FENETRE_FICHIER ."',".CST_WIDTH_FILE.",".CST_HEIGHT_FILE.",50,100)";

	// lien pour la gestion du passage en modif.
	$szCodeActionModifier = "window.location.href='";
	$szCodeActionModifier .= sprintf(URL_PARAM_CONSULTER_INDEX, "MODIFICATION",$_REQUEST["POS_NUM_DOC"], $szTypeDoc, $iPosNumFiche);
	$szCodeActionModifier .= "'";

	// lien pour la fermeture de la page.
    $szCodeActionFermer = "FermerIndexFromIndex('".$szMode."', 'ifr_posdocument_".$_REQUEST["POS_NUM_DOC"]."');";
	// lien pour le unload.
	$szCodeActionUnload = sprintf(URL_PARAM_UNLOAD_INDEX, $szMode, $_REQUEST["POS_NUM_DOC"]);
	
	$szCodeActionDossierPere = "modelesswin_dossier('".URL_SITE."/interface/session/principal/dossier/afficher_dossiers_peres.php?POS_NUM_DOC=".$_REQUEST["POS_NUM_DOC"]."&PHPSESSID=".session_id()."','".CST_LIBELLE_DOSSIER_PERES."',".CST_WIDTH_FILE.",".CST_HEIGHT_FILE.",50,200)";

	if ($retour)
	{	
		$t = new Template(".");
		
		//Traitement des requete par type de document  ::IBSON
		
		$t->set_var("NOM_UTILISATEUR", $_SESSION["sess_user_name"]);
		if($_REQUEST['POS_TYPEDOC']='ABS'){
			//Recup�ration des donn�es de l'utlisateurs connect�
				$result = pg_query($conn, "SELECT \"NOM\" , \"PRE\" ,\"FON\", \"DPT\"  from pos_tab_index_prs WHERE \"MEL\"='".$_SESSION["sess_user_name"]."'");
				$t->set_var("PROFIL_UTILISATEUR", $_SESSION["sess_profil"]);

				if (!$result){
				}else{
					while ($row = pg_fetch_row($result)) {
					  //echo "$row[0] - $row[1] - $row[2] - $row[3]";
						
						$t->set_var("USER_PRS_NOM", $row[0]);
						$t->set_var("USER_PRS_PRE", $row[1]);
						$t->set_var("USER_PRS_FON", $row[2]);
						$t->set_var("USER_PRS_DPT", $row[3]);

					}
				}
		}
		
        $retour_file = get_file_tpl("CONSULTATION_BTN", $szTypeDoc, $iPosNumFiche, /*pref*/$fileBoutonType);
		if (file_exists($fileBoutonType))
			$file_bouton_tpl = $fileBoutonType;
		else
		{
			$file_bouton_tpl = REP_TEMPLATE_APPLICATIF."consultation/boutons.tpl";
		}
        $file_entete_tpl = REP_TEMPLATE_APPLICATIF."consultation/entete.tpl";
        
		$t->set_file(array("consultation"=>$file_tpl,
                            "bouton"=>$file_bouton_tpl, 
                            "entete"=>$file_entete_tpl));
		
		// definition des blocs
		$t->set_block("entete", "BLOC_OLD_VALUE", "bloc_old_value");
		$t->set_block("entete", "POS_LISTE_ACTIONS_HERMES", "liste_actions");
		$t->set_block("entete", "BLOC_HERMES", "bloc_hermes");
        $t->set_block("entete", "BLOC_MODIFICATION_HERMES", "bloc_modification_hermes");
		
        $t->set_block("bouton", "BLOC_MODIFICATION", "bloc_modification");
		$t->set_block("bouton", "BLOC_CONSULTATION", "bloc_consultation");
        
		$t->set_var("DISPLAY_BTN_DOSSIER_PERE", (strcmp(CST_DOSSIER_PERE, "1") == 0) ? "" : "none");
        $t->set_var("ENABLED_BOUTON_ENREGISTRER", ($isDroitEnreg  || strcmp($szMode, "CONSULTATION") == 0 )? "class=\"bouton\"" : "class=\"boutongris\" disabled=\"true\"");
		$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
		$t->set_var("POS_TYPEDOC", $szTypeDoc);
		$t->set_var("MODE", $szMode);
		$t->set_var("MODE_FICHIER", $bDroitModifFic ? "MODIFICATION" : "CONSULTATION");
		$t->set_var("POS_NUM_FICHE", $iPosNumFiche);
		$t->set_var("PHPSESSID", session_id());

		$t->set_var("VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
		$t->set_var("AFFICHER_CALENDRIER", CST_LIBELLE_CALENDRIER);
	
		$t->set_var("LIBELLE_MODIFICATION", CST_LIBELLE_PASSAGE_EN_MODIF);
		$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
		$t->set_var("LIBELLE_FICHIER", CST_LIBELLE_FICHIER);
		
		$t->set_var("CODE_ACTION_MODIFIER", $szCodeActionModifier);
		$t->set_var("CODE_ACTION_FERMER", $szCodeActionFermer);
		$t->set_var("CODE_ACTION_UNLOAD", $szCodeActionUnload);
		
		$t->set_var("CODE_DOSSIERS_PERES", $szCodeActionDossierPere);
		$t->set_var("DOSSIERS_PERES", CST_DOSSIERS_PERES);
		
		$t->set_var("URL_ATTENTE", URL_ATTENTE);
		//$t->set_var("TITRE_ENTETE_PAGE", CST_LIBELLE_TITRE_TPL_CONSULTATION.$_SESSION["sess_tabLibTypeDoc"][$szTypeDoc]." - ".$_REQUEST["POS_NUM_DOC"]);
		$t->set_var("TITRE_ENTETE_PAGE", CST_LIBELLE_TITRE_TPL_CONSULTATION.$_SESSION["sess_tabLibTypeDoc"][$szTypeDoc]);
		$t->set_var("TITRE_ENTETE_NUM_DOC", " - ".$_REQUEST["POS_NUM_DOC"]); // Add by ibson //voir le numeros de la page
        $t->set_var("TITRE_FENETRE", CST_LIBELLE_TITRE_TPL_CONSULTATION.$_SESSION["sess_tabLibTypeDoc"][$szTypeDoc]." - ".$_REQUEST["POS_NUM_DOC"]);
		
		// Affichage du passage en mode modification si les droits st OK.
		if(!isset($bVisuParLien) && $_SESSION["sess_droitModification"] != 0)
			$t->parse("bloc_consultation", "BLOC_CONSULTATION");
		else
			$t->set_var("bloc_consultation", "");
		
		//Pour griser les champs en consultation
		if(strcmp($szMode,"CONSULTATION") == 0 )
			$t->set_var("GRISE_CHAMP", "desactive_saisie_rubriques(\"TOUTES\");");
        else
            $t->set_var("GRISE_CHAMP", "");

		
		// Affichage du bloc contenant les old values.		
		// Premier affichage : valeurs de la fiche dans les POS_OLD_VAL_RUB_ et POS_VAL_RUB_
		if (!isset($_REQUEST["POS_REAFFICHAGE"]))
		{
			reset($codevalrub);
			foreach($codevalrub as $key => $val)
			{
				if($key == "K H" && FORMAT_KH)
	        	{
	        	    $retour = get_valeur_kh($jeton, $szTypeDoc, $val, /*pref*/$szValFinKH);
					if($retour)
					{
					    if (FORMAT_KH == TYPE_FORMAT_KH_ESPACE_HTML)
                            $t->set_var("POS_VAL_RUB_K H", str_replace(' ', '&nbsp;', $szValFinKH));
                        else
                            $t->set_var("POS_VAL_RUB_K H", $szValFinKH);
					    $t->set_var("VALUE_OLD_RUB", $szValFinKH);
					}
					else
					{	
					    $t->set_var("POS_VAL_RUB_K H", $val);
					    $t->set_var("VALUE_OLD_RUB", $val);
					}
					
					$t->set_var("NAME_OLD_RUB", "POS_OLD_VAL_RUB_".$key);
					$t->parse("bloc_old_value", "BLOC_OLD_VALUE", true);
	        	}
	        	else
	        	{
					
					 
				    // toutes les valeurs de rubriques sont ajoutees dans un tableau
   	    	        $form_values_with_prefix[$key] = $val;
      	            $t->set_var("POS_VAL_RUB_$key", $val); 
    				$t->set_var("NAME_OLD_RUB", "POS_OLD_VAL_RUB_".$key);
    				$t->set_var("VALUE_OLD_RUB", $val);
    				$t->parse("bloc_old_value", "BLOC_OLD_VALUE", true);
			    }
		    }
		}
		// R�affichage : valeur old dans les POS_OLD_VAL_RUB_ et nouvelles valeurs dans POS_VAL_RUB_
		else
		{
			reset($codeoldvalrub);
			reset($codevalrub);
			while (list($key, $val) = each($codevalrub))
			{
				// toutes les valeurs de rubriques sont ajoutees dans un tableau
	  		   //$szCodeRub = substr($key, strlen($prefix));
   	    	$form_values_with_prefix[$key] = $val;
      	   $t->set_var("POS_VAL_RUB_$key", $val);
			}
			
			while (list($key, $val) = each($codeoldvalrub))
			{
				$t->set_var("NAME_OLD_RUB", "POS_OLD_VAL_RUB_".$key);
				$t->set_var("VALUE_OLD_RUB", htmlspecialchars_currentcharset(stripslashes($val)));
				$t->parse("bloc_old_value", "BLOC_OLD_VALUE", true);
			}
		}
		
		// mode consultation 
		if ($szMode == "CONSULTATION")
		{
			// Si on est en consultation on fait afficher le bouton imprimer sur le submit
			// mais on lui rajoute une fct sur le onClick qui va gerer l'impression puis
			// on consomme l'evenement submit par le return false.
			$szLibelleAction = CST_LIBELLE_IMPRIMER."\" onClick=\"window.location.href='";
			$szLibelleAction.= URL_IMPRIMER_INDEX;
			$szLibelleAction.= "?POS_TYPEDOC=$szTypeDoc&POS_NUM_DOC=".$_REQUEST["POS_NUM_DOC"]."';return false;";

			$t->set_var("LIBELLE_ACTION", $szLibelleAction);
			$t->set_var("CODE_ACTION_FICHIER", $szCodeActionFichier);
			
			// Effacement du bloc modification
			$t->set_var("bloc_modification", "");
			$t->set_var("bloc_modification_hermes", "");
		}
		else
		{
			if ($szMode == "MODIFICATION")
			{
				$t->set_var("bloc_consultation", "");
				// modifier
				$t->set_var("LIBELLE_ACTION", CST_LIBELLE_ENREGISTRER);
				$t->set_var("CODE_ACTION", URL_MODIFIER_INDEX);
				
				// gestion des fichiers
				$t->set_var("CODE_ACTION_FICHIER", $szCodeActionFichier);
				
				$t->set_var("ENABLED_BOUTON_SUPPRIMER", $isDroitSuppr ? "" : "DISABLED");
				$t->set_var("MESSAGE_SUPP_DOC", CST_LIBELLE_SUPP_DOC);
								
				$tabActionHermesAff = array();
				$iNbActionHermesAff = 0;	
					 
				for ($i=0;$i<count($tabActionHermes); $i++)
				{
					if ($tabActionHermes[$i]->action_code[0] != 'X')
					{
						$tabActionHermesAff[$iNbActionHermesAff] = $tabActionHermes[$i];
						$iNbActionHermesAff++;
					}
					
				}
				 
				// Si on a des actions hermes.
				if ($retour_hermes && count($tabActionHermesAff) > 0)
				{
					$t->set_var("LIBELLE_ACTION_HERMES", CST_LIBELLE_ACTION);
					asort($tabActionHermesAff);
					
					for ($i=0;$i<count($tabActionHermesAff); $i++)
					{
						// Rubriques � desactiver.
						if ($tabActionHermesAff[$i]->nb_rub_non_modif > 0)
						{
							$rub_non_modif="(";
							for($j=0;$j<$tabActionHermesAff[$i]->nb_rub_non_modif;$j++)
							{
								$cle = "codeRub_".$j;
								$rub_non_modif.="'".$tabActionHermesAff[$i]->$cle."',";
							}
							// On supprime la derni�re virgule.
							$rub_non_modif=substr ($rub_non_modif, 0, strlen($rub_non_modif)-1);
							$rub_non_modif.=")";
						}
						else
							$rub_non_modif = "('AUCUNE')";
	
						// Construction du CODE_ACTION_HERMES.SEPARATEUR.RUB_NON_MODIF
						
						
						$sCodeActionHermes=$tabActionHermesAff[$i]->action_code;
						$sCodeActionHermes.=SEPARATEUR_CONSULT;
						$sCodeActionHermes.="desactive_saisie_rubriques";
						$sCodeActionHermes.=$rub_non_modif;
						
						$t->set_var("POS_CODE_ACTION_HERMES", $sCodeActionHermes);
						$t->set_var("POS_LIBELLE_ACTION_HERMES", $tabActionHermesAff[$i]->action_libelle);
						
						/*print_r( $tabActionHermesAff[$i]->action_libelle) ;exit;*/

						if(isset($_REQUEST["POS_ACTION_HERMES"]))
						{ 
						    // S�paration du CODE_ACTION du SEPARATEUR.CODE_RUB_NON_MODIF
						    // si on ne passe par le boutons enregistrer
						    if(strpos($_REQUEST["POS_ACTION_HERMES"], "###") !== false)
						    {
        					    $tabActionHermes = explode("###", $_REQUEST["POS_ACTION_HERMES"]);
        					    $sActionHermes = $tabActionHermes[0];
        					}
        					
 						    if(strcmp($sActionHermes, $tabActionHermesAff[$i]->action_code) == 0)
                                $t->set_var("SELECTED_ACTION_HERMES", "selected");
                            else
                                $t->set_var("SELECTED_ACTION_HERMES", "");
					    }
					    else
					        $t->set_var("SELECTED_ACTION_HERMES", "");

						$t->parse("liste_actions", "POS_LISTE_ACTIONS_HERMES", true);
					}
					$t->parse("bloc_hermes", "BLOC_HERMES");
				}
				// pas d'actions hermes on vide le bloc hermes.
				else
				{
					$t->set_var("bloc_hermes", "");
				}
				
				$t->parse("bloc_modification", "BLOC_MODIFICATION");
                $t->parse("bloc_modification_hermes", "BLOC_MODIFICATION_HERMES");
			}
			else
			{
				// an error has occured
			}
		}

		// TRAITEMENT DES CREANCES

			  //Traitement etat de creances
		if($_REQUEST['POS_TYPEDOC']=='PRT' ){

			$nombreEmp=0;
			$montantEmp=0;
			$quotite=0;

			$result1=pg_query($conn, "SELECT  COUNT(*) AS nbreemprunt  FROM public.pos_tab_index_prt WHERE \"CRE\"='".strtoupper($_SESSION["sess_user_name"])."' AND \"ETF\"!='CLOS'");
			while($row1 = pg_fetch_array($result1)){
				$nombreEmp = $row1["nbreemprunt"];
			}

			//montant d'emprunt en cours 
			$result2=pg_query($conn, "SELECT  SUM(\"VEM\") AS mtnemprunt FROM public.pos_tab_index_prt WHERE \"CRE\"='".strtoupper($_SESSION["sess_user_name"])."'  AND \"ETF\"!='CLOS'");
			while($row2 = pg_fetch_array($result2)){
				$montantEmp = $row2["mtnemprunt"];
			}


			$result3=pg_query($conn, "SELECT \"DFI\" AS datefin FROM public.pos_tab_index_prt WHERE \"DFI\"=(SELECT max(\"DFI\") FROM public.pos_tab_index_prt) AND \"CRE\" ='".strtoupper($_SESSION["sess_user_name"])."'");

			while($row3 = pg_fetch_array($result3)){
				$datefin = $row3["datefin"];
			}


			

			$result4=pg_query($conn, "SELECT \"SAL\" as salaire FROM public.pos_tab_index_cot WHERE \"MEL\"='".strtolower($_SESSION["sess_user_name"])."' ORDER BY \"NUD\" DESC LIMIT 1  ");


			while($row4 = pg_fetch_row($result4)){
				$salaireNet = $row4[0];
			}


        
			     //PRENDRE LE SALAIRE NET DANS LA FICHE CONTRAT
			switch (true) {
				case ($salaireNet<=200000):
					$quotite=($salaireNet*35)/100;
					break;
				case ($salaireNet>200000 AND $salaireNet <= 400000):
					$quotite=($salaireNet*38)/100;
					break;
				case ($salaireNet>400000 AND $salaireNet <= 600000):
					$quotite=($salaireNet*42)/100;
					break;
				case ($salaireNet>600000 AND $salaireNet <= 800000):
					$quotite=($salaireNet*45)/100;
					break;
				case ($salaireNet>800000 AND $salaireNet<= 1000000):
					$quotite=($salaireNet*48)/100;
					break;
				case ($salaireNet>1000000 AND $salaireNet<= 1500000):
					$quotite=($salaireNet*52)/100;
					break;
				case ($salaireNet>1500000 AND $salaireNet<= 2000000):
					$quotite=($salaireNet*55)/100;
					break;
				case ($salaireNet>2000000):
					$quotite=($salaireNet*57)/100;
					break;
				
			}

       
            echo "<span class='nombreEmp' style='display:none'>{$nombreEmp}</span>";
			echo "<span class='montantEmp' style='display:none' >{$montantEmp}</span>";
			echo "<span class='quotite' style='display:none'>{$quotite}</span>";
			echo "<span class='datefin' style='display:none'>{$datefin}</span>";

			echo "<span class='salaire' style='display:none'>{$salaireNet}</span>";
			//echo $_SESSION["sess_user_name"];


		}

		// FIN DES TRAITEMENTS DES CREANCES

 		$traitements_speciaux = "../specifique/consultation".$szTypeDoc.".php";
		
		// on inclu la partie pour les associations.
		include ("../consultation/afficher_fiche_index_lie.inc.php");
		
		// on inclu la partie pour les fichiers.
//		include ("../consultation/afficher_fichier.inc.php");

		if(file_exists($traitements_speciaux))
		{
			include($traitements_speciaux);
		}
		
$time = getmicrotime() - $time_start;
// echo "Temps ecoule : ".$time;

		$t->parse("BOUTON", "bouton", false);
        $t->parse("ENTETE", "entete", false); 
		$t->pparse("MyOutput", "consultation");
	
		// ouverture automatique de word apres la creation ou la modif d'un doc par macro et web dav
		if(isset($bAfficheFichierCree) && $bAfficheFichierCree)
		{
		    if($bFicNoSave)
                echo "<SCRIPT language=\"javascript\">AfficherFichierNoSave('".$szNomFichierWord."', '".session_id()."');</SCRIPT>";
		    else 
    			echo "<SCRIPT language=\"javascript\">AfficherFichier('".$_REQUEST["POS_NUM_DOC"]."', '".$iNumAOuvrir."', '0', '".session_id()."', '".$modeFichier."', 'DOC');</SCRIPT>";
		}
	
	}
	else
	{
		debug($jeton);
	}
	pos_disconnect($jeton);
}
?>
