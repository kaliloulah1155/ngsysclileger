<HTML>

<HEAD>
<TITLE>{POS_LIBELLERUB}</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/configuration/constantes.js"></SCRIPT>
<SCRIPT language="javascript">
var xWin = parent;

var str_obj = "xWin.{POS_CHAMP}";
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

function afficherValeurFilleAuto() 
{	
	if (searchReq.readyState == 4 || searchReq.readyState == 0) 
	{		
        if(CST_TYPE_APPLI == 1) {
			szUrl = "/{NOM_APPLICATION}/interface/session/principal/vocabulaire/obtenir_voc_hier.php?";
		}
		else {
		  szUrl = "../../../../servlet/interface/session/principal/vocabulaire.ObtenirVocHier?";
        }
		szUrl += "POS_TYPEDOC=" + document.principal.POS_TYPEDOC.value;
		szUrl += "&POS_CODERUB=" + document.principal.POS_CODERUB.value;
		szUrl += "&POS_SZLISTRUB=" + document.principal.POS_SZLISTRUB.value;
		szDebutMot = document.principal.POS_DEBUTMOT.value;
		
		idxVoc = document.principal.POS_MOT_VOCAB.selectedIndex;
		szDebutMot += document.principal.POS_MOT_VOCAB.options[idxVoc].value + String.fromCharCode(2);
		szUrl += "&POS_DEBUTMOT=" + escape(szDebutMot);
		
		searchReq.open("GET", szUrl, true);
		searchReq.onreadystatechange = function() {
				if (searchReq.readyState == 4) 
					handleAfficherValeurFilleAuto();
			}; 
		searchReq.send(null);
	}
}

//Called when the AJAX response is returned.
function handleAfficherValeurFilleAuto() 
{	
	var objRetour = eval('(' + searchReq.responseText + ')');
	if (objRetour.code_retour == 1)
	{
        for(var i=0;i<objRetour.tablistefille.length;i++)
        {
            eval("xWin.document.principal.POS_VAL_RUB_" + objRetour.tablistefille[i]["code"]).value = objRetour.tablistefille[i]["valeur"];
        }
	}
	parent.closeFenetreVoc();
}

// Affichage du mot selectionne dans la fenetre parente
function select_mot()
{
	var index = document.principal.POS_MOT_VOCAB.selectedIndex;
	var valeur = document.principal.POS_MOT_VOCAB.options[index].value;
	var bIsFille = false;
	if(obj.readOnly != true)
	{
	    if (document.principal.POS_MULTI.value == "1" && obj.value.length > 0)
	    {
           obj.value = obj.value + "\r\n" + valeur;
        }
	    else
		obj.value = valeur;
		obj.focus();
        
        tabListRub = document.principal.POS_SZLISTRUB.value.split('|');
        bVideChamp = false;
        
		// reinitialisation de toutes les rubriques apres la rubrique en cours
        for(i=0;i<tabListRub.length;i++)
        {
            if(bVideChamp) {
                if (str_obj.indexOf("xWin.frtableau") === 0) {
                    var idxFinChaine = str_obj.indexOf("document.principal.") + "document.principal.".length; 
                    var strRubInFrmTab = str_obj.substr(0, idxFinChaine) + "POS_VAL_RUB_"+tabListRub[i];
                    eval(strRubInFrmTab).value="";
                }
                else
                    eval("xWin.document.principal.POS_VAL_RUB_"+tabListRub[i]).value="";
                    
            }

            if(tabListRub[i] == document.principal.POS_CODERUB.value)
            {
                bVideChamp = true;
                if (i + 1 < tabListRub.length)
                	bIsFille = true;
        	}
		}
	}
	
	if (bIsFille && document.principal.POS_AUTORUBFILLE.value == "1")
    	afficherValeurFilleAuto();
    else
    {
        if (document.principal.POS_MULTI.value != "1")
			parent.closeFenetreVoc();
	}
}

function voc_change_type()
{
	document.principal.submit();
}

