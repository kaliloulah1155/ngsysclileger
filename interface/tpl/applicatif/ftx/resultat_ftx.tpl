<!DOCTYPE html>
<HTML>
<HEAD>
    <TITLE>{TITRE_PAGE}</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/ftx.css">
    <!--necessaire pour action_liste_reponse.js -->
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="/{NOM_APPLICATION}/include/script/action_liste_reponse.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="/{NOM_APPLICATION}/include/script/action_ftx.js"></SCRIPT>
    <SCRIPT type="text/javascript" SRC="/{NOM_APPLICATION}/include/script/navigation.js"></SCRIPT>
	<SCRIPT type="text/javascript">
    // attention ci-dessus, defaut lie a la presence de la methode getContentContextMenu
    // dans les 2 fichiers action_liste_reponse et action_ftx : l'ordre est important 
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    	
    sitems[0]="{CONSULT_FICHE}";
    sitemlinks[0]="openFiche()";
    sitems[1]="{CONSULT_NATIF}";
    sitemlinks[1]="onConsulterNatif()";
    sitems[2]="{CONSULT_OCC}";
    sitemlinks[2]="onConsulterOcc()";
    sitems[3]="{LIBELLE_AJOUTER_PANIER}";
    sitemlinks[3]="onAjouterPanier()";
    
    // gestion de la navigation entre les documents en réponse.
    var tabNumDoc = new Array();
    <!-- BEGIN TAB_NUM_DOC -->
    tabNumDoc[{CPT_NUM_DOC}]="{NUM_DOC}";
    <!-- END TAB_NUM_DOC -->
    
    var iCurrentPos = 0;
    function getCurrentPage()
    {
    	return {CURRENT_PAGE};
    }
    
    function getNbRepParPage()
    {
    	return {NB_REPONSES_PAR_PAGE};
    }
    
    function getNbPage()
    {
    	return {TOTAL_PAGE};
    }
    
    function getTableauNumDoc()
    {
    	return tabNumDoc ;
    }
    
    function actualiser()
    {}
    
    function initEcran() {
        document.principal.POS_QUESTION_NEW.focus();
        parent.setTitle();
    }
    function changerPage(numPage)
    {
        var szUrl = document.principal.URL_ATTENTE.value + "?URL=" + document.principal.URL_RECHERCHE_FTX.value;
        szUrl += "&"+document.principal.SZ_RECHERCHE.value;
        szUrl += "&POS_NUMPAGE=" + numPage;
        szUrl += "&MODE_NAVIGATION=" + document.principal.MODE_NAVIGATION.value;
        szUrl += "&TYPE_NAVIGATION=" + document.principal.TYPE_NAVIGATION.value;
        location.href=szUrl;
        return false;
    }
    function updateMenu() 
    {
    	if ({IS_NEW_QUESTION})
            parent.updateMenuAddQuestion('{TITRE_NEW_QUEST_NB_REP}', '{NUM_NEW_QUEST}', '{NBREP_NEW_QUEST}', '{TYPE_QUESTION}');
    } 
    </SCRIPT>
</HEAD>

<BODY  onLoad="initEcran();updateMenu();">
<FORM NAME='principal' method='post' onSubmit="return onRechercher();">
<div>
<INPUT TYPE=hidden NAME=SZ_RECHERCHE VALUE="{SZ_RECHERCHE}">
<INPUT TYPE=hidden NAME=NO_DOC_SUIVANT VALUE="{MESSAGE_NO_DOC_SUIVANT}">
<INPUT TYPE=hidden NAME=NO_DOC_PRECEDENT VALUE="{MESSAGE_NO_DOC_PRECEDENT}">
<INPUT TYPE=hidden NAME=URL_CONSULT VALUE="{URL_CONSULT}">
<INPUT TYPE=hidden NAME=B_CONFIRM_FERMETURE_DOC VALUE="{B_CONFIRM_FERMETURE_DOC}">
<INPUT TYPE=hidden NAME=LIBELLE_FERM_FICHE VALUE="{LIBELLE_FERM_FICHE}">

<INPUT TYPE=hidden NAME=URL_CONSULT_INDEX VALUE="{URL_CONSULT_INDEX}">
<INPUT TYPE=hidden NAME=URL_CONSULT_OCC VALUE="{URL_CONSULT_OCC}">
<INPUT TYPE=hidden NAME=URL_CONSULT_NATIF VALUE="{URL_CONSULT_NATIF}">
<INPUT TYPE=hidden NAME=URL_RECHERCHE_FTX VALUE="{URL_RECHERCHE_FTX}">
<INPUT TYPE=hidden NAME=URL_AFFICHER_RECHERCHE_FTX VALUE="{URL_AFFICHER_RECHERCHE_FTX}">
<INPUT TYPE=hidden NAME=URL_ATTENTE VALUE="{URL_ATTENTE}">
<INPUT type='hidden' NAME="MODE_NAVIGATION" VALUE="">
<INPUT type='hidden' NAME="TYPE_NAVIGATION" VALUE="">
<BR>
<!-- BEGIN BLOC_GENERAL -->
<div style="margin:auto;width: 70%;text-align:center;">
    {LIBELLE_AFFINER_RECHERCHE}&nbsp;&nbsp; <INPUT class="inputChamp" TYPE=TEXT NAME=POS_QUESTION_NEW VALUE="{POS_QUESTION}" size=40>
    &nbsp;&nbsp;<INPUT TYPE=button class="bouton"  id="btn_rechercher" VALUE="{LIBELLE_RECHERCHER}" onClick="javascript:void onRechercher();">
    &nbsp;&nbsp;&nbsp;<INPUT TYPE=button class="bouton" VALUE="{LIBELLE_AFFINER_RECHERCHE_TOUS_CRITERES}" onClick="javascript:void onModifierCriteres();">
