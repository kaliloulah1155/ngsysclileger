<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<title>{TITRE_QUESTION}&nbsp;({NB_REPONSES})</title>
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="/{NOM_APPLICATION}/include/script/jquery/jquery.contextmenu.css"/>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/yui/build/yahoo-dom-event/yahoo-dom-event.js"></SCRIPT>
<SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
<SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-ui.min.js"></SCRIPT>
<script type="text/javascript" src='../../../../include/script/jquery/jquery.contextmenu.js'></script>
<SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
<SCRIPT language="javascript" SRC="../../../../include/script/action_liste_reponse.js"></SCRIPT>
<SCRIPT language="javascript" SRC="../../../../include/script/navigation.js"></SCRIPT>
<SCRIPT language="javascript" SRC="../../../../include/script/attente_fichier.js"></SCRIPT>

<SCRIPT language="javascript">
function updateMenu() 
{
    if ({IS_NEW_QUESTION})
    {
        parent.updateMenuAddQuestion('{TITRE_NEW_QUEST_NB_REP}', '{NUM_NEW_QUEST}', '{NBREP_NEW_QUEST}', '{TYPE_QUESTION}');
    }
    
    var i = 0;
    var tabFils = new Array();
    
    <!-- BEGIN FILS -->
    tabFils[i++] = "{TITRE_DOS}|-|{POS_NUMDOC}";
    <!-- END FILS -->
  
    if (tabFils.length > 0)  
        parent.updateMenu(tabFils);
}  

var existOpener = true;
function actualiser()
{
    document.principal.submit();
}

function fermer(mode, numDoc)
{
    if (mode == "MODIFICATION")
    {
        if(CST_TYPE_APPLI == 2)
            url = "../../../../servlet/interface/session/principal/consultation.FermerIndex?MODE="+mode+"&POS_NUM_DOC="+numDoc;
        else
            url = "/{NOM_APPLICATION}/interface/session/principal/consultation/fermer_index.php?MODE="+mode+"&POS_NUM_DOC="+numDoc;
        actualiser();
    }
}

// gestion de la navigation entre les documents en reponse.
var tabNumDoc = new Array();
<!-- BEGIN TAB_NUM_DOC -->
tabNumDoc[{CPT_NUM_DOC}]="{NUM_DOC}";
<!-- END TAB_NUM_DOC -->

function getCurrentPage()
{
    return {CURRENT_PAGE};
}

function getNbPage()
{
    return {TOTAL_PAGE};
}

function getTableauNumDoc()
{
    return tabNumDoc;
}

// Liste des boutons
var sitems=new Array();
<!-- BEGIN BOUTON -->
sitems.push({libelle: "{LIBELLE_FONCTION}",
            fonction: "{FONCTION}",
            icone: "{ICONE}"});
<!-- END BOUTON -->

function FindXY(obj){

    var x=0,y=0;
    while (obj!=null){
        x+=obj.offsetLeft-obj.scrollLeft;
        y += obj.offsetTop;
        obj=obj.offsetParent;
    }
    y -= getScrollTop();
    return {x:x, y:y};
}

var iNumDragEnCours = 0;
var iNbDocParPage = {NB_REPONSES_PAR_PAGE};
function initObjetsDrag()
{
    parent.clearObjetsDrag();
}
    

