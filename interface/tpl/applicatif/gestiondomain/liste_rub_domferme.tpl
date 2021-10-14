<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_rub_domferme.js"></SCRIPT>
    <SCRIPT language="javascript">
    
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifier_rub()";
    
    function initEcranGestionDf()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_df');
    }

    </SCRIPT>
</head>
<body topmargin="10" leftmargin="10" onLoad="initEcranGestionDf();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_RUB}">
<input TYPE=hidden NAME=DROIT_ADMIN_DOMFERME VALUE="{DROIT_ADMIN_DOMFERME}">
<input TYPE=hidden NAME=MESSAGE_NO_ADMIN_DOMFERME VALUE="{LIBELLE_NO_ADMIN_DOMFERME}">
<table id="table_liste_df" class='posdtable' style='width:100%;'>
<thead>
    <tr>
        <th class="tableau"></th>
        <th class="tableau">{LIBELLE_CODE_RUB}</th>
        <th class="tableau">{LIBELLE_LIBELLE_RUB}</th>
    </tr>
</thead>
<tbody>
<!-- BEGIN BLOC_RUB_DOMFERME -->
<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_IDENT_RUB}'>
	<td data-menu="no" class="tdnormal" width="20px" align="center" width="5%">
        <input data-menu="no" TYPE="RADIO" NAME="IDENT_RUB" VALUE="{POS_IDENT_RUB}"></td>
	<td class="tdnormal" width="105px">{POS_CODE_RUB}</td>
	<td class="tdnormal" width="570px">{POS_LIBELLE_RUB}</td>	
</tr>
<!-- END BLOC_RUB_DOMFERME -->
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
