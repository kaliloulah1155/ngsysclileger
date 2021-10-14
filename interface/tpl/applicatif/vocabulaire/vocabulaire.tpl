<HTML>
<HEAD>
<TITLE>{POS_LIBELLERUB}</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
<SCRIPT type='text/javascript' SRC='/{NOM_APPLICATION}/configuration/constantes.js'></SCRIPT>
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
	//w:ajout attente
	var o = document.getElementById ('attente');
	o.style.display = 'block';
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
    	   		//document.getElementById('nbmots').innerHTML = "("+ objVocabulaire.tabmots.length + ")";
    	   		
    	   		// si ce n'est pas le vocabulaire suivant, on reinitialise la liste
				if (!isVocabSuivant)
    	   			document.principal.POS_MOT_VOCAB.length = 1;

                var nouvel_element = null;
                var texte = null;
                for(var i=0;i<objVocabulaire.tabmots.length;i++)
                {
                    texte = (objVocabulaire.is_affiche_valeur == 1) ? objVocabulaire.tabmots[i].valeur : objVocabulaire.tabmots[i].code;
                    nouvel_element = new Option(texte, objVocabulaire.tabmots[i].code, false, false); 
                    // pour les vocabulaire qui ont un code et une valeur, ajout d'une bulle d'aide qui affiche l'autre
                    if (objVocabulaire.is_code_valeur)                       
                        nouvel_element.title =  (objVocabulaire.is_affiche_valeur == 1) ? objVocabulaire.tabmots[i].code : objVocabulaire.tabmots[i].valeur;
                    document.principal.POS_MOT_VOCAB.options[document.principal.POS_MOT_VOCAB.length] = nouvel_element;
                }
                
                document.principal.POS_MOT_VOCAB.selectedIndex = document.principal.POS_MOT_VOCAB.length - objVocabulaire.tabmots.length;
                
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
	    //w:ajout attente
	    o.style.display = 'none';
    }
}

// Affichage du mot selectionne dans la fenetre parente
function select_mot()
{
	var index = document.principal.POS_MOT_VOCAB.selectedIndex;
	if (index<0)
        	return false;

	if(obj.readOnly != true)
	{
	    obj.value = document.principal.POS_MOT_VOCAB.options[index].value;
	    obj.focus();
	}
	parent.closeFenetreVoc();
}

function voc_suiv()
{
	dernier_mot=document.principal.elements["POS_MOT_VOCAB"].options.length-1;
	mot=document.principal.POS_MOT_VOCAB.options[dernier_mot].text;
	document.principal.POS_DEBUTMOT.value=mot;
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

function remplisVisu(index)
{
	if(document.principal.POS_VISU.value != "")
		document.principal.POS_VISU.value += "{POS_SEPARATEUR}"+document.principal.POS_MOT_VOCAB.options[index].value;
	else
		document.principal.POS_VISU.value += document.principal.POS_MOT_VOCAB.options[index].value;
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
    document.principal.POS_MOT_VOCAB.addEventListener("keyup",  function(event) {
       // Number 13 is the "Enter" key on the keyboard
      if (event.keyCode ===  13) {
        // Cancel the default action, if needed
        event.preventDefault();
        // Trigger the button element with a click
        document.principal.POS_MOT_VOCAB.click();
       }
    });
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

<div style='width: 98%;text-align: center;margin:6px;'>
    <span class='labelVocabulaire' > {LIBELLE_VOCABULAIRE} {LIBELLE_CHAMP} "{POS_LIBELLERUB}"</span>
    <div>
        <select class='inputChamp' name='POS_TYPE_VOCAB' onChange='voc_change_type(0);'>
		<!-- BEGIN DOMAINE -->
		<option VALUE="{CODE_DOM}" {SELECTED}> {VALEUR_DOM}</option>
		<!-- END DOMAINE -->
		</select>&nbsp;
		<a style='display: {DISPLAY_EXPORT_VOC}' href="javascript:onExporter('{POS_CODERUB}');" title="{LIBELLE_EXPORT_DF_EXCEL}"><IMG id="img_export_df_excel" src="/{NOM_APPLICATION}/images/icons/export_xls.gif" border='0' title="{LIBELLE_EXPORT_DF_EXCEL}"></a>
		<font class='labelChamp'>{LIBELLE_DEBUT_MOT_VOC}</font>
		<input name='POS_DEBUTMOT' class='inputChamp' SIZE='15' VALUE="{POS_DEBUTMOT}">
    </div>
    <div>
        <select class='inputChamp' style="width:100%;margin-top: 7px;" name='POS_MOT_VOCAB' SIZE='15' {MODE_SELECT}>
   		   	<option VALUE=""></option>
    	</select>
    	<center id='attente' ><IMG src="/{NOM_APPLICATION}/images/icons/attente.gif"></center><!-- w:ajout attente -->
    </div>
    <div>
        <A href="javascript:void(0)" onClick="voc_suiv(1);return false;" title="{LIBELLE_VOCAB_SUIVANT}"><IMG id="img_vocab_suivant" src="/{NOM_APPLICATION}/images/bouton/suiv2.gif" border='0' title="{LIBELLE_VOCAB_SUIVANT}"></A>
    </div>
    <div style='display: {DISPLAY_SI_MULTICRITERE};text-align:left;'>
	   <span class='labelChamp'>{LIBELLE_VISUALISATION_VOC}</span>
    </div>
    <div style='display: {DISPLAY_SI_MULTICRITERE}'>
    	<TEXTAREA class="inputChamp" name="POS_VISU" style='width:100%' ROWS="3" WRAP=VIRTUAL BEHAVIOR=ALTERNATE>{POS_VISU}</TEXTAREA>
    </div>
</div>
<div style="margin:auto;width: 30%;text-align:center;">
    <INPUT TYPE="button" style='display: {DISPLAY_SI_MULTICRITERE}' VALUE="{LIBELLE_AJOUTER}" OnClick="remplisTemplate();" class="bouton">
	<INPUT TYPE="button" VALUE="{LIBELLE_FERMER}" OnClick="parent.closeFenetreVoc();" class="bouton">
</div>
</FORM>
</BODY>
</HTML>
