<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
    <title>{TITRE_RECHERCHE} : {TITRE_TYPEDOC}</title>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/hashtable.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/recherche_elaboree.js"></SCRIPT>
    <SCRIPT language='javascript' src='/{NOM_APPLICATION}/include/script/ajax_search.js'></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/calendrier.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/fermeture.js"></SCRIPT>
	<SCRIPT language="javascript">
	
    var i;
	// Liste des rubriques thesaurus
	var tab_rub_thes = new Array();
	<!-- BEGIN RUB_THESAURUS -->
	tab_rub_thes[{CPT}]="{CODE_THES}";
	<!-- END RUB_THESAURUS -->
	
	// Liste des rubriques thesaurus
	var tab_lien_rub_type_thes = new Array();
	<!-- BEGIN LIEN_RUB_TYPE_THESAURUS -->
	tab_lien_rub_type_thes['{CODE_RUB_THES}']="{CODE_TYPE_THES}";
	<!-- END LIEN_RUB_TYPE_THESAURUS -->
	
	// Liste des rubriques Date
	var tab_rub_date = new Array();
	<!-- BEGIN RUB_DATE -->
	tab_rub_date[{CPT}]="{CODE_RUB_DATE}";
	<!-- END RUB_DATE -->
	
	// Liste des rubriques Numerique
	var tab_rub_num = new Array();
    i=0;
	<!-- BEGIN RUB_NUM -->
	tab_rub_num[i++]="{CODE_RUB_NUM}";
	<!-- END RUB_NUM -->

	// Liste des rubriques tableaux
	var tab_rub_tab = new Array();
    i=0;
	<!-- BEGIN RUB_TABLEAU -->
	tab_rub_tab[i++]="{CODE_TAB}";
	<!-- END RUB_TABLEAU -->
	
	// Liste des rubriques multicriteres
	var tab_rub_multi = new Array();
    i=0;
	<!-- BEGIN RUB_MULTI -->
	tab_rub_multi[i++]="{CODE_RUB_MULTI}";
	<!-- END RUB_MULTI -->

	// Liste de la rubrique ftx
	var tab_rub_ftx = new Array();
    i=0;
	<!-- BEGIN RUB_FTX -->
	tab_rub_ftx[i++]="{CODE_RUB_FTX}";
	<!-- END RUB_FTX -->
	
	var tab_rub_type_ftx = new Array();
    i=0;
	<!-- BEGIN RUB_TYPE_FTX -->
	tab_rub_type_ftx[i++]="{CODE_RUB_TYPE_FTX}";
	<!-- END RUB_TYPE_FTX -->
    
	// Liste des rubriques liees
	var tab_code_val_rub_lie = new Hashtable();
	var tabRubLieeParRubrique = new Array();
	<!-- BEGIN RUB_LIE -->
	tab_code_val_rub_lie.put("{CODE_RUB}","{TYP_DOC_LIE}");
	
	    tabRubLieeParRubrique["{CODE_RUB}"] = new Hashtable();
    	<!-- BEGIN COL_RUB_LIE -->
    	 tabRubLieeParRubrique["{CODE_RUB}"].put("{CODE_RUB_LIE}","{LIBELLE_RUB_LIE}");
    	<!-- END COL_RUB_LIE -->
    	
	<!-- END RUB_LIE -->

    function initEcranRechEla()
    {
        parent.setTitle();
        afficheIconeSupprimerLocution();
        if (document.principal.RUB_LOC_NUM_0.value.length == 0)
            document.principal.RUB_LOC_NUM_0.focus();
        else
            document.principal.VAL1_LOC_NUM_0.focus(); 
    }
    
    var tabLibelleOperateur = new Array();
    tabLibelleOperateur["date"] = new Array();
    tabLibelleOperateur["date"][")"] = "{CST_LIBELLE_OPE_DATE_SUPERIEUR}";
    tabLibelleOperateur["date"][">"] = "{CST_LIBELLE_OPE_DATE_SUP_EGAL}";
    tabLibelleOperateur["date"]["("] = "{CST_LIBELLE_OPE_DATE_INFERIEUR}";
    tabLibelleOperateur["date"]["<"] = "{CST_LIBELLE_OPE_DATE_INF_EGAL}";
    tabLibelleOperateur["date"]["/"] = "{CST_LIBELLE_OPE_DATE_COMPRIS}";
    tabLibelleOperateur["date"]["!"] = "{CST_LIBELLE_OPE_DATE_DIFFERENT}";
    tabLibelleOperateur["date"]["="] = "{CST_LIBELLE_OPE_DATE_EGAL}";
 
    tabLibelleOperateur["multi"] = new Array();
    tabLibelleOperateur["multi"]["="] = "{CST_LIBELLE_OPE_MULTI_EGAL}";
    tabLibelleOperateur["multi"][":"] = "{CST_LIBELLE_OPE_MULTI_COMMENCE}";
    tabLibelleOperateur["multi"]["/"] = "{CST_LIBELLE_OPE_MULTI_COMPRIS}";
    tabLibelleOperateur["multi"]["<"] = "{CST_LIBELLE_OPE_MULTI_SUP_EGAL}";
    tabLibelleOperateur["multi"][">"] = "{CST_LIBELLE_OPE_MULTI_INF_EGAL}";
    tabLibelleOperateur["multi"]["*"] = "{CST_LIBELLE_OPE_MULTI_RESPECTE}";
     
    tabLibelleOperateur["base"] = new Array();
    tabLibelleOperateur["base"][":"] = "{CST_LIBELLE_OPE_COMMENCE}";
    tabLibelleOperateur["base"]["/"] = "{CST_LIBELLE_OPE_COMPRIS}";
    tabLibelleOperateur["base"]["!"] = "{CST_LIBELLE_OPE_DIFFERENT}";
    tabLibelleOperateur["base"]["="] = "{CST_LIBELLE_OPE_EGAL}";
    tabLibelleOperateur["base"]["("] = "{CST_LIBELLE_OPE_INFERIEUR}";
    tabLibelleOperateur["base"]["<"] = "{CST_LIBELLE_OPE_INF_EGAL}";
    tabLibelleOperateur["base"][")"] = "{CST_LIBELLE_OPE_SUPERIEUR}";
    tabLibelleOperateur["base"][">"] = "{CST_LIBELLE_OPE_SUP_EGAL}";
    tabLibelleOperateur["base"]["*"] = "{CST_LIBELLE_OPE_RESPECTE}";
    
    tabLibelleOperateur["base"]["X"] = "{CST_LIBELLE_OPE_SEMANTIQUE}";
    tabLibelleOperateur["base"]["0"] = "{CST_LIBELLE_OPE_VIDE}";
    tabLibelleOperateur["base"]["#"] = "{CST_LIBELLE_OPE_NVIDE}";
    tabLibelleOperateur["base"]["%"] = "{CST_LIBELLE_OPE_RESPECTE}";
    tabLibelleOperateur["base"]["~"] = "{CST_LIBELLE_OPE_NOT_FORMAT}";

    var msgValeur1VideLoc = "{CST_LIBELLE_MANQUE_VALEUR1}";
    var msgValeur2VideLoc = "{CST_LIBELLE_MANQUE_VALEUR2}";
    var msgRubriqueVideLoc = "{CST_LIBELLE_MANQUE_RUBRIQUE}";
 
	</SCRIPT>
