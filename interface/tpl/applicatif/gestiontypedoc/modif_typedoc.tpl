<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
	<TITLE>{TITRE_PAGE}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/gestionbib.css">
	
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/assets/dpSyntaxHighlighter.css">
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/button/assets/skins/sam/button.css" />
	
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/datatable/assets/skins/sam/datatable.css" />
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/yuiloader/yuiloader-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/dom/dom-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/event/event-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/dragdrop/dragdrop-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/element/element-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/datasource/datasource-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/datatable/datatable-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/button/button-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/json/json-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/fonctions_utils_typedoc.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/affichage_restriction_acces.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/affichage_rubintype.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/affichage_cle_hier.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/affichage_infos_dossier.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/rubintype_attributs.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/ajax_typedoc.js"></script>
	<script language="javascript" SRC="../../../../include/script/gestiontypedoc/rub_datatables.js"></SCRIPT>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/gestiontypedoc/cle_hier_datatable.js"></script>
	<script language="javascript" SRC="../../../../include/script/recupcontrolsaisie.js"></SCRIPT>
	<script language="javascript" SRC="../../../../include/script/navigation.js"></SCRIPT>
	<script language="javascript" SRC="../../../../include/script/vocabulaire.js"></SCRIPT>
	<base target="_self">
	<style type="text/css">
	.yui-skin-sam .yui-dt-liner { white-space:nowrap;} 
	.yui-skin-sam td.align-center	{ text-align:center;}
    </style>
	<script>
	
// VARIABLES GOBALES GESTION DES RUBRIQUES 
//  datatable des rubriques disponibles pour la gestion des rubriques	
	// mettre la taille en dur sinon le réaffichage est trop long
	// de plus le repositionnement ne fonctionne pas si display none au chargement
 	var myColumnDefstmp = [
 		<!-- BEGIN COLUMNS_DEF -->  
 				{label:"{COLUMN_NAME}", key:"{KEY_NAME}",{COLUMN_FORMAT}, width:{COLUMN_WIDTH}, sortable:false, resizeable:true, hidden: {HIDDEN}, className:"{CLASS_NAME}"}{SEPARATEUR_COLUMN}
 		<!-- END COLUMNS_DEF -->  
 		];
     
	var myDatatmp = [ 	   
	<!-- BEGIN BLOCK_LIGNE -->
			{<!-- BEGIN LR_REPONSE -->{KEY_NAME2}:"{ZONE_LR}"{SEPARATEUR_FIELD}<!-- END LR_REPONSE -->}{SEPARATEUR_ROW}
	<!-- END BLOCK_LIGNE -->
	    ];   
	      
//  datatable des rubriques du type de documents pour la gestion des rubriques   
	// mettre la taille en dur sinon le réaffichage est trop long
	// de plus le repositionnement ne fonctionne pas si display none au chargement
 	var myColumnDefstmp2 = [
		<!-- BEGIN COLUMNS_DEF2 -->  
 				{width:{COLUMN_WIDTH2}, key:"{KEY_NAME21}",{COLUMN_FORMAT2}, sortable:{COLUMN_SORTABLE2}, resizeable:true, label:"{COLUMN_NAME2}", hidden: {HIDDEN2}, className:"{CLASS_NAME2}"}{SEPARATEUR_COLUMN2}
 		<!-- END COLUMNS_DEF2 -->  
 		];
 		
   	var myDatatmp2 = [ 	   
	<!-- BEGIN BLOCK_LIGNE2 -->
			{
		<!-- BEGIN LR_REPONSE2 -->{KEY_NAME22}:"{ZONE_LR2}"{SEPARATEUR_FIELD2}<!-- END LR_REPONSE2 -->
	}{SEPARATEUR_ROW2}
	<!-- END BLOCK_LIGNE2 -->
	    ];  
	    
	var myColumnDefstmp3 = new Array();    
	var myDatatmp3 = new Array();
		
//  datatable des rubriques du type cible pour la gestion des associations	
// utilise myColumnDefstmp3 	
	var myDatatmp4 = new Array();

	var myColumnDefstmp5 = [		  
					{label:"{LIBELLE_CODE_TYPEDOC}", key:"code_rub",formatter:YAHOO.widget.DataTable.formatText, width:50, sortable:false, resizeable:true},		  
					{label:"{LIBELLE_LIBELLE_TYPEDOC}", key:"libelle_rub",formatter:YAHOO.widget.DataTable.formatText, width:200, sortable:false, resizeable:true},
					{label:"{LIBELLE_CODE_TYPEDOC_CIBLE}", key:"code_rub_cible",formatter:YAHOO.widget.DataTable.formatText, width:50, sortable:false, resizeable:true},	  
					{label:"{LIBELLE_LIBELLE_TYPEDOC_CIBLE}", key:"libelle_rub_cible",formatter:YAHOO.widget.DataTable.formatText, width:200, sortable:false, resizeable:true}		  
			]; 
	
	var myDatatmp5 = new Array();	
		
	// tableau des rubriques à ajouter/actualiser à la soumission du formulaire
	// donc modification du côté serveur
	var tabRubriquesModifiees = new Object();
	// tableau des rubriques ajouter par l'interface
	// si elles sont effacées par la suite de la même manière
	//  il n' y aura pas de modification côté serveur
	var tabRubriquesAjoutees = new Array ();
	// tableau des association initiliale
	// initialisée suite à la requête Ajax
	var tabAssociationsRubCourant = new Array();
	
	// tableau associatif des listes hiérarchiqies
	// cle : code liste, valeur : tableau des rubriques corresponadantes
	var tabRubListeHier = new Array();
	
	// tableau des rubriques à supprimer à la soumission du formulaire
	var tabRubriquesSupprimees = new Array();
	
	// mode d'ouverture du div "Ajout_rub" de paramétrage de rubrique
	// szModeParamRub = "mode_ajout_rub" pour l'ajout de la rubrique au type de document
	// szModeParamRub = "mode_modification_rub" pour la modification de la rubrique déjà dans le type de document
	// la valeur est modifiée dans rub_datatable.js (gestion de la datattable2)
	var szModeParamRub;
	
	// !! Code et libelle de la rubrique ajoutée/modifiée !!
	// initialisée dans rub_database.js
	var szCodeRubCourant;
	var szLibelleRubCourant;
	var szTypeRubCourant;
	var szMonoRubCourant;
	var szDomFermeRubCourant;
	
///// VARIABLES GOBALES GESTION DE LA CLE HIERARCHIQUE /////
	// clés hiérarchiques
	var myColumnDefstmp6 = [
					{label:"{LIBELLE_NUMERO_ZONE_KH}", key:"num_zone_kh",formatter:YAHOO.widget.DataTable.formatText, width:45, sortable:false, resizeable:true},		  
					{label:"{LIBELLE_LIBELLE_ZONE_KH}", key:"libelle_zone_kh",formatter:YAHOO.widget.DataTable.formatText, width:170, sortable:false, resizeable:true},
					{label:"{LIBELLE_LONGUEUR_KH}", key:"longueur_kh",formatter:YAHOO.widget.DataTable.formatText, width:35, sortable:false, resizeable:true},	  
					{label:"{LIBELLE_OBLIGATOIRE_KH}", key:"oblig_kh",formatter:YAHOO.widget.DataTable.formatText, width:35, sortable:false, resizeable:true},
					{label:"{LIBELLE_RUB_LIEN_KH}", key:"rub_lien_kh",formatter:YAHOO.widget.DataTable.formatText, width:140, sortable:false, resizeable:true},
					{label:"{LIBELLE_DEBUT_LIEN_KH}", key:"deb_lien_kh",formatter:YAHOO.widget.DataTable.formatText, width:35, sortable:false, resizeable:true},
					//{label:"{LIBELLE_ZONE_EXCLU_KH}", key:"zone_exclu_kh",formatter:YAHOO.widget.DataTable.formatText, width:10, sortable:false, resizeable:true},
					{label:"{LIBELLE_COMPTEUR_KH}", key:"compteur_kh",formatter:YAHOO.widget.DataTable.formatText, width:35, sortable:false, resizeable:true},
					{label:"{LIBELLE_RUPTURE_COURT_KH}", key:"rupture_kh",formatter:YAHOO.widget.DataTable.formatText, width:35, sortable:false, resizeable:true}	  
			]; 
	var myDatatmp6 = new Array();

	// tableau des clés hiérarchiques
	var tabCleHier = new Array();
	//tabCleHier[0] : valeur de wHierarchie
	//tabCleHier[1] : valeur de wHierNbZone
	//tabCleHier[1] : objet stKeyHier
	// mode d'ouverture du bloc "bloc_zone_cle_hier" de paramétrage de zone clé hiérarchique
	// szModeParamZone = "mode_ajout_zone" pour l'ajout 
	// szModeParamZone = "mode_modification_zone" pour la modification d
	// la valeur est modifiée dans cle_hier_datatable.js (gestion de la datattable6)
	var szModeParamZone;
	
