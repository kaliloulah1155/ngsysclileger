<HTML>

<HEAD>
	<TITLE>Fiches liees</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/popup_menu.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"></SCRIPT>
	<SCRIPT language='javascript' src='../../../../include/script/ajax_search.js'></SCRIPT>

	<SCRIPT language="javascript">
    	
	function lancerRecherche()
	{
		var sUrl = "{URL_AFF_LIEN}";
		document.principal.action = sUrl;
		document.principal.target = '';
		document.principal.POS_ASSOCIATION.value = "RECHERCHE";
		document.principal.submit();
	}
	
	function gestionToucheEntree(evenement)
    {
        var touche = window.event ? evenement.keyCode : evenement.which;
    	if (touche == 13) {		// TOUCHE " ENTRER "
    		lancerRecherche();
    	}
    }
    
    function ouvrirDocument(iNumDoc, sessid, mode) {
        
        parent.consulterDocFromTplWithMode(iNumDoc, mode);
    }
    
    function creerDocument(sUrl) {
        
        parent.creerDocFromTpl(sUrl);
    }
    
    function valider()
    {
    	//Cas de feuille de recherche inexistante
    	if(document.principal == null) {
    		alert('Pas de document sélectionné.');
    		parent.afficher_lien.location.href="{URL_AFF_LIEN}{QUERY_STRING}" ;
    	}
    	else {
    		// consultation
            var iNumDoc = getValueRadio(document.principal.POS_NUM_DOC);
            if(iNumDoc != null && iNumDoc.length != 0) {			
    			document.principal.submit();
    		}
        }
    }
    
    function validerRepUnique()
    {
        if( document.principal.POS_NUM_DOC != null 
            && document.principal.POS_NUM_DOC.length == 2 && {B_AFF_BOUTON_VALIDER}
            // on ne valide pas automatiqument en retour d'une recherche
            && document.principal.POS_ASSOCIATION.value != "RECHERCHE")
            valider();
    }
    
    function onGarderEnReponse()
    {
        var szUrlGarderEnReponse = "{URL_GARDER_EN_REPONSE}?{QUERY_STRING}";
        document.location.href = szUrlGarderEnReponse;
    }
    
    function closeAssociation() 
    {
        parent.closeAssocModif();
    }
    
    function initTplLien() {
        
        validerRepUnique();
        var iNumDocParent = 0;
        if (typeof(parent.document.principal.POS_NUM_DOC) != 'undefined')
            iNumDocParent = parent.document.principal.POS_NUM_DOC.value;
        if (document.getElementById("img_consult_" + iNumDocParent) != null)
            document.getElementById("img_consult_" + iNumDocParent).style.display = 'none';
    }

    window.focus();
	</SCRIPT>

	<base target="_self">
</HEAD>

<BODY onLoad="initTplLien();">
<FORM NAME=principal ACTION="{URL_ASSOC}">
<input type='hidden' name='POS_TYPEDOC' value='{POS_TYPEDOC}'>
<input type='hidden' name='POS_CODERUB' value='{POS_CODERUB}'>
<input type='hidden' name='POS_CODERUB_LIEE' value='{POS_CODERUB_LIEE}'>
<input type='hidden' name='POS_TYPEDOC_LIE' value='{POS_TYPEDOC_LIE}'>
<input type='hidden' name='NB_REPONSE' value='{NB_REPONSES}'>
<input type='hidden' name='POS_ASSOCIATION' value='{POS_ASSOCIATION}'>
<input type='hidden' name='B_AFF_BOUTON_VALIDER' value='{B_AFF_BOUTON_VALIDER}'>
<input type='hidden' name='POS_CREATION' value='{POS_CREATION}'>
<input type='radio' name='POS_NUM_DOC' VALUE='' style='display: none;'>


