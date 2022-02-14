document.write("<SCRIPT language=\"javascript\" SRC=\"../../../../configuration/constantes.js\"></SCRIPT>");
document.write("<SCRIPT language=\"javascript\" SRC=\"../../../../include/script/specifique/specifique.js\"></SCRIPT>");
/*
 * Fonctions pour l'affichage du vocabulaire
 * 15.05.02 GG ajout de la gestion du vocabulaire lie
 * 23.01.03 Mise a jour pour netscape 6 & 7
 */

/*
 * Script qui permet de connaitre le champ qui a le focus 
 * de facon a pouvoir afficher le vocabulaire de la rubrique concernee
 *
 */
var tagname = "POS_VAL_RUB_";
var tagnamelie = "POS_VAL_LIE_";
var codeRubrique;
var codeRubLie;
var rubliee = 0;

function get_url(type_url)
{
	var tabCodeUrlVocab = new Array();
	if(CST_TYPE_APPLI == 1)
	{
		tabCodeUrlVocab["URL_VOCAB"] = "../../../../interface/session/principal/vocabulaire/afficher_db.php?";
		tabCodeUrlVocab["URL_VOCABHIER"] = "../../../../interface/session/principal/vocabulaire/afficher_vocab_hier.php?";
		tabCodeUrlVocab["URL_THESAURUS"] ="../../../../interface/session/principal/thesaurus/afficher_thesaurus_xtree.php?";
		tabCodeUrlVocab["URL_VOCAB_SQL"] = "../../../../interface/session/principal/vocabulaire/afficher_db_frame.php?";
	}
	else
	{
		tabCodeUrlVocab["URL_VOCAB"] = "../../../../servlet/interface/session/principal/vocabulaire.AfficherVocabulaire?";
		tabCodeUrlVocab["URL_VOCABHIER"] = "../../../../servlet/interface/session/principal/vocabulaire.AfficherVocabulaireHier?";
		tabCodeUrlVocab["URL_VOCAB_SQL"] = "../../../../servlet/interface/session/principal/vocabulaire.AfficherVocabulaireSql?";
	}

	return tabCodeUrlVocab[type_url];	
}

function getValueRadio(groupRadioObj)
{
    var valueRadio = "";
    for (var i = 0; i < groupRadioObj.length; i++)
    {
        if (groupRadioObj[i].checked)
        {
            valueRadio = groupRadioObj[i].value;
            break;
        }   
    }
    return valueRadio;
}

function setValueRadio(groupRadioObj, valeur)
{
    for (var i = 0; i < groupRadioObj.length; i++)
    {
        if (groupRadioObj[i].value == valeur)
        {
            groupRadioObj[i].checked = true;
            break;
        }   
    }
}

function fixe_focus(e)
{
	var elementForm = e.target;
		
	if(elementForm.type == "text" || elementForm.type == "textarea")
	{
        // tester l'existence de la fonction
        //closeSearch();
		// POS_VAL_RUB_XXX => XXX
		parties = elementForm.name.split(tagname);
		codeRubrique = parties[1];
	}
			
	if (codeRubrique)
	{	
		if (codeRubrique.length > 3)
		{
			codeRubLie = codeRubrique.substring(4, 7);
			rubliee = 1;
		}
		else
			rubliee = 0;
	}
	return true;
}


function charger_vocabulaire_avec_association(codeType, codeRub, nomChamp)
{
	var ancienneValeur = eval("document.principal."+nomChamp).value;
	charger_vocabulaire(codeType, codeRub, nomChamp);
	var nouvelleValeur = eval("document.principal."+nomChamp).value;
	if (ancienneValeur.toUpperCase() != nouvelleValeur.toUpperCase() && nouvelleValeur.length != 0)
		lancer_association(codeRub, 1);
}