</HEAD>

<BODY onLoad="javascript:initEcranRechEla();">
<h1 align="center">{TITRE_RECHERCHE}</h1>
<TABLE class="texteaide" align="center" cellpadding="5">
<TR>
	<TD class="texteaide">
        <div class="titretexteaide">
        <SCRIPT language="javascript">
        var szText = "";
        if("{LANGUE}" == "fr")
        {
            szText += "</div>";
    		szText += "<b>Composez votre question en choisissant</b>, pour chaque locution, le lien (Et-Ou-Sauf), la rubrique dans la liste proposée, l'opérateur (Egal, Respecte le format...)";
    		szText += " puis en saisissant la valeur recherchée.<br>";
    		szText += "L'icône&nbsp;<div class='iconvocmono'></div>";
    		szText += "&nbsp;permet de consulter la liste des valeurs possibles pour une rubrique.<br>";
    		szText += "<br><b>Respecte le format</b> : ";
    		szText += "Les opérateurs \"Respecte le format\" et \"Contient un mot respectant le format\" permettent de saisir des caractères jokers ( <b>{JOKER_1CARACTERE}</b> pour 1 caractère, <b>{JOKER_MANYCARACTERES}</b> pour une plage de caractères).<br>";
    		szText += "<br><b>Recherches variables</b> : ";
    		szText += "Les critères de recherche peuvent contenir des variables qui dépendent des informations de la session en cours<br>";
    		szText += "$[USER] pour le code de l'utilisateur connecté $[USER], $[PROFIL] pour son profil<br>";
    		szText += "$[DATE_SYSTEME] pour la Date du jour et $[DATE_SYSTEME+X] ou $[DATE_SYSTEME-X] pour la Date du jour +/- X jours  <br>";
    		szText += "Veuillez consulter la documentation utilisateur si vous souhaitez utiliser plus de critères.<br><br>";
    		szText += "Pour les questions enregistrées, vous pouvez mettre des \"variables\" qui seront résolues au lancement de la requête en utilisant les valeurs #?1 à #?50 dans les champs valeurs.<br>";
    		szText += "Lancer la recherche en cliquant sur le bouton \"{LIBELLE_RECHERCHER}\".<br>";
    		szText += "Le bouton \"{LIBELLE_EFFACER}\" permet de vider tous les champs.";
        }
        else
        {
            szText += "Advanced search : </div><BR>";
    		szText += "Compose your search by choosing, for each line<BR>";
    		szText += "- link (and-or-except)<BR>";
    		szText += "- data field between list of data fields of selected document type<BR>";
    		szText += "- operator (Equal-superior-etc...)<BR>";
    		szText += "- search value.<BR>";
    		szText += "Icon <div class='iconvocmono'></div>";
    		szText += "allows to consult the list of possible values for a given data field.<BR>";
    		szText += "Launch the search by clicking on \"{LIBELLE_RECHERCHER}\".";
    		szText += "Click on \"{LIBELLE_EFFACER}\" button to empty all fields.";
        }		
		document.write(szText);
		</SCRIPT>
	</TD>