<div id='zone_recherche' style="display: {DISPLAY_ZONE_RECHERCHE}">
<span class="labelObligatoire">{LIBELLE_TYPEDOC}</span>
<select class="inputChamp" NAME="POS_RUB_RECH">
<!-- BEGIN RUBRIQUES -->
<option VALUE="{CODE_RUB}" {SELECTED}> {LIBELLE_RUB} </option>
<!-- END RUBRIQUES -->
</select>
<input type='text' size='40' NAME="POS_VALEUR_RUB" value="{POS_VALEUR_RUB}" onKeyPress="javascript:gestionToucheEntree(event);"
onKeyDown='return autoCompleteKeyDown(event);' onkeyup="return searchSuggestTypeRubMin(event, this, VOCAB_USED, 0, document.principal.POS_TYPEDOC_LIE.value, document.principal.POS_RUB_RECH.value);" autocomplete="off" onClick="return closeSearch();">
<a HREF="javascript:charger_vocabulaire_rech_elabore(document.principal.POS_TYPEDOC_LIE.value, document.principal.POS_RUB_RECH.value,'POS_VALEUR_RUB')">
<div class='iconvocmono' id='img_voc_lien' title='Vocabulaire'></div></a>
&nbsp;&nbsp;&nbsp;<input type='button' class='bouton' value="{LIBELLE_RECHERCHER}" onClick="javascript:lancerRecherche();">
<br>
<br>
<hr>
</div>
<span class="labelObligatoire">{LIBELLE_NB_REPONSE} {NB_REPONSES}</span>
<div style='height: 70%;overflow-y: auto;'>
<TABLE class='tablelr' id="tablelr" style="display: {DISPLAY_TABLE_LR}" cellpadding='2' cellspacing='1'>
	<TR>
		<TH class='titrecolonne' width='50px'>{LIBELLE_COL_RADIO_BOUTON_FICHE_LIE}</TH>
		<!-- BEGIN ENTETE -->
        <TH class=titrecolonne>{TITRE_COLONNE}</TH>
		<!-- END ENTETE -->
	</TR>

	<!-- BEGIN LISTE_REPONSES -->
	<TR class="ligne" data-line="{PAIR_OU_IMPAIR}"  id="doc_{POS_NUMDOC}">
		<TD class='listeResumee' width='50px' NOWRAP>
			{SELECTION_RADIO} <A href="javascript: void(0);" id='img_consult_{POS_NUMDOC}' onClick="ouvrirDocument('{POS_NUMDOC}', '{PHPSESSID}', 'CONSULTATION');"><IMG SRC="/{NOM_APPLICATION}/images/icons/doc.gif" border=0 title="{LIBELLE_CONSULT}"></A>
		</TD>
		<!-- BEGIN LR_REPONSE -->
		<TD class='listeResumee' align="{ALIGN}">{ZONE_LR}&nbsp;</TD>
        <!-- END LR_REPONSE -->
	</TR>
	<!-- END LISTE_REPONSES -->
</TABLE>
</div>
<hr>
<div style='vertical-align: bottom'>
<!-- Affichage du bouton Valider quand cela est necessaire   -->
<input type='button' class='bouton' style="display: {DISPLAY_VALIDER};" VALUE='{LIBELLE_VALIDER_ASSO}' onClick='javascript:void valider();'>
&nbsp;<input type='button' class='bouton' name="liste" id="btn_affiche_liste" style="display: none;" VALUE="{LIBELLE_AFFICHER_LISTE}" onClick=parent.frames["afficher_lien"].location.href="{URL_ATTENTE}?URL={URL_AFF_LIEN}&{QUERY_STRING}" >
&nbsp;<input type='button' class='bouton' name="garder_en_reponse" VALUE="{LIBELLE_GARDER_EN_REPONSE}" onClick="javascript:onGarderEnReponse();" >
&nbsp;<input type='button' class='bouton' VALUE="{LIBELLE_BOUTON_CREER}"  style="display: {DISPLAY_CREER};" onClick="creerDocument('{URL_CREATION}?POS_TYPEDOC={POS_CODETYPE_LIEE}')">
<input type='button' class='bouton' VALUE="{LIBELLE_FERMER}" style="float: right;" onClick='closeAssociation();'>
</div>
<div style="clear: both;"></div>

</FORM>
</BODY>
</HTML>
