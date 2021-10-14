<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_nature.js"></SCRIPT>
    <SCRIPT language="javascript">
    
    function actualiser()
    {
    	window.location.href="{LIEN_ACTUALISATION}";
    }
    
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
	sitems[i]="{LIBELLE_AJOUTER}";
    sitemlinks[i++]="onCreerNature()";
    
//    sitems[i]="<HR>";
   // sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifierNature()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimerNature()";
    
    function initEcranGestionNature()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_natures');
    }

    </SCRIPT>
</head>

<body onLoad="initEcranGestionNature();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_NATURE}">
<input TYPE=hidden NAME=MESSAGE_SUPP_NATURE VALUE="{MESSAGE_SUPP_NATURE}">
<input TYPE=hidden NAME=DROIT_ADMINISTRATION VALUE="{DROIT_ADMINISTRATION}">
<input TYPE=hidden NAME=MESSAGE_NO_ADMINISTRATION VALUE="{MESSAGE_NO_ADMINISTRATION}">
<input TYPE=hidden NAME=URL_TRI VALUE="{LIEN_ACTUALISATION}">
<input TYPE=hidden NAME=MODE VALUE="{MODE}">
<table id="table_liste_natures" class='posdtable'>
<thead>
<tr>
    <th class="tableau"></th>
	<th class="tableau" onClick="tri('CODE_NATURE')">{LIBELLE_CODE_NATURE}&nbsp;<IMG SRC='../../../../images/icons/tri_lr_{TRI_CODE}.png' border='0'></th>
	<th class="tableau" onClick="tri('LIBELLE_NATURE')">{LIBELLE_LIBELLE_NATURE}&nbsp;<IMG SRC='../../../../images/icons/tri_lr_{TRI_LIBELLE}.png' border='0'></th>
</tr>
</thead>
<tbody>
<!-- BEGIN BLOC_NATURE -->
<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_NATURE}'>
	<td data-menu="no" class="tdnormal" width="20px" align="center">
        <input data-menu="no" TYPE="RADIO" NAME="INFO_NATURE" VALUE="{POS_INFO_NATURE}"></td>
	<td class="tdnormal" width="105px" >{POS_CODE_NATURE}</td>
	<td class="tdnormal" width="135px" >{POS_LIBELLE_NATURE}</td>
</tr>
<!-- END BLOC_NATURE -->
</tbody>
</table>
<center>
<br><br>
	<SCRIPT language="javascript">              
	document.write("<DIV id='bouton'></DIV>");
	</SCRIPT>
</center>
</form>
</body>
</html>