function initEcran()
{
    //if ({IS_DRAG_AND_DROP})
    //    initObjetsDrag();
    parent.setTitle();
    afficherArborescence();
    afficherListeFichiers();
    
    $('#tablelr').dataTable({
            processing: true,
            serverSide: false,
            searchDelay: 1000,
            orderCellsTop: false,
            order: [], // fixe une anomalie sur le tri
            language: {
                info:           "",
                infoEmpty:      "",
                infoFiltered:   "",
                infoPostFix:    "",
                loadingRecords: "Chargement en cours...",
                zeroRecords:    "",
                emptyTable:     "",
            },
            columnDefs: [
                {"sortable": false, targets: '_all'} 
            ],
            paging: false,
            //sorting: false,
            searching: false,
            scrollY: '65vh',
            scrollX: true,
            //scrollX: '95%', // do not put or scroll is far away from table
            scrollCollapse: true
    });
    // evite le passage du focus sur des zones masquees
    $('.dataTables_scrollBody thead *').each(function () { $(this).attr('tabindex', -1); }); 
    /*
    $("#tablelr tbody tr").draggable({
        helper: "clone",
        iframeFix: true,
    });
    */
    /*
    $('#tablelr').contextPopup({
        trigger: 'left',
        items: customMenu()
    });
    */
    $(window).on('resize', function () {
        $('#tablelr').dataTable().fnAdjustColumnSizing();
        // evite le passage du focus sur des zones masquees
        $('.dataTables_scrollBody thead *').each(function () { $(this).attr('tabindex', -1); });
    });
    
    //$( "#tablelr tbody tr").contextmenu(eventOnTabLine);
    $("#tablelr tbody tr").on("contextmenu", eventOnTabLine);
    $("#tablelr tbody tr").on("click", eventOnTabLine); 
    
    function eventOnTabLine(evt) {
        var _this = $(this);
        if($(this).find("td input[name^='POS_PANIER']")[0]) {
        
            szInfos = $(this).find("td input[name^='POS_PANIER']")[0].value;
            selectLigne(evt, this, szInfos);
        }
        // Cancel event, so real browser popup doesn't appear.
        if (evt.type == "contextmenu")
            return false;
        else
            stopEvent(evt);
    }
    $("#page_" + document.principal.POS_NUMPAGE.value).focus(); 
}

function afficherArborescence()
{
    var s = parent.getFlatTree();
    // it seems that it be always the case, even if a question is selected in home page, the node tree is selected before calling
    if (s.length != 0) {
        s = "&nbsp;&nbsp;" + s.replace("zzz_nbrep", document.getElementById('sp_nb_reponse').innerHTML) + "&nbsp;";
        document.getElementById("cellule_arborescence").innerHTML = s;
    }
    else
        document.getElementById("info_question").style.display = "";
}

function closeEcran()
{
    if ({IS_DRAG_AND_DROP})
        parent.clearObjetsDrag();
}

function closeCtxMenu()
{
    hide_popup_menu();
}

function onMouseOverIcone(objImg, numdoc)
{
    if ({IS_DRAG_AND_DROP})
    {
        var pt = FindXY(objImg);
        var decalageY;
        var decalageX;
        decalageY = (parent.isModeOnglet == 1) ? -26 : 1;
        decalageX = (parent.isModeOnglet == 1) ? -15 : -10;
        if (objImg.src.indexOf("folder.gif") > 0)
        {
            isFolder = true;
            parent.document.getElementById('dd-demo-0').src = "/{NOM_APPLICATION}/images/icons/folder.gif";
        }
        else
        {
            isFolder = false;
            parent.document.getElementById('dd-demo-0').src = "/{NOM_APPLICATION}/images/dragdrop/doc.gif";
        }
        
        parent.document.getElementById('dd-demo-0').style.display = "";
        parent.document.getElementById('dd-demo-0').style.cursor = "move";
        parent.document.getElementById('dd-demo-0').style.top = (pt.y - decalageY + parent.document.getElementById('div_center').offsetTop + parent.document.getElementById('container_onglet').offsetTop + parent.document.getElementById('container').offsetTop) + "px";
        parent.document.getElementById('dd-demo-0').style.left = (pt.x  - decalageX + parent.document.getElementById('div_center').offsetLeft  + parent.document.getElementById('container_onglet').offsetLeft + parent.document.getElementById('container').offsetLeft) + "px";
        parent.document.getElementById('dd-demo-0').style.display = "";
        parent.document.getElementById('dd-demo-0').posNumDoc = numdoc;
        
        //console.log("offsetTop:" + parent.document.getElementById('div_center').offsetTop);
        //console.log("offsetLeft:" + parent.document.getElementById('div_center').offsetLeft);   
    }
}

