<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<title>Fiche d'index paramétrée - {POS_CODE_TYPEDOC}</title>

<style type="text/css">
/*margin and padding on body element can introduce errors in determining element position and are not recommended;
  we turn them off as a foundation for YUI CSS treatments. */
body {
	margin:0;
	padding:0;
}

</style>

<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/fonts/fonts-min.css" />
<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/resize/assets/skins/sam/resize.css" />
<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/tabview/assets/skins/sam/tabview.css" />
<link rel="stylesheet" href="/{NOM_APPLICATION}/include/script/yui/build/logger/assets/skins/sam/logger.css">
<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/menu/assets/skins/sam/menu.css"> 

<LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/style/fip.css"> 

<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/element/element-min.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/dragdrop/dragdrop-min.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/resize/resize-min.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/tabview/tabview-min.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/json/json-min.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/logger/logger-min.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/event/event.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/dom/dom.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/animation/animation.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/container/container_core.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/menu/menu.js"></script>
<!-- replace All -->
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/association.js"></script>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/fip.js"></script>


<script type="text/javascript">
// taille de la fiche parametree issue du paramétrage client lourd
var widthFIP_WIN = {FIP_WIDTH_WIN};
var heightFIP_WIN = {FIP_HEIGHT_WIN};

//taille de l'objet fiche-parametree
var tmp_widthFIP_PHP = getStyleClassProperty("fiche-parametree","width");
var widthFIP_PHP = parseInt(tmp_widthFIP_PHP.substr(0, tmp_widthFIP_PHP.length - 2));
var tmp_heightFIP_PHP = getStyleClassProperty("fiche-parametree","height");
var heightFIP_PHP =  parseInt(tmp_heightFIP_PHP.substr(0, tmp_heightFIP_PHP.length - 2));

if (widthFIP_WIN == 0)
	widthFIP_WIN  = widthFIP_PHP;
	
if (heightFIP_WIN == 0)
	heightFIP_WIN = heightFIP_PHP;

// tableau de tous les onglets
var tabInitialOnglet = new Array();
<!-- BEGIN BLOC_ONGLET_FIP -->
tabInitialOnglet[{CPT_ONGLET}] = new YAHOO.sesin.fip.ObjetOnglet("{LIBELLE_ONGLET}", {dwCouleurFond});
<!-- END BLOC_ONGLET_FIP -->

// tableau de toutes les rubriques du type de document qu'elles soient affichées ou pas dans la FIP
var tabCompletRubrique = new Array();
<!-- BEGIN BLOC_RUB_FIP -->
tabCompletRubrique["{CODE}"] = new YAHOO.sesin.fip.Rubrique("{CODE}", "{LIBELLE}", {NUM_ONGLET}, {wX}, {wY}, {wDX}, {wDY}, {dwCouleurFond}, {dwCouleurTexte});
tabCompletRubrique["{CODE}"].isTableau = {IS_TABLEAU};
<!-- END BLOC_RUB_FIP -->

// tableau de tous les regroupements
var tabCompletRegroupement = new Array();
<!-- BEGIN BLOC_REGROUP_FIP -->
 tabCompletRegroupement["{CODE}"] = new YAHOO.sesin.fip.Regroupement("{CODE}", "{LIBELLE}", {NUM_ONGLET}, {wX}, {wY}, {wDX}, {wDY}, {dwCouleurFond}, {dwCouleurTexte});
<!-- END BLOC_REGROUP_FIP -->

var iNbObj = {CPT_INIT_OBJ};

// tableau des libellés initiaux
var tabInitialLibelle = new Array();
<!-- BEGIN BLOC_LIBELLE_FIP -->
tabInitialLibelle["{CODE}"] = new YAHOO.sesin.fip.Libelle("{CODE}", "{LIBELLE}", {NUM_ONGLET}, {wX}, {wY}, {wDX}, {wDY}, {dwCouleurFond}, {dwCouleurTexte});
<!-- END BLOC_LIBELLE_FIP -->

// tableau des listes de fichiers
var tabInitialListeFichiers = new Array();
<!-- BEGIN BLOC_LISTEFICHIERS_FIP -->
tabInitialListeFichiers["{CODE}"] = new YAHOO.sesin.fip.ListeFichiers("{CODE}", "{LIBELLE}", {NUM_ONGLET}, {wX}, {wY}, {wDX}, {wDY}, {dwCouleurFond}, {dwCouleurTexte});
<!-- END BLOC_LISTEFICHIERS_FIP -->

var isCleHier = {IS_CLEHIER};
var tabCleHier = new Array();
<!-- BEGIN BLOC_CLE_H -->
tabCleHier["{CODE}"] = new YAHOO.sesin.fip.CleHier("{CODE}", "{LIBELLE}", {NUM_ONGLET}, {wX}, {wY}, {wDX}, {wDY}, {dwCouleurFond}, {dwCouleurTexte});
<!-- END BLOC_CLE_H -->
</script>
</head>