/*
 * Affichage du vocabulaire pour une rubrique d'un type de document
 * codeType : code du type du document
 * codeRub : code de la rubrique pour laquelle le vocabulaire doit etre affiche
 * nomChamp : nom du champ dans lequel la valeur sera ajoute 
 */ 
function charger_vocabulaire(codeType, codeRub, nomChamp)
{
	var avecVocLie = 1;
	
	if (arguments.length == 0)
	{ 
		if (codeRubrique)
		{
			if (rubliee == 1)
			{
				lancer_chargement(codeRubLie, document.principal.POS_TYPEDOC_LIE.value, "document.principal.POS_VAL_LIE_" + codeRubrique, avecVocLie);
			}
			else {
                if (window.name && window.name.indexOf("frtableau") == 0)
				    lancer_chargement(codeRubrique, document.principal.POS_TYPEDOC.value, window.name + "." + "document.principal.POS_VAL_RUB_" + codeRubrique, avecVocLie);
                else
                    lancer_chargement(codeRubrique, document.principal.POS_TYPEDOC.value, "document.principal.POS_VAL_RUB_" + codeRubrique, avecVocLie);
            }
		}
		else {
            if (parent.posMessageBoxWarning)
                parent.posMessageBoxWarning("CST_JS_CURSOR_VOC");
            else
                parent.parent.posMessageBoxWarning("CST_JS_CURSOR_VOC");
        }
	}
	else 
	{
		if (arguments.length == 3)
		{
			if (codeType) {
                if (window.name && window.name.indexOf("frtableau") == 0)
                    lancer_chargement(codeRub, codeType, window.name + "." + "document.principal." + nomChamp, avecVocLie);
                else
                    lancer_chargement(codeRub, codeType,"document.principal." + nomChamp, avecVocLie);
            }
		}
	}
}

function charger_thesaurus(typeThesaurus,codeRub)
{
	if (arguments.length == 2)
	   lancer_chargement_thesaurus(typeThesaurus,codeRub, "");
}

function charger_thesaurus_elaboree(typeThesaurus,codeRub,champ)
{
	if (arguments.length == 3)
	   lancer_chargement_thesaurus(typeThesaurus,codeRub, champ);
}


/*
 * Affichage du vocabulaire pour une rubrique d'un type de document
 * NB : cette fonction ne permet pas l'affichage du vocabulaire lie
 * Normalement plus rapide que la fonction affichant le vocabulaire lie 
 *
 * codeType : code du type du document
 * codeRub : code de la rubrique pour laquelle le vocabulaire doit etre affiche
 * nomChamp : nom du champ dans lequel la valeur sera ajoute 
 */ 
function charger_vocabulaire_sans_lie(codeType, codeRub, nomChamp)
{
	var sansVocLie = 0;
	if (arguments.length == 0)
	{ 
		if (codeRubrique)
			lancer_chargement(codeRubrique, document.principal.POS_TYPEDOC.value, "document.principal.POS_VAL_RUB_" + codeRubrique, sansVocLie);
		else {
            if (parent.posMessageBoxWarning)
                parent.posMessageBoxWarning("CST_JS_CURSOR_VOC");
            else
                parent.parent.posMessageBoxWarning("CST_JS_CURSOR_VOC");
        }
        
	}
	else 
	{
		if (arguments.length == 3)
			lancer_chargement(codeRub, codeType,"document.principal." + nomChamp, sansVocLie);
	}
}


/*
 * Affichage pour la recherche elaboree pour que rub multi-critere se comporte comme 
 * une mono-critere (ie pour que la fenetre de vocabulaire se ferme automatiquement
 * en cliquant sur une valeur) 
 */