function affichageSpeLignes() 
{
   // la table
    var tablelr = document.getElementById("tablelr");
    var nbCells = 0;
    // les lignes de la table
    var ligneslr = tablelr.rows;

    var iInitCptBoucle = 1;
    if (document.getElementById('tr_filtre_entete'))
       iInitCptBoucle = 2;
    // affichage icone de couleur en fonction de la valeur de la rubrique "Statut"
    var iNumCelluleNature = -1;
    var cellsLigneEntete = ligneslr[0].cells;
    for (i=1;i<cellsLigneEntete.length;i++)
    {
       if(cellsLigneEntete[i].id.indexOf("rub10") != -1)
       {
           iNumCelluleNature = i;
           break;
       }
    }
    
    if (iNumCelluleNature != -1)
    {   
        // si colspan entete = 2
        //iNumCelluleNature++;
        for (i=iInitCptBoucle;i<tablelr.rows.length;i++) 
        {
            var cellulesLigne = tablelr.rows[i].cells;
            
            var szTexte = cellulesLigne[iNumCelluleNature].innerHTML;
            var iTexte = parseInt(szTexte, 10);
            var s = "<center data-menu='no'>";
            /*
            if (iTexte > 0)
            {
                s += "<A HREF=\"javascript:AfficherFichierPdfLR("+tabNumDoc[(i-iInitCptBoucle)] +", 'phpsessid', '0');\">";
                s += "<img src='/ratp-etudes-ged/images/menu/win/pdf.gif' border='0'></A>&nbsp;";
            }
            */
            // affichage d'un lien par fichier 
            for(var j=1;j<=iTexte;j++)
            {
                s += "<A data-menu='no' title='T�l�charger le fichier' HREF=\"javascript:AfficherFichierLR("+tabNumDoc[(i-iInitCptBoucle)]+",'"+j+"','0','phpsessid','CONSULTATION','','1');\">";
                s += "<u data-menu='no' >" + j +"</u>" + "</A>&nbsp;";
            }
            s += "</center>";
            
            cellulesLigne[iNumCelluleNature].innerHTML = s;
            cellulesLigne[iNumCelluleNature].setAttribute("data-menu", "no");
        }
    }
}

function affinerRecherche(codeRubrique)
{
    var valeurFiltre = document.getElementById("FILTRE_" + codeRubrique).value;
    if (valeurFiltre.length != 0)
    {
        document.principal.FILTRE.value = "1";
        document.principal.RUB_FILTRE.value = codeRubrique;
        document.principal.VALEUR_FILTRE.value = valeurFiltre;
        document.principal.submit();
    }
    else
    {
        alert(document.principal.LIBELLE_ATTENTE_SAISIE_VALEUR_FILTRE.value);
        eval("document.principal.FILTRE_" + codeRubrique).focus();
    }
}

function changerPage(numPage)
{
    document.principal.POS_NUMPAGE.value = numPage;
    document.principal.submit();
}

function changerProfil()
{
    // reinitialise la colonne de tri
    document.principal.POS_LR_TRI_NUMCOL.value = "1";
    document.principal.submit();
}

function changerTri(typeTri, colonneTri)
{
    document.principal.POS_LR_TRI_TYPE.value = typeTri;
    document.principal.POS_LR_TRI_NUMCOL.value = colonneTri;
    document.principal.submit();
}

function onKeyUpFiltre(evenement, codeRubrique)
{
    var touche = window.event ? evenement.keyCode : evenement.which;
    if (touche == 13) {     // TOUCHE " ENTRER "
        affinerRecherche(codeRubrique);
    }
}

// For all major browsers, except IE 8 and earlier
if (document.addEventListener) {      
    document.addEventListener("click", bodyClickEvent);
}


function bodyClickEvent() {
    //console.log("bodyClickEvent");
    if ($("input.checkbox_select_doc:checked").length == 0) {
        unhighlightElement(oldElement);
        closeCtxMenu();
    }
}

</SCRIPT>
</HEAD>

<BODY  topmargin="0" leftmargin="0" onLoad="affiche_boutons();updateMenu();{MAJ_BAL};initEcran();{SCRIPT_OUVRIR_REPONSE_UNIQUE};" onUnload="javascript:closeEcran();">
    <title>{TITRE_QUESTION}&nbsp;({NB_REPONSES})</title>