///// FONCTIONS DE CONTROLE TYPE DE DOCUMENT GENERAL/////

	var tabNomTousTypeDoc = new Array();
	
	<!-- BEGIN BLOC_TOUS_TYPEDOC -->
		
	tabNomTousTypeDoc[{CPT_CODE_TYPEDOC}] = "{CODE_DOC_CONTROLE}";
		
	<!-- END BLOC_TOUS_TYPEDOC -->
	

	function verifFormCodeTypeDoc(obj)
	{ 
		var szCodeTypeDoc= obj.value;
		var exp=new RegExp("^[A-Z0-9_-]*$","g");
		if (exp.test(szCodeTypeDoc) == false)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_CODE.value);
			obj.focus();
			return false;
		}
		else
			return true;
	}
	
	function verifFormLibelleTypeDoc(obj)
	{ 
 		var szLibelleTypeDoc = obj.value;
 		var exp=new RegExp("^[\\\sa-zA-Z0-9àâçèéêîôùûÀÂÇÈÉÊÎÔÙÛ\\-_'/\\.\\(\\)\\[\\]]*$","g");
  		if (exp.test(szLibelleTypeDoc) == false)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_LIBELLE.value);
			obj.focus();
			return false;
		}
		else
			
			return true;		
	}
	//ouverture des div popup
	
	function ouvrirPopUp(id)
	{
		if(document.getElementById('bloc_v2').style.display!='none')
			afficheMasqueBloc('v2');	
		document.getElementById(id).style.display='';	
	}
	
///// ENVOI DU FORMULAIRE ////
	function tabsToJSON() 
	{		
		var objRubAjoutText;		
        YAHOO.lang.JSON.useNativeStringify = false;		
		objRubAjoutText = YAHOO.lang.JSON.stringify(tabRubriquesModifiees);
        objRubAjoutText = objRubAjoutText.replace(/\\/g, '\\\\').replace(/\n/g, '\\n');
		document.principal.POS_TABRUB_AJOUT_JSON_STRING.value = objRubAjoutText;
		var objRubSuppText;	
		objRubSuppText = YAHOO.lang.JSON.stringify(tabRubriquesSupprimees);
		document.principal.POS_TABRUB_SUPP_JSON_STRING.value = objRubSuppText;
		var objRubTmpText;	
		objRubTmpText = YAHOO.lang.JSON.stringify(tabRubriquesAjoutees);
		document.principal.POS_TABRUB_TMP_JSON_STRING.value = objRubTmpText;
		var objCleHierText;	
		objCleHierText = YAHOO.lang.JSON.stringify(tabCleHier);
		document.principal.POS_CLEHIER_JSON_STRING.value = objCleHierText;
	}
	
	function lancerFormulaire()
	{
	 	with(document.principal)
		{ 
			if ((POS_CODE_TYPEDOC.value.length) == 0) 
			{
				alert("{MESSAGE_CODE_TYPEDOC_OBLIGATOIRE}");
				return false;
			}
			else if ((POS_LIBELLE_TYPEDOC.value.length) == 0) 
			{
				alert("{MESSAGE_LIBELLE_TYPEDOC_OBLIGATOIRE}");
				return false;
			}
			else if (document.getElementById('nb_rubindoc').innerHTML.length == 0
					|| document.getElementById('nb_rubindoc').innerHTML == 0 )
			{
				alert("{MESSAGE_NB_RUBRIQUE_OBLIGATOIRE}");
				return false;			
			}		
			else if (verifFormCodeTypeDoc(POS_CODE_TYPEDOC) && verifFormLibelleTypeDoc(POS_LIBELLE_TYPEDOC))
			{ 				
				for(var i=0; i<tabNomTousTypeDoc.length; i++)
				{
					if(POS_CODE_TYPEDOC.value == tabNomTousTypeDoc[i])
					{
						alert("{MESSAGE_CODE_TYPEDOC_EXISTANT}");
						return false;
					}					
				}
				// Les infos de clé hiérarchiques sont récuépés par requêtes Ajax
				// au moment de l'ouverture de l'interface de paramétrage correspondante
				// Si elle n'a pas été ouverte, il faut aller chercher ces infos
				if(typeof(tabCleHier[0]) == 'undefined' && POS_KH.checked == true)
					RecupCleHier(POS_CODE_TYPEDOC.value);
				// traitement des différents tableaux en string JSON		
				tabsToJSON();
				
				return true;
			}
			else 
				return false;
		}
	} 
     	
	function initEcran()
    {
        if (document.principal.MODE.value == "CREATION")
        {
	       document.principal.POS_CODE_TYPEDOC.focus();
        }
        copyRestrictionAccesFromFormToJSON();
        copyInfoDossierFromFormToJSON();
    }
</script>
</HEAD>