function charger_vocabulaire_rech_elabore(codeType, codeRub, nomChamp)
{
    if (codeRub == "N D" || codeRub == "N P" || codeRub == "N R" || codeRub == "F X")
    {
        parent.posMessageBoxWarning("CST_JS_NO_VOC_RUB_SYST");
        return;
    }
    
    numLoc = nomChamp.substring(nomChamp.lastIndexOf("_")+1,nomChamp.length);
	
	if(eval("document.principal.RUB_LIE_"+numLoc)!=null && eval("document.principal.RUB_LIE_"+numLoc).value.length > 0)
	{
	    tabValeurLie = eval("document.principal.RUB_LIE_"+numLoc).value.split("#");
		codeRub = tabValeurLie[1];
		codeType = tabValeurLie[0];
	}
	
	bVocabulaireLie = 0;
	bForceMonocritere = 1;
	if (codeType)
		lancer_chargement(codeRub, codeType,"document.principal." + nomChamp, bVocabulaireLie, bForceMonocritere);
}


/*
 * Affichage pour la recherche pour que rub multi-critere se comporte comme 
 * une mono-critere (ie pour que la fenetre de vocabulaire se ferme automatiquement
 * en cliquant sur une valeur) et que le vocabulaire lie ne soit pas affiche (+ rapide)
 */
function charger_vocabulaire_recherche()
{
	if (codeRubrique)
		lancer_chargement(codeRubrique, document.principal.POS_TYPEDOC.value, "document.principal.POS_VAL_RUB_" + codeRubrique, 0, 1);
	else
        parent.posMessageBoxWarning("CST_JS_CURSOR_VOC");
}

/*
 * Fonction interne
 * Ne doit pas etre appele par d'autres fichiers
 */ 
function lancer_chargement(codeRub, codeTyp, nomChamp, bVocabulaireLie, bForceMonocritere)
{
	var ref= get_url("URL_VOCAB");
	// gestion des caracteres speciaux
	ref+="POS_CODERUB=";
	ref+=escape(codeRub);
	ref+="&POS_TYPEDOC=";
	ref+=escape(codeTyp);
	ref+="&POS_CHAMP=";
	ref+=nomChamp;
	ref+="&POS_VOC_LIE=";
	ref+=bVocabulaireLie;
	ref+="&FORCE_MONOCRITERE=";
	ref+=bForceMonocritere;

    openFenetreVoc(ref, evalMsgJsVoc('CST_JS_TITRE_FEN_VOC'), 480, 480, 100, 100);
}

function evalMsgJsVoc(msg)
{
    if (parent.evalMsgJs)
        return parent.evalMsgJs(msg);
    else if (parent.parent.evalMsgJs)
        return parent.parent.evalMsgJs(msg);
	else if ( opener && opener.parent && opener.parent.evalMsgJs)
		return opener.parent.evalMsgJs(msg);
	else if ( parent.opener && parent.opener.parent && parent.opener.parent.evalMsgJs)
		return parent.opener.parent.evalMsgJs(msg);        
    else
        return msg;
}

function lancer_chargement_thesaurus(typeThesaurus, codeRub, codeChamp)
{
	var ref = get_url("URL_THESAURUS");
	// gestion des caractere speciaux
	ref += "POS_CODERUB=";
	ref += codeRub;
	ref += "&POS_TYPETHE=";
	ref += typeThesaurus;
	ref += "&POS_ETAT=CONSULTATION";
	ref += "&CHAMP=";
	ref += codeChamp;
	window.open(ref,"","width=550px,height=690px,top=100,left=100,resizable=1,scrollbars=0,modal=yes");
}

function charger_vocabulaire_hierarchique(szListRub, codeTyp, codeRub, nomChamp)
{
	var debutMot = "";
	if (arguments.length > 4)
	{
		for(var i=4;i<arguments.length;i++) {
            var obj = eval("document.principal.POS_VAL_RUB_"+arguments[i]);
            if (typeof obj[0] == 'object' && obj[0].type == "radio")
                debutMot += getValueRadio(eval("document.principal.POS_VAL_RUB_"+arguments[i]));
            else
                debutMot += eval("document.principal.POS_VAL_RUB_"+arguments[i]+".value");
            debutMot += String.fromCharCode(2);
        }
	}
	charger_vocabulaire_hierarchique_prive(szListRub, codeTyp, codeRub, 0, nomChamp, debutMot);
}