</TR>
</TABLE>
<br><CENTER><b>{TITRE_TYPEDOC}</b></CENTER><br>
<div style="display:{DISPLAY_TITRE_QUEST};width:50%;text-align:center;margin:auto;">
<span>{LIBELLE_TITRE_QUEST} :</span> <span><b>{POS_QUEST_NOM}</b></span><br>
</div>
<FORM NAME=principal  ACTION="{URL_ATTENTE}" onSubmit="return Verif_form();" method="POST">
<INPUT TYPE=HIDDEN NAME=URL VALUE="{URL_ACTION_FORM}">

<INPUT TYPE=HIDDEN NAME=URL_ENREG_QUEST VALUE="{URL_ENREG_QUEST}">

<INPUT name="TYPE_RECHERCHE" type="hidden" value="RECHERCHE_ELABOREE">
<INPUT name="POS_TYPEDOC" type="hidden" value="{POS_TYPEDOC}">
<INPUT name="POS_NUMLOC" type="hidden" value="{POS_NUMLOC}">

<INPUT name="POS_ENREG_QUEST" type="hidden" value="1">
<INPUT name="TYPE_BDD" type="hidden" value="{POS_TYPE_BDD}">
<INPUT name="NB_LOC_AFFICHEES" type="hidden" value="{NB_LOC_AFFICHEES}">

<INPUT type="hidden" NAME="MESSAGE_SAISIE_PARENTHESE" VALUE="{MESSAGE_SAISIE_PARENTHESE}">
<INPUT type="hidden" NAME="MESSAGE_CONFIRM_SUPPRESSION_LOC" VALUE="{MESSAGE_CONFIRM_SUPPRESSION_LOC}">

