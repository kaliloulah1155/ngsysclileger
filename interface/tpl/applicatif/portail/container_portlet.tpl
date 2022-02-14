<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" type="text/css" href="../../../../include/style/style.css">
	<link rel="stylesheet" type="text/css" href="../../../../include/style/pos-yui-portal.css">    
	<link rel="stylesheet" type="text/css" href="../../../../include/style/pos-yui-portlet.css">
    <script type="text/javaScript">
	var elements_dans_bal = "{ELEMENTS_DANS_BAL}";
	var set_reload_bal = "{SET_RELOAD_BAL}";
	var display_icon_delete_bal = "{DISPLAY_ICON_DELETE_BAL}";
	</script>
    <SCRIPT language="javascript" SRC="../../../../configuration/constantes.js"></SCRIPT>
    <script language="JavaScript" src="../../../../include/script/yui_3.18.1/yui/build/yui/yui-min.js"></script>
    <script language="JavaScript" src="../../../../include/script/yui_3.18.1/yui/yui-use.js"></script>
    <script language="JavaScript" src="../../../../include/script/portail/pos-yui-portal-labels_{LANG}.js"></script>
    <script language="JavaScript" src="../../../../include/script/portail/pos-yui-portlets-conf.js"></script>
    <script language="JavaScript" src="../../../../include/script/portail/pos-yui-utils.js"></script>
    <script language="JavaScript" src="../../../../include/script/portail/pos-yui-portlet-factory.js"></script>
    <script language="JavaScript" src="../../../../include/script/portail/pos-yui-portal.js"></script>
    <SCRIPT language="javascript" SRC="../../../../include/script/action_accueil.js"></SCRIPT>
    <script language="JavaScript">
        var isAdmin = {IS_MODE_EDITION};
        var i=0;
        var tabBal = new Array();
        var tabBalhtmlEncode = new Array();
        var tabIfBalOpen = new Array();
        var tabBalIcone = new Array();
    	var tabNbRepBal = new Array();
        <!-- BEGIN BLOC_NOM_BAL -->
        tabBal[i]="{SZ_CODE_BAL}";
        tabBalhtmlEncode[i]="{SZ_CODE_BAL_HTML_ENCODE}";
        tabBalIcone[i] = "{ICONE_BAL}";
    	tabNbRepBal[i] = -1;
        tabIfBalOpen[i++]={BAL_OPEN};
        <!-- END BLOC_NOM_BAL -->

	var toggleShowConfigPanel = function (button) {
		var showconfigpanel = Yglob.PosYUIPortal.get('showconfigpanel');
        Yglob.PosYUIPortal.set('showconfigpanel', !showconfigpanel);		
	}
    
	var toggleEdition = function (button) {
		var editing = Yglob.PosYUIPortal.get('editing');
        // difficile de le faire uniquement en js car il faut modifier toutes 
        // les portlets pour y ajouter les boutons d'edition
        //Yglob.PosYUIPortal.set('editing', !editing); 
       document.location.href= window.location.href.split('?')[0] + "?EDITION=" + (editing ? '0' : '1'); 
	   		
	}

    var currentLayoutContent = "{LAYOUT_CONTENT}";
    var currentLayoutContentMsgErr = "{LAYOUT_CONTENT_MSG_ERR}";
    
</script>
<title>{TITRE_PAGE}</title>
</head>
<!--  class="yui3-skin-sam" --> 
<body class='body_portlet_edition_{IS_MODE_EDITION}' style="margin-top: 0;">
<h1>{LIBELLE_BIENVENUE_ACCUEIL}</h1>
<form name="principal">
<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}">
<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
</form>
<!-- BEGIN BLOC_BAL -->
<!-- END BLOC_BAL -->
<div style='display: none;' id='liste_profil'>
<div style='overflow: auto; max-height: 150px;'>
<!-- BEGIN BLOC_CHANGE_PROFIL -->
<!-- BEGIN LISTE_PROFIL -->
<li style="margin-bottom: 3px;">
<img src="../../../../images/portail/puce.gif" border='0'><A  HREF="javascript:changerProfil('{LIBELLE_PROFIL}')" TITLE="{LIBELLE_CHANGER_PROFIL}">{LIBELLE_ACCES_PROFIL} {LIBELLE_PROFIL}</a>
</li>
<!-- END LISTE_PROFIL -->
<!-- END BLOC_CHANGE_PROFIL -->
</div>
</div>

