<?php

/*
 * DESCRIPTION : Affichage pour la numérotation des dossiers d'une séance
 *
 * AUTEUR : Patrick Legaigneur
 * DATE de CREATION : 29/10/2008
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
include ("../include/liste_resumee.inc.php");
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../include/form_values.inc.php");


// Si il n'y a pas de numero de document, on ne fait rien.
if (!isset($POS_NUM_DOC) || $POS_NUM_DOC <= 0)
{
	afficheMsg(CST_LIBELLE_CONSULTER_NUM_INIT); 
}
else
{
	$retour = connexion($jeton);

	if($retour) {
	
	$iNombreReponse = 0;
	// variable commune : initialisation des options de tri de la LR
		if (!isset($POS_LR_TRI_NUMCOL))
			$POS_LR_TRI_NUMCOL = 1; //tri sur la première colonne
		//on recupere le type de tri de la LR,...
		if (!isset($POS_LR_TRI_TYPE))
			$POS_LR_TRI_TYPE = CST_TYPE_TRI;
		
		// ouverture fichier de configuration
		$ficInfoNumerotation = "../../../../configuration/numerotation.conf";
        $tabInfoNumerotation = parse_ini_file ($ficInfoNumerotation, true);
        $szActionHermes = $_REQUEST["POS_ACTION_HERMES"];

		// ...et fixe le profil de la liste résumée.
		$szProfilLR = $tabInfoNumerotation[$szActionHermes]["NUMEROTE_LR"];
		
		
		$retour = pos_constlrdavecattributs($jeton, $POS_NUM_DOC, 0,$POS_LR_TRI_NUMCOL, $POS_LR_TRI_TYPE,/*pref*/$szProfilLR, /*pref*/$tabREP_LR, /*pref*/$tabZoneLR);			
		if($retour) {
			$iNombreReponse = count($tabREP_LR);
			
			$t = new template(REP_TEMPLATE_APPLICATIF."numerotation");
			$t->set_File("numerotation_dossiers", "numerotation.tpl");
			
			// Definition des blocs
			$t->set_block("numerotation_dossiers", "COLUMNS_DEF", "columns_def");
			$t->set_block("numerotation_dossiers", "FIELDS_DEF", "fields_def");
			
			$t->set_block("numerotation_dossiers", "LR_REPONSE", "lr_reponse");
			$t->set_block("numerotation_dossiers", "BLOCK_LIGNE", "block_ligne");
			
			$t->set_block("numerotation_dossiers", "COLUMN_POSITION", "column_position");
			
			$t->set_var("POS_NUM_DOC", $_REQUEST["POS_NUM_DOC"]);
			$t->set_var("POS_TYPEDOC", $_REQUEST["POS_TYPEDOC"]);
			$t->set_var("POS_ACTION_HERMES", $_REQUEST["POS_ACTION_HERMES"]);

			$t->set_var("TITRE_PAGE", "Numérotation des déliberations");
			$t->set_var("URL_CONSULTER_INDEX", URL_CONSULTER_INDEX);
			
			
			
			$t->set_var("URL_ACTION", URL_NUMEROTER);	
			
			// Affichage Entete (liste résumée corresponadnte) 
			$retour = pos_gestplr($jeton, "$szProfilLR", /*pref*/$objLR, /*pref*/$tabZoneLR);			
			$tabAlignCol = array();
			
			
			$tabKeyName = array();
			$sep = ",";
			$cpt = 2;	
				
			//$retour = pos_getinforubintype($jeton, $_REQUEST['POS_TYPEDOC'], "", 999, /*pref*/$tabRubInType);
			$retour = pos_getinfoallrub($jeton, 999, /*pref*/$tabInfoRub);
			if (!$retour)
				debug($jeton);		
	
			for ($i=0;$i<count($tabZoneLR);$i++) 
		  	{
		        $t->set_var("COLUMN_NAME", $tabZoneLR[$i]->zone_titre_col);
		        $t->set_var("COLUMN_WIDTH", $tabZoneLR[$i]->zone_largeur_col);
		        $t->set_var("KEY_NAME", $cpt);
		        $tabKeyName[$i] = $cpt;
		   		
				$szFormat = "formatter:YAHOO.widget.DataTable.formatText";
				$szSortable = "true";
				// parcourt de toutes les rubriques du type
			    for($j=0;$j<count($tabInfoRub);$j++)
			    {
					if(strcmp($tabZoneLR[$i]->zone_code_rub_ref, $tabInfoRub[$j]->code) == 0)
					{
						//date
						if($tabInfoRub[$j]->typerub == 2)
						{
							$szFormat = "dateOptions:\"DD/MM/YYYY\",formatter:YAHOO.widget.DataTable.formatDate";
							//$t->set_var("seb", ",parser:YAHOO.util.DataSource.parseDate");
							$szSortable = "false";
						}
						// numérique ou decimale
						elseif($tabInfoRub[$j]->typerub == 1 || $tabInfoRub[$j]->typerub == 4)
							$szFormat = "formatter:YAHOO.widget.DataTable.formatNumber";
					}
				}
				// GG : desactivation tri
				$szSortable = "false";
				
				$t->set_var("COLUMN_FORMAT", $szFormat);
				$t->set_var("COLUMN_SORTABLE", $szSortable);
				
				if( $i == count($tabZoneLR) -1)
					$sep = "";
				$t->set_var("SEPARATEUR_COLUMN", $sep);	
						
				$t->parse("columns_def", "COLUMNS_DEF", true);
				$t->parse("fields_def", "FIELDS_DEF", true);
				$cpt++;
			}
			
				
			$sep_row = ","; 
			for($i=0;$i<$iNombreReponse;$i++) {
			
				$tabChamps = "";
				$iNumDoc = $tabREP_LR[$i]->numdoc;
				
				$objet_dossier=$tabREP_LR[$i]->lr;
				
				// toutes les autres colonnes
				$tabChamps = extraireChampsLR($tabREP_LR[$i]->lr, "\x02");
				
				$sep_field = ",";
				for ($j = 0; $j<count($tabChamps); $j++)
				{
		        	$t->set_var("KEY_NAME2", $tabKeyName[$j]);
					$t->set_var("ZONE_LR", $tabChamps[$j]);
					$t->set_var("ZONE_LR", addslashes($tabChamps[$j]));
					//$t->set_var("ZONE_LR", urlencode(htmlspecialchars_currentcharset($tabChamps[$j])));
		        	if( $j == count($tabChamps) -1)
					$sep_field = "";
					$t->set_var("SEPARATEUR_FIELD", $sep_field);	
		        	$t->parse("lr_reponse", "LR_REPONSE", true);
				}
				$t->set_var("POS_NUM_DOC_DOSSIER", $iNumDoc);
				$position = $i + 1;
				$t->set_var("POSITION", $position);
				if( $i == $iNombreReponse -1)
					$sep_row = "";
				$t->set_var("SEPARATEUR_ROW", $sep_row);
				$t->parse("block_ligne", "BLOCK_LIGNE", true);				
				$t->set_var("lr_reponse", "");
				$t->parse("column_position", "COLUMN_POSITION", true);					
			}
			
 
		  $t->pparse("MyOutput", "numerotation_dossiers");
		}
		else
			debug($jeton);
	}
	else
	{
		debug ($jeton);	
	}
	pos_disconnect($jeton);
}

?>
