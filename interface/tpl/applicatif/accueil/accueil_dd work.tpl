<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title></title>

<link href='/{NOM_APPLICATION}/include/style/style.css' type='text/css' rel='STYLESHEET' />
<link href='/{NOM_APPLICATION}/include/style/ecranprincipal.css' type='text/css' rel='STYLESHEET' />
<link href='/{NOM_APPLICATION}/include/style/menu_style_couleur.css' type='text/css' rel='STYLESHEET' />
<link href='/{NOM_APPLICATION}/include/style/{STYLE_THEME}.css' type='text/css' rel='STYLESHEET' />
<SCRIPT type='text/javascript' SRC='/{NOM_APPLICATION}/configuration/constantes.js'></SCRIPT>
<SCRIPT type='text/javascript' SRC='/{NOM_APPLICATION}/include/script/toolbar.js'></SCRIPT>
<script type='text/javascript' src="/{NOM_APPLICATION}/include/script/menu_util.js"></script>
<SCRIPT type='text/javascript'  SRC='/{NOM_APPLICATION}/include/script/fonction_util.js'></script>
<SCRIPT type='text/javascript' SRC='/{NOM_APPLICATION}/include/script/hashtable.js'></SCRIPT>
<SCRIPT type='text/javascript' SRC='/{NOM_APPLICATION}/include/script/fct_parent_menu.js'></SCRIPT>
<link rel="stylesheet" type="text/css" href="../../../../include/script/yui/build/container/assets/skins/sam/container.css"/>
<link rel="stylesheet" type="text/css" href="../../../../include/script/yui/build/resize/assets/skins/sam/resize.css"/>
<link rel="stylesheet" type="text/css" href="../../../../include/script/yui/build/layout/assets/skins/sam/layout.css" />
<script type='text/javascript' src="../../../../include/script/yui/yui-use.js"></script>
<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/tabview/assets/skins/sam/tabview.css" />
<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/yui/build/tabview/tabview-min.js'></script>
<link type="text/css" rel="stylesheet" href="/{NOM_APPLICATION}/include/script/jquery/layout-default-latest.css" />
<script type='text/javascript' src="/{NOM_APPLICATION}/include/script/jquery/jquery-1.11.1.min.js"></script>
<script type='text/javascript' src="/{NOM_APPLICATION}/include/script/jquery/jquery-ui.min.js"></script>
<script type='text/javascript' src="/{NOM_APPLICATION}/include/script/jquery/jquery.layout-latest.js"></script>
<!--arborescence -->
<link rel="stylesheet" type='text/css' href="/{NOM_APPLICATION}/include/script/jstree/themes/proton/style.css" />
<script type='text/javascript' src="/{NOM_APPLICATION}/include/script/jstree/jstree.js"></script>
<script type='text/javascript' src="/{NOM_APPLICATION}/include/script/accueil_principal.js"></script>
<SCRIPT type='text/javascript'>
var bLienMenu = 0;
var sTitreFileDialog = "{LIBELLE_FENETRE_FICHIER_APPLET}";
var affichePleinEcran = "{DISPLAY_PLEIN_ECRAN}";
var vocab;
var numInstance = {NUM_INSTANCE};
// pour que les autres ?crans puissent tester si c'est l'?cran principal
var isEcranPrincipal = 1;
var iNbDocParPage = {NB_REPONSES_PAR_PAGE};
var szMenuLocation = '{URL_ACCES_DIRECT_MENU}';
var sNomUtilisateur = "{NOM_UTILISATEUR}";
var sProfilUtilisateur = "{PROFIL_UTILISATEUR}";
var openDocumentOnConnect = {OPEN_DOCUMENT_ON_CONNECT};
var openDocumentOnConnectUrl = "{OPEN_DOCUMENT_ON_CONNECT_URL}";
var sUrlCenterBal = "{URL_ATTENTE}?URL={URL_AFFICHER_QUESTION}";
var sUrlCenter = "{URL_ATTENTE}?URL={URL_CENTER}";
var sUrlAttenteDeconnect = "{URL_ATTENTE_DECONNECT}"; 
var sFrameAccueil = "{FRAME_ACCUEIL}";
var sUrlAttente = "{URL_ATTENTE}";
var sUrlResultat = "{URL_RESULTAT}";
var sUrlRechercheFtx = "{URL_RECHERCHE_FTX}";
var sUrlAfficheHisto = "{URL_AFFICHE_HISTORIQUE}";
var sUrlAfficheHistoQuest = "{URL_AFFICHE_HIST_QUESTION}";
var sUrlAfficherMenu = "{URL_AFFICHER_MENU}";
var sUrlChoixType = "{URL_CHOIX_TYPE}";
var sUrlVersion = "{URL_VERSION}";
var sUrlFermerApplication = "{URL_FERMER_APPLICATION}";
var sLibelleTitre = "{CST_LIBELLE_DEBUT_TITRE}";
var isOpenFileHiddenFr = "{IS_OPEN_FILE_HIDDEN_FRAME}";

var displayMenuSousArbo = {DISPLAY_MENU_SOUS_ARBO};
var isVerifSession = {VERIF_SESSION};
var nextVerifSession = {NEXT_VERIF_SESSION};
var largeurFromMenu = {LARGEUR_FRM_MENU};

var isAfficheMenu = true;
var isAfficheArbo = true;
var isAfficheCenterPleinEcran = false;
var tailleImageEntete = 74;
var marginTop = 5;
var marginBottom = 5;
var hauteurBarreTitre = 22;
var hauteurArrondiBas = 0;
var marginBetweenMenu = 10;
var szFrameEnCours = "";
var currentClientHeight = 0;
var currentClientWidth = 0;
var isAfficheMenuEnHaut = {AFFICHAGE_MENU_EN_HAUT};
var pourcentageMenu = {POURCENTAGE_TAILLE_MENU};
var isModePortail = {MODE_PORTAIL};
var isModeOnglet = {MODE_ONGLET};
var dateModifDf = "{DATE_MODIF_DF}";
var sUrlCurrentAssocation = "";
var labelInsertionDos = "{MENU_INSERTION_DOS}";
var labelStopInsertionDos = "{MENU_STOP_INSERTION_DOS}";
var msgErrArboNoDossSelect = "{CST_MSG_ERR_ARBO_NO_DOSS_SELECT_DD}";
var msgConfirmInsertDosDrag1 = "{CST_MSG_CONFIRM_INSERT_DOS_DRAG1}";
var msgConfirmInsertDosDrag2 = "{CST_MSG_CONFIRM_INSERT_DOS_DRAG2}";
var msgConfirmInsertDosCheckbox = "{CST_MSG_CONFIRM_INSERT_DOS_CHECKBOX}";
var msgTipRedimensionner = "Redimensionner";
var msgTipAfficherPanneauLateral = "Afficher le panneau lat?ral";
var msgTipMasquerPanneauLateral = "Masquer le panneau lat?ral";
var msgTipAfficherMenu = "Afficher le menu";
var msgTipMasquerMenu = "Masquer le menu";
var libVersion = "{LIBELLE_VERSION}";
var childrenInitTree = {ARBORESCENCE};

{LISTE_MSG_JS}

function getNumInstance()
{
    return numInstance;
}

function log(szMessage) {
    YAHOO.log(szMessage);
}

function showElement(element)
{
    var s = "";
    for (a in element)
    {
       s += a +  " : " + element[a] + "\n";
    }
    return s;
}

function openFileModif(szUrlAppletFile) {
    openAppletOrJnlp(szUrlAppletFile, 300, 400, 250, 150);
}

function openAppletOrJnlp(szUrlAppletFile, iWidth, iHeight, iLeft, iTop) {
    if (isOpenFileHiddenFr == "1") {
        var obj = document.getElementById('ifr_jnlp');
    	if (obj == null) {
            obj = document.createElement("div");
            obj.style.display = "none";
            obj.innerHTML = "<iframe id='ifr_jnlp' frameborder='0' name='ifr_jnlp'></iframe>";
            obj.id = 'div_jnlp';  
    	    document.body.appendChild(obj);
        }
        window.ifr_jnlp.location.href = szUrlAppletFile;
    }
    else {
        modelesswinyui(szUrlAppletFile, sTitreFileDialog, {width: iWidth, height: iHeight, 
                            left: iLeft, top: iTop});
    } 
}

function closeFileModif()
{
    panelFile.hide();
}