<div id="boxTableauRechercheElaboree">
    <TABLE id="tableauRechercheElaboree" border='0' width="100%" class="tdfond">
		<THEAD>
    	<TR>
    	    <th CLASS='tableau'>&nbsp;</th>
			<th CLASS='tableau'>{LIBELLE_LIEN} </th>
			<th CLASS='tableau'>(</th>
			<th CLASS='tableau'>{LIBELLE_RUBRIQUE} </th>
			<th CLASS='tableau'>{LIBELLE_OP} </th>
			<th CLASS='tableau'>{LIBELLE_VALEUR} </th>
			<th CLASS='tableau' colspan='2'>)</th>
		</TR>
		</THEAD>
		<TBODY>
		<!-- BEGIN LOCUTION -->
		<TR class='lr_{PAIR_OU_IMPAIR}'>
			<TD>
		    <img id="img_suppr_{NUM_LOC}" style="display:{DISPLAY_SUPP_LOC};" onClick="javascript:supprimerLocution('{NUM_LOC}');" src="/{NOM_APPLICATION}/images/icons/supprimer_ligne_croix.gif" VALIGN='middle' BORDER='0'>
            </TD>
    		<TD>
            	<!-- BEGIN LOC_LIEN_0 -->
            	<INPUT type="hidden" name="LIEN_LOC_NUM_0" VALUE="1">&nbsp;
            	<!-- END LOC_LIEN_0 -->
    
            	<!-- BEGIN LOC_LIEN -->
            	<SELECT class="inputChamp" name="LIEN_LOC_NUM_{NUM_LOC}"> 
            	<option value=""></option>
            	<OPTION value="1" {LIEN_SELECTED_1}>{LIBELLE_LIEN_OU} </OPTION>
            	<OPTION value="2" {LIEN_SELECTED_2}>{LIBELLE_LIEN_ET} </OPTION>
            	<OPTION value="3" {LIEN_SELECTED_3}>{LIBELLE_LIEN_SAUF} </OPTION>
    			</SELECT>
            	<!-- END LOC_LIEN -->
        </TD>
        <TD>
        	<INPUT type=hidden name="POS_NB_PAR_OUV_{i}" value="{POS_NB_PAR_OUV}">
        	<INPUT class="inputChamp" type=text name="PAR_OUV_{i}" value="{PAR_OUV}" size=1 onBlur='TransParEnNbPar(this,"OUV")'>
        </TD>
        <TD>
    		<SELECT class="inputChamp" NAME="RUB_LOC_NUM_{i}" style="width: 90%;" onChange="afficheOperateur('{i}');affiche_thesaurus('{i}');afficheLienRubMulti('{i}');afficheRubLie('{i}')">
    		<option></option>
    		<!-- BEGIN LOC_RUB -->
    		<option value="{CODE_RUB}" {SELECTED}>{LIBELLE_RUB} </OPTION>
    		<!-- END LOC_RUB -->
    		</SELECT>
    	</TD>
    	<TD>
    		<select class="inputChamp" NAME="OPE_LOC_NUM_{i}" style="width: 90%;" onChange="affiche_thesaurus('{i}');affiche_valeur2('{i}', this.value);">
    		<option>
    		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    		</option>
    		</select>
    	</TD>
    	<TD nowrap>
    		<INPUT id="RubVal1_{i}" class="inputChamp" type=text name="VAL1_LOC_NUM_{i}" value="{LOC_VAL_VALUE}" size=25>
            <a href="javascript:charger_vocabulaire_rech_elabore(document.principal.POS_TYPEDOC.value, getCodeRubSelected('{i}'),'VAL1_LOC_NUM_{i}')">
			<div class='iconvocmono' id='img_voc_1{i}' title='Vocabulaire'></div></a>
    	</TD>
    	<TD>
    		<span id="Calendrier_{i}_0" style="display:none">
                <a href="javascript:void ouvrir_calendrier('document.principal.VAL1_LOC_NUM_{i}');">
			    <div class='iconcalendrier' title="Voir le calendrier"></div></a>
        	</span>
    	</TD>
    	<TD>
    		<INPUT type=hidden name="POS_NB_PAR_FER_{i}" value="{POS_NB_PAR_FER}">
    		<INPUT class="inputChamp" type=text name="PAR_FER_{i}" value="{PAR_FER}" size=1 onBlur='TransParEnNbPar(this,"FER")'>
    	</TD>
    </TR>
    <TR class='lr_{PAIR_OU_IMPAIR}'>
    <TD></TD>
    	<TD colspan=2 CLASS=labelPS align=right>
    	    <span id="LibRubLie_{i}" style="{DISPLAY_RUB_LIE}"> {LIBELLE_LIE} </span>
    	    <span id="LibRubTAb_{i}" style="{DISPLAY_RUB_TAB}"> {LIBELLE_COLONNE} </span>
    	</TD>
    	<TD CLASS=labelPS>
    		<span id="RubLie_{i}" style="{DISPLAY_RUB_LIE}"> 
    	    	<SELECT class="inputChamp" name="RUB_LIE_{i}" style="width: 90%;"  onChange="afficheOperateur('{i}','','TRUE');afficheLienRubMulti('{i}', true);">
    	    	<option></option>
    	    	</SELECT>
    		</span>
    	</TD>
    	<TD CLASS=labelPS align=right>
    	    <span id="LibVal2_{i}" style="{DISPLAY_VAL2}"> {LIBELLE_VALEUR} 2 </span>
    	</TD>
    	<TD CLASS=labelPS colspan=1>
    		<span id="RubVal2_{i}" style="{DISPLAY_VAL2}"> 
    	    	<INPUT class="inputChamp" type=text name="VAL2_LOC_NUM_{i}" value="{LOC_VAL2_VALUE}" size=25>
                <a href="javascript:charger_vocabulaire_rech_elabore(document.principal.POS_TYPEDOC.value, getCodeRubSelected('{i}'),'VAL2_LOC_NUM_{i}')">
				<div class='iconvocmono' id='img_voc_2{i}' title='Vocabulaire'></div></a>
    		</span>
    	</TD>
    	<TD colspan='4'>
    		<span id="Calendrier_{i}_1" style="display:none">
                <a href="javascript:void ouvrir_calendrier('document.principal.VAL2_LOC_NUM_{i}');">
			    <div class='iconcalendrier' title="Voir le calendrier"></div></a>
        	</span>
    	</TD>
    </TR>
    <TR class='lr_{PAIR_OU_IMPAIR}' >
        <TD colspan='5' CLASS=labelPS align=right>
    	    <span id="LibLienMulti_{i}" style="{DISPLAY_LIEN_MULTI}">{LIBELLE_LIEN_ENTRE_CHAMPS}</span>
    	</TD>
    	<TD colspan='3' CLASS=labelPS>
    		<span id="LienMulti_{i}" style="{DISPLAY_LIEN_MULTI}">
    	    	<SELECT class="inputChamp" name="LIEN_TYPE_MULTI_LOC_NUM_{i}">
    	    	    <OPTION value="2" {LIEN_MULTI_SELECTED_2}>{LIBELLE_LIEN_ET}</OPTION>
    	        	<OPTION value="1" {LIEN_MULTI_SELECTED_1}>{LIBELLE_LIEN_OU}</OPTION>
    	        	<OPTION value="3" {LIEN_MULTI_SELECTED_3}>{LIBELLE_LIEN_SAUF}</OPTION>
    	    	</SELECT>
    		</span>
    	</TD>
    </TR>
    <TR class='lr_{PAIR_OU_IMPAIR}' style='border-bottom: 1px solid gray'>
    	<TD colspan='2' style='border-bottom: 1px solid gray'></TD>
    	<TD colspan='6' CLASS=labelPS style='border-bottom: 1px solid gray'>
    		<span id="thes_{i}" style="{DISPLAY}">
    			Code thésaurus
    	    	<SELECT class="inputChamp" name="CODE_THES_LOC_NUM_{i}" onChange="init_profondeur('{i}')">
    	        	<OPTION value="0" {SELECTED_0}>Aucun</OPTION>
    	        	<OPTION value="1" {SELECTED_1}>Père</OPTION>
    	        	<OPTION value="2" {SELECTED_2}>Fils</OPTION>
    	        	<OPTION value="4" {SELECTED_4}>Termes associés</OPTION>
    	    	</SELECT>
    			Profondeur
    		    <INPUT class="inputChamp" name="PFD_THES_LOC_NUM_{i}" type=text value="{LOC_PFDTHES_VALUE}" size=2 maxlength=2>
    			Synonyme
    			<INPUT name="TYPE_THE_{i}" type="hidden">
    		    <INPUT name="SYN_THES_LOC_NUM_{i}" type="checkbox" {LOC_SYNTHES_CHECKED}>
    		    <A HREF="javascript:charger_thesaurus_elaboree(document.principal.TYPE_THE_{i}.value,document.principal.RUB_LOC_NUM_{i}.options[document.principal.RUB_LOC_NUM_{i}.selectedIndex].value, 'document.principal.VAL1_LOC_NUM_{i}')">
    			<IMG class="iconvocmono" SRC="/{NOM_APPLICATION}/images/icons/vocab.gif" title="Vocabulaire"></A>
    		</span>
    	</TD>
    </TR>