<BODY topmargin="2" leftmargin="10" class="yui-skin-sam" onLoad="initEcran();">
<FORM NAME=principal ACTION="{URL_ATTENTE}" method="POST" onSubmit="return lancerFormulaire();">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="{CODE_ACTION}">
<INPUT TYPE=HIDDEN NAME="POS_TYPE_DOC" VALUE="">
<INPUT TYPE=HIDDEN NAME="MODE" VALUE="{MODE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_CONSULTATION_INDEX_RUB_VIDE" VALUE="{MESSAGE_CONSULTATION_INDEX_RUB_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_MODIFICATION_INDEX_RUB_VIDE" VALUE="{MESSAGE_MODIFICATION_INDEX_RUB_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_MODIFICATION_FICHIER_RUB_VIDE" VALUE="{MESSAGE_MODIFICATION_FICHIER_RUB_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_SUPPRESSION_INDEX_RUB_VIDE" VALUE="{MESSAGE_SUPPRESSION_INDEX_RUB_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_SUPPRESSION_FICHIER_RUB_VIDE" VALUE="{MESSAGE_SUPPRESSION_FICHIER_RUB_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_AJOUT_FILS_RUB_VIDE" VALUE="{MESSAGE_AJOUT_FILS_RUB_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_SUPPRESSION_FILS_RUB_VIDE" VALUE="{MESSAGE_SUPPRESSION_FILS_RUB_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_HABILITATION_VIDE" VALUE="{MESSAGE_HABILITATION_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_CODE_RUB_IDENTIQUE" VALUE="{MESSAGE_CODE_RUB_IDENTIQUE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_TYPE_LIE_VIDE" VALUE="{MESSAGE_TYPE_LIE_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_CODE_RUB_ASSOCIEE" VALUE="{MESSAGE_CODE_RUB_ASSOCIEE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_PARAM_ASSO_INCOMPLET" VALUE="{MESSAGE_PARAM_ASSO_INCOMPLET}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VAL_COMPTEUR_VIDE" VALUE="{MESSAGE_VAL_COMPTEUR_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VAL_COMPTEUR_INI_VIDE" VALUE="{MESSAGE_VAL_COMPTEUR_INI_VIDE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_SELECTIONNER_ZONE_KH" VALUE="{MESSAGE_SELECTIONNER_ZONE_KH}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_LIBELLE_ZONE_KH" VALUE="{MESSAGE_VERIF_LIBELLE_ZONE_KH}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_LONGUEUR_ZONE_KH" VALUE="{MESSAGE_VERIF_LONGUEUR_ZONE_KH}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_DEBUT_LIEN_ZONE_KH" VALUE="{MESSAGE_VERIF_DEBUT_LIEN_ZONE_KH}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_RUB_LIE_VIDE_ZONE_KH" VALUE="{MESSAGE_RUB_LIE_VIDE_ZONE_KH}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_ZONE_RUPTURE_VIDE_ZONE_KH" VALUE="{MESSAGE_ZONE_RUPTURE_VIDE_ZONE_KH}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_RUB_INVALIDE_INFOS_DOSSIER" VALUE="{MESSAGE_RUB_INVALIDE_INFOS_DOSSIER}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_CODE" VALUE="{MESSAGE_VERIF_FORME_CODE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_LIBELLE" VALUE="{MESSAGE_VERIF_FORME_LIBELLE}">
<INPUT TYPE=HIDDEN NAME="LIBELLE_FIN_DE_LISTE_ZONE_KH" VALUE="{LIBELLE_FIN_DE_LISTE_ZONE_KH}">
<INPUT TYPE=HIDDEN NAME="LIBELLE_RUB_CLEHIER" VALUE="{LIBELLE_RUB_CLEHIER}">
<INPUT TYPE=HIDDEN NAME="CODE_RUB_CLEHIER" VALUE="{CODE_RUB_CLEHIER}">
<INPUT TYPE=HIDDEN NAME="POS_THESAURUS_TYPEDOC" VALUE="{THESAURUS_TYPEDOC}">
<INPUT TYPE=HIDDEN NAME="POS_TABRUB_AJOUT_JSON_STRING" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_TABRUB_SUPP_JSON_STRING" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_TABRUB_TMP_JSON_STRING" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_CLEHIER_JSON_STRING" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_RESTACCES_JSON_STRING" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_INFOSDOSSIER_JSON_STRING" VALUE="">
<h1 align = "center">{TITRE_PAGE} </h1>
<table role='presentation' WIDTH="100%">
<tr>
	<td valign='top' align='center'>
		<table role='presentation' cellpadding="1" cellspacing="1" width="920px">								
		<tr>
			<td align="left">
			<div class='groupe'>
			<p class='groupe'>
				<span class="groupe">{LIBELLE_BLOC_GENERAL_TYPEDOC} <a onClick="afficheMasqueBloc('v1')"><img id="img_v1" src="../../../../images/icons/moins1.gif" class="iconbloc"></a></span>
            </p>
				<table role='presentation' id="bloc_v1" cellpadding="5" cellspacing="5" width="920px">	
    				<!-- début table paramétrage générale -->	
    				<tr>
    					<td>
    						<table role='presentation'>																	
    						<tr>
    							<td class="labelChamp">{LIBELLE_CODE_TYPEDOC} </td>
    							<td NOWRAP>
    								<INPUT class="{CLASS_CODE_TYPEDOC}" {READONLY_CODE_TYPEDOC} NAME="POS_CODE_TYPEDOC"  SIZE="3" VALUE="{CODE_TYPEDOC}" MAXLENGTH=3 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormCodeTypeDoc(this);">
    							</td>
    												
    							<td class="labelChamp">{LIBELLE_LIBELLE_TYPEDOC} </td>
    							<td NOWRAP>
    								<INPUT class="inputChamp" NAME="POS_LIBELLE_TYPEDOC" SIZE="30" VALUE="{LIBELLE_TYPEDOC}" MAXLENGTH=47 onChange="javascript:verifFormLibelleTypeDoc(this);">
    							</td>
    							
    						</tr>
    						</table>
    					</td>
    				</tr>
				    <tr>
					<td>
						<table role='presentation' cellspacing="3">																	
							<tr>																						
								<td class="normalleftalign">
								    <input type="checkbox" {CHECKED_INV_RECH} name="POS_INV_RECH" value="1">{LIBELLE_INV_RECH}
								</td>
								<td class="normalleftalign">
									<input type="checkbox" disabled {CHECKED_GEST_SPOOL} name="POS_GEST_SPOOL" value="1">{LIBELLE_GEST_SPOOL}
								</td>
                                <td class="normalleftalign">
                                    <input type="checkbox" disabled {CHECKED_GEST_VERSIONS} name="POS_GEST_VERSIONS" value="1">{LIBELLE_GEST_VERSIONS}													
								</td>
							</tr>
							<tr>
								<td class="normalleftalign">
									<input type="checkbox" {CHECKED_INDEX_AUTO_FIC} name="POS_INDEX_AUTO_FIC" value="1">{LIBELLE_INDEX_AUTO_FIC}
								</td>
								<td class="normalleftalign">
									<input type="checkbox" {CHECKED_FICHE_PARAM}  name="POS_FICHE_PARAM" value="1">{LIBELLE_FICHE_PARAM}
								</td>
								<td class="tdnormal" align='center'>
                                    {LIBELLE_INF_DOSSIERS}													
									<a href="javascript:void(0)"  onclick="afficheDivInfosDossier();">
									<IMG border=0 src="/{NOM_APPLICATION}/images/icons/fleche_simple_droite.gif"></a>
								</td>	
							</tr>
							<tr>
								<td class="normalleftalign">
								    <input type="checkbox" {CHECKED_FICHIERS_FULLTEXT} name="POS_CHECK_FICHIERS_FULLTEXT" value="1" >{LIBELLE_FICHIERS_FULLTEXT}
								</td>
								<td class="normalleftalign">
								    <input type="checkbox" {CHECKED_KH} name="POS_KH" value="1" onClick="javascript:GererCheckCleHier(this)">{LIBELLE_TYPEDOC_KH}
								    <a href="javascript:void(0)"  id="button_cle_hier" onclick="afficherPopUpCleHier();">
									<IMG border=0 src="/{NOM_APPLICATION}/images/icons/fleche_simple_droite.gif"></a>
									<input type="checkbox" {CHECKED_KH_MULTI} {DISABLED_KH_MULTI} name="POS_KH_MULTI" value="1">{LIBELLE_KH_MULTI}
								</td>
								<td class="tdnormal" align='center'>
								    {LIBELLE_RESTRIC_ACCES}
									<a href="javascript:void(0)"  onclick="afficheDivRestrictionAcces();">
									<IMG border=0 src="/{NOM_APPLICATION}/images/icons/fleche_simple_droite.gif"></a>
								</td>
							</tr>
							<tr>										
								<td class="normalleftalign">
								    <input type="checkbox" {CHECKED_SOUS_FICHIERS_FULLTEXT} name="POS_CHECK_SOUS_FICHIERS_FULLTEXT" value="1">{LIBELLE_SOUS_FICHIERS_FULLTEXT}
								</td>
							     <td class="normalleftalign">
								    <input type="checkbox" {CHECKED_XML} name="POS_XML" value="1">{LIBELLE_XML}
								</td>
							</tr>
                            <tr>										
								<td class="normalleftalign">
								    <input type="checkbox" {CHECKED_DERNIER_FICHIER_FULLTEXT} name="POS_CHECK_DERNIER_FICHIER_FULLTEXT" value="1">{LIBELLE_DERNIER_FICHIER_FULLTEXT}
								</td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td>
						<table role='presentation' class='groupe' style='border: 1px solid gray;' cellspacing=0 cellpadding=0>													
							<tr>
								<td valign="top">
									<table role='presentation'>
										<tr>
											<th>{LIBELLE_ARCHIVAGE} </th>
										</tr>
										<tr>										
											<td class="normalleftalign">
												<input type="radio" name="POS_CHOIX_ARCHIVAGE" value="1" {CHECKED_AUCUN_ARCHIVAGE}>{LIBELLE_AUCUN_ARCHIVAGE}
											</td>
											<td class="normalleftalign">
												<input type="radio" name="POS_CHOIX_ARCHIVAGE" value="2" {CHECKED_FICHIERS_ARCHIVAGE}>{LIBELLE_FICHIERS_ARCHIVAGE}
											</td>
											<td class="normalleftalign">
												<input type="radio" name="POS_CHOIX_ARCHIVAGE" value="3" {CHECKED_FICHIERS_INDEX_ARCHIVAGE}>{LIBELLE_INDEX_ARCHIVAGE}
											</td>
											<td>&nbsp;&nbsp;</td>
											<td class="labelChamp" valign="bottom">{LIBELLE_RETENTION_DM} </td>
											<td NOWRAP>
												<INPUT class="inputChamp" NAME="POS_RETENTION_DM" SIZE="5" VALUE="{RETENTION_DM}" MAXLENGTH=5>
											</td>
											<td class="labelChamp" valign="bottom" >{LIBELLE_JOURS} </td>
										</tr>
									</table>
								</td>
							</tr>																			
						</table>
					</td>
				</tr>
								
			</table>
				    </div>
			         </td>
			</tr>
			<!-- Fin table paramétrage générale -->		
			<!-- Début table pour l'ajout des rubriques -->	
			<tr>
				<td align="left">
					<div class='groupe'>
					<p class='groupe'>
					<span class="groupe">{LIBELLE_BLOC_AJOUT_RUBRIQUES_TYPEDOC} <a onClick="afficheMasqueBloc('v2')"><img id="img_v2" src="../../../../images/icons/plus1.gif" class="iconbloc"></a></span></p>
					<table role='presentation' id="bloc_v2" style="display: none;" width="920px">								
					<tr>
						<td align="center">
							<table role='presentation'>
								<tr>
									<th style="text-align: left;text-decoration:underline;">{LIBELLE_RUBRIQUES_DISPONIBLES} </th>
								</tr>																															
								<tr>
								    <td class="tdfond">
										<div id="table-rubdipos">
										</div>																			
									</td>
								</tr>																
							</table>	
						</td>
					</tr>
    				<tr>
    					<td align="center">
    					   <input type="button" class="bouton" value="{LIBELLE_AJOUTER_RUBRIQUE}" onClick="javascript:AjoutRubFn();">
    					</td>
    				</tr>
    				<tr>
    					<td align="center">
		                      <table role='presentation'>
								<tr>
									<th style="text-align: left;text-decoration:underline;">{LIBELLE_RUBRIQUES_DANS_TYPEDOC} <span id="nb_rubindoc">{NB_RUB_DANS_DOC} </span></th>
								</tr>
								<tr>
    								<td>
    								    <div id="table-rubdanstype">
    								</div>
    								</td>															
								</tr>
							</table>
    					</td>
    				</tr>
    				<tr>
    					<td align="center">
    					   <input type="button" class="bouton" value="{LIBELLE_SUPPRIMER_RUBRIQUE}" onClick="javascript:SupprimeRubFn();">
    					</td>
    				</tr>
			     </table>
			</div>
			</td>
			</tr>
			<!-- fin table pour l'ajout des rubriques -->			
									
		</TABLE>
		</td>
	</tr>