var gotomot = false;
var previousrow = -1;
function goToMot(evenement) 
{
    var keyPressed = window.event ? evenement.keyCode : evenement.which;
	if (keyPressed == 13)
	{
		var debutmot = document.principal.debut_mot.value.toUpperCase();
		if (debutmot.length > 0)
		{
			var listeOption = document.getElementById("liste_mot_vocab").options;
			// debut a 1 pour passer le titre
			for (var cptrow = 1;cptrow<listeOption.length;cptrow++)
			{
				if (debutmot <= listeOption[cptrow].text.toUpperCase())
					break;
			}
			var iNbOptionsAff = document.getElementById("liste_mot_vocab").size;
			document.getElementById("liste_mot_vocab").selectedIndex = 0;
			if (cptrow + iNbOptionsAff -1 > listeOption.length)
                document.getElementById("liste_mot_vocab").selectedIndex = listeOption.length - 1;
            else
			document.getElementById("liste_mot_vocab").selectedIndex = cptrow + iNbOptionsAff -1;
		}
		else
		{
			document.getElementById("liste_mot_vocab").selectedIndex = 0;
		}
		document.getElementById("liste_mot_vocab").selectedIndex = -1;
	}
	gotomot = true;
}
</SCRIPT>
</HEAD>

<BODY topmargin="0" leftmargin="0">
<FORM NAME=principal ACTION="{ACTION_AFFICHER_VOCAB}" onSubmit="if (gotomot) {gotomot=false;return false;} else return true;">
<INPUT TYPE=HIDDEN NAME="POS_TYPEDOC" VALUE="{POS_TYPEDOC}">
<INPUT TYPE=HIDDEN NAME="POS_CODERUB" VALUE="{POS_CODERUB}">
<INPUT TYPE=HIDDEN NAME="POS_TYPERUB" VALUE="{POS_TYPERUB}">
<INPUT TYPE=HIDDEN NAME="POS_CHAMP" VALUE="{POS_CHAMP}">
<INPUT TYPE=HIDDEN NAME="POS_VOC_LIE" VALUE="{POS_VOC_LIE}">
<INPUT TYPE=HIDDEN NAME="POS_DEBUTMOT" VALUE="{POS_DEBUTMOT}">
<INPUT TYPE=HIDDEN NAME="POS_SZLISTRUB" VALUE="{POS_SZLISTRUB}">
<INPUT TYPE=HIDDEN NAME="POS_AUTORUBFILLE" VALUE="{POS_AUTORUBFILLE}">
<INPUT TYPE=HIDDEN NAME="POS_MULTI" VALUE="{POS_MULTI}">
<INPUT TYPE=HIDDEN NAME="URL_VOCAB_AJAX" VALUE="{URL_VOCAB_AJAX}">
<TABLE WIDTH="100%">
<tr><!-- w:ajout titre -->
    <td class='labelVocabulaire' colspan=2>
        {LIBELLE_VOCABULAIRE} {LIBELLE_CHAMP} "{POS_LIBELLERUB}"
    </td>
</tr>

<TR>
	<TD NOWRAP>
		<SELECT class="inputChamp" NAME="POS_TYPE_VOCAB" onChange='voc_change_type(0);'>
		<!-- BEGIN DOMAINE -->
		<OPTION VALUE="{CODE_DOM}" {SELECTED}> {VALEUR_DOM} </OPTION>
		<!-- END DOMAINE -->
		</SELECT>
	</TD>
	<TD NOWRAP>
		<FONT CLASS="labelChamp">{LIBELLE_DEBUT_MOT_VOC}</FONT><INPUT NAME="debut_mot" SIZE=10 VALUE="" onKeyPress="javascript:goToMot(event)">
	</TD>
</TR>
<!-- w:suppression -->
<TR>
	<TD colspan="2" align="center">
    	<SELECT id="liste_mot_vocab" NAME=POS_MOT_VOCAB class="inputChamp" SIZE="14" style='width: 100%' onchange="select_mot()"> <!-- w:ajout style 100% -->  		
   		   	<OPTION VALUE="">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
 			</OPTION>
	    	<!-- BEGIN LISTE_MOTS -->
			<OPTION VALUE="{CODE_MOT}"> {VALEUR_MOT} </OPTION>
	    	<!-- END LISTE_MOTS -->
    	</SELECT>
	</TD>
</TR>
<TR>
	<TD colspan="2" align=center><BR>
		<INPUT TYPE="button" VALUE="{LIBELLE_FERMER}" OnClick="parent.closeFenetreVoc();" class="bouton">
	</TD>
</TR>
</TABLE>

</FORM>
</BODY>
</HTML>