var yuidialogdiv = false;
var simpleDialog = null;
function yuidialog(sTitreFileDialog, texte, coord)
{
	if (!yuidialogdiv) 
    {
        yuidialogdiv = document.createElement("div");
        yuidialogdiv.id = "yuidialogdiv";
        // ? masquer sinon r?serve la place et affiche des ascenseurs
        yuidialogdiv.style.display = "none";
        document.body.insertBefore(yuidialogdiv, document.body.firstChild);
        yuidialogdiv.style.display = "";
        simpleDialog = new YAHOO.widget.SimpleDialog("yuidialogdiv", {
	        width: "50em",
	        effect:{
	            effect: YAHOO.widget.ContainerEffect.FADE,
	            duration: 0.25
	        },
	        fixedcenter: true,
	        modal: true,
	        visible: false,
	        draggable: true,
	        buttons: [ { text: "Fermer", handler: function() {
	                            this.hide(); }}]
	    });
    }
    
    simpleDialog.setHeader(sTitreFileDialog);
    simpleDialog.setBody(texte);
    simpleDialog.cfg.setProperty("icon", YAHOO.widget.SimpleDialog.ICON_WARN);
	simpleDialog.render();
    simpleDialog.show();
}

var yuiwaitdiv = false;
var simpleWait = null;
function yuiWaitOpen(sTitreFileDialog, frName, nomFnAnnuler)
{
    simpleWait = new YAHOO.widget.Panel("wait",    
         { width:"240px", 
           height:"180px", 
           xy:[100,300],  
           close:false,   
           draggable:false,   
           zindex:4,  
           modal:true,  
           visible:false  
         });  
    simpleWait.setHeader(sTitreFileDialog);
    var sBody = "<div style='text-align: center;'><img src='../../../../images/icons/attente.gif'><br>";
    sBody += "<input type='button' class='bouton' value='Annuler' onClick=\"frames['"+frName+"']."+nomFnAnnuler+"();\"></div>";  
    simpleWait.setBody(sBody);
    simpleWait.render(document.body);
    simpleWait.show();
}
function yuiWaitClose() {
    simpleWait.hide();
}

if (!Array.isArray)
{
    Array.isArray = function (obj) {
        return Object.prototype.toString.call(obj) === "[object Array]";
    };
}

function evalMsgJs(s) {
    if (s.indexOf("CST_JS_") == 0)
        s = eval(s);
    return s;
}

function posMessageBoxWarning(s) {
    var message = "";
    if (Array.isArray(s)) {
        for(var i=0;i<s.length;i++)
            message += evalMsgJs(s[i]); 
    }
    else
        message = evalMsgJs(s); 
    yuidialog("Attention", message, [20, 20, 200, 300]);
}

function posMessageBoxConfirm(s) {
    var message = "";
    if (Array.isArray(s)) {
        for(var i=0;i<s.length;i++)
            message += evalMsgJs(s[i]); 
    }
    else
        message = evalMsgJs(s); 
    return confirm(message);
}

var overlayPosInformation = null; 
function showPosInformation(s) {
    var message = "";
    if (Array.isArray(s)) {
        for(var i=0;i<s.length;i++)
            message += evalMsgJs(s[i]); 
    }
    else
        message = evalMsgJs(s);
	if (overlayPosInformation == null) {
        overlayPosInformation = new YAHOO.widget.Overlay("posInformation", { xy:[600,200],
                                              visible:false,
											   width:"300px" } );
    	overlayPosInformation.setHeader("Information");
    	overlayPosInformation.render(document.body);
    }
    overlayPosInformation.setBody("<br>" + s + "<br>");
    overlayPosInformation.show();         

    return true;
}

function hidePosInformation() {
	if (overlayPosInformation != null) {
        overlayPosInformation.hide();
    }
    return true;
}

var PosTabView = function(id) {
    this.tabView = new YAHOO.widget.TabView(id);
}

PosTabView.prototype.addListener = function(event, fct) {
    this.tabView.addListener(event, fct);
}

PosTabView.prototype.selectTab = function(indOnglet) {
    this.tabView.selectTab(indOnglet);
}

PosTabView.prototype.addTab = function(tab, ind) {
    this.tabView.addTab(tab, ind);
}

PosTabView.prototype.get = function(tabs) {
    return this.tabView.get(tabs);
}

PosTabView.prototype.removeTab = function(tab) {
    this.tabView.removeTab(tab);
}

PosTabView.prototype.getTab = function(indOnglet) {
    return this.tabView.getTab(indOnglet);
}

var PosLayout = function(isModeTabView) {
    
    this.isModeTabView = isModeTabView;
    //this.tabView = new YAHOO.widget.TabView('div_center');
    this.tabView = new PosTabView('div_center');
    this.tabView.addListener('activeIndexChange', onChangeTabIndex);
}
PosLayout.prototype.openPosDocument = function (szUrlConsulter) {
    
    var iNumDoc;
    var debutChaine = szUrlConsulter.indexOf("POS_NUM_DOC=");
    if (debutChaine != -1)
    {
        debutChaine += "POS_NUM_DOC=".length;
        var finChaine = szUrlConsulter.indexOf("&", debutChaine);
        if (finChaine != -1)
            iNumDoc =  szUrlConsulter.substring(debutChaine, finChaine);
        else
            iNumDoc =  szUrlConsulter.substring(debutChaine);
        
        var indOnglet = findOngletByIdContent("tab_posdocument_"+iNumDoc);
        // document deja ouvert
        if (indOnglet != -1) {
            this.tabView.selectTab(indOnglet);
        }
        else {
            var sContent = "<iframe frameborder='0' style='height: 100%;width: 98%;margin-left:10px;' src='"+szUrlConsulter+"' id='ifr_posdocument_"+iNumDoc+"' name='ifr_posdocument_"+iNumDoc+"'>";
            var newtab = new YAHOO.widget.Tab({ label: iNumDoc, content: sContent});
            newtab.get('contentEl').id = "tab_posdocument_"+iNumDoc;
            this.tabView.addTab( newtab);
            var nbTab = this.tabView.get('tabs').length;
            this.tabView.selectTab(nbTab - 1);
            szFrameEnCours = "ifr_posdocument_"+iNumDoc;
        }
    }
}

var iNbDocumentCreation = 0;
PosLayout.prototype.openDocumentCreation = function (szUrlCreer) {
    
    var sContent = "<iframe frameborder='0' style='height: 100%;width: 98%;margin-left:10px;' src='"+szUrlCreer+"' id='ifr_posdoc_creation_"+iNbDocumentCreation+"' name='ifr_posdoc_creation_"+iNbDocumentCreation+"'>";
    var newtab = new YAHOO.widget.Tab({ label: "Creation", content: sContent});
    newtab.get('contentEl').id = "tab_posdoc_creation_"+iNbDocumentCreation;
    this.tabView.addTab( newtab);
    var nbTab = this.tabView.get('tabs').length;
    this.tabView.selectTab(nbTab - 1);
    szFrameEnCours = "ifr_posdoc_creation_"+iNbDocumentCreation;
    iNbDocumentCreation++;
}

PosLayout.prototype.getFramePosDocument = function (iNumDoc) {
    var sName = "";
    if (frames["center"].principal && frames["center"].principal.POS_NUM_DOC &&
        frames["center"].principal.POS_NUM_DOC.value == iNumDoc)
        sName = "center";
    else    
        sName = "ifr_posdocument_"+iNumDoc;
    return frames[sName];   
}

PosLayout.prototype.closeOnglet = function(idIFrm)  {
    
    if (idIFrm.indexOf("ifr_posdocument_") != -1 || idIFrm.indexOf("ifr_posdoc_creation_") != -1
            || idIFrm.indexOf("ifr_center") != -1)
    {
        var sContentOngletId = idIFrm.replace("ifr", "tab");
        var indOnglet = findOngletByIdContent(sContentOngletId);
        if (indOnglet != -1) {
            if (idIFrm.indexOf("ifr_center") != -1) {
                document.body.appendChild(document.getElementById("ifr_center"));
                document.getElementById('ifr_center').style.display = "none";
            }
            this.tabView.removeTab(this.tabView.get('tabs')[indOnglet]);
            if (selectedOngletBeforeClose != -1 && selectedOngletBeforeClose != indOnglet) {
                if (selectedOngletBeforeClose >= this.tabView.get('tabs').length)
                    selectedOngletBeforeClose = this.tabView.get('tabs').length - 1;   
                this.tabView.selectTab(selectedOngletBeforeClose);
                selectedOngletBeforeClose = -1;
            }
        } 
    }
}

PosLayout.prototype.changeIdFramePosDocument = function (oldNumDoc, newNumDoc) {
    
    this.changeIdFrame("posdocument_" + oldNumDoc, "posdocument_" + newNumDoc);
}

PosLayout.prototype.changeIdFrameCreationToDocument = function(newNumDoc) {

    var tabTab = this.tabView.get('tabs');
    var iNumOnglet = this.tabView.get('activeIndex');
    if (iNumOnglet != -1) {
        var idTab = tabTab[iNumOnglet].get('contentEl').id; 
        var id = idTab.replace("tab_", "");
        this.changeIdFrame(id, "posdocument_" + newNumDoc);
    }
}