function charger_vocabulaire_hierarchique_auto(szListRub, codeTyp, codeRub, nomChamp)
{
	var debutMot = "";
	if (arguments.length > 4)
	{
		for(var i=4;i<arguments.length;i++) {
            var obj = eval("document.principal.POS_VAL_RUB_"+arguments[i]);
            if (typeof obj[0] == 'object' && obj[0].type == "radio")
                debutMot += getValueRadio(eval("document.principal.POS_VAL_RUB_"+arguments[i]));
            else
                debutMot += eval("document.principal.POS_VAL_RUB_"+arguments[i]+".value");
            debutMot += String.fromCharCode(2);
        }
	}
	charger_vocabulaire_hierarchique_prive(szListRub, codeTyp, codeRub, 1, nomChamp, debutMot);
}


/*
 * Affichage du vocabulaire hierarchique
 * szListRub : liste de toutes les rubriques de la liste hierarchique
 * codeTyp : code du type de document
 * codeRub : code de la rubrique
 * bRempliRubFille : remplissage automatique des valeurs filles
 * nomChamp : nom du champ
 * autres arguments : code des rubriques ancetres (du + ancien au plus recent)
 *   (ex rub arriere gd-mere, rub gd-mere, rb mere)
 */
function charger_vocabulaire_hierarchique_prive(szListRub, codeTyp, codeRub, bRempliRubFille, nomChamp, debutMot)
{
    var szUrl = "";
	szUrl = get_url("URL_VOCABHIER");
	// gestion des caractere speciaux
	szUrl +="POS_CODERUB=";
	szUrl +=escape(codeRub);
	szUrl +="&POS_TYPEDOC=";
	szUrl +=escape(codeTyp);
	szUrl +="&POS_CHAMP=";
    if (window.name && window.name.indexOf("frtableau") == 0)
        szUrl += window.name + "." + nomChamp;
    else
	szUrl +=nomChamp;
	szUrl +="&POS_DEBUTMOT=";
	szUrl +=escape(debutMot);
	szUrl +="&POS_SZLISTRUB=";
	szUrl +=escape(szListRub);
	szUrl +="&POS_AUTORUBFILLE=";
	szUrl +=bRempliRubFille;
	
	szUrl += "&POS_MULTI=";
	if(eval(nomChamp).type == "textarea")
	   	szUrl += "1";
	else
	    szUrl += "0";
    openFenetreVoc(szUrl, evalMsgJsVoc('CST_JS_TITRE_FEN_VOC'), 450, 480, 100, 100);
}

/**
 * Cette fonction permet d'ouvrir des fenetres modales (IE), le probleme est qu'elle n'autorise
 * pas l'ouverture de nouvelles fenetres dont elle serait la mere.
 */
function modelesswin(url,mwidth,mheight)
{ 
	if (window.showModelessDialog)
		return eval('window.showModelessDialog(url,window,"help:0;resizable:1;dialogWidth:'+mwidth+'px;dialogHeight:'+mheight+'px,status=no")') 
	else 
		return eval('window.open(url,"","width='+mwidth+'px,height='+mheight+'px,top=100,left=100,resizable=0,scrollbars=0,modal=yes")') 
} 


/**
 * Cette fonction est une alternative a la fonction precedente, elle ouvre un layer dans la page
 * qui le demande, on peut ensuite ouvrir d'autres fenetres externes
 */
function modelesswin_fichier(url,title, mwidth,mheight,mTop,mLeft)
{ 
    privateModeless('fenetre', "frfenetre.fermerFenetre", url, title, mwidth, mheight, mTop, mLeft);
}