</TABLE>

<!-- ------------------------------------------------------- div infos_dossier -------------------------------------------------------------------------------- -->
<div style="display: none; position: absolute; left: 0; top: 0; width: 600px; height: 600px; border: 1px solid #000000;background: #ffffff;"  id="infos_dossier">
<table role='presentation' width="100%">
    <tr style="background: #86B6E3">
        <td align="left" style="color: #FFFFFF; font-weight: bold;">{LIBELLE_PARAM_DOSSIERS}
        </td>
    </tr>
    <tr>
		<td><br/></td>
	</tr>
	<tr>
		<td>
			<div class='groupe'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_TYPE_DOSSIER} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both" width="100%">
	
					<tr>										
						<td class="normalleftalign">
							<input type="checkbox" {CHECKED_TYPE_DOSSIER} name="POS_CHECK_TYPE_DOSSIER" value="1" onClick="javascript:GererControleInfosDossier();">{LIBELLE_TYPE_DOSSIER}
						</td>
					</tr>
					<tr>
						<td class="labelChamp">
							{LIBELLE_RUB_TITRE_DOSSIER}																
						</td>
						<td>
							<SELECT id="id_rub_titre_dossier" NAME="POS_RUB_TITRE_DOSSIER"  SIZE="1">																												
								<OPTION VALUE=""></OPTION>
								<OPTION VALUE="{CODE_RUB_TITRE_DOSSIER}" selected>{CODE_RUB_TITRE_DOSSIER} </OPTION>
							</SELECT>
						</td>
					</tr>
					<tr>
						<td class="normalleftalign">
							<input type="checkbox" {DISABLED_DOSSIER_REF} {CHECKED_DOSSIER_REF} name="POS_CHECK_DOSSIER_REF" value="1">{LIBELLE_DOSSIER_REF}
						</td>
					</tr>
				</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class='groupe' style='margin:1em 1em 1em 1em'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_INSERTION_AUTO_DOSSIER} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both" width="100%">
			<tr>
				<td align="center">
					<table role='presentation' width="45%">
					<tr>										
						<td class="normalleftalign">
							<input type="checkbox" {CHECKED_INSERTION_AUTO} name="POS_CHECK_INSERTION_AUTO" value="1" onClick="javascript:GererControleInfosDossier();">{LIBELLE_INSERTION_AUTO_DOSSIER}
						</td>
					</tr>
					<tr>
						<td>
							<table role='presentation' width="100%" style="border: 1px solid gray;" cellpadding="5">
							<thead>
								<tr>
									<td class="labelChamp" style="border-bottom: 1px solid gray;" colspan="2">
										{LIBELLE_TYPE_FILS_EN_COURS}																
									</td>									
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="labelChamp">
										{LIBELLE_RUB_CODE_TYPE_PERE}																
									</td>	
									<td>
										<SELECT id="id_rub_code_type_pere" NAME="POS_RUB_CODE_TYPE_PERE"  SIZE="1">																												
											<OPTION VALUE=""></OPTION>										
											<OPTION VALUE="{CODE_RUB_CODE_TYPE_PERE}" selected>{CODE_RUB_CODE_TYPE_PERE} </OPTION>
										</SELECT>
									</td>															
								</tr>
								<tr>
									<td class="labelChamp">
										{LIBELLE_RUB_VAL_SELECTION}
									</td>
									<td>
										<SELECT id="id_rub_val_selection_fils" NAME="POS_RUB_VAL_SELECTION_FILS"  SIZE="1">																												
											<OPTION VALUE=""></OPTION>
											<OPTION VALUE="{CODE_RUB_VAL_SELECTION_FILS}" selected>{CODE_RUB_VAL_SELECTION_FILS} </OPTION>
										</SELECT>
									</td>															
								</tr>
								<tr>
									<td colspan="2" class="normalleftalign">
										<input type="checkbox" {DISABLED_SELECTION_CHAQUE_MOT} {CHECKED_SELECTION_CHAQUE_MOT} name="POS_CHECK_SELECTION_CHAQUE_MOT" value="1">{LIBELLE_SELECTION_CHAQUE_MOT}
									</td>															
								</tr>
							</tbody>														
							</table>
						</td>
					</tr>
					<tr>
						<td>
							<table role='presentation' width="100%" frame="border" rules="groups" style="border: 1px solid gray;" cellpadding="5">
								<thead>
								<tr>
									<td class="labelChamp" style="border-bottom: 1px solid gray;" colspan="2">
										{LIBELLE_DOSSIER_PERE}																
									</td>																															
								</tr>
								</thead>
								<tbody>
								<tr>
									<td class="labelChamp">
										{LIBELLE_RUB_VAL_SELECTION}
									</td>
									<td>
										<SELECT id="id_rub_val_selection_pere" NAME="POS_RUB_VAL_SELECTION_PERE"  SIZE="1">																												
											<OPTION VALUE=""></OPTION>
											<OPTION VALUE="{CODE_RUB_VAL_SELECTION_PERE}" selected>{CODE_RUB_VAL_SELECTION_PERE} </OPTION>
										</SELECT>
									</td>															
								</tr>
								</tbody>													
							</table>
						</td>
					</tr>
					<tr>										
						<td class="normalleftalign">
							<input type="checkbox" {DISABLED_TEST_EXIST_PERE} {CHECKED_TEST_EXIST_PERE} name="POS_CHECK_TEST_EXIST_PERE" value="1">{LIBELLE_TEST_EXIST_PERE}
						</td>
					</tr>
					<tr>										
						<td class="normalleftalign">
							<input type="checkbox" {DISABLED_MAJ_INSERTION_DOSSIER} {CHECKED_MAJ_INSERTION_DOSSIER} name="POS_CHECK_MAJ_INSERTION_DOSSIER" value="1">{LIBELLE_MAJ_INSERTION_DOSSIER}
						</td>
					</tr>
				</table>
			</td>
		</tr>										
	</table>
	</div>
	</td>
    </tr>
    <tr>
		<td align="center">
			<INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_VALIDER}"  onclick="ValideInfosDossier();">
            <INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}"  onclick="AnnuleInfosDossier();">
		</td>
	</tr>		