<SCRIPT type="text/javascript">
    // on conserve les operateurs (dans le rappel de la question) pour le chargement de la page.
    operateurSelected_{i} = '{OPERATEUR_SELECTED}';
    
    // pour les locutions simple.
    afficheOperateur('{i}', '{OPERATEUR_SELECTED}');
    
    // thesaurus
    affiche_thesaurus('{i}');

    // appel a la fonction pour visualiser les rub liees si on est au chargement de la page.
    afficheRubLie('{i}','{RUB_LIE_SELECTED}');
</SCRIPT>
<!-- END LOCUTION -->
	</TBODY>
    </TABLE>
</div>

<div id="boxBtnTableauRechercheElaboree">
<INPUT class="bouton" TYPE=button VALUE="{LIBELLE_ENREG_QUEST}" onClick="EnregQuest()">
<INPUT class="bouton_sub" TYPE=submit VALUE="{LIBELLE_RECHERCHER}">
<INPUT class="bouton" TYPE=reset VALUE="{LIBELLE_EFFACER}" onclick='location="{URL_RESET_FORM}?POS_TYPEDOC={POS_TYPEDOC}"'>
<input type='button' class='bouton' value='{LIBELLE_FERMER}' onClick="fermeture();">           
</div>

</FORM>
</BODY>
</HTML>