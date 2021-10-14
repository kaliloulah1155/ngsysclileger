<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_typedoc.js"></SCRIPT>
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
    sitemlinks[i++]="onCreerTypeDoc()";
    
//    sitems[i]="<HR>";
    //sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifierTypeDoc()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimerTypeDoc()";
    
	sitems[i]="<HR>";
    sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_FICHE_PARAMETREE}";
    sitemlinks[i++]="onAfficherFicheParam()";
    
    function initEcranGestionTypeDoc()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_typedoc');
    }

    </SCRIPT>
</head>

<body onLoad="initEcranGestionTypeDoc();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_TYPEDOC}">
<input TYPE=hidden NAME=MESSAGE_SUPP_TYPEDOC VALUE="{MESSAGE_SUPP_TYPEDOC}">
<input TYPE=hidden NAME=DROIT_ADMINISTRATION VALUE="{DROIT_ADMINISTRATION}">
<input TYPE=hidden NAME=MESSAGE_NO_ADMINISTRATION VALUE="{MESSAGE_NO_ADMINISTRATION}">
<input TYPE=hidden NAME=URL_TRI VALUE="{LIEN_ACTUALISATION}">
<table id="table_liste_typedoc" class='posdtable'>
<thead>
    <tr>
        <th class="tableau"></th>
		<th class="tableau" onClick="tri('CODE_TYPEDOC')">{LIBELLE_CODE_TYPEDOC}</th>
		<th class="tableau" onClick="tri('LIBELLE_TYPEDOC')">{LIBELLE_LIBELLE_TYPEDOC}</th>
		<th class="tableau" onClick="tri('THESAURUS_TYPEDOC')">{LIBELLE_THESAURUS_TYPEDOC}</th>
		<th class="tableau" onClick="tri('DOSSIER_TYPEDOC')">{LIBELLE_DOSSIER_TYPEDOC}</th>
		<th class="tableau" onClick="tri('KH_TYPEDOC')">{LIBELLE_K_H_TYPEDOC}</th>
		<th class="tableau" onClick="tri('FULLTEXT_TYPEDOC')">{LIBELLE_FULLTEXT_TYPEDOC}</th>
		<th class="tableau" onClick="tri('VISIBILITE_TYPEDOC')">{LIBELLE_VISIBILITE_TYPEDOC}</th>
		<th class="tableau" onClick="tri('FICHE_PARAM_TYPEDOC')">{LIBELLE_FICHE_PARAM_TYPEDOC}</th>
		<th class="tableau" onClick="tri('GESTION_VERSION_TYPEDOC')">{LIBELLE_GESTION_VERSION_TYPEDOC}</th>
		<th class="tableau" onClick="tri('SPOOL_TYPEDOC')">{LIBELLE_SPOOL_TYPEDOC}</th>
		<th class="tableau" onClick="tri('RESTRICTION_ACCES_TYPEDOC')">{LIBELLE_RESTRICTION_ACCES_TYPEDOC}</th>
    </tr>
</thead>
<tbody>    
    <!-- BEGIN BLOC_TYPEDOC -->
    <tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_TYPEDOC}'>
    	<td data-menu="no" class="tdnormal" width="23px" align="center">
            <input data-menu="no" TYPE="RADIO" NAME="INFO_TYPEDOC" VALUE="{POS_INFO_TYPEDOC}"></td>
    	<td class="tdnormal">{POS_CODE_TYPEDOC}</td>
    	<td class="tdnormal">{POS_LIBELLE_TYPEDOC}</td>
    	<td class="tdnormal">{POS_THESAURUS_TYPEDOC}</td>
    	<td class="tdnormal">{POS_DOSSIER_TYPEDOC}</td>
    	<td class="tdnormal">{POS_K_H_TYPEDOC}</td>
    	<td class="tdnormal">{POS_FULLTEXT_TYPEDOC}</td>
    	<td class="tdnormal">{POS_VISIBILITE_TYPEDOC}</td>
    	<td class="tdnormal">{POS_FICHEPARAM_TYPEDOC}</td>
    	<td class="tdnormal">{POS_GESTION_VERSION_TYPEDOC}</td>
    	<td class="tdnormal">{POS_SPOOL_TYPEDOC}</td>
    	<td class="tdnormal">{POS_RESTRICTION_ACCES_TYPEDOC}</td>
    </tr>
    <!-- END BLOC_TYPEDOC -->
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
