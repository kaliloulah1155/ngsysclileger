<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<title>{TITRE_PAGE}</title>
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
<SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
<SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
<SCRIPT language="javascript" SRC="../../../../configuration/constantes.js"></SCRIPT>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/popup_menu.js"></SCRIPT>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/fonction_util.js"></SCRIPT>
<script language="javascript">
// Liste des boutons
var sitems=new Array();
var sitemlinks=new Array();
<!-- BEGIN BOUTON -->
sitems[{CPT}]="{LIBELLE_FONCTION}";
sitemlinks[{CPT}]="{FONCTION}";
<!-- END BOUTON -->

function onSupprimerConnexion(iNumSession)
{
    var szUrlLibererSession = "/{NOM_APPLICATION}/interface/session/principal/lposte/liberer_session.php?POS_NUMSESSION=";
	if(CST_TYPE_APPLI == 2)
        szUrlLibererSession = "../../../../servlet/interface/session/principal/lposte.LibererSession?POS_NUMSESSION=";
	
	if(arguments.length == 1)
		szUrlLibererSession += iNumSession;
	else if(Verif_form())
		szUrlLibererSession += getCheckedValue(document.principal.POS_SESSION);
	else
		return false;

	location.href = szUrlLibererSession; 
}

function getContentContextMenu()
{
	var s = "";
	for (var i=0;i<=sitems.length-1;i++)
	{
		if(sitems[i] == "<HR>")
			s+= sitems[i];
		else
		{
			if(sitemlinks[i].substring(sitemlinks[i].length-2, sitemlinks[i].length) == "()")
			{
				// ici on doit faire passer le num doc dans les parentheses de la fct.
				szNomFct = sitemlinks[i].substring(0, sitemlinks[i].length-2);
				s+='&nbsp;<IMG src=\"../../../../images/icons/lr_fleche.png\">&nbsp;<a href=\"javascript:void '+szNomFct+'(\''+szInfos+'\')\">'+sitems[i]+'</a><br>';
			}
			else
				s+='&nbsp;<a href=\"'+sitemlinks[i]+'\" class=glowtext>'+sitems[i]+'</a><br>';
		}
	}
    return s;
}

function tri_lposte(arg)
{
    document.location.href=document.principal.URL_TRI.value+"?POS_TRI_COL="+escape(arg);
}

function initEcranGestionSession()
{
    affiche_boutons();
    parent.setTitle();
    initTableStdAdmin('table_liste_session');
}

</SCRIPT>
</HEAD>
<BODY onLoad="initEcranGestionSession();">
<h1>{TITRE_PAGE}</h1>
<FORM NAME="principal">
<input TYPE=hidden NAME=URL_TRI VALUE="{LIEN_ACTUALISATION}">
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_SESSION}">
<table id="table_liste_session" class='posdtable'>
<thead>
    <tr STYLE="cursor:pointer">
    	<th class="tableau" NOWRAP>&nbsp;</th>
    <!-- BEGIN ENTETE -->
        <th class="tableau" NOWRAP onClick="tri_lposte('{CLE_COLONNE}')">{LIBELLE_TITRE_COLONNE}</th>
    <!-- END ENTETE -->
</tr>
</thead>
<tbody>
<!-- BEGIN LISTE_REPONSES -->
<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{NUM_SESSION}'>
    <td data-menu="no" class="tdnormal" align=center>
		<input data-menu="no" TYPE=RADIO NAME="POS_SESSION" VALUE="{VALUE_RADIO_SESSION}">
	</td>							
	<td class="tdnormal">{TYPE}&nbsp;</td>
	<td class="tdnormal">{NUM_PROCESS}&nbsp;</td>
	<td class="tdnormal">{NUM_SESSION}&nbsp;</td>
	<td class="tdnormal">{APPLICATION}&nbsp;</td>
	<td class="tdnormal">{CODE_UTILISATEUR}&nbsp;</td>
	<td class="tdnormal">{ADRESSE_IP}&nbsp;</td>
	<td class="tdnormal">{POSTE_CLIENT}&nbsp;</td>
	<td class="tdnormal">{DATE_HEURE}&nbsp;</td>
</tr>
<!-- END LISTE_REPONSES -->
</tbody>
</table>
<center>
<br><br>
<SCRIPT language="javascript">              
document.write("<DIV id='bouton'></DIV>");
</SCRIPT>
</center>
</FORM>
</BODY>
</HTML>