PosLayout.prototype.changeIdFrame = function (oldId, newId) {
    
    var frDoc = document.getElementById("ifr_" +oldId);
    if (frDoc != null) {
        frDoc.id = "ifr_"+newId;
        frDoc.name = frDoc.id; 
        
        var indOnglet = findOngletByIdContent("tab_"+oldId);
        if (indOnglet != -1) {
            var tabTab = this.tabView.get('tabs');
            tabTab[indOnglet].get('contentEl').id = "tab_" + newId; 
        }
    }
}

PosLayout.prototype.findOngletByIdContent = function(sContentOngletId)  {

    var indOnglet = -1;
    var tabTab = this.tabView.get('tabs');
    for(var i=0;i<tabTab.length;i++) {
        if (tabTab[i].get('contentEl').id == sContentOngletId) {
            indOnglet = i;
            break;
        }
    }
    return indOnglet;
}

PosLayout.prototype.basculerEcran = function(szEcran)  {

    clearObjetsDrag();
    if (szEcran == 'center')
    {
        var iNumOnglet = findOngletByIdContent("tab_center");
        if (iNumOnglet == -1) {
            var newtab = new YAHOO.widget.Tab({ label: ""});
            newtab.get('contentEl').id = "tab_center";
            newtab.get('contentEl').appendChild(document.getElementById('ifr_center'));
            this.tabView.addTab(newtab, 1);
        }
        else {
        
            var idFrm = "center";
            if (frames[idFrm].principal && frames[idFrm].principal.POS_NUM_DOC
                        && frames[idFrm].principal.MODE &&
                        typeof (window.frames[idFrm].FermerIndex) == 'function') {
                window.frames[idFrm].FermerIndex();
            }
        }
        try {
            if (document.center && document.center.closeCtxMenu)
                document.center.closeCtxMenu();
		}
		catch(e) {
		}
   	}
    
    if (szEcran == 'centerbal') {
        this.tabView.selectTab(0);
        document.getElementById('ifr_centerbal').style.display = "";
        szFrameEnCours = 'ifr_centerbal';
    }
    else if (szEcran == 'center') {
        this.tabView.selectTab(1);
        document.getElementById('ifr_center').style.display = "";
        document.getElementById('tab_center').style.display = "";
        szFrameEnCours = 'ifr_center';
    }
}

var selectedOngletBeforeClose = -1;
                
PosLayout.prototype.closeOngletDocByCross = function(sFrmId) {

    selectedOngletBeforeClose = this.tabView.get('activeIndex');
    if(sFrmId.indexOf('ifr_posdoc_creation_') != -1
    	|| sFrmId == "ifr_center") {
        closeOnglet(sFrmId);
    }
    else if(!window.frames[sFrmId].PosConfirmFermerIndexTestModif()) {
        return false;
    }
    else {
        window.frames[sFrmId].FermerIndex();
        window.bLienMenu = 1;
    }
} 