</table>
</div>
<!-- ------------------------------------------------------- div cle_hier -------------------------------------------------------------------------------- -->
<div style="z-index: 99; display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%" id="cle_hier">
<table role='presentation' border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 100%; background: url('/{NOM_APPLICATION}/images/grille.gif');">
<tr>
<td align="center">
<div style="width: 750px; height: 550px; border: 1px solid #000000; background: #FFFFFF">
<table role='presentation' width="100%" style="border-collapse: collapse;">
		<tr style="background: #86B6E3;color: #FFFFFF; font-weight: bold;">
			<td align="left" NOWRAP>{LIBELLE_DEFINITION_KH} </td>						
		</tr>
		<tr>						
			<td>
				<div class='groupe' style='margin:1em 1em 1em 1em;'>											
				<table role='presentation' width="100%">
					<tr>										
						<td class="tdfond">																		
							<div id="table-typedoc-cle-hier">
							</div>																			
						</td>
					</tr>
					
					<tr id="bloc_zone_cle_hier" style="display:none; border: 1px solid #000000; background: #8abae3">
						<td>		
							<table role='presentation' width="100%">
								<tr>
									<td>{LIBELLE_LIBELLE_ZONE_KH} </td>
									<td colspan="2">
										<INPUT class="inputChamp" NAME="POS_LIBELLE_ZONE_KH" SIZE="12" MAXLENGTH ="11" VALUE="">
									</td>												
								</tr>
								<tr>
									<td>{LIBELLE_LONGUEUR_KH} </td>
									<td class="normalleftalign">
										<INPUT class="inputChamp" NAME="POS_LONGUEUR_KH" SIZE="5" MAXLENGTH ="3" VALUE="" onBlur="javascript:isANumber(this);javascript:verifLongueurLienZoneCleHier();">
									</td>
									<td>
										<input type="checkbox" name="POS_OBLIGATOIRE_KH" value="1" >{LIBELLE_OBLIGATOIRE_KH}
									</td>																							
								</tr>
								<tr>
									<td valign="top" colspan="3">
									<div class='groupe' style='margin:0.5em 1em 0.5em 1em'>
										<p class='groupe'>								 														 														 														
											<span class='groupe'>{LIBELLE_LIEN_KH} </span>													 													 													
										</p>
											<table role='presentation'>
												<tr>																	
													<td class="normalleftalign">
														<input type="checkbox" name="POS_CHECKED_LIEN_KH" value="1" onClick=javascript:GererCheckLienZoneCleHier(this);>{LIBELLE_LIEN_KH}
													</td>
												</tr>
												<tr>
													<td>{LIBELLE_RUB_LIEN_KH} </td>
													<td class="normalleftalign"> 
														<SELECT id="select_rub_lien_KH"  NAME="POS_RUB_LIEN_KH" SIZE="1">
														</SELECT>
													</td>
												</tr>
												<tr>
													<td>{LIBELLE_DEBUT_LIEN_KH} </td>
													<td class="normalleftalign">
														<INPUT class="inputChamp" NAME="POS_DEBUT_LIEN_KH" SIZE="5" MAXLENGTH ="3" VALUE="" onBlur="javascript:isANumber(this);javascript:verifDebutLienZoneCleHier(this);">
													</td>
												</tr>
											</table>	
									</div>
									</td>
									<td valign="top">
											<div class='groupe' style='margin:0.5em 1em 0.5em 1em'>
											<p class='groupe'>								 														 														 														
												<span class='groupe'>{LIBELLE_COMPTEUR_KH} </span>													 													 													
											</p>
											<table role='presentation' style="clear:both;">
												<tr>																	
													<td class="normalleftalign">
														<input type="checkbox" name="POS_CHECKED_CPT_KH" value="1" onClick="javascript:GererCheckCompteurZoneCleHier(this);">{LIBELLE_COMPTEUR_KH}
													</td>
												</tr>
												<tr>
													<td>{LIBELLE_RUPTURE_LONG_KH} </td>
													<td class="normalleftalign">
														<SELECT id="select_rupture_KH"  NAME="POS_RUPTURE_KH" SIZE="1">
														</SELECT>
													</td>																			
												</tr>
											</table>	
											</div>
										</td>
								</tr>
								<tr>
									<td align="center" colspan="4">
										<table role='presentation' width="100%">
											<tr>															
												<td align="right">
													<span id="ValideZoneButton" class="yui-button yui-push-button">
											        <span class="first-child">
											            <button type="button">{LIBELLE_VALIDER} </button>
											        </span>
											    	</span>
												</td>
												<td align="left">
													<span id="AnnuleZoneButton" class="yui-button yui-push-button">
											        <span class="first-child">
											            <button type="button">{LIBELLE_ANNULER} </button>
											        </span>
											    	</span>
												</td>
											</tr>
										</table>										
									</td>												
								</tr>
							</table>
							
						</td>
					</tr>
					<tr>
						<td align="left">
							<table role='presentation'>
								<tr>
									<td>
										{LIBELLE_SEPARATEUR_KH}
									</td>
									<td>
										<INPUT class="inputChamp" NAME="POS_SEPARATEUR_KH" SIZE="3" VALUE="{POS_SEPARATEUR_KH}">
									</td>
								</tr>
							</table>										
						</td>
					</tr>
					<tr>
						<td>
							<table role='presentation'>
								<tr>										
									<td>											
										 <span id="InsereZoneButton" class="yui-button yui-push-button">
								        <span class="first-child">
								            <button type="button" name="InsereZone">{LIBELLE_INSERER} </button>
								        </span>
								    	</span>
									</td>
									<td>
										 <span id="ModifieZoneButton" class="yui-button yui-push-button">
								        <span class="first-child">
								            <button type="button" name="ModifieZone">{LIBELLE_MODIFIER} </button>
								        </span>
								    	</span>
									</td>
									<td>
										 <span id="SupprimeZoneButton" class="yui-button yui-push-button">
								        <span class="first-child">
								            <button type="button" name="SupprimeZone">{LIBELLE_SUPPRIMER} </button>
								        </span>
								    	</span>
									</td>
								</tr>
							</table>											
							</td>																										
					</tr>
				</table>
				</div>
			</td>
		</tr>
		<tr>
			<td colspan="5">
				<table role='presentation' width="100%">
					<tr>
						<td align="right">
							 <span id="ValideCleHierButton" class="yui-button yui-push-button">
					        <span class="first-child">
					            <button type="button" name="ValideCleHier">{LIBELLE_VALIDER} </button>
					        </span>
					    	</span>
						</td>
						<td align="left">
							 <span id="AnnuleCleHierButton" class="yui-button yui-push-button">
					        <span class="first-child">
					            <button type="button" name="AnnuleCleHier">{LIBELLE_ANNULER} </button>
					        </span>
					    	</span>
						</td>
					</tr>
				</table>
			</td>
		</tr>
	</table>									
