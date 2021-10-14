<?php   
/*   
 * DESCRIPTION : Module d'affichage d'une fiche creation 
 *
 * AUTEUR : Gabrielle Guy, S�bastien Fleury
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 * POS_TYPEDOC : type du document  (pour determiner le template)
 * POS_NUM_FICHE : numero du template utilis� (optionnel, par defaut 0)
 * POS_REAFFICHAGE : reaffichage apr�s une erreur
 * ------------------------------------------------------------
 * Modifications
 * Gaby : 08/08/2001 : gestion des valeurs par d�faut
 * Gaby : 26.10.2001 : reaffichage apr�s une cr�ation infructueuse
 * Gaby : 30.10.2001 : les templates sont ranges par application
 * Gaby : 12.11.2001 : ajout prise en compte du num�ro de fiche
 * Gaby : 23.11.2001 : prise en compte des valeurs des rubriques en entr�e
 *   pour passer du mode recherche en mode cr�ation
 * Gaby : 06.08.2002 : correction date system + nb jours
 * Gaby : 01.04.2003 : ajout constantes Fermer/Creer
 * PL : 25.07.2007 PL les variables issues de GET et POST
 * 		 sont recuperees par $_REQUEST
 */
// connexion
if (!isset($_SESSION))
session_start();
include ("../include/debug.inc.php");
include ("../include/connexion.inc.php");
include ("../include/template.inc.php");
include ("../include/form_values.inc.php");
include ("../include/get_template.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
//le type de document n'est pas s�lectionn�
include ("../../../../configuration_w/mabd.php"); //add by ibson


/***** script principale **/
if (!isset($_REQUEST['POS_TYPEDOC']) || $_REQUEST['POS_TYPEDOC'] == NULL)
{
	afficheMsg(CST_LIBELLE_CREATION_TYPE_DOC);
	exit;
}
if(defined('DISPLAY_CONF_CREATION_DOC') && strcmp(DISPLAY_CONF_CREATION_DOC, "1") == 0 && !isset($_REQUEST["POS_CONF_HAB"])) {
    include("../creation/choisir_confidentialite.php");
    exit;
}

$iNumFiche = (isset($_REQUEST["POS_NUM_FICHE"])) ? $_REQUEST["POS_NUM_FICHE"] : 0;
$retour_file = get_file_tpl("CREATION", $_REQUEST['POS_TYPEDOC'], $iNumFiche, /*pref*/$file_tpl);

if (!$retour_file)
{
	afficheMsg(CST_LIBELLE_CREATION_SEARCH_NOT_EXIST);
	exit;
}
$retour = connexion($jeton);
if ($retour)
{
	$retour = pos_getrubriquetype($jeton, $_REQUEST['POS_TYPEDOC'], /*pref*/$tabRubInType);
    if ($retour)
    {
    	// remplacement dans le template
    	$t = new Template(".");


        
		//initialisation du salaire net
		$salaireNet=0;
		
		//Traitement des requetes par type de document  ::IBSON
		if($_REQUEST['POS_TYPEDOC']=='ABS'
		      OR $_REQUEST['POS_TYPEDOC']=='PRT' OR $_REQUEST['POS_TYPEDOC']=='DEM' OR $_REQUEST['POS_TYPEDOC']=='TMS' OR
			   $_REQUEST['POS_TYPEDOC']=='DBQ' OR $_REQUEST['POS_TYPEDOC']=='JUS'
			    OR $_REQUEST['POS_TYPEDOC']=='ATT'  OR $_REQUEST['POS_TYPEDOC']=='DFM' OR $_REQUEST['POS_TYPEDOC']=='COT'
				OR $_REQUEST['POS_TYPEDOC']=='MIS' OR $_REQUEST['POS_TYPEDOC']=='HSU'  OR $_REQUEST['POS_TYPEDOC']=='LIC' OR $_REQUEST['POS_TYPEDOC']=='SAN'
				OR $_REQUEST['POS_TYPEDOC']=='PAY'
			    ){
			        
			  /* $val1="je suis fort";*/
			  /* include ("../../../../interface/tpl/NGSYS/ABS/mypage.tpl");*/

			/* $t->set_var("RUB_DIS", include ("../../../../interface/tpl/NGSYS/ABS/mypage.tpl"));*/
			 
			
			//Recup�ration des donn�es de l'utlisateurs connect�
				$result = pg_query($conn, "SELECT \"NOM\" , \"PRE\" ,\"FON\", \"DPT\" , \"SLT\", \"MAT\" from pos_tab_index_prs WHERE \"MEL\"='".$_SESSION["sess_user_name"]."'");
			       
				$t->set_var("NOM_UTILISATEUR", $_SESSION["sess_user_name"]);
				$t->set_var("PROFIL_UTILISATEUR", $_SESSION["sess_profil"]);

                 $nom='';
				 $prenom='';
				 $fonction='';
				 $departement=''; 
				 $service='';  
				 $matricule='';  
				
				if (!$result){  
				}else{
					while ($row = pg_fetch_row($result)) {
						// as a string 
						 $nom=$row[0];
						 $prenom=$row[1];
						 $matricule=$row[5];
						 //$fonction=$row[2];
						 //$departement=$row[3];
						// $salaireNet=$row[4];
						   

						 if(isset($nom) AND isset($prenom)){
							echo "<input  type='hidden' class='nom'  value='{$nom}' />"; 
							echo "<input  type='hidden' class='prenom' name='POS_VAL_RUB_PRE'  value='{$prenom}' />";
							echo "<input  type='hidden' class='matricule' name='POS_VAL_RUB_MAT'  value='{$matricule}' />";
							
							
						 }
					}
				}


				///get user fonction 

				$query_fposte="
                SELECT
                     \"IPO\"
               FROM 
                   public.pos_tab_index_fpo
               WHERE \"MEL\"='".strtolower($_SESSION["sess_user_name"])."'
               ORDER BY \"NUD\" DESC LIMIT 1
               ";
			     $contests_fposte = pg_query($query_fposte) or die('Query failed: ' . pg_last_error());
			      $fpo_fonction='';
			     while($rowfpos=pg_fetch_row($contests_fposte)){

			        $fonction=$rowfpos[0];
			        $t->set_var("FONCTION_UTILISATEUR",$fonction);
			        echo "<input  type='hidden' class='fonction' name='POS_VAL_RUB_FON'  value='{$fonction}' />";
			     }


			     //get user departement
			      $query_dpt="
                SELECT dpt.\"LIB\" 
                FROM public.pos_tab_index_pos postab
                INNER JOIN public.pos_tab_index_dpt dpt
                ON  dpt.\"LIB\"=postab.\"DPT\" 
                WHERE postab.\"IPO\"='".strtoupper($fonction)."'
               ORDER BY postab.\"NUD\" DESC LIMIT 1
			       ";
			       $contests_dpt = pg_query($query_dpt) or die('Query failed: ' . pg_last_error());
			       while($rowdpt=pg_fetch_row($contests_dpt)){
			            $departement= strtoupper($rowdpt[0]);
			            $t->set_var("DEPARTEMENT_UTILISATEUR",$departement);
			      echo "<input  type='hidden' class='departement'  name='POS_VAL_RUB_DPT'  value='{$departement}' />";
			       }




			       //get user service
			      $query_src="
                SELECT src.\"LIB\" 
                FROM public.pos_tab_index_pos postab
                INNER JOIN public.pos_tab_index_src src
                ON  src.\"LIB\"=postab.\"SER\" 
                WHERE postab.\"IPO\"='".strtoupper($fonction)."'
               ORDER BY postab.\"NUD\" DESC LIMIT 1
			       ";
			       $contests_src = pg_query($query_src) or die('Query failed: ' . pg_last_error());
			       while($rowsrc=pg_fetch_row($contests_src)){
			            $service= strtoupper($rowsrc[0]);

			      echo "<input  type='hidden' class='service'  name='POS_VAL_RUB_SER'  value='{$service}' />";
			       }
			     

				   $result4=pg_query($conn, "SELECT \"CAE\" as categorie FROM public.pos_tab_index_cot WHERE \"MEL\"='".strtolower($_SESSION["sess_user_name"])."' ORDER BY \"NUD\" DESC LIMIT 1  ");
            $categorie=''; 
			while($row_cae = pg_fetch_row($result4)){
 				$categorie = $row_cae[0];
			}
			
			$salaire_base=0;
			$query_salbse="SELECT \"BSE\"
			FROM public.pos_tab_index_cat WHERE \"CAE\" ='".$categorie."' ";
			$contests_salbse = pg_query($query_salbse) or die('Query failed: ' . pg_last_error());
		 
			while ($row_salbse = pg_fetch_row($contests_salbse)) {
				  $salaire_base=$row_salbse[0];
			 } 

			 echo "<span class='salaire_base' style='display:none'>{$salaire_base}</span>";




				    
		}


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
			echo "<span class='nombreEmp' >sssss {$categorie}</span>";
        
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
		
		
        
        $retour_file = get_file_tpl("CREATION_BTN", $_REQUEST['POS_TYPEDOC'], $iNumFiche, /*pref*/$fileBoutonType);
        $file_bouton_tpl =  (file_exists($fileBoutonType)) ? $fileBoutonType : REP_TEMPLATE_APPLICATIF."creation/titre_boutons.tpl";
		
		
			
    	$t->set_file(array(
			"creation"=>$file_tpl,
			"bouton"=>$file_bouton_tpl,
			
			
		));
        $t->set_block("bouton", "BLOC_LISTE_RUB_TAB", "bloc_liste_rub_tab");
        $t->set_var("URL_ATTENTE", URL_ATTENTE);
        $t->set_var("LIBELLE_ACTION", CST_LIBELLE_CREER);
        $t->set_var("LIBELLE_CREER_DOSSIER", CST_LIBELLE_CREER_DOSSIER);
    	$t->set_var("LIBELLE_FERMER", CST_LIBELLE_FERMER);
        $t->set_var("CODE_ACTION", URL_CREER);
    	$t->set_var("POS_NUM_FICHE", $iNumFiche);
        $t->set_var("POS_TYPEDOC", $_REQUEST['POS_TYPEDOC']);
    	$t->set_var("TITRE_ENTETE_PAGE", CST_LIBELLE_TITRE_TPL_CREATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
    	$t->set_var("TITRE_FENETRE", CST_LIBELLE_TITRE_TPL_CREATION.$_SESSION["sess_tabLibTypeDoc"][$_REQUEST['POS_TYPEDOC']]);
    	$t->set_var("FCT_JS_VOC_GEN", "charger_vocabulaire();");
    
    	$t->set_var("VOCABULAIRE", CST_LIBELLE_VOCABULAIRE);
        $t->set_var("AFFICHER_CALENDRIER", CST_LIBELLE_CALENDRIER);
    	$t->set_var("CODE_ACTION_FERMER", "fermeture();");
    	$t->set_var("PHPSESSID", session_id());
        $t->set_var("MODE", "CREATION");
        
        if (isset($_REQUEST["POS_CONF_HAB"]))
    		$t->set_var("POS_CONF_HAB", $_REQUEST["POS_CONF_HAB"]);
		else
    		$t->set_var("POS_CONF_HAB", "0");

		if (isset($_REQUEST["POS_CONF_NIV"]))
    		$t->set_var("POS_CONF_NIV", $_REQUEST["POS_CONF_NIV"]);
		else
    		$t->set_var("POS_CONF_NIV", "0");

		if (isset($_REQUEST["POS_CLOISON"]))
    		$t->set_var("POS_CLOISON", $_REQUEST["POS_CLOISON"]);
		else
    		$t->set_var("POS_CLOISON", "");

		if (isset($_REQUEST["POS_CONF_LIBELLE_HAB"]))
    		$t->set_var("POS_CONF_LIBELLE_HAB", $_REQUEST["POS_CONF_LIBELLE_HAB"]);
		else
    		$t->set_var("POS_CONF_LIBELLE_HAB", "");

    	// affichage des valeurs par d�faut
    	if (!isset($_REQUEST["POS_REAFFICHAGE"]))
    	{
    		$t->set_var("RUB_ERREUR", "");
    		$szListeRubVerrouille = "";
    		for($i=0;$i<count($tabRubInType);$i++)
    		{
    		    if ($tabRubInType[$i]->wReservee == 1 || $tabRubInType[$i]->wReservee == 2)
    		    {
    		      $szListeRubVerrouille .= $tabRubInType[$i]->szRubrique . ";";
                }
    			// valeurs par d�faut
    			$szCodeRubDefaut = $tabRubInType[$i]->szRubrique;
    			$szValeurRubDefaut = $tabRubInType[$i]->szDefaut;
                $szValeurRubDefaut = calcValDefaut($szValeurRubDefaut);
    
    			// si pas de valeur par d�faut (ou vide), affiche la valeur de la rubrique 
    			// en entree (cas du passage recherche -> creation)
    			$tag = "POS_VAL_RUB_".$szCodeRubDefaut;
    			if (isset($_REQUEST[$tag]) &&  strlen($_REQUEST[$tag]) != 0 && strlen($szValeurRubDefaut) == 0)
    			{
    				$szValeurRubDefaut = stripslashes($_REQUEST[$tag]);
    				$szValeurRubDefaut = htmlentities($szValeurRubDefaut, ENT_QUOTES);
    			}
    			// si une valeur par d�faut existe, elle remplace la pr�c�dente
    			$t->set_var("POS_VAL_RUB_".$szCodeRubDefaut, $szValeurRubDefaut);
                
                // rubrique tableau
                if ( $tabRubInType[$i]->szDefaut == "AUTO" && strlen($tabRubInType[$i]->szTypeLie) != 0) {
                    
                    $szNextValCompt = "";
                    $retour = pos_gestcompteur($jeton, $tabRubInType[$i]->szRubrique, $_REQUEST['POS_TYPEDOC'],
                                                PHP_VULCAIN_GET_NEXT_VAL, $szNextValCompt);
                    $t->set_var("CODE_RUB_TAB", $tabRubInType[$i]->szRubrique);
                    $t->set_var("VALEUR_RUB_TAB", $szNextValCompt);
                    $t->set_var("POS_VAL_RUB_".$tabRubInType[$i]->szRubrique, $szNextValCompt);
                    $t->parse("bloc_liste_rub_tab", "BLOC_LISTE_RUB_TAB", true);
                }
    		}
    		$t->set_var("LISTE_RUB_VERROUILLEES", $szListeRubVerrouille);
    	}
    	else
    	// reaffichage des valeurs saisies
    	{
            $t->set_var("RUB_ERREUR", (isset($szRubErreur)) ? $szRubErreur : "");
    		$tabValeur = get_form_values_with_prefix("POS_VAL_RUB_", true);
    		
    	 	while (list($key, $val) = each($tabValeur))
    	 	{
    			$val = htmlentities_currentcharset($val,ENT_QUOTES);
    			$t->set_var("POS_VAL_RUB_".$key, $val);
    		}
    		$t->set_var("LISTE_RUB_VERROUILLEES", $_REQUEST["LISTE_RUB_VERROUILLEES"]);
            
            for($i=0;$i<count($tabRubInType);$i++)
    		{
    		    // rubrique tableau
                if ( $tabRubInType[$i]->szDefaut == "AUTO" && strlen($tabRubInType[$i]->szTypeLie) != 0) {
                    $t->set_var("CODE_RUB_TAB", $tabRubInType[$i]->szRubrique);
                    $t->set_var("VALEUR_RUB_TAB", $tabValeur[$tabRubInType[$i]->szRubrique]);
                    $t->parse("bloc_liste_rub_tab", "BLOC_LISTE_RUB_TAB", true);
                }
    		}
    	}
        $traitements_speciaux = "../specifique/afficher_creation_".$_SESSION["sess_application"].".php";
        if(file_exists($traitements_speciaux))
        {
            include($traitements_speciaux);
        }
        pos_disconnect($jeton);
    }
	$t->parse("TITRE_BOUTONS", "bouton", false);
	$t->pparse("MyOutput", "creation");
}
else
{
	debug($jeton);
	echec_connexion();
}

?>