function modelesswin_dossier(url,title, mwidth,mheight,mTop,mLeft)
{ 
    privateModeless('fenetre', 'closeFenetre', url, title, mwidth, mheight, mTop, mLeft);
}


/**
 * Fenetre de vocabulaire
 */
function openFenetreVoc(url, title, mwidth, mheight, mTop, mLeft)
{ 
    privateModeless('fenetrevoc', 'closeFenetreVoc', url, title, mwidth, mheight, mTop, mLeft);
} 

function privateModeless(baseid, methodeClose, url, title, mwidth, mheight, mTop, mLeft)
{ 
	var ecrit=false;
    var container = document;
    if (window.name && window.name.indexOf("frtableau") == 0)
        container = parent.document;
    var obj = container.getElementById('div' + baseid);
	if (obj == null) {obj = container.createElement("div");ecrit = true;}
		
	obj.style.width = (mwidth) + "px";
	obj.style.height = (mheight + 17) + "px";
    var textInnerHtml = "";
	textInnerHtml +="<table border=0 cellspacing='0' cellpadding='0' height="+mheight+" width="+mwidth+">";
	widthBarre = mwidth - 16;
	textInnerHtml +="<tr>";
    textInnerHtml +="<td class='titrefenetre' NOWRAP>&nbsp;"+title+"</td>";
    textInnerHtml +="<td align='right' class='titrefenetre' NOWRAP><IMG SRC='../../../../images/bouton/close.gif' onclick='"+methodeClose+"();'></td>";
	textInnerHtml +="</tr>";
	textInnerHtml +="<tr>";
	textInnerHtml +="<td colspan='2'>";
	textInnerHtml +="<iframe id='fr"+baseid+"' frameborder='0' name='fr"+baseid+"' height="+ (mheight-1) +" width="+ (mwidth) + " src=\""+url+"\"></iframe>";
	textInnerHtml +="</td></tr>";
	textInnerHtml +="</table>";
	obj.innerHTML = textInnerHtml;
	
	obj.style.top = (mTop + container.body.scrollTop) + "px";
	obj.style.left = (mLeft + container.body.scrollLeft) + "px";
	obj.style.position = "absolute";
	obj.style.display = "";
	obj.style.border ='1px solid #aaa';
    obj.id = 'div' + baseid;  
		
	if (ecrit)
	{
        container.body.appendChild(obj);
	}
} 

function closeFenetreVoc() {

	var voc = document.getElementById('divfenetrevoc');
    if(!voc)
        voc = parent.document.getElementById('divfenetrevoc'); 
    
    if(voc) {
    	voc.innerHTML = "";
        voc.style.display="none";
    }
} 

function closeFenetre() {
    
    var fen = document.getElementById('divfenetre');
    if(fen) {
        fen.innerHTML = "";
        fen.style.display = 'none';
    }
}

function afficheMasqueBloc(id)
{
	var objBloc = document.getElementById("bloc_"+id);
	var objImg = document.getElementById("img_"+id);
	if (objBloc.style.display == "none")
	{
		objBloc.style.display = "inline";
		objImg.src ='../../../../images/icons/moins1.gif';
	}
	else
	{
		objBloc.style.display = "none";
		objImg.src ='../../../../images/icons/plus1.gif';
	}
}

function getElementsWithClassName(elementName,className) {
	
	var allElements = document.getElementsByTagName(elementName);
	var elemColl = new Array();
	for (var i = 0; i< allElements.length; i++) {
 		if (allElements[i].className == className) {
  			elemColl[elemColl.length] = allElements[i];
 		}
	}
	return elemColl;
}

function afficheMasqueAllBlocs(bAffiche)
{
	var prefixBloc = "bloc_";
	var lstElts = getElementsWithClassName("*", "blocamasquer");
	for (var i = 0; i< lstElts.length; i++) 
	{
		if (lstElts[i].id != null )
		{
			var id = lstElts[i].id;
			var objImg = document.getElementById("img_" + id.substring(prefixBloc.length, id.length));
			if (bAffiche)
			{
				lstElts[i].style.display = "inline";
				objImg.src ='../../../../images/icons/moins1.gif';
			}
			else
			{
				lstElts[i].style.display = "none";
				objImg.src ='../../../../images/icons/plus1.gif';
			}
		}
	}
}