</div>
</td>
</tr>
</table>
</div>
<!-- ------------------------------------------------------- div rest_acces -------------------------------------------------------------------------------- -->
<div style="display: none; position: absolute; left: 0; top: 0; width: 950px; height: 750px; border: 1px solid #000000;background: #ffffff;" id="rest_acces">
<table role='presentation' width="100%">
	<tr style="background: #86B6E3">
		<td align="left" colspan='2' style="color: #FFFFFF; font-weight: bold;">{LIBELLE_RESTRIC_ACCES} </td>
	</tr>
    <tr>
		<td colspan='2'><br/></td>
	</tr>
	<tr>
		<td>
			<div class='groupe2'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_CONSULTATION_INDEX} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both;">
				<tr>										
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_CONSULT_INDEX" value="2" {CHECKED_POS_CTRL_CONSULT_INDEX_RUB} OnClick="javascript:GererControleRestAcces();">{LIBELLE_CONTROLE_RUBRIQUE}
					</td>
					<td>
						<SELECT class="inputChamp" id="id_rub_consult_index" NAME="POS_RUB_CONSULT_INDEX"  SIZE="1">
                            <!-- affichage d'une seule rubrique juste pour avoir la valeur, maj contenu du select en javascript -->
							<OPTION VALUE="{CODE_RUB_CONSULT_INDEX_RUB}">{CODE_RUB_CONSULT_INDEX_RUB} </OPTION>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_CONSULT_INDEX" value="0" {CHECKED_POS_CTRL_CONSULT_INDEX_AUCUN} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AUCUN_CONTROLE}
					</td>
				</tr>													
			</table>
			</div>
		</td>
		<td align="center" valign="middle">
			
		</td>									
	</tr>
	<tr>
		<td>
			<div class='groupe2'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_MODIFICATION_INDEX} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both;">
				<tr>										
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_MODIF_INDEX" value="2" {CHECKED_POS_CTRL_MODIF_INDEX_RUB} OnClick="javascript:GererControleRestAcces();">{LIBELLE_CONTROLE_RUBRIQUE}
					</td>
					<td>
						<SELECT class="inputChamp" id="id_rub_modif_index" NAME="POS_RUB_MODIF_INDEX"  SIZE="1">																												
							<!-- affichage d'une seule rubrique juste pour avoir la valeur, maj contenu du select en javascript -->
                            <OPTION VALUE="{CODE_RUB_MODIF_INDEX_RUB}">{CODE_RUB_MODIF_INDEX_RUB} </OPTION>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_MODIF_INDEX" value="0" {CHECKED_POS_CTRL_MODIF_INDEX_AUCUN} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AUCUN_CONTROLE}
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_MODIF_INDEX" value="1" {CHECKED_POS_CTRL_MODIF_INDEX_IMP} OnClick="javascript:GererControleRestAcces();">{LIBELLE_MODIF_IMPOSSSIBLE}
					</td>
				</tr>													
			</table>
			</div>
		</td>
		<td>
			<div class='groupe2'>
			<p class='groupe'>								 														 														 														
				<span class='groupe'>{LIBELLE_SUPPRESSION_INDEX} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both;">
			<tr>										
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_INDEX" value="2" {CHECKED_POS_CTRL_SUPP_INDEX_RUB} OnClick="javascript:GererControleRestAcces();">{LIBELLE_CONTROLE_RUBRIQUE}
				</td>
				<td>
					<SELECT class="inputChamp" id="id_rub_supp_index" NAME="POS_RUB_SUPP_INDEX"  SIZE="1">
						<!-- affichage d'une seule rubrique juste pour avoir la valeur, maj contenu du select en javascript -->
                        <OPTION VALUE="{CODE_RUB_SUPP_INDEX_RUB}">{CODE_RUB_SUPP_INDEX_RUB} </OPTION>
					</SELECT>
				</td>
			</tr>
			<tr>
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_INDEX" value="0" {CHECKED_POS_CTRL_SUPP_INDEX_AUCUN} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AUCUN_CONTROLE}
				</td>
			</tr>
			<tr>
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_INDEX" value="1" {CHECKED_POS_CTRL_SUPP_INDEX_IMP} OnClick="javascript:GererControleRestAcces();">{LIBELLE_SUPP_IMPOSSSIBLE}
				</td>
			</tr>													
			</table>
			</div>
		</td>										
	</tr>
	<tr>
		<td>
			<div class='groupe2'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_MODIFICATION_FICHIER} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both;">
				<tr>										
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_MODIF_FICHIER" value="2" {CHECKED_POS_CTRL_MODIF_FICHIER_RUB} OnClick="javascript:GererControleRestAcces();">{LIBELLE_CONTROLE_RUBRIQUE}
					</td>
					<td>
						<SELECT class="inputChamp" id="id_rub_modif_fichier" NAME="POS_RUB_MODIF_FICHIER"  SIZE="1">																												
						<!-- affichage d'une seule rubrique juste pour avoir la valeur, maj contenu du select en javascript -->
                        <OPTION VALUE="{CODE_RUB_MODIF_FICHIER_RUB}">{CODE_RUB_MODIF_FICHIER_RUB} </OPTION>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_MODIF_FICHIER" value="0" {CHECKED_POS_CTRL_MODIF_FICHIER_AUCUN} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AUCUN_CONTROLE}
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_MODIF_FICHIER" value=1" {CHECKED_POS_CTRL_MODIF_FICHIER_IMP} OnClick="javascript:GererControleRestAcces();">{LIBELLE_MODIF_IMPOSSSIBLE}
					</td>
				</tr>													
			</table>
			</div>
		</td>
		<td>
			<div class='groupe2'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_SUPPRESSION_FICHIER} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both;">
			<tr>										
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_FICHIER" value="2" {CHECKED_POS_CTRL_SUPP_FICHIER_RUB} OnClick="javascript:GererControleRestAcces();">{LIBELLE_CONTROLE_RUBRIQUE}
				</td>
				<td>
					<SELECT class="inputChamp" id="id_rub_supp_fichier" NAME="POS_RUB_SUPP_FICHIER"  SIZE="1">																												
						<!-- affichage d'une seule rubrique juste pour avoir la valeur, maj contenu du select en javascript -->
                        <OPTION VALUE="{CODE_RUB_SUPP_FICHIER_RUB}">{CODE_RUB_SUPP_FICHIER_RUB} </OPTION>
					</SELECT>
				</td>
			</tr>
			<tr>
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_FICHIER" value="0" {CHECKED_POS_CTRL_SUPP_FICHIER_AUCUN} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AUCUN_CONTROLE}
				</td>
			</tr>
			<tr>
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_FICHIER" value="1" {CHECKED_POS_CTRL_SUPP_FICHIER_IMP} OnClick="javascript:GererControleRestAcces();">{LIBELLE_SUPP_IMPOSSSIBLE}
				</td>
			</tr>													
			</table>
			</div>
		</td>
	</tr>
	<tr>
		<td>
			<div class='groupe2'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_AJOUT_FILS} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both;">
				<tr>										
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_AJOUT_FILS" value="2" {CHECKED_POS_CTRL_AJOUT_FILS_RUB} OnClick="javascript:GererControleRestAcces();">{LIBELLE_CONTROLE_RUBRIQUE}
					</td>
					<td>
						<SELECT class="inputChamp" id="id_rub_ajout_fils" NAME="POS_RUB_AJOUT_FILS"  SIZE="1">																												
							<!-- affichage d'une seule rubrique juste pour avoir la valeur, maj contenu du select en javascript -->
                            <OPTION VALUE="{CODE_RUB_AJOUT_FILS_RUB}">{CODE_RUB_AJOUT_FILS_RUB} </OPTION>
						</SELECT>
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_AJOUT_FILS" value="0" {CHECKED_POS_CTRL_AJOUT_FILS_AUCUN} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AUCUN_CONTROLE}
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_AJOUT_FILS" value=1" {CHECKED_POS_CTRL_AJOUT_FILS_IMP} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AJOUT_IMPOSSSIBLE}
					</td>
				</tr>													
			</table>
			</div>
		</td>
		<td>
			<div class='groupe2'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_SUPPRESSION_FILS} </span>													 													 													
			</p>
			<table role='presentation' style="clear:both;">
			<tr>										
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_FILS" value="2" {CHECKED_POS_CTRL_SUPP_FILS_RUB} OnClick="javascript:GererControleRestAcces();">{LIBELLE_CONTROLE_RUBRIQUE}
				</td>
				<td>
					<SELECT class="inputChamp" id="id_rub_supp_fils" NAME="POS_RUB_SUPP_FILS"  SIZE="1">																												
						<!-- affichage d'une seule rubrique juste pour avoir la valeur, maj contenu du select en javascript -->
                        <OPTION VALUE="{CODE_RUB_SUPP_FILS_RUB}">{CODE_RUB_SUPP_FILS_RUB} </OPTION>
					</SELECT>
				</td>
			</tr>
			<tr>
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_FILS" value="0" {CHECKED_POS_CTRL_SUPP_FILS_AUCUN} OnClick="javascript:GererControleRestAcces();">{LIBELLE_AUCUN_CONTROLE}
				</td>
			</tr>
			<tr>
				<td class="normalleftalign">
					<input type="radio" name="POS_CTRL_SUPP_FILS" value="1" {CHECKED_POS_CTRL_SUPP_FILS_IMP} OnClick="javascript:GererControleRestAcces();">{LIBELLE_SUPP_IMPOSSSIBLE}
				</td>
			</tr>													
			</table>
			</div>
		</td>
	</tr>
	<tr>
		<td colspan='2'>
			<div class='groupe2'>
			<p class='groupe' >								 														 														 														
				<span class='groupe'>{LIBELLE_RESTRICTION_QUESTION} </span>													 													 													
			</p>
			<table role='presentation' width="100%">
			<tr>
			<td align="left">
				<SELECT class="inputChamp" NAME="POS_RESTRICTION_QUESTION"  SIZE="1">																												
					<!-- BEGIN BLOC_RESTRICTION_QUESTION -->
						<OPTION VALUE="{QUESTION}" {SELECTED_QUESTION}>{QUESTION} </OPTION>
					<!-- END BLOC_RESTRICTION_QUESTION -->
				</SELECT>
			</td>
			</tr>													
			</table>
			</div>
		</td>																																																																			
	</tr>
	<tr>
		<td colspan=2>
			<div class='groupe2'>
			<p class='groupe'>								 														 														 														
				<span class='groupe'>{LIBELLE_CONFIDENTIALITE_TYPE} </span>													 													 													
			</p>
			<table role='presentation'>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_CONF_TYPE" value="0" {CHECKED_POS_CONF_TYPE_AUCUN} OnClick="javascript:GererConfType(this.value);">{LIBELLE_AUCUN_CONTROLE}
					</td>
					<td class="labelChamp">{LIBELLE_HAB_CONF_TYPE} </td>							
					<td>
						<SELECT class="{CLASS_CONF_TYPE}" {READONLY_CONF_TYPE} {DISABLED_SELECT_HAB_CONF_TYPE} NAME="POS_HAB_CONF_TYPE" id="POS_HAB_CONF_TYPE" SIZE="1">																												
							<!-- BEGIN BLOC_HAB_CONF_TYPE -->
							<OPTION VALUE="{HAB_CONF_TYPE_VALUE}" {SELECTED_HAB_CONF_TYPE}>{HAB_CONF_TYPE_LIBELLE} </OPTION>
							<!-- END BLOC_HAB_CONF_TYPE -->
						</SELECT>
					</td>
					<td class="labelChamp">{LIBELLE_NIV_CONF_TYPE} </td>
					<td NOWRAP>
						<INPUT class="{CLASS_CONF_TYPE}" {READONLY_CONF_TYPE} NAME="POS_NIV_CONF_TYPE" id="POS_NIV_CONF_TYPE" SIZE="10" VALUE="{NIV_CONF_TYPE}" MAXLENGTH=10 onChange="javascript:isANumber(this);">
					</td>												
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_CONF_TYPE" value="1" {CHECKED_POS_CTRL_CONF_TYPE_MODIF_PAR_UTIL} OnClick="javascript:GererConfType(this.value);">{LIBELLE_MODIF_PAR_UTIL}
					</td>
					<td class="labelChamp">{LIBELLE_CLOIS_CONF_TYPE} </td>
					<td align="left" NOWRAP>
						<INPUT class="{CLASS_CONF_TYPE}" {READONLY_CONF_TYPE} NAME="POS_CLOIS_CONF_TYPE" id="POS_CLOIS_CONF_TYPE" SIZE="10" VALUE="{CLOIS_CONF_TYPE}" MAXLENGTH=10>
					</td>
				</tr>
				<tr>
					<td class="normalleftalign">
						<input type="radio" name="POS_CTRL_CONF_TYPE" value="2" {CHECKED_POS_CTRL_CONF_TYPE_NON_MODIF_PAR_UTIL} OnClick="javascript:GererConfType(this.value);">{LIBELLE_NON_MODIF_PAR_UTIL}
					</td>
				</tr>											
			</table>
			</div>
		</td>								
	</tr>
    <tr>
        <td colspan=2>
        <center>
        <INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_VALIDER}"  onclick="ValideRestrictionAcces();">
        &nbsp;&nbsp;&nbsp;
        <INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}"  onclick="AnnuleRestrictionAcces();">
        </center>
        </td>
    </tr>																		