function htmlEscape(str) {
    return String(str)
            .replace(/&/g, '&amp;')
            .replace(/"/g, '&quot;')
            .replace(/'/g, '&#39;')
            .replace(/</g, '&lt;')
            .replace(/>/g, '&gt;');
}

PosLayout.prototype.setTitle = function()  {

    try {
        var _this = this;
        if (this.tabView && this.tabView.get('activeTab'))
        {
            var tabTab = this.tabView.get('tabs');
            var iNumOnglet = this.tabView.get('activeIndex');
            var idFrm = tabTab[iNumOnglet].get('contentEl').id; 
            var nameFrm = idFrm.replace("tab", "ifr");
            // sur chrome, l'objet retourn? est un HTMLIFrameElement (acces au contentDocument plut?t qu'au document)
            var sTitre = (document.getElementById(nameFrm).contentDocument) ? document.getElementById(nameFrm).contentDocument.title : document.getElementById(nameFrm).document.title;
            sTitre = htmlEscape(sTitre);
            if (iNumOnglet != -1 && iNumOnglet != 0) {
                // cas des documents
                if (iNumOnglet > 1 || (openDocumentOnConnect == 1 && nameFrm.indexOf("ifr_posdocument") != -1)
                    || nameFrm == "ifr_center"
                    || nameFrm.indexOf("ifr_posdoc_creation_") != -1)
                    sTitre += '&nbsp;<span class="closeonglet" onClick="closeOngletDocByCross(\''+nameFrm+'\');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>';
                
                if (openDocumentOnConnect == 1 && nameFrm.indexOf("ifr_posdocument") != -1)
                    openDocumentOnConnect = 0;
                this.tabView.getTab(iNumOnglet).set('label', "&nbsp;" + sTitre);
            }
            
            // anomalie raffraichissement des label sur IE8, la taille de l'onglet ne s'adapte pas
            if (this.tabView.get('activeIndex') && this.tabView.get('activeIndex') >= 0 && 
                                               this.tabView.get('activeIndex') < this.tabView.get('tabs').length)
                this.tabView.selectTab(this.tabView.get('activeIndex'));
        }
    }
    catch(e) {
    }
}

PosLayout.prototype.setTitleDoc = function(nameFrm)  {

	try {
        var tabTab = this.tabView.get('tabs');
        var s = "";
        var idFrm = nameFrm.replace("ifr", "tab");

        var iNumOnglet = -1;
        for(var i=tabTab.length -1;i>= 1;i--) {
            var idTab = tabTab[i].get('contentEl').id;
            
            if (idTab === idFrm) {
                iNumOnglet = i;
                break;
            }
        }
        if (iNumOnglet != -1) {
            // sur chrome, l'objet retourn? est un HTMLIFrameElement (acces au contentDocument plut?t qu'au document)
            var sTitre = (document.getElementById(nameFrm).contentDocument) ? document.getElementById(nameFrm).contentDocument.title : document.getElementById(nameFrm).document.title;
            sTitre = htmlEscape(sTitre);
            sTitre += '&nbsp;<span class="closeonglet" onClick="closeOngletDocByCross(\''+nameFrm+'\');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>';
                
            if (openDocumentOnConnect == 1 && nameFrm.indexOf("ifr_posdocument") != -1)
                openDocumentOnConnect = 0;
            this.tabView.getTab(iNumOnglet).set('label', "&nbsp;" + sTitre);
        }
    }
    catch(e) {
    }
}

PosLayout.prototype.onChangeTabIndex = function(e)  {

    if (document.center && document.center.closeCtxMenu)
        document.center.closeCtxMenu();
    clearObjetsDrag();
    return true;
}


PosLayout.prototype.testOpenDocument = function(bCloseDoc)
{
    if (bCloseDoc) {
    
        var tabTab = this.tabView.get('tabs');
        var s = "";
		try {
            for(var i=tabTab.length -1;i>= 1;i--) {
                var idTab = tabTab[i].get('contentEl').id;
                if (idTab.indexOf("tab_posdocument_") != -1 || idTab.indexOf("tab_posdoc_creation_") != -1 ||
                    // cas o? la frame centrale contient un document
                    (idTab.indexOf("tab_center") != -1  && frames["center"].principal && frames["center"].principal.POS_NUM_DOC
                        && frames["center"].principal.MODE))
                {
                    var idFrm = idTab.replace("tab", "ifr");
                    if (idFrm == "ifr_center")
                        idFrm = "center";    
                    this.tabView.selectTab(i);
                    if(idFrm.indexOf('ifr_posdoc_creation_') != -1) {
                        closeOnglet(idFrm);
                    }
                    else {
						if (typeof (window.frames[idFrm].PosConfirmFermerIndexTestModif) == 'function') {
		                    if(!window.frames[idFrm].PosConfirmFermerIndexTestModif()) {
		                        return false;
		                    }
		                    else {
		                        window.frames[idFrm].FermerIndex();
		                        window.bLienMenu = 1;
		                    }
		            	}
					}
				}
            }
		}
		catch(e) {
		}
    }
    return true;
}



function openPosDocument(szUrlConsulter)
{
    return posLayout.openPosDocument(szUrlConsulter);
}

function openDocumentCreation(szUrlCreer)
{
    return posLayout.openDocumentCreation(szUrlCreer);
}

function closeOnglet(idIFrm) 
{
    return posLayout.closeOnglet(idIFrm);
}

function findOngletByIdContent(sContentOngletId) 
{
    return posLayout.findOngletByIdContent(sContentOngletId);
}

function basculerEcran(szEcran)
{
    return posLayout.basculerEcran(szEcran);    
}

function setTitle()
{
    return posLayout.setTitle();
}

function setTitleDoc(sFrName)
{
    return posLayout.setTitleDoc(sFrName);
}

function closeOngletDocByCross(sFrmId)
{
    return posLayout.closeOngletDocByCross(sFrmId);
}
 
function onChangeTabIndex(e) {
    return posLayout.onChangeTabIndex(e);   
}

function testOpenDocument(bCloseDoc) {
    return posLayout.testOpenDocument(bCloseDoc);
}

function getFramePosDocument(iNumdoc) {
    return posLayout.getFramePosDocument(iNumdoc);
}

function closeCenterOnglet() {
    return posLayout.closeOnglet("ifr_center");
}

function changeIdFramePosDocument(oldNumdoc, newNumDoc) {
    return posLayout.changeIdFramePosDocument(oldNumdoc, newNumDoc);
}

function changeIdFrameCreationToDocument(newNumDoc) {
    return posLayout.changeIdFrameCreationToDocument(newNumDoc);
}

function getIdEcranCourant()
{
    return 'div_center';
}

function afficherMenu(szFonction)
{
    var bAffPage;
    if (szFonction == 'accueil')
    {
        bAffPage = window.frames['menu_fonction'].affichePage('accueil','javascript:void(0)');
        if (bAffPage)
        {
	        window.frames['menu_fonction'].document.location.href =  szMenuLocation;
        }
    }
    if (szFonction == 'recherche')
    {
        bAffPage = window.frames['menu_fonction'].affichePage('recherche', sUrlChoixType + '?ACTION=RECHERCHE');
        if (bAffPage)
        {
	        window.frames['menu_fonction'].document.location.href = sUrlAfficherMenu + '?MENU=recherche';
        }
    }
    if (szFonction == 'parametrage')
    {
        window.frames['menu_fonction'].document.location.href = sUrlAfficherMenu + '?MENU=parametrage';
    }
    
    if (szFonction == 'creation')
    {
        window.frames['menu_fonction'].document.location.href = sUrlAfficherMenu + '?MENU=creation';
        window.frames['menu_fonction'].affichePage('recherche', sUrlChoixType + '?ACTION=CREATION');
    }
    
    if (!isAfficheMenu)
    {
        //isAfficheMenu = true;
        positionnement();
    }
}

function clearObjetsDrag()
{
    document.getElementById('dd-demo-0').style.display = "none";
}

var bFirstLoad = true;
function getIfFirstLoad()
{
    var bFirstLoadTmp = bFirstLoad;
    bFirstLoad = false;
    return bFirstLoadTmp;   
}
var bEcranDeconnexion=0;
function onUnload()
{
	if (bEcranDeconnexion == 0)
	{
		szUrlUnload = sUrlAttenteDeconnect; 
		//open(szUrlUnload, "", "top=200,left=350,width=300px,height=100px,resizable=0,scrollbars=0");
		var searchReq = getHTTPObjectParent();
        var sUlrRep = "../connexion/ajax_deconnect.php";
        if (searchReq.readyState == 4 || searchReq.readyState == 0)
		{
		   	searchReq.open("GET", sUlrRep, false);
		   	searchReq.send(null);
            if (searchReq.readyState == 4 || searchReq.readyState == 0)
    		{
    		  var objAction = eval('(' + searchReq.responseText + ')');
    		}
	    }
		bEcranDeconnexion = 1;
	}
}

function setWindowTitle(userName, profilName)
{
    document.title = sLibelleTitre + userName + " : " + profilName + "] - SESIN";
}

setWindowTitle(sNomUtilisateur, sProfilUtilisateur);
var posLayout;

var containerLayout, leftLayout;
function initEcran()
{
    containerLayout = $('#container').layout({
        defaults: {
    		//	reference only - these options are NOT required because 'true' is the default
            resizerTip: msgTipRedimensionner, 
    		closable: true,	// pane can open & close
    		resizable: true,	// when open, pane can be resized 
    		slidable: false,	// when closed, pane can 'slide' open over other panes - closes on mouse-out
            animatePaneSizing:	false,
    		livePaneResizing:true
		},
        west: {
            size: largeurFromMenu,
            minSize: 100,
            resizeWhileDragging: true,
            togglerTip_closed: msgTipAfficherPanneauLateral,
            togglerTip_open: msgTipMasquerPanneauLateral,
            showOverflowOnHover: false,
            spacing_open: 18,
            spacing_closed: 18,
            initClosed: (affichePleinEcran == "1") ? true : false
        },
        
		  //	some resizing/toggling settings
		  north__slidable:			false,	// OVERRIDE the pane-default of 'slidable=true'
		  north__togglerLength_closed: '100%',	// toggle-button is full-width of resizer-bar
		  south__resizable:			false,	// OVERRIDE the pane-default of 'resizable=true'
		  south__spacing_open:		0,		// no resizer-bar when open (zero height)

		  //	some pane-size settings
		  center__minWidth:			300,
		  west__fxName_close:			"none",	// NO animation when closing west-pane
          west__fxName_open:			"none",	// NO animation when closing west-pane

		  // enable state management
		  stateManagement__enabled:	true, // automatic cookie load & save enabled by default
          showDebugMessages: false // log and/or display messages from debugging & testing code
		}
    );
    
    leftLayout = $('#leftPanel').layout({
        defaults: {
    		//	reference only - these options are NOT required because 'true' is the default
            resizerTip: msgTipRedimensionner, 
    		closable: true,	// pane can open & close
    		resizable: true,	// when open, pane can be resized 
    		slidable: false,	// when closed, pane can 'slide' open over other panes - closes on mouse-out
            animatePaneSizing: false,
    		livePaneResizing:true
		},

        center: {
            resizeWhileDragging: true,
            showOverflowOnHover: false,
            spacing_open: 0,
            spacing_closed: 0,
            fxName_close: "none",
            fxName_open: "none"
        },  
        south: {
            resizeWhileDragging: true,
            togglerTip_closed: msgTipAfficherMenu,
            togglerTip_open: msgTipMasquerMenu,
            showOverflowOnHover: false,
            spacing_open: 18,
            spacing_closed: 18,
            size:300,
            initClosed: true
        },
        
		  // enable state management
		  stateManagement__enabled:	true, // automatic cookie load & save enabled by default
          showDebugMessages: false // log and/or display messages from debugging & testing code
		}
    );
    if (!displayMenuSousArbo)
        leftLayout.options.south.spacing_closed = 0;
    posLayout = new PosLayout(isModeOnglet);
    
    basculerEcran(sFrameAccueil); 
    positionnement();
    
    window.centerbal.location.href = sUrlCenterBal;
    window.center.location.href = sUrlCenter;
    if (openDocumentOnConnect == 1) {
        openPosDocument(openDocumentOnConnectUrl);
    }
    
    if (isVerifSession)
        setTimeout("checkConnexion()", nextVerifSession);
    
    // initialisation de l'arbre    
    treeInit();        
/** Modification Andry DEBUT - stabiliser barre verticale*/
if($("#div_menu").length > 0){
        $("#div_menu").css({
            "overflow": "hidden"
        });
    }

    if($("div.ui-layout-resizer-west").length > 0){
        $("div.ui-layout-resizer-west").attr("ondragstart", "containerState('dragStart')");
        $("div.ui-layout-resizer-west").attr("ondrag", "containerState('drag')");
    }

    if($("div.ui-layout-resizer-south").length > 0){
        $("div.ui-layout-resizer-south").attr("ondragstart", "divMenuState('dragStart')");
    }

    if($("div.ui-layout-resizer-south").length > 0){
        $("div.ui-layout-resizer-south").draggable({
            axis: "y",
            zIndex: 5000,
            stop: function(){
                if($("#div_menu").length > 0){
                    $("#div_menu").css({
                        "z-index": 0
                    });
                }
            }
        });
        $("div.ui-layout-resizer-south-open").css({
            "bottom": "306px"
        });
    }

    if($("div.ui-layout-resizer-west").length > 0){
        $("div.ui-layout-resizer-west").draggable({
            axis: "x",
            refreshPositions: false,
            zIndex: 5000,         
            helper: "clone",
            stop: function(){
                if($("#container_onglet").length > 0){
                    $("#container_onglet").css({
                        "z-index": 0
                    });
                }
                if($("#div_menu").length > 0){
                    $("#div_menu").css({
                        "z-index": 0
                    });
                }
            }
        });
    }
    /** Modification Andry FIN - stabiliser barre verticale*/
	document.getElementById('focusFirst').focus();
}
function getHTTPObjectParent()
{
	if(window.XMLHttpRequest) {
		return new XMLHttpRequest();
	}
	else if (window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}

function positionnement()
{
}

function testpositionnement()
{
    // test si la difference est importante pour ?viter des repositionnement intempestifs sous IE (affichage/masquage scrollbar)
    if (currentClientHeight - document.body.clientHeight > 25 || document.body.clientHeight - currentClientHeight > 25 ||
        currentClientWidth - document.body.clientWidth  > 25 || document.body.clientWidth - currentClientWidth > 25 )
        positionnement();
}

function debutChargementBal()
{
    document.getElementById("carteviz_util").src = "../../../../images/icons/reload_anime.gif";
}

function finChargementBal()
{
    document.getElementById("carteviz_util").src = "../../../../images/carteviz/utilisateur.png";
}

/* 
 * Fonction pour la barre d'outils
 */ 
function afficherQuestionUrl(szQuestion)
{
   var szUrl = sUrlAttente + "?URL="+sUrlResultat+"&TYPE_RECHERCHE=RECHERCHE_BIB&POS_QUEST_PUBLIC=1&POS_QUEST_NOM=" + escape(szQuestion);
   afficherUrl(szUrl);
}

function afficherRechercheTexte()
{
    var szValeurRecherche = document.getElementById('champ_recherche').value;
    
    if (szValeurRecherche.length == 0)
       posMessageBoxWarning("CST_JS_VALEUR_RECH_VIDE");
    else 
    {
        /*
	    var szUrl = sUrlAttente + "?URL=../ftx/recherche_ftx.php";
        szUrl += "&POS_CHOIX_LIB=" + escape("COA;COD;EML;NOT");
        szUrl += "&POS_TRI=0";
        szUrl += "&TYPE_CHOIX_RUB=RUB_ET_FIC";
        szUrl += "&POS_NB_REP=20";
        szUrl += "&POS_QUESTION=" + escape(szValeurRecherche);
        afficherUrl(szUrl);
        */
        var szUrl = sUrlAttente + "?URL=../resultat/rechercher_db.php";
        szUrl += "&POS_TYPEDOC=FIC";
        szUrl += "&POS_TRI=0";
        szUrl += "&TYPE_RECHERCHE=RECHERCHE_SIMPLE";
        //szUrl += "&POS_OP_RUB_NOE=:";
        szUrl += "&POS_NB_REP=20";
        szUrl += "&POS_VAL_RUB_NAT=" + escape(szValeurRecherche);
        afficherUrl(szUrl);
    }
}

function afficherVersion() {
    window.open(sUrlVersion, libVersion, 'screenX=350,screenY=250,scrollbars=no,location=no,toolbar=no,status=no,width=300,height=200');
}

function onCloseApplication()
{
    var bRetour = testOpenDocument(true);
    if (bRetour)
    {
	    bEcranDeconnexion = 1;
	    document.location.href = sUrlFermerApplication;
    }
    return false;
}
function divMenuState(action){

    if(action == "dragStart"){
        if($("#div_menu").length > 0){
            $("#div_menu").css({
                "z-index": "-1"
            });
        }
    }
}

function containerState(action){

    if(action == "dragStart"){

        if($("#container_onglet").length > 0){
            $("#container_onglet").css({
                "z-index": "-1"
            });
        }

        if($("#div_menu").length > 0){
            $("#div_menu").css({
                "z-index": "-1"
            });
        }
    }
}
</SCRIPT>
</HEAD>
<body class='accueil yui-skin-sam' onLoad="initEcran();" onResize="testpositionnement();" onBeforeUnLoad='onUnload();'>
<div id='toolbar1' role="banner">
<a href="javascript:void()" id="focusFirst"></a>
<ul id="container-evitement">
   <li>
      <a href="javascript:void()" class="evitement" onClick="evtGoTo('accueil')">{CST_EVITEMENT_ACCUEIL}</a>
   </li>
   <li>
      <a href="javascript:void()" class="evitement" onClick="evtGoTo('arborescence');">{CST_EVITEMENT_ARBO}</a>
   </li>
</ul>
<table role='presentation' class="containertoolbar" >
    <tr style='vertical-align: middle;'>
        <td class="menu_logo_version" style="cursor: pointer;" title="{LIBELLE_VERSION}" onClick="afficherVersion();"></td>
	    <td>
	       <nav class="menu" id="contenu-menu">
            {CONTENU_MENU}
            </nav>
        </td>
        <td>    
            <span id='span_recherche' style="display: {DISPLAY_RECH_FTX}">
            <input type='text' tabindex=0 id='champ_recherche' placeholder="{CST_PLACEHOLDER_SEARCH}" onClick="this.value=''" onKeyPress="javascript:onKeyPressPleinTexte(event);">&nbsp;
            <input type="image" src="/{NOM_APPLICATION}/images/toolbar/recher.png" id='btn_champ_recherche' alt="{CST_TITLE_ALT_SEARCH_ICON}" title="{CST_TITLE_ALT_SEARCH_ICON}"  onClick='javascript:afficherRechercheTexte();'/>
            </span>
        </td>
        <td class="cartevisite" rowspan='2'>
            <table role='presentation' class="cartevisite" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td height="17" class="cartevisite_libelle" > 
                  <img id='carteviz_util' src="/{NOM_APPLICATION}/images/carteviz/utilisateur.png" style="vertical-align: bottom; margin-right: 3px;" alt="Utilisateur" width="18">{NOM_UTILISATEUR}</td>
              </tr>
              <tr> 
                <td height="17"> 
                  <img src="/{NOM_APPLICATION}/images/carteviz/profil.png" style="vertical-align: bottom;margin-right: 3px;" width="18" height="15" alt="Profil"><span id='libelle_profil' class="cartevisite_libelle">{PROFIL_UTILISATEUR}</span>
                </td>
              </tr>
            </table>
		</td>
		<!--
       <td style="text-align: right;">
            <span class="libellemenu">
                <a class="libellemenu" href="#" OnClick="javascript:window.open('/{NOM_APPLICATION}/Aide/aide.htm','','resizable=yes,directories=no,location=no,width=1000, height=800')" title="Acc?der ? l'aide en ligne">
                <div class='iconaide' title='Aide en ligne'></div>
                <img src="../../../../images/toolbar/aide.png" alt="{CST_LIBELLE_TOOLBAR_AIDE}">
                </a>
             </span>
        </td>
        --> 
        <td style="text-align: right;">
            <span class="libellemenu">
              <a class="libellemenu" href="javascript:void(0);" onClick="javascript:onCloseApplication();return false;" title="{LIBELLE_TOOLBAR_FERMER}">
                <img src="../../../../images/toolbar/deconnexion.png" alt="{LIBELLE_TOOLBAR_FERMER}">
                </a>
             </span>
        </td> 
	</tr> 
</table>
</div>
<!-- arborescence -->
<div id='container'>
<div class="ui-layout-west" style="background-color: transparent;border: none;">
<div id='leftPanel'>
<div id='arborescence' class="ui-layout-center" style="background-color: transparent;border: none;">
<FORM NAME="principal">
<!-- Hidden pour ajout des fils -->
<INPUT TYPE='hidden' id='POS_NUM_DOSSIER_POUR_AJOUT' NAME='POS_NUM_DOSSIER_POUR_AJOUT' VALUE="">
<INPUT TYPE='hidden' NAME='POS_TITRE_DOSSIER_PERE' VALUE="">
<INPUT TYPE='hidden' NAME='POS_INDICE_DOSSIER_POUR_AJOUT' VALUE="">
<!-- Hidden pour repositionner le dossier selected apres suppression ou retrait -->
<INPUT TYPE='hidden' NAME='POS_NUM_DOS' VALUE="">
<INPUT TYPE='hidden' NAME='POS_INDICE' VALUE="">
</FORM>
<div>
<div id="treeDiv1">
</div>
</div>
</div>
<!-- MENU SOUTH -->
<div id='div_menu' class="ui-layout-south" style="border: none;top: 0px;">
<iframe name='menu_fonction' id='menu_fonction' src='{URL_ACCES_DIRECT_MENU}' allowTransparency="true" style='height: 100%;width: 100%;' frameborder='0' ></iframe>
</div>
</div>
</div>

<!-- BEGIN BLOC_MODE_SANS_ONGLET -->
<!-- END BLOC_MODE_SANS_ONGLET -->

<!-- BEGIN BLOC_MODE_ONGLET -->
<div id='container_onglet' class="ui-layout-center" style="background-color: transparent;">
    <div role="main" id='div_center' style="background-color: transparent;border: none;top: 0px;" class="divs_center yui-navset"> 
    <ul class="yui-nav">  
         <li class="selected"><a href="#tab_centerbal"  id='yui-nav-accueil'><em>{PAGE_ACCUEIL}</em></a></li>  
     </ul>
                  
     <div class="yui-content" id="nav-content" style="height: 98%;background-color: white;">  
         <div id="tab_centerbal"  style="height: 97%;">
            <iframe src='' allowTransparency="false" style='height: 100%;width: 98%;margin-left:10px;' frameborder='0' id='ifr_centerbal' name='centerbal'></iframe>
        </div>
        <iframe src='' style='height: 100%;width: 98%;margin-left:10px;display:none;' frameborder='0' id='ifr_center' name='center'></iframe>
     </div> 
    </div>
<!-- END BLOC_MODE_ONGLET --> 
</div>
</div>  
<script type="text/javascript">
var posXDebutDrag = 0;
var posYDebutDrag = 0;
function getObjFromEvent(evt)
{
    var obj;
    if (evt.srcElement)
        obj = evt.srcElement;
    else
    {
        var node = evt.target;
        while(node.nodeType != node.ELEMENT_NODE)
        	node = node.parentNode;
        obj = node;
    }
    return obj;
}
// construit les images qui serviront au drag and drop
var ddobj = document.createElement("img");
ddobj.className = "dd-demo";
ddobj.src = "../../../../images/dragdrop/croix.gif";
ddobj.id = "dd-demo-0";
ddobj.style.display = "none";
document.body.appendChild(ddobj);
(function() {
    var dd, dd2, dd3;
    YAHOO.util.Event.onDOMReady(function() {

        // ajoute la "couche" drag and drop sur les images cr?e ci-dessus 
        dd = new YAHOO.util.DD("dd-demo-0");
        dd.useShim = true;
        //dd.resizeFrame = false; 
        dd.on('startDragEvent', 
            function(ev) {
                //console.log('startDragEvent');	
            }, dd, true);
        
        dd.on('mouseDownEvent', 
            function(ev) {
            
                var objDrag = getObjFromEvent(ev);
                var idDrag = objDrag.id;
                var isControl = event.ctrlKey;
                // console.log('mouseDownEvent');
                posXDebutDrag = document.getElementById(idDrag).offsetLeft;
                posYDebutDrag = document.getElementById(idDrag).offsetTop;
                
                document.getElementById(idDrag).style.cursor = "default";
            }, dd, true);

        dd.on('endDragEvent', 
            function(ev) {
            
                var objDrag = getObjFromEvent(ev.e);
                objDrag.style.display = "none";
                var isControl = ev.e.ctrlKey;
                var iNumDoc = document.getElementById("dd-demo-0").posNumDoc;
                if (ev.e.clientX < document.getElementById('arborescence').clientWidth)
                {
                    if (parent.center.getNbDocChecked() > 0)
                    {
                        iNumDoc = parent.center.getListeNumInfo(false);
                        insererDansDossier(ev.e.clientY, iNumDoc, true);
                    }
                    else
                    {
                        insererDansDossier(ev.e.clientY, iNumDoc, false);
                    }
                }
                document.getElementById(idDrag).style.left = posXDebutDrag + "px";
                document.getElementById(idDrag).style.top = posYDebutDrag + "px";

            }, dd, true);
        
        dd.on('dragEvent', 
            function(ev) {
                if (ev.e.clientX < document.getElementById('arborescence').clientWidth) {
                    afficherDrop(ev.e.clientY);
                }
            }, dd, true);
    });
})();

// Cette fonction permet de remplacer une chaine par une autre dans une chaine.
function replaceSubstring(inputString, fromString, toString) 
{
   // Goes through the inputString and replaces every occurrence of fromString with toString
   return inputString; // Send the updated string back to the user
} // Ends the "replaceSubstring" function


function replaceAll(str, search, repl) { 
  while (str.indexOf(search) != -1) 
	 str = str.replace(search, repl); 
	return str; 
}
function AfficheDossier(numDos, titreDos, iNumEntry)
{
    var bRetour = true;
    //si on a une fiche d'index ouverte on la ferme
	if(this.name == "frm_arbo_question")
	{
		bRetour = parent.testOpenDocument(false);
	}
	if (bRetour)
    {
        var titreDos = replaceAll(titreDos, "+", "%2B");
        url =sUrlAttente + "?TYPE_RECHERCHE=CONTENU_DOS";
        url+="&POS_NUMDOS="+numDos;
        // encodeURI : encodage UTF-8
        url+="&POS_TITREDOS="+escape(titreDos);
        url+="&URL="  + sUrlResultat;
        url+="&POS_INDICE_DOS_ARBO=" + iNumEntry;
    
        parent.basculerEcran('center');
        parent.center.location.href = url;
    }
}

function AfficheDossierBal(szTitreBalSsCote, bPublic)
{
    var url =sUrlAttente + "?TYPE_RECHERCHE=RECHERCHE_BAL";
    url+="&POS_QUEST_NOM="+escape(szTitreBalSsCote);
    url+="&POS_QUEST_PUBLIC="+bPublic;
    url+="&URL=" + sUrlResultat;
    parent.basculerEcran('center');
    parent.center.location.href=url;
}
function AfficheDossierBib(szTitreBibSsCote, bPublic)
{
    var url = sUrlAttente + "?TYPE_RECHERCHE=RECHERCHE_BIB";
    url+="&POS_QUEST_NOM="+escape(szTitreBibSsCote);
    url+="&POS_QUEST_PUBLIC="+bPublic;
    url+="&URL=" + sUrlResultat;

    parent.basculerEcran('center');
    parent.center.location.href=url;
}

function AfficheQuestion(iNumQuest)
{
    var url = sUrlAttente + "?INUMQUEST="+iNumQuest;
    url+="&URL=" + sUrlResultat;
    parent.basculerEcran('center');
    parent.center.location.href=url;
}

function AfficheQuestionFtx(iNumQuest)
{
    var url = sUrlRechercheFtx + "?INUMQUEST="+iNumQuest;
    parent.basculerEcran('center'); 
    parent.center.location.href=url;
}
var iNumEntryInsertion = -1;
function afficherDrop(position) {
    
    debug("position afficherDrop" + position);
    var m = $("#treeDiv1").jstree(true)._model.data;
    var idElementTrouve = chercherDossierMenuParPosition(position);

	if (iNumEntryInsertion != -1)
        $("#treeDiv1").jstree(true).set_type(m[iNumEntryInsertion], "default");
    
    if (idElementTrouve !== -1)   
    {
        debug("Insertion dans dossier " + m[idElementTrouve].text);
        iNumEntryInsertion = idElementTrouve;
        $("#treeDiv1").jstree(true).set_type(m[idElementTrouve], "FolderAjout");
    }
}
function InitInsertion(node)
{
	var iAncienIndice = document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value;
    var m = $("#treeDiv1").jstree(true)._model.data;
	if (iAncienIndice.length != 0)
        $("#treeDiv1").jstree(true).set_type(m[iAncienIndice], "default");

    document.principal.POS_NUM_DOSSIER_POUR_AJOUT.value = node.data.numdos;
    document.principal.POS_TITRE_DOSSIER_PERE.value = node.text;
    document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value = node.id;
    $("#treeDiv1").jstree(true).set_type(node, "FolderAjout");
    var lstframes = document.getElementsByTagName("iframe");
    for (var i=0;i<lstframes.length;i++) {
        if(lstframes[i].id && lstframes[i].id.indexOf("ifr_posdoc_creation_") == 0
         && lstframes[i].contentDocument.getElementById('btn_creerdansdossier'))
            lstframes[i].contentDocument.getElementById('btn_creerdansdossier').disabled = false;    
    }
}

function StopInsertion(node)
{
	var iAncienIndice = document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value;
    var m = $("#treeDiv1").jstree(true)._model.data;
	if (iAncienIndice.length != 0)
        $("#treeDiv1").jstree(true).set_type(m[iAncienIndice], "default");

    document.principal.POS_NUM_DOSSIER_POUR_AJOUT.value = "";
    document.principal.POS_TITRE_DOSSIER_PERE.value = "";
    document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value = "";
    var lstframes = document.getElementsByTagName("iframe");
    for (var i=0;i<lstframes.length;i++) {
        if(lstframes[i].id && lstframes[i].id.indexOf("ifr_posdoc_creation_") == 0
         && lstframes[i].contentDocument.getElementById('btn_creerdansdossier'))
            lstframes[i].contentDocument.getElementById('btn_creerdansdossier').disabled = true;    
    }
}

function chercherDossierMenuParPosition(position) {
	
    var idElementTrouve = -1;
    var xy = YAHOO.util.Dom.getXY('arborescence');
    position = (position - xy[1]);
    var m = $("#treeDiv1").jstree(true)._model.data;
    
    var nodeRoot = m["#"];
    var children = nodeRoot.children_d;
    
    for(var i=0;i<children.length;i++) {
        var childId = children[i];
        var childNode = m[childId];
        
        if (childNode.data.action == "Folder") {
            var objLi = $('#' + childId);
            if (objLi.length) {
                var pos = objLi.position();
                var positionTopElt = pos.top;
                if (position > (positionTopElt - 15) && position <= (positionTopElt + 15))
        	    {
        	       idElementTrouve = childNode.id;
                   break;
                }
            }
        }
    }
    return idElementTrouve;
}

function insererDansDossier(position, iNumDoc, bMultiple) {
    
    debug("position insererDansDossier::" + position);
    var idElementTrouve = chercherDossierMenuParPosition(position);
    
	if (idElementTrouve === -1)
	{
	   alert(msgErrArboNoDossSelect);
	}
	else
	{
        var m = $("#treeDiv1").jstree(true)._model.data;
        var szNomDossier = $("<div/>").html(m[idElementTrouve].text).text();
        var iNumDossier = m[idElementTrouve].data.numdos;
        var sMsgConfirm = msgConfirmInsertDosDrag1 + iNumDoc + " "+ msgConfirmInsertDosDrag2 +" '" + szNomDossier + "' ?";
        if (bMultiple)
            sMsgConfirm = msgConfirmInsertDosCheckbox + " '" + szNomDossier + "' ?";
    	if (confirm(sMsgConfirm))
    	{
    	   InitInsertion(m[idElementTrouve]);
    	   center.onInsereDos("POS_LISTE_NUM_DOC=" + iNumDoc);
        }
        
        if (iNumEntryInsertion != -1)
            $("#treeDiv1").jstree(true).set_type(m[iNumEntryInsertion], "default");
        
        iNumEntryInsertion = -1;
        document.principal.POS_NUM_DOSSIER_POUR_AJOUT.value = "";
        document.principal.POS_TITRE_DOSSIER_PERE.value = "";
        document.principal.POS_INDICE_DOSSIER_POUR_AJOUT.value = "";
    }
}

function debug(msg) {
    console.log(msg);
}

function reloadBal() {
    parent.centerbal.reloadBal();
}

function getQuestionSessionNode() 
{
    return getNodeByAction("Question");
}

function getNodeByAction(action) 
{
    var m = $("#treeDiv1").jstree(true)._model.data;
    var node = null;
  
    for(var i in m) {
        if(i !== '#' && m[i].data && m[i].data.action === action) {
            node = m[i];
            break;
        }
    }
    return node;
}

function getSzImage(szTypeQuestion)
{
	switch(szTypeQuestion)
	{
		case "RECHERCHE_POS_NUM_DOC":
			return "RechNUM";
			break;
	
		case "RECHERCHE_CLE":
			return "RechKH";
			break;
		
		case "RECHERCHE_SIMPLE":
			return "RechFIC";
			break;
		
		case "RECHERCHE_ELABOREE":
			return "RechELA";
			break;
		
		case "RECHERCHE_EXCALIBUR":
		case "RECHERCHE_FTX_LOC":
			return "RechEXC";
			break;
		
		case "RECHERCHE_COMBINE":
			return "RechCOMB";
			break;
		
		default :
			return "RechFIC";
			break;
	}
}
 
function updateMenu(tabSzTitreNumDocFils) 
{
    var listNode = $("#treeDiv1").jstree(true).get_selected(true);
    var currentSelectedNode = null;
    if (listNode != null && listNode.length == 1)
        currentSelectedNode = listNode[0];

    var m = $("#treeDiv1").jstree(true)._model.data; 

    if (currentSelectedNode != null)
    {
        // on teste si le noeud est cree dans notre hastable qui contient tous les num infos.             
        for(i=0; i<tabSzTitreNumDocFils.length; i++)
        {
            // tabSzTitreNumDocFils[]="titredos|-|numdoc"    
            var arraySzInfoFils = tabSzTitreNumDocFils[i].split("\|-\|");
            var titreDos = arraySzInfoFils[0];
            var numDos = arraySzInfoFils[1];
            
            var nodeId =  findDossierInSelectedNode(numDos);
            if( nodeId === -1) {
                $('#treeDiv1').jstree().create_node(currentSelectedNode.id, {"text" : titreDos, 
                        "type": "Folder",
                        "children" : true, 
                        "data" : {"action": "Folder", "numdos": numDos}
                        }, 
                    "last", function(){}, true);
            }
 			else
			{
                if (m[nodeId].text != titreDos) {
                    $("#treeDiv1").jstree('rename_node', m[nodeId] , titreDos);
                }
            }
		}
     }
}  

// cette renvoie true si le p?re de l'entr?e eID est numPere
function getIfGoodParentFolder(eID, numPere)
{
	str = "[(]'"+numPere+"'";
	
	eID = theMenu.entry[eID].parent;
	
	if (theMenu.entry[eID].url != null && theMenu.entry[eID].url.search(str) != -1)
		return true;
	else
		return false;
}

// cette foction g?re le retrait du dossier et la suppression d'un doc
// si numPere = 0 => on est en suppression
function updateMenuRemoveFils(numFils, numPere, eID) 
{
	//if(arguments.length == 2)
	//	eID = theMenu.firstEntry;
	// retrait d'un dossier d'un dossier : le dossier pere doit etre en cours de selection
    var	bDeleteDossier = !(numPere > 0) ? true: false;
    var nodeDossierId = findDossierInSelectedNode(numFils);
    if (nodeDossierId !== -1) {
        $('#treeDiv1').jstree('delete_node', nodeDossierId);
    }
    
    // suppression d'un dossier : il faut parcourir toute l'arborescence pour supprimer
    // le dossier
    if (bDeleteDossier) {
        // TODO
    }
}

function updateMenuRemoveBib(szNomQuestionBib, bPublic)
{
    var parentNode = (bPublic == '1') ? getNodeByAction("Bibliotheque_PUB") : getNodeByAction("Bibliotheque_PRIV");
    var m = $("#treeDiv1").jstree(true)._model.data;
    if (parentNode != null) {
        for (var i = 0; i < parentNode.children.length; i++) {

            var node = m[parentNode.children[i]];
            if (node.data.TitreQuestion == szNomQuestionBib) {
                // suppression du dossier et des sous dossiers si besoin
                // fonctionne aussi si l'element ou un des enfants est selectionne 
                $('#treeDiv1').jstree('delete_node', node.id);
                break;
            }
        }        
    }
}

function updateMenuAddBib(szNomQuestionBib, bPublic)
{
    var parentNode = (bPublic == '1') ? getNodeByAction("Bibliotheque_PUB") : getNodeByAction("Bibliotheque_PRIV");
    $('#treeDiv1').jstree().create_node(parentNode.id, {"text" : szNomQuestionBib, 
        "type" : "QuestBib", "data" : { "action" : "QuestBib", "TitreQuestion": szNomQuestionBib, "publique" : bPublic}}, "last", 
        function(){});
}

function selectQuestionMenu(szCode, szTypeQuestion)
{
    var node = null;
    var parentNode = null;
    if (szTypeQuestion == "QUESTION_PUBLIQUE")
        parentNode = getNodeByAction("Bibliotheque_PUB");
    else if (szTypeQuestion == "QUESTION_PRIVEE")
        parentNode = getNodeByAction("Bibliotheque_PRIV");
    else
        parentNode = getNodeByAction("BalGenerale"); 

        // children_d
    if (parentNode != null) {
        var m = $("#treeDiv1").jstree(true)._model.data;
        var listChild = (szTypeQuestion == "QUESTION_BAL") ? parentNode.children_d : parentNode.children; 
        var node = null;
      
        for(var i=0;i<listChild.length;i++) {
            if((szTypeQuestion == "QUESTION_BAL" && m[listChild[i]].data.CodeBal === szCode) || 
                (szTypeQuestion != "QUESTION_BAL" && m[listChild[i]].data.TitreQuestion === szCode)) {
                node = m[listChild[i]];
                break;
            }
        }
        if (node != null) {
            refreshOnSelect = false;
            $('#treeDiv1').jstree('select_node', node);
        }
    }
}

function majBal(szCodeBal, iNbRep)
{
    var parentNode = getNodeByAction("BalGenerale"); 
    if (parentNode != null) {
        var m = $("#treeDiv1").jstree(true)._model.data;
        var listChild = parentNode.children_d; 
        var node = null;
      
        for(var i=0;i<listChild.length;i++) {
            if(m[listChild[i]].data.CodeBal === szCodeBal) {
                node = m[listChild[i]];
                break;
            }
        }
        var text = "";
        if (node != null) {
            
             // le nombre de reponse a d?ja ete affich?
            if (node.text.charAt(0) == '(')
            {
                var pos = node.text.indexOf(") ");
                text = "(" + iNbRep + ") " + node.text.substr(pos + ") ".length);
            }
            else
                text = "(" + iNbRep + ") " + node.text;
            $("#treeDiv1").jstree('rename_node', node , text);
            $("#treeDiv1").jstree(true).set_type(node, (iNbRep == 0) ? "BalVide" : "Bal");
        }
    }
}

function getSelectedTreeNode() {

    var listNode = $("#treeDiv1").jstree(true).get_selected(true);
    var currentSelectedNode = null;
    if (listNode != null && listNode.length == 1)
        currentSelectedNode = listNode[0];
    
    return currentSelectedNode;   
}

function findDossierInSelectedNode(iNumDossier)
{
    var iNumEntryDossier = -1;
    var currentSelectedNode = getSelectedTreeNode();
    var instance = $("#treeDiv1").jstree(true);
    var m = instance._model.data; 

    if (currentSelectedNode != null)
    {
        for (var i = 0; i < currentSelectedNode.children.length; i++) {

            var path = $('#treeDiv1').jstree(true).get_path(currentSelectedNode.children[i],"/");
            var node = m[currentSelectedNode.children[i]];
            if (node.data.numdos == iNumDossier) {
                iNumEntryDossier = currentSelectedNode.children[i];
                break;
            }
        }
    }
    return iNumEntryDossier;
}

function ouvrirDossierDansMenu(iNumDossier)
{
    var nodeDossier = findDossierInSelectedNode(iNumDossier);
    if (nodeDossier !== -1) {
        $('#treeDiv1').jstree('select_node', nodeDossier);
    }
}

function selectNode(nodeid)
{
    $('#treeDiv1').jstree('select_node', nodeid);
}

function getFlatTree()
{
    var szFlatTree = "";
    var node = getSelectedTreeNode();
    var bLastNode = true;
    var instance = $("#treeDiv1").jstree(true);
    var m = instance._model.data; 
    while (node != null)
    {
        if (node.data.action == "Folder" || node.data.action == "Rech" || 
                        node.data.action == "QuestBib" || node.data.action == "Bal")
        {
            var ico = 'folderopen.png';
            if (node.data.action == "Rech")
                ico = 'recher.png';
            else if (node.data.action == "QuestBib")
                ico = 'list_bib.png';
            else if (node.data.action == "Bal")
                ico = 'bal.png';
            var text = (node.data.action == "Bal") ? node.data.LibelleBal : node.text;       
            var s = "<a title='"+ text +"' id='href_"+node.id+"' href=\"javascript:void parent.selectNode('"+node.id+"');\">";
            // for search, nb rep is already included in text
            if (bLastNode && node.data.action != "Rech") {
                text = "(zzz_nbrep)&nbsp;" + text;
            }
            s += "<img src='../../../../images/icons/"+ico+"' alt=''> <span>"+ text + "</span></a>";
            bLastNode = false;
        }
        else
            break;
        
        szFlatTree = (szFlatTree.length == 0) ? s : s + "&nbsp;>&nbsp;" + szFlatTree;
        node = (node.parents.length > 1) ? m[node.parents[0]]: null;
    }
    return szFlatTree;
}

function getXmlHttpRequestObject() {	

	if (window.XMLHttpRequest) {
	
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	}
}
var searchReq = getXmlHttpRequestObject();
function getListeFils(iNumDos)
{
    var tabFils = new Array();
    //tabFils[i++] = "D?partement AE|-|11911";
        
    if (searchReq.readyState == 4 || searchReq.readyState == 0)
	{
        var szRequete = "../ajax/get_fils_dossier.php?";
        if(CST_TYPE_APPLI == 2)
            szRequete = "../../../../servlet/interface/session/principal/ajax.GetFilsDossier?";	
            
        szRequete += "POS_NUMDOS=" + iNumDos;
        searchReq.open("GET", szRequete, false);
	   	searchReq.send(null);
        if (searchReq.readyState == 4 || searchReq.readyState == 0)
        {
            var objListeFils = eval('(' + searchReq.responseText + ')');
            if (objListeFils.code_retour == 1)
                tabFils = objListeFils.liste_fils;
            else
                alert(objListeFils.msg_erreur);	
    	}
    }
    return tabFils;
}

/**
 *  Supprime toute selection pour eviter que les dossiers s'ajoute sur une mauvaise entree
 *  Cas du panier
 */
function setSelectedArboNone()
{
    var listNode = $("#treeDiv1").jstree(true).get_selected(true);
    var currentSelectedNode = null;
    if (listNode != null && listNode.length > 0) {
        $("#treeDiv1").jstree(true).deselect_node( [ listNode[0].id ] )
    }
}

function updateMenuAddQuestion(titreQuestionSansQuote, iNumQuest, iNbReponses, szTypeQuestion) 
{
    var node = getQuestionSessionNode();
    var typeRecherche = getSzImage(szTypeQuestion);
    var action = (szTypeQuestion == "RECHERCHE_EXCALIBUR") ? "RechFtx" : "Rech";
    $('#treeDiv1').jstree().create_node(node.id, {"text" : titreQuestionSansQuote, 
        "state":{"selected":true,"opened":true}, "type": typeRecherche, "data" : {"action": action, "NumQuest": iNumQuest}}, "last", 
        function(){
            var listNode = $("#treeDiv1").jstree(true).get_selected(true);
            var currentSelectedNode = null;
            if (listNode != null && listNode.length > 1) {
                $("#treeDiv1").jstree(true).deselect_node( [ listNode[0].id ] )
            }
    });
}
function customMenu(node) {
    // The default set of all items
    var items = {};
    if (node.data.action == "Folder") {
            if (node.type != "FolderAjout") {
            items["insertionItem"] = {
                label: labelInsertionDos,
                icon : "arbo-folderajout",
                action: function (dataMenu) {
                
                    var inst = $.jstree.reference(dataMenu.reference),
                        node = inst.get_node(dataMenu.reference);
                    InitInsertion(node);
                }
             };
        }
        else {
            items["stopItem"] = {
                label: labelStopInsertionDos,
                icon : "arbo-folderajout-inactif",
                action: function (dataMenu) {
                    var inst = $.jstree.reference(dataMenu.reference),
                        node = inst.get_node(dataMenu.reference);
                    StopInsertion(node);
                }
            };
        }
    }
    else if (node.data.action == "BalGenerale") {
        items["actualiserItem"] = {
            label: "Actualiser",
            icon : "arbo-bal-actualise",
            action: function (dataMenu) {
                reloadBal();
            }
         };
    }
    return items;
}

var refreshOnSelect = true;
function treeInit() {
	
	//instantiate the tree:
	$('#treeDiv1').jstree({
        "plugins" : ["contextmenu", "types"],
        "types" : {
          "Root" : {
            "icon" : "arbo-root"
          },
          "FolderAjout" : {
            "icon" : "arbo-folderajout"
          },
          "BalGenerale" : {
            "icon" : "arbo-balgenerale"
          },
          "BalVide" : {
            "icon" : "arbo-balvide"
          },
          "Bal" : {
            "icon" : "arbo-bal"
          },
          "Bibliotheque" : {
            "icon" : "arbo-bibliotheque"
          },
          "Bibliotheque_PUB" : {
            "icon" : "arbo-bibliotheque-pub"
          },
          "Bibliotheque_PRIV" : {
            "icon" : "arbo-bibliotheque-priv"
          }
        },
      contextmenu: {items: customMenu,
                    select_node:false
                    },
      
      'core' : {
        'check_callback': true,
        'themes': {
                "name": "proton"
        },
        'multiple': false,
        'data' : function (node, cb) {
          
          if(node.id === "#") {
              cb([{"text" : "", "type" : "Root", "state": {"opened": "TRUE"}, "data" : { "action" : "Root"}, "children" : childrenInitTree}]);
          }
          else {
            var m = $("#treeDiv1").jstree(true)._model.data;
            var children = [];
            
            if (node.children.length > 0) {
                for(var i=0;i<node.children.length;i++)
                    children.push(m[node.children[i]]);    
            }
            else {
                if (node.data.action == "Folder") {
                    var listeFils = getListeFils(node.data.numdos);
                    for(var i=0;i<listeFils.length;i++) {
                    	children[i] = {"text": listeFils[i].libelle, "type" : "Folder", 
                                "data" : { "action" : "Folder", "numdos" : listeFils[i].num},
                                children: true};
        			}
                }
            }
            cb(children);
          }
        }
        }
    });

    $('#treeDiv1').on("select_node.jstree", 
        function (e, data) {
        
            var countSelected = data.selected.length;
            if (countSelected > 1) {
                data.instance.deselect_node( [ data.selected[0] ] );
            }
            
            if (!refreshOnSelect) {
                refreshOnSelect = true;
            } else {
                //alert("node_id: " + data.node.id + data.node.type);
                var actionOnClick = data.node.data.action;
                if (actionOnClick == "Folder") {
                    AfficheDossier(data.node.data.numdos, data.node.text, data.node.id);
                }
                else if (actionOnClick == "RechHIS") {
                    parent.basculerEcran('center');
                    parent.center.location.href = sUrlAfficheHisto;
                }
                else if (actionOnClick == "Question") {
                    parent.basculerEcran('center');
                    parent.center.location.href = sUrlAfficheHistoQuest;
                }
                else if (actionOnClick == "Bal") {
                    AfficheDossierBal(data.node.data.CodeBal, data.node.data.publique);
                }
                else if (actionOnClick == "QuestBib") {
                    AfficheDossierBib(data.node.data.TitreQuestion, data.node.data.publique);
                }
                else if (actionOnClick == "RechFtx") {
                    AfficheQuestionFtx(data.node.data.NumQuest);
                }
                else if (actionOnClick == "Rech") {
                    AfficheQuestion(data.node.data.NumQuest);
                }
            }
    });
    
    $('#treeDiv1').on("open_node.jstree", 
        function (e, data) {
        
            return;
    });
}

function treeReInit() {
    $('#treeDiv1').jstree('destroy');
    treeInit();
}
</SCRIPT>
</HTML>