<body class="yui-skin-sam" onLoad="initEcranFip();"">
<FORM NAME=principal ACTION="{URL_ATTENTE}" method="POST" onSubmit="return lancerFormulaire();">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="{CODE_ACTION}">
<INPUT TYPE=HIDDEN NAME="POS_CODE_TYPEDOC" VALUE="{POS_CODE_TYPEDOC}">
<INPUT TYPE=HIDDEN NAME="MODE_AFFICHE_FICHE_PARAM" VALUE="{MODE_AFFICHE_FICHE_PARAM}">
<INPUT TYPE=HIDDEN NAME="POS_TAB_TOUS_OBJETS_JSON_STRING" VALUE="">
<INPUT TYPE=HIDDEN NAME="LIBELLE_MENU_CONTEXT_SUPP" VALUE="{LIBELLE_SUPP}">
<INPUT TYPE=HIDDEN id="LIBELLE_LISTEFICHIERS" VALUE="{LIBELLE_LISTEFICHIERS}">
<INPUT TYPE=HIDDEN id="LIBELLE_CLEHIER" VALUE="{LIBELLE_CLEHIER}">
<INPUT TYPE=HIDDEN id="LIBELLE_GROUPE" VALUE="{LIBELLE_GROUPE}">
<INPUT TYPE=HIDDEN id="LIBELLE_TEXTE" VALUE="{LIBELLE_TEXTE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_LISTEFICHIERS_ONGLET" VALUE="{MESSAGE_LISTEFICHIERS_ONGLET}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_SUPP_ONGLET"  VALUE="{MESSAGE_SUPP_ONGLET}">
<br>
<div id="container-bouton-valid">
	<table cellspacing="1"border='0' align='center'>	
     	
   	<tr>
        <td>
            <INPUT TYPE=SUBMIT class="bouton_sub" VALUE="{LIBELLE_VALIDER}">
        </td> 
        <td>
            <INPUT TYPE=SUBMIT class="bouton_sub" name="GENERER_TEMPLATE" VALUE="{LIBELLE_VALIDER} et générer template">
        </td>
        <td>
            <INPUT TYPE=SUBMIT class="bouton_sub" name="GENERER_TEMPLATE_ONLY" onClick="return confirm('Etes-vous sur de vouloir générer les templates sans valider vos modifications ?');" VALUE="Générer template">
        </td>
        <td>
       	    <INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}" onClick="location.href='{URL_ANNULER}'">
     	</td>
 	</tr>
    </table>
</div>

<div id="container-fip">
<div id="demo" class="yui-navset">
    <ul id="nav-fip" class="yui-nav">
        <li class="selected"><a href="#tab1"><em>Onglet N°1</em></a></li>
    </ul>            
    <div id="content-fip" class="yui-content">
        <div id="tab100">
            <div id="fiche-parametree-100" class="fiche-parametree"></div>
        </div>
    </div>
</div>
</div>
<div id="container-bouton-objet">
	   <table cellspacing="2" style="border: 1px solid gray;">
    	<tr>
		    <td class="labelFip">{LIBELLE_RUBRIQUES} </td>
		</tr>
		<tr>
			<td >
		     <select id="liste-rubriques" class="inputChamp">
		    </select>
            <button type="button" onClick="javascript:onClicAjouterRubrique();" title="{LIBELLE_AJOUT_RUB}">+</button>
		    </td>
		</tr>
		<tr>
		    <td class="labelFip">{LIBELLE_CHAMPS_SPECIAUX} </td>
		</tr>
        <tr>
			<td nowrap>
		     <select id="liste-champs-speciaux" style="width: 85%" class="inputChamp">
		    </select>
            <button type="button" onClick="javascript:onClicAjouterChampsSpeciaux();" title="{LIBELLE_AJOUT_CHAMPS}">+</button>
		    </td>
		</tr>
	    <tr>
    		<td style="text-align: center;">
    	    <button type="button" onClick="javascript:onClicSupprimerSelectedObjets();" title="{LIBELLE_SUPP_OBJ_SELECT}"><img src="/{NOM_APPLICATION}/images/icons/fip/rubrique_suppr.gif" alt="{LIBELLE_SUPP_OBJ_SELECT}"></button>
    	   </td>	   
		</tr>
	
		<tr>
		    <td class="labelFip">{LIBELLE_ONGLETS}</td>
		</tr>
		<tr>
			<td style="text-align: center;">
	        <button type="button" onClick="javascript:AjouterOnglet();" title="{LIBELLE_AJOUT_ONGLET}"><img src="/{NOM_APPLICATION}/images/icons/fip/onglet_ajout.gif" alt="{LIBELLE_AJOUT_ONGLET}"></button>
	        &nbsp;  
			<button type="button" id="SuppOngletBouton" onClick="javascript:SupprimerOnglet();" title="{LIBELLE_SUPP_ONGLET}"><img src="/{NOM_APPLICATION}/images/icons/fip/onglet_suppr.gif" alt="{LIBELLE_SUPP_ONGLET}"></button>
			&nbsp;  
			<button type="button" onClick="javascript:RenommerOnglet();" title="{LIBELLE_RENOM_ONGLET}"><img src="/{NOM_APPLICATION}/images/icons/fip/onglet_renommer.gif" alt="{LIBELLE_RENOM_ONGLET}"></button>
			</td>	
		</tr>
 	</table>
</div>
<div id="logger" style="position:absolute;left:910px;top:50px;display:none;"></div>

<BR>
</FORM>
</body>
</html>
