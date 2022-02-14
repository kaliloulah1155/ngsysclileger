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

function onLibererDocument(iNumDocument)
{
	var szUrlLibererDoc = "/{NOM_APPLICATION}/interface/session/principal/lposte/liberer_document.php?POS_NUMDOC=";
    if(CST_TYPE_APPLI == 2)
        szUrlLibererDoc = "../../../../servlet/interface/session/principal/lposte.LibererDocument?POS_NUMDOC=";

	if(arguments.length == 1)
		szUrlLibererDoc += iNumDocument;
	else if(Verif_form())
		szUrlLibererDoc += getCheckedValue(document.principal.POS_NUMDOC);
	else
		return false;

	location.href = szUrlLibererDoc; 
}

function getContentContextMenu()
{
	var s = "";
	for (i=0;i<=sitems.length-1;i++)
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

function initEcranGestionDocuments()
{
    affiche_boutons();
    parent.setTitle();
    initTableStdAdmin('table_liste_document');
}

</SCRIPT>
</HEAD>
<BODY onLoad="initEcranGestionDocuments();">
<h1>{TITRE_PAGE}</h1>

<FORM NAME="principal">
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_DOC_EN_MODIF}">
<table id='table_liste_document' class='posdtable' style='width:100%;'>
<thead>
   <tr>
    	<th class="tableau">&nbsp;</th>
        <!-- BEGIN ENTETE -->
        <th class="tableau">{TITRE_COLONNE}</th>
        <!-- END ENTETE -->
    </tr>
</thead>
<tbody>
    <!-- BEGIN LISTE_REPONSES -->
    <tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{NUM_DOCUMENT}'">
        <td data-menu="no" class="tdnormal" width=15 align=center>
		<INPUT data-menu="no" TYPE="RADIO" NAME="POS_NUMDOC" VALUE="{VALUE_RADIO_NUMDOC}">
	</td>
	</td>							
		<!-- BEGIN LR_REPONSE -->
        <TD class="tdnormal"  NOWRAP>	{ZONE_LR}&nbsp;</TD>
        <!-- END LR_REPONSE -->
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