<!--affichage du nombre de resultat-->
<FORM NAME="principal" ACTION="{URL_ATTENTE}" method="POST" onSubmit="return false;">
<INPUT type='hidden' NAME=URL VALUE="{URL_RESULTAT}">
<INPUT type='hidden' NAME=ECRAN VALUE="LISTE_REPONSES">
<INPUT type='hidden' NAME=INUMQUEST VALUE="{INUMQUEST}">
<INPUT type='hidden' NAME=POS_TYPEDOC VALUE="{POS_TYPEDOC}">
<INPUT type='hidden' NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_REP}">
<INPUT type='hidden' NAME=MESSAGE_SUPP_DOC VALUE="{MESSAGE_SUPP_DOC}">
<INPUT type='hidden' NAME=MESSAGE_SELECT_PANIER VALUE="{MESSAGE_SELECT_PANIER}">
<INPUT type='hidden' NAME=MESSAGE_RENSEIGNER_DOSSIER_PERE VALUE="{MESSAGE_RENSEIGNER_DOSSIER_PERE}">
<INPUT type='hidden' NAME=LIBELLE_ATTENTE_SAISIE_VALEUR_FILTRE VALUE="{LIBELLE_ATTENTE_SAISIE_VALEUR_FILTRE}">
<INPUT type='hidden' NAME=PHPSESSID VALUE="{PHPSESSID}">

<INPUT type='hidden' NAME=POS_QUEST_NOM VALUE="{POS_QUEST_NOM}">
<INPUT type='hidden' NAME=NO_DOC_SUIVANT VALUE="{MESSAGE_NO_DOC_SUIVANT}">
<INPUT type='hidden' NAME=NO_DOC_PRECEDENT VALUE="{MESSAGE_NO_DOC_PRECEDENT}">
<INPUT type='hidden' NAME=URL_CONSULT VALUE="{URL_CONSULT}">
<INPUT type='hidden' NAME=B_CONFIRM_FERMETURE_DOC VALUE="{B_CONFIRM_FERMETURE_DOC}">
<INPUT type='hidden' NAME=LIBELLE_FERM_FICHE VALUE="{LIBELLE_FERM_FICHE}">
<INPUT type='hidden' NAME=LIBELLE_DOC_SELECT VALUE="{LIBELLE_DOC_SELECT}">
<INPUT type='hidden' NAME=LIBELLE_DOCS_SELECTS VALUE="{LIBELLE_DOCS_SELECTS}">

<INPUT type='hidden' NAME=POS_NUMDOS VALUE="{POS_NUMDOS}">
<INPUT type='hidden' NAME=POS_TITREDOS VALUE="{POS_TITREDOS}">
<INPUT type='hidden' NAME=POS_LR_TRI_TYPE VALUE="{POS_LR_TRI_TYPE}">
<INPUT type='hidden' NAME=POS_LR_TRI_NUMCOL VALUE="{POS_LR_TRI_NUMCOL}">
<INPUT type='hidden' NAME=POS_INDICE_DOS_ARBO VALUE="{POS_INDICE_DOS_ARBO}">
<INPUT type='hidden' NAME=POS_NUMPAGE VALUE="{POS_NUMPAGE}">
<INPUT type='hidden' NAME=TYPE_RECHERCHE VALUE="{TYPE_RECHERCHE}">

<INPUT type='hidden' NAME="FILTRE" VALUE="">
<INPUT type='hidden' NAME="RUB_FILTRE" VALUE="">
<INPUT type='hidden' NAME="VALEUR_FILTRE" VALUE="">
<INPUT type='hidden' NAME="MODE_NAVIGATION" VALUE="">
<INPUT type='hidden' NAME="TYPE_NAVIGATION" VALUE="">
<INPUT type='hidden' NAME="POS_FIRSTLOAD" VALUE="0">
<INPUT type='hidden' NAME="NB_REPONSES" VALUE="{NB_REPONSES}">
<INPUT type='hidden' NAME="AFFICHER_FICHIER_DANS_LR_COL_NAME" VALUE="{AFFICHER_FICHIER_DANS_LR_COL_NAME}">
<span id='sp_nb_reponse' style="display: none;">{NB_REPONSES}</span>

<br/>
<TABLE role='presentation' border="0" align="left" cellpadding="0" cellspacing="0" width="100%" style="margin-bottom: 5px;">
<TR>
    <TD class=labelChamp id='cellule_arborescence'></TD>
    <TD class=labelChamp id='info_question' style='display: none;'>&nbsp;&nbsp;<b>{CHEMIN} &nbsp;:&nbsp;</b>{TITRE_QUESTION}&nbsp;({NB_REPONSES})</TD>
    <TD width="100%" align="right">{URL_RAPPEL}</TD>