<div style='display: none;' id='div_panier'>
<A href='javascript:void(0)' onClick='javascript:void lancePanier();'>{LIBELLE_PANIER}</A>
<div id="panier" style="display:inline">({NB_ELEMENT_PANIER})</div> 
</div>

<div style='display: none;' id='liste_bal'>
<ul style='list-style: none; padding-top: 3px;padding-left: 2px;margin-top: 0px;'>
<!-- BEGIN GROUPE_BAL -->
<!-- BEGIN TITRE_GROUPE -->
<li class="groupbal"><br>
    <img id="image_fermeture_group_{ICPTGROUP}" src="/{NOM_APPLICATION}/images/icons/{ICONE_ARBRE_PLUS_MOINS}_bal.gif" onClick="javascript:afficheMasqueGroupe('{ICPTGROUP}');">
    <!-- BEGIN TITRE_ONLY_GROUPE -->
    {ICONE_GROUPE} <span style="{STYLE_BAL_GROUP}">{POS_BAL_TITRE_GROUPE} </span>
    <!-- END TITRE_ONLY_GROUPE -->
    <!-- BEGIN TITRE_BAL_GROUPE -->
    <A class="groupbal" title="{POS_BAL_LIBELLE_COMMENT}" href="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');">
    <img src="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}">
    {POS_BAL_LIBELLE}<span id="bal{ICPTBAL}">({POS_BAL_NB_REP})</span></A>
    <!-- END TITRE_BAL_GROUPE -->
    <ul style='list-style: none; margin-left: -10px;display:{DISPLAY_GROUPE_OUVERT};' id='group_bal_{ICPTGROUP}' class='table_groupe_isgroup_{GROUP_ON}'>
	<!-- BEGIN BAL -->     
       
        <li id="td_bal{ICPTBAL}">
            <a title="{POS_BAL_LIBELLE_COMMENT}" href="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');"><IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}" border="0">
			<span id="bal{ICPTBAL}">({POS_BAL_NB_REP})</span>
			<span style="{STYLE_BAL}">{POS_BAL_LIBELLE}</span></a>
        </li>
	<!-- END BAL -->
    </ul>
</li>
<br>
<!-- END TITRE_GROUPE -->
<!-- BEGIN BAL_SEULE -->
<li id="td_bal{ICPTBAL}">
    <a title="{POS_BAL_LIBELLE_COMMENT}" HREF="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');">
    <IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}" border="0">
	<span id="bal{ICPTBAL}">({POS_BAL_NB_REP})</span>
    <span style="{STYLE_BAL}">{POS_BAL_LIBELLE}</span></a>
</li>
<!-- END BAL_SEULE -->
<!-- END GROUPE_BAL --> 
</ul>
</div>
<div style="padding: 0; margin-top: 5px;margin-bottom: 5px;">
	<button type="button" id="editiontoggler" data-is-edit='0' title="{LIBELLE_EDITER_PORTAIL}" onclick="javascript:toggleEdition(this);"></button>
    <button type="button" id="showconfigpaneltoggler" data-is-open='1' title="{LIBELLE_CONFIGURER_PORTAIL}" style="display: none;" onclick="javascript:toggleShowConfigPanel(this);"></button>
    <span style='font-weight: bold; display: {DISPLAY_MGS_EDITION};margin-left: 200px;'>{MGS_EDITION}</span>
</div>

<div style='display: none;' id='liste_qpubliques'>
<div style='overflow: auto; max-height: 150px;'> 
<ul style="margin: 0; padding: 0">
<!-- BEGIN BIBLIO_PUB -->
<li style="margin-bottom: 3px;">
<img src="../../../../images/portail/puce.gif" alt=""><a href="javascript:void(0)" onClick="javascript: void afficherResultat('qpubliques', '{POS_BIB_LIEN_PORTAIL}');">{POS_BIB_LIBELLE}</a>
</li>
<!-- END BIBLIO_PUB -->
</ul>
</div>
</div>

<div style='display: none;' id='liste_qprivees'>
<div style='overflow: auto; max-height: 150px;'>  
<ul style="margin: 0; padding: 0">
<!-- BEGIN BIBLIO_PRIV -->
<li style="margin-bottom: 3px;">
<img src="../../../../images/portail/puce.gif" alt=""><a href="javascript:void(0)" onClick="javascript: void afficherResultat('qprivees', '{POS_BIB_LIEN_PORTAIL}');">{POS_BIB_LIBELLE}</a>
</li>
<!-- END BIBLIO_PRIV -->
</ul>
</div>
</div>
<div id="portal"/>
</body>
</html>
     