</div>
<BR> 
 
<div class="entete" style='height: 20px;vertical-align: center;padding-top: 10px;margin-bottom: 10px;'>
    <div style="float: left;vertical-align: center;">{QUESTION_RECHERCHEE}</div> 
    <div style="float: right;vertical-align: center;">{NB_REPONSES}</div>
</div>
<div style="margin:auto;width: 70%;text-align:center;">
    <b>{PAGE_LIBELLE}</b>&nbsp;
    <A style='display: {AFFICHE_PAGES_PRECEDENTES}' id="page_{PAGE_PRECEDENTE}" href='javascript:changerPage({PAGE_PRECEDENTE});'><IMG src="../../../../images/bouton/prec.gif" title='{CST_LIBELLE_PAGE_PRECEDENTE}' border=0></A>
    <!-- BEGIN PAGE -->
    <span class='numeroPage{PAGE_SELECTED}'>&nbsp;<A id="page_{NUMERO_DE_PAGE}" href="javascript:changerPage({NUMERO_DE_PAGE});" aria-label='{CST_LIBELLE_PAGE_NO} {NUMERO_DE_PAGE}' title='{CST_LIBELLE_PAGE_NO} {NUMERO_DE_PAGE}'>{NUMERO_DE_PAGE}</A>&nbsp;</span>
    <!-- END PAGE -->
    <A style='display: {AFFICHE_PAGES_SUIVANTES}' id="page_{PAGE_SUIVANTE}" href='javascript:changerPage({PAGE_SUIVANTE});'><IMG src="../../../../images/bouton/suiv.gif" title='{CST_LIBELLE_PAGE_SUIVANTE}' border=0></A>
</div>
<TABLE style='width: 100%;'>
<!-- BEGIN BLOC_REPONSE -->
<TR class="line-bib" data-line="{PAIR_OU_IMPAIR}" onclick="selectLigneExc(event, this, '{POS_INFO_DOC}', '{B_FICHIER}');" >
    <TD>
    	<div class='info'>{CHAMP_LR}</div>
        <div class='occurrence'>{OCCURRENCE}</div>
        <div class='divers'>
            {OCCURRENCE_PERTINENCE} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <A data-menu="no" class="lien_resultat" href="javascript:void openFiche('{POS_INFO_DOC}')" >{CONSULT_FICHE}</A> -
            <!-- BEGIN LIEN_CONSULT_SI_FICHIER -->
            <span style="display:{DISPLAY_SI_SOUS_PAGE}"><A data-menu="no" class="lien_resultat" href="javascript:void onConsulterFichierPrincipal('{POS_INFO_DOC}')" >{CONSULT_FICHIER_PRINCIPAL}</A> -</span>
            <A data-menu="no" class="lien_resultat" href="javascript:void onConsulterNatif('{POS_INFO_DOC}')" >{CONSULT_NATIF} </A> -
            <A data-menu="no" class="lien_resultat" href="javascript:void onConsulterOcc('{POS_INFO_DOC}')" >{CONSULT_OCC}</A>
            <!-- END LIEN_CONSULT_SI_FICHIER --> 
			<!-- BEGIN LIEN_CONSULT_SIPAS_FICHIER -->
            <A data-menu="no" class="lien_resultat_grise" href="javascript:alert('{CST_MSG_NO_FILE_ASSOCIE}');">{CONSULT_NATIF}</A> -
            <A data-menu="no" class="lien_resultat_grise" href="javascript:alert('{CST_MSG_NO_FILE_ASSOCIE}');">{CONSULT_OCC}</A>
            <!-- END LIEN_CONSULT_SIPAS_FICHIER --> -
            <A data-menu="no" class="lien_resultat" href="javascript:void onAjouterPanier('{POS_INFO_DOC}')" >{LIBELLE_AJOUTER_PANIER}</A>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </div>
    </TD>
</TR>
<!-- END BLOC_REPONSE -->
</TABLE>
<script>
{SCRIPT_OUVRIR_REPONSE_NAVIGATION}
</script>
<!-- END BLOC_GENERAL -->
</div>
</FORM>
</BODY>
</HTML>