</TR>
</TABLE>
<br clear=left>
{AFFICHE_LIBELLE_DOSSIER_VIDE}
<TABLE role='presentation' border="0" cellpadding="0" cellspacing="0" style="display: {DISPLAY_CHOIX_PROFIL};margin-bottom: 5px;">
<TR>
    <TD class='labelChamp'>&nbsp;&nbsp;<label for='select_choix_profil_lr' class='labelChamp'><b>{LIB_CHOIX_LISTE_RESUMEE} :</b>&nbsp;</label></TD>
    <TD>
        <SELECT class='inputChamp' name='POS_PROFIL_LR' id='select_choix_profil_lr' onChange="changerProfil();">
        <!-- BEGIN BLOC_CHOIX_PROFIL -->
        <OPTION value="{POS_LIB_CHOIX_PROFIL}" {SELECTED}>{POS_LIB_CHOIX_PROFIL}</OPTION>
        <!-- END BLOC_CHOIX_PROFIL -->
        </SELECT>
    </TD>
</TR>
</TABLE>
<!--table Pages-->
<div style='text-align: center;margin-bottom: 5px;'>
    <b>{PAGE_LIBELLE}</b>&nbsp; 
    <A style='display: {AFFICHE_PAGES_PRECEDENTES}' id='page_{PAGE_PRECEDENTE}' href='javascript:changerPage({PAGE_PRECEDENTE});'><IMG src='../../../../images/bouton/prec.gif' title='{CST_LIBELLE_PAGE_PRECEDENTE}' style='margin-bottom: -3px;vertical-align: bottom;'></A>
    <!-- BEGIN PAGE -->
    <span class='numeroPage{PAGE_SELECTED}'>&nbsp;<A id="page_{NUMERO_DE_PAGE}" href="javascript:changerPage({NUMERO_DE_PAGE});" aria-label='{CST_LIBELLE_PAGE_NO} {NUMERO_DE_PAGE}' title='{CST_LIBELLE_PAGE_NO} {NUMERO_DE_PAGE}'>{NUMERO_DE_PAGE}</A>&nbsp;</span>
    <!-- END PAGE -->        
    <A style='display: {AFFICHE_PAGES_SUIVANTES}' id='page_{PAGE_SUIVANTE}' href='javascript:changerPage({PAGE_SUIVANTE});'><IMG src='../../../../images/bouton/suiv.gif' title='{CST_LIBELLE_PAGE_SUIVANTE}' style='margin-bottom: -3px;vertical-align: bottom;'></A>
</div>
<div id='actionsSelection' style='text-align: center;float: right; visibility: hidden;margin-bottom: 5px;'>
<span id='nbDocumentSelect'></span>
<span class='labelselectdoc'></span>
<a href="javascript:void(0);" onClick="javascript:afficheMenuMultiple(event)" id='listeactions'>{LIBELLE_SELECT_ACTION_PLUSIEURS_DOC}</a>
</div>
<!--table Liste des reponses-->
<!-- Nombre de r�ponses : {NB_REPONSES} -->
<div class="container">
<TABLE class='tablelr posdtable' id="tablelr"  width="100%"  style="display:{DISPLAY_TABLE_REPONSE}" >
<caption class="sr-only">{LIBELLE_CAPTION_TABLE_RESULTAT}</caption>
<thead>
<TR>
     <TH class='titrecolonne' tabindex=-1 style="display: none"></TH> 
    <TH class='titrecolonne' id="col_panier" onclick="selectAllPanier(event);" style="text-align: center;cursor: pointer;"><IMG tabindex=0 title="{LIBELLE_SELECT_ALL}" src="/{NOM_APPLICATION}/images/icons/multi_select.png"></TH>
    <!-- BEGIN ENTETE -->
    <TH class='titrecolonne' id="col_{COMPT}_rub{ID_RUBRIQUE}"><A class='lientitrecolonne' HREF="javascript:changerTri({NV_TYPE_TRI}, {NV_COLONNE_TRI});">{TITRE_COLONNE}</A></TH>
    <!-- END ENTETE -->
    <TH class='titrecolonne' tabindex=-1>&nbsp;</TH>