var isDocumentModified = false;
function initEcran()
{
    if (parent.isEcranPrincipal) {
    	var id = this.name;
        // cas des chgt hermes, le nom n'est pas mis a jour
        if (document.principal && document.principal.MODE && 
            (document.principal.MODE.value == "CONSULTATION" || document.principal.MODE.value == "MODIFICATION"))
            id = "ifr_posdocument_" + document.principal.POS_NUM_DOC.value;
        
		parent.setTitleDoc(id);
	}
	
	if (document.principal && document.principal.MODE && document.principal.MODE.value == "MODIFICATION") {
        /*
        document.principal.addEventListener("input", function () {
            if (!isDocumentModified) {
                if (document.activeElement != null && document.activeElement.name != "POS_ACTION_HERMES") {
                    document.title = "* " + document.title; 
                    parent.setTitle();
                    isDocumentModified = true;
                }
            }
        });
        */
    }        
}

function consulterDocFromTpl(iNumDoc){

    if (document.principal.MODE)
        consulterDocFromTplWithMode(iNumDoc, document.principal.MODE.value);
    else
        consulterDocFromTplWithMode(iNumDoc, "CONSULTATION");
}

function consulterDocFromTplWithMode(iNumDoc, mode){
	
    var sUrlConsultation = ""; 
    if(CST_TYPE_APPLI == 1)
        sUrlConsultation = "../../../../interface/session/principal/consultation/consulter_index.php?POS_NUM_DOC=";
    else
        sUrlConsultation = "../../../../servlet/interface/session/principal/consultation.ConsulterIndex?POS_NUM_DOC=";
    sUrlConsultation += iNumDoc;
    sUrlConsultation += "&MODE=" + mode;    
    parent.openPosDocument(sUrlConsultation);
}

function consulterDocDansOnglet(iNumDoc) {

	var mode = document.principal.MODE.value;
	var bChampModif = false;
	// si mode modification, appel de la fonction de verifiation des zones modifiees
	if(mode == "MODIFICATION")
		bChampModif = getIfChampModif(document.principal);
	if(mode == "CONSULTATION" || (bChampModif && confirm(parent.center.document.principal.LIBELLE_FERM_FICHE.value)) || !bChampModif)
	{
		if(mode == "MODIFICATION")
			parent.center.onModifier("POS_NUM_DOC="+iNumDoc+"&POS_OLD_NUMDOC=" + document.principal.POS_NUM_DOC.value);
		else
			parent.center.onConsulter("POS_NUM_DOC="+iNumDoc+"&POS_OLD_NUMDOC=" + document.principal.POS_NUM_DOC.value);
		parent.closeOnglet(frameElement.id);
	}
}

function creerDocFromTpl(sUrl){

    parent.openDocumentCreation(sUrl);
}

function focusOngletSel() {
    var ongletSel = document.querySelector(".titreongletsel a");
    if (ongletSel != null) {
        if (ongletSel.getAttribute('tabindex') == null)
            ongletSel.setAttribute('tabindex', '0')
        ongletSel.focus();
    }
}
    
