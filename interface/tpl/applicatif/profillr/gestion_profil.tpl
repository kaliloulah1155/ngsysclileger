<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_profillr.js"></SCRIPT>
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="/{NOM_APPLICATION}/include/script/jquery/jquery.contextmenu.css"/>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <script type="text/javascript" src='../../../../include/script/jquery/jquery.contextmenu.js'></script>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>

<SCRIPT language="javascript">

function actualiser()
{
	window.location.href="{LIEN_ACTUALISATION}";
}

// Liste des boutons
var sitems=new Array();
var sitemlinks=new Array();

var i = 0;
<!-- BEGIN BOUTON -->
sitems[{CPT}]="{LIBELLE_FONCTION}";
sitemlinks[{CPT}]="{FONCTION}";
<!-- END BOUTON -->

function initEcranGestionProfil()
{
    affiche_boutons();
    parent.setTitle();
    $('#table_liste_utils').dataTable({
        processing: true,
    	serverSide: false,
    	searchDelay: 1000,
        orderCellsTop: false,
        order: [], // fixe une anomalie sur le tri
        language: {
            lengthMenu:    "Afficher _MENU_ d&eacute;p&ocirc;ts",
            loadingRecords: "...",
            zeroRecords:    "-",
            infoFiltered:   "",
            info:           "",
        },
        columnDefs: [
            {"sortable": false, targets: '_all'} 
        ],
        paging: false,
        searching: false,
        scrollY: '400px',
        scrollX: true,
        scrollCollapse: true
    });
    $("#table_liste_utils tbody tr").on("contextmenu", eventOnTabLine);
    $("#table_liste_utils tbody tr").on("click", eventOnTabLine);
    function eventOnTabLine(evt) {
        selectLigneProfil(event, this, $(this).data('info'), $(this).data('actif'), $(this).data('auto'), $(this).data('public'));
        // Cancel event, so real browser popup doesn't appear.
        return (evt.type == "contextmenu") ? false : true;
    }
    $(window).on('resize', function () {
        $('#table_liste_utils').dataTable().fnAdjustColumnSizing();
    });
    window.focus();
}
</SCRIPT>
</head>

<body onLoad="initEcranGestionProfil();">
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_REP}">
<input TYPE=hidden NAME=MESSAGE_NO_DROIT_ACTIVER_PROFIL VALUE="{MESSAGE_NO_DROIT_ACTIVER_PROFIL}">
<input TYPE=hidden NAME=MESSAGE_SUPP_PROFIL_LR VALUE="{MESSAGE_SUPP_PROFIL_LR}">
<input TYPE=hidden NAME=MESSAGE_NO_DROIT_SUPP_PROFIL_LR VALUE="{MESSAGE_NO_DROIT_SUPP_PROFIL_LR}">
<input TYPE=hidden NAME=MESSAGE_NO_DROIT_AJOU_PROFIL_LR VALUE="{MESSAGE_NO_DROIT_AJOU_PROFIL_LR}">
<input TYPE=hidden NAME=MESSAGE_NO_DROIT_MODIF_PROFIL_LR VALUE="{MESSAGE_NO_DROIT_MODIF_PROFIL_LR}">
<input name="POS_ADMIN" type="hidden" value="{POS_ADMIN}">
<input name="POS_ADMIN_PROFIL" type="hidden" value="{POS_ADMIN_PROFIL}">
<h1>{TITRE_PAGE}</h1>
<table id='table_liste_utils' class='posdtable' style='width:100%;'>
<thead>
	<tr>
        <th class="tableau" ></th>
		<th class="tableau">{LIBELLE_ENT_PROFIL}</th>
		<th class="tableau">{LIBELLE_ENT_TYPE_DOC}</th>
		<th class="tableau">{LIBELLE_ENT_ACTIF_TYPE}</th>
		<th class="tableau">{LIBELLE_ENT_PUBLIC}</th>
		<th class="tableau">{LIBELLE_ENT_AUTO}</th>
	</tr>
</thead>
<tbody>
<!-- BEGIN BLOC_PROFIL -->
	<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_STRU_PROFIL}' data-actif='{B_ACTIF}' data-auto='{B_AUTO}' data-public='{B_PUBLIC}'">
		<td data-menu="no" ><input data-menu="no" TYPE="RADIO" NAME="INFO_STRU_PROFIL" VALUE="{POS_INFO_STRU_PROFIL}"></td>
		<td>{POS_LIBELLE_PROFIL}</td>
		<td>{POS_LIBELLE_TYPE_DOC}</td>
		<td>{POS_LIBELLE_ACTIF_TYPE}</td>
		<td>{POS_LIBELLE_PUBLIC}</td>
		<td>{POS_LIBELLE_AUTO}</td>
	</tr>
<!-- END BLOC_PROFIL -->
</tbody>
</table>	

<div style="margin:auto;width: 70%;text-align:center;margin-top:10px;">
<SCRIPT language="javascript">              
	document.write("<DIV id='bouton'></DIV>");
</SCRIPT>
</div>
</form>
</body>
</html>
