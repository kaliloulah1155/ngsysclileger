<HTML>
<HEAD>
<TITLE>{POS_LIBELLERUB}</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
<SCRIPT type='text/javascript' SRC='/{NOM_APPLICATION}/configuration/constantes.js'></SCRIPT>
<style>
.titrevocab {
	font-weight: bold;
	color:white;
	text-align: center;
}

.listevocab {
	border: 1px solid gray;
}

thead.headervocab tr {
	position: relative;
}

div.tablecontainer {
	height: 230px;
	overflow: auto;
	border: 1px solid gray;
    margin-top: 7px;
}

div.tablecontainer table
{
	float: left;
}
</style>
<SCRIPT language="javascript">
var str_obj = parent.{POS_CHAMP};
var obj = eval(str_obj);

function getXmlHttpRequestObject() {	

	if (window.XMLHttpRequest) {
	
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
	return null;
}

var searchReq = getXmlHttpRequestObject();

function getVocabulaire(isVocabSuivant)
{
    if (searchReq.readyState == 4 || searchReq.readyState == 0)
	{
		var szRequete = document.principal.URL_VOCAB_AJAX.value + "?";
		szRequete += "POS_DEBUTMOT=" + escape(document.principal.POS_DEBUTMOT.value);
		szRequete += "&POS_TYPEDOC=" + document.principal.POS_TYPEDOC.value;
		szRequete += "&POS_CODERUB=" + document.principal.POS_CODERUB.value;
		szRequete += "&POS_TYPERUB=" + document.principal.POS_TYPERUB.value;
		var iTypeVocab = document.principal.POS_TYPE_VOCAB.options[document.principal.POS_TYPE_VOCAB.selectedIndex].value;
		szRequete += "&POS_TYPE_VOCAB=" + iTypeVocab;
		szRequete += "&POS_NEXT_VAL=" + isVocabSuivant;
		szRequete += "&POS_TYPEDF=" + document.principal.POS_TYPEDF.value;
		
	   	searchReq.open("GET", szRequete, false);
	   	searchReq.send(null);
	   if (searchReq.readyState == 4 || searchReq.readyState == 0)
	   {
    	   	var objVocabulaire = eval('(' + searchReq.responseText + ')');
    	   	if (objVocabulaire.code_retour == 1)
    	   	{
    	   		var tablevocab = document.getElementById("tablevocab");
    	   		var iNbRows = tablevocab.rows.length;
                var row_select = null;
                // si ce n'est pas le vocabulaire suivant, on réinitialise la liste
				if (!isVocabSuivant) {
                    
                	for(var i=1;i<iNbRows;i++) {
                        tablevocab.deleteRow(1);
                    }
                }
    	   		
                var nbMots = objVocabulaire.tabmots.length; 
                for(var i=0;i<objVocabulaire.tabmots.length;i++)
                {
                    var row = tablevocab.insertRow();
                    row.id = objVocabulaire.tabmots[i].code;
                    row.onclick = function() { {FONCTION_SELECT}(this.id) };
                    row.className = "ligne line-bib";
                    if (i==0)
                        row_select = row;
                    var cell1 = row.insertCell(0);
                    cell1.innerHTML = objVocabulaire.tabmots[i].code;
                    if (objVocabulaire.is_code_valeur) {
                        var cell2 = row.insertCell(1);
                        cell2.innerHTML = objVocabulaire.tabmots[i].valeur;   
                    } 
                }
                if (nbMots > 0)
                    dernier_mot = (objVocabulaire.is_affiche_valeur == 1) ? objVocabulaire.tabmots[nbMots - 1].valeur : objVocabulaire.tabmots[nbMots - 1].code; 
                if (row_select != null)
                    document.getElementById('tablecontainer').scrollTop = row_select.cells[0].offsetTop - 40;            
                
                if (objVocabulaire.tabmots.length < document.principal.NB_MAX_MOTS.value)
                    document.getElementById("img_vocab_suivant").src = "/{NOM_APPLICATION}/images/bouton/suivgris2.gif";
                else 
                    document.getElementById("img_vocab_suivant").src = "/{NOM_APPLICATION}/images/bouton/suiv2.gif";
				//document.principal.POS_MOT_VOCAB.selectedIndex = -1;
				//document.principal.POS_MOT_VOCAB.scrollTop = document.principal.POS_MOT_VOCAB.length - 1;
			}
    		else
    			alert(objVocabulaire.msg_erreur);	
    	}
    }
}

// Affichage du mot selectionne dans la fenetre parente
function select_mot(valeur)
{
	if(obj.readOnly != true)
	{
	    obj.value = valeur;
	    obj.focus();
	}
	parent.closeFenetreVoc();
}
var dernier_mot = ""; 
function voc_suiv()
{
	document.principal.POS_DEBUTMOT.value=dernier_mot;
	getVocabulaire(1);
}

function voc_debut()
{
	document.principal.POS_DEBUTMOT.value = "";
	getVocabulaire(0);
}

function voc_change_type()
{
	document.principal.POS_DEBUTMOT.value = "";
	getVocabulaire(0);
}

function remplisVisu(valeur)
{
	if(document.principal.POS_VISU.value != "")
		document.principal.POS_VISU.value += "{POS_SEPARATEUR}"+valeur;
	else
		document.principal.POS_VISU.value += valeur;
}

function ancienneValeur()
{
	if (obj.value != "" && document.principal.POS_VISU.value == "" && document.principal.POS_DEBUTMOT.value == "")
		document.principal.POS_VISU.value = obj.value;	
		
	document.principal.POS_DEBUTMOT.focus();
	document.principal.POS_DEBUTMOT.select();
}

function remplisTemplate()
{
	if(obj.readOnly != true)
	{
	    obj.value = document.principal.POS_VISU.value;
	    obj.focus();
	}
	
	parent.closeFenetreVoc();
}
function onExporter(coderub)
{
    var szUrlExporter = "";
    if(CST_TYPE_APPLI == 1)
    	szUrlExporter += URL_SITE + "/interface/session/principal/gestiondomain/exporter_valeurs_domaine.php?POS_CODE_RUB=";
    else
    	szUrlExporter += URL_SITE + "/interface/session/principal/gestiondomain.ExporterValeursDomaine?POS_CODE_RUB=";
    szUrlExporter += coderub;
    szUrlExporter += "&PHPSESSID=" + document.principal.PHPSESSID.value;
    //alert(szUrlExporter);
    document.body.style.cursor = 'wait';
    document.getElementById('img_export_df_excel').style.cursor = 'wait';
    var fenetreExport = window.open(szUrlExporter, 'exportation_df', 'left=200,top=50,height=400,width=600,scrollbars=yes,location=no,toolbar=no,status=no,resizable=yes');
    document.body.style.cursor = 'default';
    document.getElementById('img_export_df_excel').style.cursor = 'default';
}

function initEcran() {
    
    ancienneValeur();
    voc_debut(); 
}

</SCRIPT>
</HEAD>

<BODY topmargin='10' leftmargin="0" onLoad="initEcran();">
<FORM NAME=principal ACTION="{ACTION_AFFICHER_VOCAB}" METHOD="POST" onSubmit='getVocabulaire(0);return false;'>
<INPUT TYPE=HIDDEN NAME="POS_TYPEDOC" VALUE="{POS_TYPEDOC}">
<INPUT TYPE=HIDDEN NAME="POS_CODERUB" VALUE="{POS_CODERUB}">
<INPUT TYPE=HIDDEN NAME="POS_TYPERUB" VALUE="{POS_TYPERUB}">
<INPUT TYPE=HIDDEN NAME="POS_SEPARATEUR" VALUE="{POS_SEPARATEUR}">
<INPUT TYPE=HIDDEN NAME="POS_CHAMP" VALUE="{POS_CHAMP}">
<INPUT TYPE=HIDDEN NAME="POS_VOC_LIE" VALUE="{POS_VOC_LIE}">
<INPUT TYPE=HIDDEN NAME="POS_NEXT_VAL" VALUE=0>
<INPUT TYPE=HIDDEN NAME="FORCE_MONOCRITERE" VALUE="{FORCE_MONOCRITERE}">
<INPUT TYPE=HIDDEN NAME="NB_MAX_MOTS" VALUE="{NB_MAX_MOTS}">
<INPUT TYPE=HIDDEN NAME="PHPSESSID" VALUE="{PHPSESSID}">
<INPUT TYPE=HIDDEN NAME="POS_TYPEDF" VALUE="{POS_TYPEDF}">
<INPUT TYPE=HIDDEN NAME="URL_VOCAB_AJAX" VALUE="{URL_VOCAB_AJAX}">

<center>
<table style='width: 95%;'>
<tr>
	<td class='labelVocabulaire'>
		{LIBELLE_VOCABULAIRE} {LIBELLE_CHAMP} "{POS_LIBELLERUB}"
    </td>
</tr>
<tr>
	<td NOWRAP>
		<select class='inputChamp' name='POS_TYPE_VOCAB' onChange='voc_change_type(0);'>
		<!-- BEGIN DOMAINE -->
		<option VALUE="{CODE_DOM}" {SELECTED}> {VALEUR_DOM}</option>
		<!-- END DOMAINE -->
		</select>&nbsp;
        <a style='display: {DISPLAY_EXPORT_VOC}' href="javascript:onExporter('{POS_CODERUB}');" title="{LIBELLE_EXPORT_DF_EXCEL}"><IMG id="img_export_df_excel" src="/{NOM_APPLICATION}/images/icons/export_xls.gif" border='0' title="{LIBELLE_EXPORT_DF_EXCEL}"></a>
		<FONT CLASS=labelChamp>{LIBELLE_DEBUT_MOT_VOC}</FONT><INPUT name='POS_DEBUTMOT' class='inputChamp' SIZE='15' VALUE="{POS_DEBUTMOT}" onKeyUp="this.value=this.value.toUpperCase();">
	</td>
</tr>

<tr>
	<td ALIGN=CENTER>
    	<DIV id="tablecontainer" class="tablecontainer">
    	<table id="tablevocab" border='0' width="100%">
    		<thead class="headervocab">
    		<tr style="display:{DISPLAY_SI_EXST_LIB}">
    			<th class='tableau'>{LIBELLE_VOCAB_DF_CODE}</th>
    			<th class='tableau'>{LIBELLE_VOCAB_DF_LIBELLE}</th>
    		</tr>
    		</thead>
    		<tbody class="listevocab">
    	    
    		</tbody>
    	</table>
    	</DIV>
	</td>
</tr>
<tr>
	<td CLASS='labelChamp' style='text-align:center'>
		<A href="javascript:void(0)" onClick="voc_suiv(1);return false;" title="{LIBELLE_VOCAB_SUIVANT}"><IMG id="img_vocab_suivant" src="/{NOM_APPLICATION}/images/bouton/suiv2.gif" border='0' title="{LIBELLE_VOCAB_SUIVANT}"></A>
	</td>
</tr>
<tr>
	<td CLASS='labelChamp'>{LIBELLE_VISUALISATION_VOC}</td>
</tr>
<tr>
	<td>
		<TEXTAREA class="inputChamp" NAME=POS_VISU style='width:100%' ROWS='3' WRAP=VIRTUAL BEHAVIOR=ALTERNATE>{POS_VISU}</TEXTAREA>
	</td>
</tr>
<tr>
	<td class='labelChamp' style='text-align:center'>
        <INPUT TYPE="button" VALUE="{LIBELLE_AJOUTER}" OnClick="remplisTemplate();" class="bouton">
		<INPUT TYPE="button" VALUE="{LIBELLE_FERMER}" OnClick="parent.closeFenetreVoc();" class="bouton">
	</td>
</tr>
</table>
</center>
</FORM>
</BODY>
</HTML>
