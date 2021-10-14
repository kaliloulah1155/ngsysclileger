<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_utilisateur.js"></SCRIPT>
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
    
    <!-- BEGIN BLOC_MENU_AVEC_LDAP -->
    // menu contextuel avec si connexion LDAP
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifier()";
    
    <!-- END BLOC_MENU_AVEC_LDAP -->
    
    <!-- BEGIN BLOC_MENU_SANS_LDAP -->
    // menu contextuel en absence de connexion LDAP
    sitems[i]="{LIBELLE_AJOUTER}";
    sitemlinks[i++]="onCreer()";
    
//    sitems[i]="<HR>";
    //sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifier()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimer()";
    
    <!-- END BLOC_MENU_SANS_LDAP -->
    
    function initEcranGestionUtil()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_utils');
    }
    </SCRIPT>
</head>

<body onLoad="initEcranGestionUtil();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_UTIL}">
<input TYPE=hidden NAME=CONNEXION_LDAP VALUE="{CONNEXION_LDAP}">
<input TYPE=hidden NAME=MESSAGE_SUPP_UTILISATEUR VALUE="{MESSAGE_SUPP_UTILISATEUR}">
<input TYPE=hidden NAME=DROIT_ADMIN_UTIL VALUE="{DROIT_ADMIN_UTIL}">
<input TYPE=hidden NAME=MESSAGE_NO_ADMIN_USER VALUE="{MESSAGE_NO_ADMIN_USER}">
<input TYPE=hidden NAME=URL_TRI VALUE="{LIEN_ACTUALISATION}">
<table id="table_liste_utils" class='posdtable' style='width:100%;'>
<thead>
<tr STYLE="cursor:pointer">
    <th class="tableau" ></th>
	<th class="tableau" onClick="tri('CODE')">{LIBELLE_CODE_UTIL}</th>
	<th class="tableau" onClick="tri('NOM')">{LIBELLE_NOM_UTIL}</th>
	<th class="tableau" onClick="tri('PROFIL')">{LIBELLE_PROFIL_UTIL}</th>
	<th class="tableau" onClick="tri('MAIL')">{LIBELLE_MAIL_UTIL}</th>
</tr>
</thead>
<tbody>
<!-- BEGIN BLOC_UTILISATEUR -->
<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_UTIL}'>
	<td data-menu="no" align="center">
    <input data-menu="no" TYPE="RADIO" NAME="INFO_UTIL" VALUE="{POS_INFO_UTIL}"></td>
	<td>{POS_CODE_UTIL}</td>
	<td>{POS_NOM_UTIL}</td>
	<td>{POS_PROFIL_UTIL}</td>
	<td>{POS_MAIL_UTIL}</td>
</tr>
<!-- END BLOC_UTILISATEUR -->
</tbody>
</table>
<br>
<center>
<SCRIPT language="javascript">              
document.write("<DIV id='bouton'></DIV>");
</SCRIPT>
</center>

</form>
</body>
</html>
