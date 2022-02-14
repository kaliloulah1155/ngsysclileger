<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>Gestion des rubriques</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_rubrique.js"></SCRIPT>
    <SCRIPT language="javascript">
    
    function actualiser()
    {
    	window.location.href="{LIEN_ACTUALISATION}";
    }
    
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
    // menu contextuel
	sitems[i]="{LIBELLE_AJOUTER}";
    sitemlinks[i++]="onCreerRubrique()";
    
    //sitems[i]="<HR>";
    //sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifierRubrique()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimerRubrique()";
    
    function initEcranGestionRubrique()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_rubriques');
    }

    </SCRIPT>
</head>

<body onLoad="initEcranGestionRubrique();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_RUBRIQUE}">
<input TYPE=hidden NAME=MESSAGE_SUPP_RUBRIQUE VALUE="{MESSAGE_SUPP_RUBRIQUE}">
<input TYPE=hidden NAME=DROIT_ADMINISTRATION VALUE="{DROIT_ADMINISTRATION}">
<input TYPE=hidden NAME=MESSAGE_NO_ADMINISTRATION VALUE="{MESSAGE_NO_ADMINISTRATION}">
<input TYPE=hidden NAME=URL_TRI VALUE="{LIEN_ACTUALISATION}">
<table id="table_liste_rubriques" class='posdtable'>
<thead>
	<tr>
        <th class="tableau"></th>
		<th class="tableau" onClick="tri('CODE_RUBRIQUE')">{LIBELLE_CODE_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('LIBELLE_RUBRIQUE')">{LIBELLE_LIBELLE_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('TYPE_RUBRIQUE')">{LIBELLE_TYPE_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('NB_CAR_RUBRIQUE')">{LIBELLE_NB_CAR_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('VISIBILITE_RUBRIQUE')">{LIBELLE_VISIBILITE_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('MONO_RUBRIQUE')">{LIBELLE_MONO_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('CRITERE_SECONDAIRE_RUBRIQUE')">{LIBELLE_CRITERE_SECONDAIRE_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('DOMFERME_RUBRIQUE')">{LIBELLE_DOMFERME_RUBRIQUE}</th>
		<th class="tableau" onClick="tri('CODE_THESAURUS_RUBRIQUE')">{LIBELLE_CODE_THESAURUS_RUBRIQUE}</th>
	</tr>
</thead>    
<tbody>
	<!-- BEGIN BLOC_RUBRIQUE -->
	<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_RUBRIQUE}'>
		<td data-menu="no" class="tdnormal" width="20px" align="center">
            <input data-menu="no" TYPE="RADIO" NAME="INFO_RUBRIQUE" VALUE="{POS_INFO_RUBRIQUE}"></td>
		<td class="tdnormal" width="73px" align="center">{POS_CODE_RUBRIQUE}</td>
		<td class="tdnormal" width="260px">{POS_LIBELLE_RUBRIQUE}</td>
		<td class="tdnormal" width="47px" align="center">{POS_TYPE_RUBRIQUE}</td>
		<td class="tdnormal" width="47px" align="center">{POS_NB_CAR_RUBRIQUE}</td>
		<td class="tdnormal" width="46px" align="center">{POS_VISIBILITE_RUBRIQUE}</td>
		<td class="tdnormal" width="47px" align="center">{POS_MONO_RUBRIQUE}</td>
		<td class="tdnormal" width="49px" align="center">{POS_CRITERE_SECONDAIRE_RUBRIQUE}</td>
		<td class="tdnormal" width="60px" align="center">{POS_DOMFERME_RUBRIQUE}</td>
		<td class="tdnormal" width="46px" align="center">{POS_CODE_THESAURUS_RUBRIQUE}</td>
	</tr>
	<!-- END BLOC_RUBRIQUE -->
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
