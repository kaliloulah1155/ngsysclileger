<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_profil_util.js"></SCRIPT>
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
    sitemlinks[i++]="onCreerProfil()";
    
    //sitems[i]="<HR>";
    //sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifierProfil()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimerProfil()";
    
	sitems[i]="{LIBELLE_COPIER}";
    sitemlinks[i++]="onCopierProfil()";
    
    
    function initEcranGestionUtil()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_profils');
    }

    </SCRIPT>
</head>

<body onLoad="initEcranGestionUtil();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_PROFIL}">
<input TYPE=hidden NAME=MESSAGE_SUPP_PROFIL VALUE="{MESSAGE_SUPP_PROFIL}">
<input TYPE=hidden NAME=DROIT_ADMIN_UTIL VALUE="{DROIT_ADMIN_UTIL}">
<input TYPE=hidden NAME=MESSAGE_NO_ADMIN_USER VALUE="{MESSAGE_NO_ADMIN_USER}">
<input TYPE=hidden NAME=URL_TRI VALUE="{LIEN_ACTUALISATION}">
<table id="table_liste_profils" class='posdtable' style='width:100%;'>
<thead>
<tr>
    <th class="tableau"></th> 
	<th class="tableau" onClick="tri('CODE')">{LIBELLE_CODE_PROFIL}</th>
	<th class="tableau" onClick="tri('FONCTION')">{LIBELLE_FONCTION}</th>
	<th class="tableau" onClick="tri('SERVICE')">{LIBELLE_SERVICE}</th>
	<th class="tableau" onClick="tri('PROFIL_INDEX')">{LIBELLE_PROFIL_INDEX}</th>
	<th class="tableau" onClick="tri('PROFIL_HIER')">{LIBELLE_PROFIL_HIER}</th>
</tr>
</thead>
<tbody>        
    <!-- BEGIN BLOC_PROFIL -->
    <tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_PROFIL}'>
    	<td data-menu="no" class="tdnormal" width="20px" align="center">
        <input data-menu="no" TYPE="RADIO" NAME="INFO_PROFIL" VALUE="{POS_INFO_PROFIL}"></td>
    	<td>{POS_CODE_PROFIL}</td>
    	<td>{POS_FONCTION}</td>
    	<td>{POS_SERVICE}</td>
    	<td>{POS_PROFIL_INDEX}</td>
    	<td>{POS_PROFIL_HIER}</td>
    </tr>
    <!-- END BLOC_PROFIL -->
<tbody>
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