</table>
</div>

<!-- ------------------------------------------------------- div ajout_rub -------------------------------------------------------------------------------- -->
<div style="z-index: 99; display: none; position: absolute; left: 0; top: 0; width: 100%; height: 100%;background: url('/{NOM_APPLICATION}/images/grille.gif');" id="ajout_rub">
<div style="width: 750px; height: 680px; border: 1px solid #000000; background: #FFFFFF">
<table role='presentation' width="100%" style="border-collapse: collapse;">
	<tr style="background: #86B6E3;color: #FFFFFF; font-weight: bold;">
		<td align="left" NOWRAP>{LIBELLE_ATTRIB_RUB} <span id="rub_courante"></span></td>
	</tr>
	<tr>
    	<td>
    		<div class='groupe'>											
    		<table role='presentation'>
    			<tr>										
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_INDEX_RUB_AJOUT" value="1">{LIBELLE_INDEXEE_RUB}
    				</td>
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_REPORT_VAL_RUB_AJOUT" value="1">{LIBELLE_REPORT_VAL_RUB}
    				</td>
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_VER_CREAT_RUB_AJOUT" value="1">{LIBELLE_VERROUILLEE_CREAT_RUB}
    				</td>																																				
    			</tr>
    			<tr>										
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_MODIFIABLE_RUB_AJOUT" value="1">{LIBELLE_MODIFIABLE_RUB}
    				</td>
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_FULLTEXT_RUB_AJOUT" value="1">{LIBELLE_FULLTEXT_RUB}
    				</td>
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_VER_MODIF_RUB_AJOUT" value="1">{LIBELLE_VERROUILLE_MODIF_RUB}
    				</td>																																				
    			</tr>
    			<tr>										
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_VAL_UNIQUE_RUB_AJOUT" value="1">{LIBELLE_VALEUR_UNIQUE_RUB}
    				</td>
    				<td class="normalleftalign">
    					<input type="checkbox" name="POS_MAJUSCULE_RUB_AJOUT" value="1">{LIBELLE_MAJUSCULE_RUB}
    				</td>																																															
    			</tr>	
    			<tr>
    				<td align="left" valign="top" colspan="2" width="60%">
    					<table role='presentation'>															
    						<tr>										
    							<td class="normalleftalign">
    								<input type="checkbox" name="POS_CHECK_TYPE_CIBLE_RUB_AJOUT" value="1" onClick="javascript:GererCheckTypeCible();">{LIBELLE_TYPE_CIBLE_RUB}
    							</td>
    							<td class="normalleftalign">
    								<SELECT id="select_type_cible" NAME="POS_TYPE_TYPE_CIBLE_RUB_AJOUT" SIZE="1" onChange="javascript:GereBoutonAssociations();javascript:ModifTypeCible();javascript:AfficheRubCible();">																												
    									<OPTION VALUE=""></OPTION>
    									<!-- BEGIN BLOC_TYPE_CIBLE_RUB_AJOUT -->
    									<OPTION VALUE="{TYPE_CIBLE}">{TYPE_CIBLE} </OPTION>
    									<!-- END BLOC_TYPE_CIBLE_RUB_AJOUT -->
    								</SELECT>
    							</td>															
    						</tr>
    						<tr>										
    							<td class="normalleftalign">{LIBELLE_RUBRIQUE_CIBLE} </td>
    							<td align="left">	
    								<SELECT id="select_rub_cible" NAME="POS_RUB_TYPE_CIBLE_RUB_AJOUT"  SIZE="1">																																																																		
    								</SELECT>
    							</td>																	
    							<td>
    							<INPUT TYPE="button" name="POS_BUTTON_ASSOCIATIONS" id="button_associations" VALUE="{LIBELLE_ASSOCIATIONS}" onClick="javascript:AfficherBlocAssociations();">
    							</td>																															
    							<td class="normalleftalign" style="display:none">
    								<input type="checkbox" disabled name="POS_CHECK_RECUP_FICHIER_ASSOCIATIONS" value="1" >{LIBELLE_RECUP_FICHIER_ASSOCIATIONS}
    							</td>
    						</tr>
    						</table>
    						</td>
    						<td valign="top">
    						      <div class='groupe'>
    								<p class='groupe'>								 														 														 														
    									<span class='groupe'>{LIBELLE_RUB_OBLIG} </span>													 													 													
    								</p>
    									<table role='presentation' width='100%'>
    										<tr>																	
    											<td>
    												<input type="radio" name="POS_CHOIX_RUB_OBLIG" value="0">{LIBELLE_RUB_OBLIG_NON}
    											</td>
    											<td>
    												<input type="radio" name="POS_CHOIX_RUB_OBLIG" value="1">{LIBELLE_RUB_OBLIG_OUI}	
    											</td>
    											<td>
    												<input type="radio" name="POS_CHOIX_RUB_OBLIG" value="2">{LIBELLE_RUB_OBLIG_PSEUDO}
    											</td>
    										</tr>
    									</table>	
    						  </div>
    					   </td>
    					   </tr>
    					<tr id="bloc_association" style="display:none; border: 1px solid #000000; background: #8abae3">
    						<td colspan="4" align="center">
    							<table role='presentation'>
    								<tr>
    									<td>
    										{LIBELLE_LISTE_RUB_TYPE_COURANT}
    									</td>
    									<td>
    										{LIBELLE_LISTE_RUB_TYPE_CIBLE}
    									</td>
    								</tr>
    								<tr>
    									<td class="tdfond">																		
    										<div id="table-rub-source-assocations">
    										</div>																			
    									</td>
    									 <td class="tdfond">																	
    										<div id="table-rub-cible-associations">
    										</div>																			
    									</td>	
    								</tr>
    								<tr>
    									<td align="right">
    									 <span id="AjoutAssociationButton" class="yui-button yui-push-button">
    							        <span class="first-child">
    							            <button type="button"> {LIBELLE_ASSOCIER} </button>
    							        </span>
    							    	</span>
    									</td>
    									<td align="left">
    										 <span id="SupprimeAssociationButton" class="yui-button yui-push-button">
    								        <span class="first-child">
    								            <button type="button">{LIBELLE_RETIRER} </button>
    								        </span>
    								    	</span>
    									</td>
    								</tr>
    								<tr>
    									<td class="tdfond" colspan="2">
    										<div id="table-associations">
    										</div>																	
    									</td>
    								</tr>
    								<tr>
    									<td align="center">
    										<INPUT TYPE=BUTTON id="ValideAssociationButton" class="bouton" VALUE="{LIBELLE_VALIDER}">
    									</td>
    									
    									<td align="center">
    										<INPUT TYPE=BUTTON id="AnnuleAssociationButton" class="bouton" VALUE="{LIBELLE_ANNULER}">
    									</td>
    								
    								</tr>
    							</table>
    						</td>
    					</tr>
    			        <tr>
    				       <td colspan="2">
    							<div class='groupe'>
    								<p class='groupe'>								 														 														 														
    									<span class='groupe'>{LIBELLE_COMPTEUR} </span>													 													 													
    								</p>
    								<table role='presentation' style="clear:both">
    									<tr>
                                        	<td class="normalleftalign">
    											<input type="checkbox" name="POS_CHECK_COMPTEUR" value="1" onClick="javascript:GererCheckCompteur();">{LIBELLE_COMPTEUR}	
    										</td>
    										<td class="normalleftalign">{LIBELLE_VALEUR_ACTUELLE} </td>
    										<td NOWRAP>
    											<input name="POS_VAL_ACT_COMPTEUR" value="" SIZE="15" MAXLENGTH=11 onChange="javascript:isANumber(this);">
    										</td>
    									</tr>
    									<tr>
    										<td class="normalleftalign" colspan='2'>
    											<input type="checkbox" name="POS_CHECK_INI_COMPTEUR" value="1" onClick="javascript:GererCheckIniCompteur();">{LIBELLE_INI_COMPTEUR}	
    										</td>																			
    										<td NOWRAP>
    											<input name="POS_VAL_INI_COMPTEUR" value="" SIZE="15" MAXLENGTH=11 onChange="javascript:GererCptValReinit(this);">
    										</td>
    									</tr>
    								</table>	
    							</div>
    						</td>														
    		                <td valign="top">
    						<div class='groupe'>
    					    <p class='groupe'>								 														 														 														
    						<span class='groupe'>{LIBELLE_LISTHIER} </span>													 													 													
    					    </p>
    						<table role='presentation'>
    						<tr>
    							<td class="labelChamp">{LIBELLE_CODE_LISTHIER} </td>
    							<td class="normalleftalign">
    								<SELECT id="select_code_listhier" NAME="POS_CODE_LISTHIER" SIZE="1" onChange="javascript:AutoriseCheckControlListHier();AfficheCodeRubMere();">																												
    									<!-- BEGIN BLOC_CODE_LISTHIER -->
    									<OPTION VALUE="{CODE_LISTHIER}">{CODE_LISTHIER} </OPTION>
    									<!-- END BLOC_CODE_LISTHIER -->
    								</SELECT>
    							</td>
    							<td class="labelChamp">{LIBELLE_CODE_RUBMERE_LISTHIER} </td>
    							<td class="normalleftalign">
    								<SELECT id="select_code_rubmere" NAME="POS_CODE_RUB_MERE" SIZE="1">																																																	
    								</SELECT>
    							</td>
    						</tr>
    						<tr>																		
    							<td NOWRAP colspan="4">
    								<input type="checkbox"  disabled name="POS_CONTROLE_LISTHIER" value="1">{LIBELLE_CONTROLE_LIST_HIER}
    							</td>
    						</tr>
    						</table>	
    						</div>
    					</td>
    				</tr>
    				<tr>
    					<td align="center" colspan="2">
    						<table role='presentation'>
    							<tr>
    								<td class="labelChamp">{LIBELLE_VAL_MIN} </td>
    								<td NOWRAP>
    									<input name="POS_VAL_MIN" value="" SIZE="15" MAXLENGTH=11 onChange="javascript:if(validateDecimal(this))maximum(this,'11');">
    								</td>
    							</tr>
    							<tr>
    								<td class="labelChamp">{LIBELLE_VAL_MAX} </td>
    									<td NOWRAP>
    										<input name="POS_VAL_MAX" value="" SIZE="15" MAXLENGTH=11 onChange="javascript:if(validateDecimal(this))maximum(this,'11');">
    									</td>
    							</tr>	
    						</table>
    					</td>																																																
    					<td align="center">
    						<table role='presentation'>
    							<tr>
    								<td class="labelChamp">{LIBELLE_VAL_DEF} </td>								
    								<td id="td_val_def">
    									<input id="saisie_val_def" name="POS_VAL_DEF" value="" SIZE="30" MAXLENGTH="27">
    								</td>
    							</tr>	
    						</table>
    					</td>		
    				</tr>
    				<tr>
    					<td align="center" colspan="3">
    						<table role='presentation'>
    							<tr>
    								<td align="center">
    								    <input type="button" class="bouton" value="{LIBELLE_VALIDER}" onClick="javascript:ValideAjoutRubFn();">
    								 </td>																																																																																																																																																																																
    								<td align="center">
    								    <input type="button" class="bouton" value="{LIBELLE_ANNULER}" onClick="javascript:AnnuleAjoutRubFn();">
    						       	</td>
    							</tr>
    						</table>
    					</td>
    				</tr>
    				</table>
    
    		</div>
																								
</td>																																															
</tr>																				
</table>	
</div>
		
</div>
<BR>
<CENTER>
    <INPUT TYPE=SUBMIT class="bouton_sub" VALUE="{LIBELLE_VALIDER}">
    <INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}" onClick="location.href='{URL_ANNULER}'">
</CENTER>
</FORM>
</BODY>
</HTML>