function initCompletion()
{
    var TABCOMPLETION = new Array();
    TABCOMPLETION["recherche"] = new Array();
    TABCOMPLETION["creation"] = new Array();
    TABCOMPLETION["creation"]["FIC"] = new Array("FIC");
    TABCOMPLETION["consultation"] = new Array();
    if (typeof TABCOMPLETION["creation"][document.principal.POS_TYPEDOC.value] != 'undefined') {
    for (var i=0;i<TABCOMPLETION["creation"][document.principal.POS_TYPEDOC.value].length;i++) {
    var inputRub = document.getElementById('id_rub_' + TABCOMPLETION["creation"][document.principal.POS_TYPEDOC.value][i]);
    inputRub.onkeydown = function(event){return autoCompleteKeyDown(event);};
    inputRub.onkeyup = function(event){return searchSuggestMin(event, this, VOCAB_USED, 0, '');};
    /*inputRub.onblur = function(event) {
        console.log(document.activeElement);
        //console.log(document.contentWindow.document.activeElement);
        setTimeout(function()
        {
          console.log(document.activeElement);
           //closeSearch();
          //document.getElementById("focused").value = target ? target.id||target.tagName||target : '';
        }, 1);
       
       return false;
    };
    */
    inputRub.onclick = function(event){return closeSearch();};
    inputRub.setAttribute("autocomplete", 'off');
    }
    }
    //onKeyDown='return autoCompleteKeyDown(event);' onkeyup="return searchSuggestMin(event, this, VOCAB_USED, 0, 'lancerAssociationApresSaisie');" autocomplete="off" onClick="return closeSearch();"
    //onKeyDown='return autoCompleteKeyDown(event);' onkeyup="return searchSuggestMin(event, this, VOCAB_LIE, 0, 'lancerAssociationApresSaisie');" autocomplete="off" onClick="return closeSearch();" onBlur="return closeSearch();"
}
 

function initTplRecherche()
{
	initTplTypeDoc("RECHERCHE");
}

function initTplConsultation()
{
    initTplTypeDoc("CONSULTATION");
}

function initTplCreation()
{
    initTplTypeDoc("CREATION");

}

function initTplTypeDoc(mode)
{
    if (mode == "RECHERCHE") {
	parent.setTitle();
    }
    else if (mode == "CONSULTATION" || mode == "CREATION") {

        initEcran();
        updateCtrlValue();
        appel_desactivation();
    
        if (mode == "CONSULTATION") {
        
          var tabChampDate = document.querySelectorAll('.champDate');
          for (var i=0;i<tabChampDate.length;i++) {
            ValidateForm(tabChampDate[i]);        
          }
          
          if (document.principal.NUM_ONGLET != null && document.principal.NUM_ONGLET.value != "0")
            affiche_onglet(document.principal.NUM_ONGLET.value);
        }
        else {
            
            focus_to_rub_obligatoire(document.principal.RUB_ERREUR.value);
            if (parent.document.getElementById('POS_NUM_DOSSIER_POUR_AJOUT') && 
              parent.document.getElementById('POS_NUM_DOSSIER_POUR_AJOUT').value.length == 0) {
              document.getElementById('btn_creerdansdossier').disabled = true;
            }
            
            if(document.body.className.indexOf("tpl_creation") > -1 && document.principal.LISTE_RUB_VERROUILLEES)
		    {
		        var listeRubVerrouille = document.principal.LISTE_RUB_VERROUILLEES.value;
		        var tabRubVerrouille = listeRubVerrouille.split(';');
		        for (var i=0;i<tabRubVerrouille.length;i++)
		        {
		            if (eval("document.principal.POS_VAL_RUB_" + tabRubVerrouille[i]))
		            {
		                changeEtatElement(eval("document.principal.POS_VAL_RUB_" + tabRubVerrouille[i]), true);
		                //.className = "verrouille";
		            }
		        }
		    }
		            
            //initCompletion();
        }
    } 
        
    // placement du focus sur l'onglet
    focusOngletSel();
    
    // ajout listener focus sur les champs pour afficher le vocabulaire correspondant 
    var listInput = Array.prototype.slice.call(document.querySelectorAll("input[name^='POS_VAL_RUB_'],textarea[name^='POS_VAL_RUB_']"));
    listInput.forEach(function(element) {element.addEventListener("click", fixe_focus, false);});
}