</TR>
<!-- BEGIN FILTRE_ENTETE -->
<TR class="lr_pair" id='tr_filtre_entete'>
        <TD class='titrecolonne' tabindex=-1>&nbsp;</TD>
        <TD class='titrecolonne' tabindex=-1>&nbsp;</TD>
        <!-- BEGIN RUB_FILTRE_ENTETE -->
        <TD nowrap class='titrecolonne' align='left'>
        <!-- BEGIN IS_RUB_FILTRE_ENTETE -->
        &nbsp;&nbsp;<input type='text' id='FILTRE_{CODE_RUBRIQUE}' style='width: calc(100% - 30px)' size='5' onKeyPress="javascript:onKeyUpFiltre(event, '{CODE_RUBRIQUE}');">
        <IMG SRC="/{NOM_APPLICATION}/images/icons/filtre_lr.gif" onClick="javascript:affinerRecherche('{CODE_RUBRIQUE}');">
        <!-- END IS_RUB_FILTRE_ENTETE -->
        <!-- BEGIN NO_RUB_FILTRE_ENTETE -->
        <!-- END NO_RUB_FILTRE_ENTETE -->
        </TD>
        <!-- END RUB_FILTRE_ENTETE -->
        <TD class='titrecolonne'>&nbsp;</TD>
</TR>
<!-- END FILTRE_ENTETE -->
</thead>
<tbody>
<!-- BEGIN LISTE_REPONSES -->
<TR class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-paramurl="{VALUE_RADIO_NUMDOC}"  data-numdoc="{POS_NUMDOC}" id="doc_{POS_NUMDOC}">
    <TD class='listeResumee' align='center' style="display: none">
        <!-- BEGIN TD_DOCUMENT -->
        
        <!-- END TD_DOCUMENT -->

        <!-- BEGIN TD_DOSSIER -->
        
        <!-- END TD_DOSSIER -->
    
    </TD>
    <TD class='listeResumee cellCheckboxLR'  onClick="onSelectPanierElt(event, this);" style="position: relative;">
    <input id="checkbox_lr_{POS_NUMDOC}" onClick="onSelectPanierElt(event, this);" data-menu="no" data-id="{POS_NUMDOC}"  class="checkbox_select_doc" type="checkbox" name="POS_PANIER[]" value="{VALUE_RADIO_NUMDOC}" />
    <span class="label_for_checkbox_select_doc"></span>
    </TD>   
    <!-- BEGIN LR_REPONSE -->
    <TD class='listeResumee' align="{ALIGN}">{ZONE_LR}</TD>
    <!-- END LR_REPONSE -->
    <TD data-menu="no" class='listeResumee' width='20' align='center'>
    <a href="javascript:void(0)" title='Consulter' onclick="onConsulter('{VALUE_RADIO_NUMDOC}');"><IMG SRC="/{NOM_APPLICATION}/images/icons/lr_consulter.png"></a>
    </TD>
</TR>
<!-- END LISTE_REPONSES -->
</tbody>
</TABLE>
<!--
<br>
<div style='text-align: center'>
<b>{PAGE_LIBELLE}</b>&nbsp;
    <A style='display: {AFFICHE_PAGES_PRECEDENTES}' id='page_{PAGE_PRECEDENTE}' href='javascript:changerPage({PAGE_PRECEDENTE});'><IMG src='../../../../images/bouton/prec.gif' title='{CST_LIBELLE_PAGE_PRECEDENTE}' style='margin-bottom: -3px;vertical-align: bottom;'></A>
    {LIEN_PAGE_PRECEDENTE}
      {page}
    {LIEN_PAGE_SUIVANTE}
    <A style='display: {AFFICHE_PAGES_SUIVANTES}' id='page_{PAGE_SUIVANTE}' href='javascript:changerPage({PAGE_SUIVANTE});'><IMG src='../../../../images/bouton/suiv.gif' title='{CST_LIBELLE_PAGE_SUIVANTE}' style='margin-bottom: -3px;vertical-align: bottom;'></A>
</div>
<BR>
-->
<div style='text-align: center;display: none'>
        <SCRIPT language="javascript">              
        document.write("<DIV id='bouton'></DIV>");
        </SCRIPT>
</div>
</div>
</FORM>
</BODY>
</HTML>


