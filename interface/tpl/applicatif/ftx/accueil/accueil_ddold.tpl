<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<title></title>

<link href='/{NOM_APPLICATION}/include/style/joust.css' ID='JoustStyles' type='text/css' rel='STYLESHEET' />
<link href='/{NOM_APPLICATION}/include/style/style.css' type='text/css' rel='STYLESHEET' />
<link href='/{NOM_APPLICATION}/include/style/ecranprincipal.css' type='text/css' rel='STYLESHEET' />
<link href='/{NOM_APPLICATION}/include/style/toolbar.css' type='text/css' rel='STYLESHEET' />
<link href='/{NOM_APPLICATION}/include/style/menu_style_couleur.css' type='text/css' rel='STYLESHEET' />
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/style/menu_style_couleur_ie6.css" />
<![endif]-->
<link href='/{NOM_APPLICATION}/include/style/{STYLE_THEME}.css' type='text/css' rel='STYLESHEET' />
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/configuration/constantes.js'></SCRIPT>
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/include/script/menu.js'></SCRIPT>
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/include/script/toolbar.js'></SCRIPT>
<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/menu_util.js"></script>
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/include/script/fonction_util.js'></script>
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/include/script/hashtable.js'></SCRIPT>
<SCRIPT language='JavaScript' SRC='/{NOM_APPLICATION}/include/script/fct_parent_menu.js'></SCRIPT>
<link rel="stylesheet" type="text/css" href="../../../../include/script/yui/build/container/assets/skins/sam/container.css"/>
<link rel="stylesheet" type="text/css" href="../../../../include/script/yui/build/resize/assets/skins/sam/resize.css"/>
<link rel="stylesheet" type="text/css" href="../../../../include/script/yui/build/layout/assets/skins/sam/layout.css" />
<script type="text/javascript" src="../../../../include/script/yui/yui-use.js"></script>
<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/tabview/assets/skins/sam/tabview.css" />
<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/yui/build/tabview/tabview-min.js'></script>

<!--[if lt IE 7]>
    <script type="text/javascript">

    // Fonction destinée à remplacer le "LI:hover" pour IE 6
    sfHover = function() {
         var sfEls = document.getElementsByTagName("li");
         for (var i=0; i<sfEls.length; i++) {
          sfEls[i].onmouseover = function() {
            this.className = this.className.replace(new RegExp(" sfhover"), "");
            this.className += " sfhover";
          }
          sfEls[i].onmouseout = function() {
            this.className = this.className.replace(new RegExp(" sfhover"), "");
          }
         }
    }
    if (window.attachEvent) window.attachEvent("onload", sfHover);
    </script>
<![endif]--> 

<SCRIPT language="JavaScript">
var bLienMenu = 0;
var sTitreFileDialog = "{LIBELLE_FENETRE_FICHIER_APPLET}";
var fenTab = new Array();
var vocab;
var numInstance = {NUM_INSTANCE};
// pour que les autres écrans puissent tester si c'est l'écran principal
var isEcranPrincipal = 1;
var iNbDocParPage = {NB_REPONSES_PAR_PAGE};
var szMenuLocation = '{URL_ACCES_DIRECT_MENU}';
var isIE10 = (navigator.appVersion.indexOf("MSIE 10") != -1);

function openWindow(url,refWindow,left,top,height,width,scrollbars,location,toolbar,status,resizable)
{
	fen1 = window.open(url, refWindow, 'left='+left+',top='+top+',height='+height+',width='+width+',scrollbars='+scrollbars+',location='+location+',toolbar='+toolbar+',status='+status+',resizable='+resizable);
	fenTab[fenTab.length] = fen1;
}

function getNumInstance()
{
    return numInstance;
}


function closeWindows()
{
	if(fenTab.length > 0)
	{
		for(i = 0; i < fenTab.length ; i++)
		{
			if(eval(fenTab[i]) && eval(fenTab[i]).open && !(eval(fenTab[i])).closed)
				eval(fenTab[i]).close();
		}
	}
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

function openFileModif(szUrlAppletFile)
{
    modelesswinyui(szUrlAppletFile, {width: 300, height: 400, 
                        left: 250, top: 150});
}

function closeFileModif()
{
    panelFile.hide();
}

var PosLayout = function(isModeTabView) {
    
    this.isModeTabView = isModeTabView;
    if (this.isModeTabView == 1) {
        this.tabView = new YAHOO.widget.TabView('div_center');
        this.tabView.addListener('activeIndexChange', onChangeTabIndex);
    }
}
PosLayout.prototype.openPosDocument = function (szUrlConsulter) {
    
    if (this.isModeTabView == 1) {

        var iNumDoc;
        var debutChaine = szUrlConsulter.indexOf("POS_NUM_DOC=");
         
        if (debutChaine != -1)
        {
            debutChaine += "POS_NUM_DOC=".length;
            var finChaine = szUrlConsulter.indexOf("&", debutChaine);
            iNumDoc =  szUrlConsulter.substring(debutChaine, finChaine);
            
            //parent.posdocument.document.location.href = szUrlConsulter;
        	//parent.basculerEcran('posdocument');
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
    else {
    	basculerEcran('posdocument');
		posdocument.document.location.href = szUrlConsulter;
	}
}

PosLayout.prototype.getFramePosDocument = function (iNumDoc) {
    var sName = "";
    if (this.isModeTabView == 1) {
        if (frames["center"].principal && frames["center"].principal.POS_NUM_DOC &&
            frames["center"].principal.POS_NUM_DOC.value == iNumDoc)
            sName = "center";
        else    
            sName = "ifr_posdocument_"+iNumDoc;
    }
    else   {
    	sName = "posdocument";
	}
    return frames[sName];   
}

PosLayout.prototype.closeOnglet = function(idIFrm)  {
    
    if (this.isModeTabView == 1) {
    
        if (idIFrm.indexOf("ifr_posdocument_") != -1 || idIFrm.indexOf("ifr_center") != -1)
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
}

PosLayout.prototype.findOngletByIdContent = function(sContentOngletId)  {

    var indOnglet = -1;
    if (this.isModeTabView == 1) {
    
        var tabTab = this.tabView.get('tabs');
        for(var i=0;i<tabTab.length;i++) {
            if (tabTab[i].get('contentEl').id == sContentOngletId) {
                indOnglet = i;
                break;
            }
        }
    }
    return indOnglet;
}

PosLayout.prototype.basculerEcran = function(szEcran)  {

    if (this.isModeTabView == 1) {
        
        if (szEcran == 'centerbal' && isModePortail)
            document.getElementById('nav-content').style.backgroundColor = "transparent";
        else
            document.getElementById('nav-content').style.backgroundColor = "#FFFFFF";
    }
    else {
    	if (szEcran == 'centerbal' && isModePortail)
	        document.getElementById('div_center').style.backgroundColor = "transparent";
	    else
	        document.getElementById('div_center').style.backgroundColor = "#FFFFFF";
    }
    
    clearObjetsDrag();
    if (this.isModeTabView == 1) {
        
        if (szEcran == 'center')
        {
            var iNumOnglet = findOngletByIdContent("tab_center");
            if (iNumOnglet == -1) {
                var newtab = new YAHOO.widget.Tab({ label: ""});
                newtab.get('contentEl').id = "tab_center";
                newtab.get('contentEl').appendChild(document.getElementById('ifr_center'));
                this.tabView.addTab(newtab, 1);
            }
            
            if (document.center && document.center.closeCtxMenu)
                document.center.closeCtxMenu();
        }
        
        if (szEcran == 'centerbal') {
            this.tabView.selectTab(0);
            //document.getElementById('ifr_center').style.display = "none";
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
    else {
    
		document.getElementById('ifr_posdocument').style.display = "none";
	    document.getElementById('ifr_center').style.display = "none";
	    document.getElementById('ifr_centerbal').style.display = "none";
	    
	    if (szEcran == 'center')
	    {
	        if (document.center && document.center.closeCtxMenu)
	            document.center.closeCtxMenu();
	    }

	    szFrameEnCours = szEcran;
	    if (szEcran == 'centerbal') {
	        document.getElementById('ifr_centerbal').style.display = "";
	        setTitle();
	    }
	    else if (szEcran == 'center') {
	        document.getElementById('ifr_center').style.display = "";
	    }
	    else if (szEcran == 'posdocument') {
	    
	        document.getElementById('ifr_posdocument').style.display = "";
	    }
    }
}

var selectedOngletBeforeClose = -1;
                
PosLayout.prototype.closeOngletDocByCross = function(sFrmId) {

    if (this.isModeTabView == 1) {
        selectedOngletBeforeClose = this.tabView.get('activeIndex');
        if(!window.frames[sFrmId].PosConfirmFermerIndexTestModif()) {
            return false;
        }
        else {
            window.frames[sFrmId].FermerIndex();
            window.bLienMenu = 1;
        }
    }
} 

PosLayout.prototype.setTitle = function()  {

    if (this.isModeTabView == 1) {
        var _this = this;
        if (this.tabView && this.tabView.get('activeTab'))
        {
            //this.tabView.get('activeIndex');
            /*
            var tabTab = this.tabView.get('tabs');
            var iNumOnglet = this.tabView.get('activeIndex');
            var idFrm = tabTab[iNumOnglet].get('contentEl').id; 
            var nameFrm = idFrm.replace("tab", "ifr");
            var sTitre = (document.getElementById(nameFrm).contentDocument) ? document.getElementById(nameFrm).contentDocument.title : document.getElementById(nameFrm).document.title;
            */
            // sur chrome, l'objet retourné est un HTMLIFrameElement (acces au contentDocument plutôt qu'au document)
            var sTitre = (document.getElementById(szFrameEnCours).contentDocument) ? document.getElementById(szFrameEnCours).contentDocument.title : document.getElementById(szFrameEnCours).document.title; 
            var sIdContent = szFrameEnCours.replace("ifr", "tab"); 
            var iNumOnglet = findOngletByIdContent(sIdContent);
            
            if (iNumOnglet != -1) {
                // cas des documents
                if (iNumOnglet > 1)
                    sTitre += '&nbsp;<span class="closeonglet" onClick="closeOngletDocByCross(\''+szFrameEnCours+'\');">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>';
                this.tabView.getTab(iNumOnglet).set('label', "&nbsp;" + sTitre);
            }
            
            // anomalie raffraichissement des label sur IE8, la taille de l'onglet ne s'adapte pas
            if (this.tabView.get('activeIndex') && this.tabView.get('activeIndex') >= 0 && 
                                               this.tabView.get('activeIndex') < this.tabView.get('tabs').length)
                this.tabView.selectTab(this.tabView.get('activeIndex'));
        }
    }
    else {
    	document.getElementById('titre_barre_center').innerHTML = "&nbsp;" + window.frames[szFrameEnCours].document.title;
    }
}

PosLayout.prototype.onChangeTabIndex = function(e)  {

    if (this.isModeTabView == 1) {
        document.getElementById('nav-content').style.backgroundColor =  (e.newValue == 0 && isModePortail) ? "transparent" : "#FFFFFF";
        
        if (document.center && document.center.closeCtxMenu)
            document.center.closeCtxMenu();
        clearObjetsDrag();
        return true;
    }
}


PosLayout.prototype.testOpenDocument = function(bCloseDoc)
{
    if (this.isModeTabView == 1) {
        if (bCloseDoc) {
        
            var tabTab = this.tabView.get('tabs');
            var s = "";
            for(var i=1;i<tabTab.length;i++) {
                var idTab = tabTab[i].get('contentEl').id;
                if (idTab.indexOf("tab_posdocument_") != -1 ||
                    // cas où la frame centrale contient un document
                    (idTab.indexOf("tab_center") != -1  && frames["center"].principal && frames["center"].principal.POS_NUM_DOC
                        && frames["center"].principal.MODE))
                {
                    var idFrm = idTab.replace("tab", "ifr");
                    if (idFrm == "ifr_center")
                        idFrm = "center";    
                    this.tabView.selectTab(i);
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
    else {
        if(window.posdocument.FermerIndex != null && 
            window.posdocument.document.principal != null && 
                window.posdocument.document.principal.POS_NUM_DOC != null)
    	{
            if (typeof (window.frames[idFrm].PosConfirmFermerIndexTestModif) == 'function') {
	    		if(!window.posdocument.PosConfirmFermerIndexTestModif())
	               return false;
	            else {
	                window.posdocument.FermerIndex();
	                window.bLienMenu = 1;
	            }
			}
        }
    }
    return true;
}



function openPosDocument(szUrlConsulter)
{
    return posLayout.openPosDocument(szUrlConsulter);
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
	        document.getElementById('barre_bloc_menu').className = "arrondi arrondi_accueil";
	        document.getElementById('barre_bloc_arbo').className = "arrondi arrondi_accueil";
	        document.getElementById('barre_bloc_center').className = "arrondi arrondi_accueil";
        }
    }
    if (szFonction == 'recherche')
    {
        bAffPage = window.frames['menu_fonction'].affichePage('recherche','{URL_CHOIX_TYPE}?ACTION=RECHERCHE');
        if (bAffPage)
        {
	        window.frames['menu_fonction'].document.location.href = '{URL_AFFICHER_MENU}?MENU=recherche';
	        document.getElementById('barre_bloc_menu').className = "arrondi arrondi_recherche";
	        document.getElementById('barre_bloc_arbo').className = "arrondi arrondi_recherche";
	        document.getElementById('barre_bloc_center').className = "arrondi arrondi_recherche";
        }
    }
    if (szFonction == 'parametrage')
    {
        window.frames['menu_fonction'].document.location.href = '{URL_AFFICHER_MENU}?MENU=parametrage';
        document.getElementById('barre_bloc_menu').className = "arrondi arrondi_parametrage";
        document.getElementById('barre_bloc_arbo').className = "arrondi arrondi_parametrage";
        document.getElementById('barre_bloc_center').className = "arrondi arrondi_parametrage";
    }
    
    if (szFonction == 'creation')
    {
        window.frames['menu_fonction'].document.location.href = '{URL_AFFICHER_MENU}?MENU=creation';
        document.getElementById('barre_bloc_menu').className = "arrondi arrondi_parametrage";
        document.getElementById('barre_bloc_arbo').className = "arrondi arrondi_parametrage";
        document.getElementById('barre_bloc_center').className = "arrondi arrondi_parametrage";
        window.frames['menu_fonction'].affichePage('recherche','{URL_CHOIX_TYPE}?ACTION=CREATION');
    }
    
    if (!isAfficheMenu)
    {
        //isAfficheMenu = true;
        positionnement();
    }
    
}

function getTailleMenu()
{
    return document.getElementById('div_menu').style.width;
}

function changeTailleMenuPourcentage(pourcentage)
{
    document.getElementById('div_menu').style.width= pourcentage + "%";
    var pourcentageRestant = 100 - pourcentage;
    document.getElementById('div_center').style.width = pourcentageRestant + "%";
    document.getElementById('div_center').style.marginLeft = pourcentage + "%";
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
initialise_menu();
var bEcranDeconnexion=0;
function onUnload()
{
	if (bEcranDeconnexion == 0)
	{
		szUrlUnload = "{URL_ATTENTE_DECONNECT}"; 
		closeWindows();
		open(szUrlUnload, "", "top=200,left=350,width=300px,height=100px,resizable=0,scrollbars=0");
		bEcranDeconnexion = 1;
	}
}

function setWindowTitle(userName, profilName)
{
    document.title = "{CST_LIBELLE_DEBUT_TITRE}" + userName + " : " + profilName + "] - SESIN";
}
setWindowTitle('{NOM_UTILISATEUR}', '{PROFIL_UTILISATEUR}');
var posLayout;
function initEcran()
{
    posLayout = new PosLayout(isModeOnglet);
    
    basculerEcran('{FRAME_ACCUEIL}'); 
    positionnement();
    document.getElementById('img_retrecir_largeur_arbo2').style.display = "";
    document.getElementById('img_retrecir_largeur_arbo1').style.display = "";
    document.getElementById('img_elargir_largeur_arbo1').style.display = "";
    document.getElementById('img_elargir_largeur_arbo2').style.display = "";
    document.getElementById('img_agrandir_arbo').style.display = "none";
    document.getElementById('img_agrandir_menu').style.display = "";
    document.getElementById('img_agrandir_bloc_center').style.display = "";
    document.getElementById('barre_bloc_center').style.display = "";
    
    window.centerbal.location.href = "{URL_ATTENTE}?URL={URL_AFFICHER_QUESTION}";
    window.center.location.href = "{URL_ATTENTE}?URL={URL_CENTER}";
    window.getFrameArborescence().location.href = "{URL_MENU}";
    if ({VERIF_SESSION})
        setTimeout("checkConnexion()", {NEXT_VERIF_SESSION});
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

var isAfficheMenu = false;
var isAfficheArbo = true;
var isAfficheCenterPleinEcran = true;
var tailleImageEntete = 74;
var marginTop = 5;
var marginBottom = 5;
var hauteurBarreTitre = 20;
var hauteurArrondiBas = 0;
var marginBetweenMenu = 10;
var szFrameEnCours = "";
var taille_menu = {LARGEUR_FRM_MENU};
var currentClientHeight = 0;
var currentClientWidth = 0;
var isAfficheMenuEnHaut = {AFFICHAGE_MENU_EN_HAUT};
var pourcentageMenu = {POURCENTAGE_TAILLE_MENU};
var isModePortail = {MODE_PORTAIL};
var isModeOnglet = {MODE_ONGLET};

function positionnement()
{
    // initialise la largeur et la hauteur courante
    currentClientHeight = document.body.clientHeight;
    currentClientWidth = document.body.clientWidth;
    var decalageHauteur = tailleImageEntete + marginTop + hauteurBarreTitre;
    var hauteurDivCenter = document.body.clientHeight - (decalageHauteur + marginBottom + hauteurArrondiBas);
    var szIdEcranEnCours = getIdEcranCourant();

    // hauteur en-tete
    document.getElementById('div_header').style.height = tailleImageEntete + "px";
    document.getElementById('toolbar1').style.height = tailleImageEntete + "px";

    // affichage du menu : soit l'arborescence est affichée aussi, soit seul le menu est affiché
    if (isAfficheMenu)
    {
        document.getElementById('div_menu').style.display = "";
        document.getElementById('div_menu').style.width = taille_menu + "px";
        document.getElementById('barre_bloc_menu').style.left = document.getElementById('div_menu').offsetLeft  + "px";
        document.getElementById('barre_bloc_menu').style.width = document.getElementById('div_menu').clientWidth  + "px";
        document.getElementById('barre_bloc_menu').style.display = "";
        
        if (isAfficheArbo)
        {
            document.getElementById('div_menu2').style.display = "";
            document.getElementById('barre_bloc_arbo').style.display = "";
            var espaceDisponibleMenus = hauteurDivCenter - hauteurBarreTitre - marginBetweenMenu;
            document.getElementById('div_menu').style.height = (parseInt(espaceDisponibleMenus*pourcentageMenu/100)) + "px";
            document.getElementById('menu_fonction').style.height = document.getElementById('div_menu').style.height;
            
            document.getElementById('div_menu2').style.height = (parseInt(espaceDisponibleMenus*(100-pourcentageMenu)/100)) + "px";
            document.getElementById("frm_arbo_question").style.height = document.getElementById('div_menu2').style.height;
            document.getElementById('div_menu2').style.width = document.getElementById('div_menu').clientWidth + "px";
            
            if (isAfficheMenuEnHaut)
            {
                document.getElementById('div_menu').style.top = decalageHauteur + "px";
                document.getElementById('barre_bloc_menu').style.top = (tailleImageEntete + marginTop) + "px";
                
                document.getElementById('barre_bloc_arbo').style.top = (document.getElementById('div_menu').offsetTop + marginBetweenMenu + document.getElementById('div_menu').clientHeight) + "px";
                document.getElementById('div_menu2').style.top = (parseInt(document.getElementById('barre_bloc_arbo').style.top) + hauteurBarreTitre) + "px";
            }
            else
            {
                document.getElementById('div_menu2').style.top = decalageHauteur + "px";
                document.getElementById('barre_bloc_arbo').style.top = (tailleImageEntete + marginTop) + "px";

                document.getElementById('barre_bloc_menu').style.top = (decalageHauteur + marginBetweenMenu + document.getElementById('div_menu2').clientHeight) + "px";
                // parseInt car la donnée top est en pixel
                document.getElementById('div_menu').style.top = (parseInt(document.getElementById('barre_bloc_menu').style.top) + hauteurBarreTitre) + "px";
            }
                        
            document.getElementById('barre_bloc_arbo').style.left = document.getElementById('div_menu').offsetLeft  + "px";
            document.getElementById('barre_bloc_arbo').style.width = document.getElementById('div_menu').clientWidth  + "px";
        
            document.getElementById('img_agrandir_menu').src = '../../../../images/icons/flechejaunehaut.gif';
        }
        else
        {
            document.getElementById('div_menu').style.top = decalageHauteur + "px";
            document.getElementById('barre_bloc_menu').style.top = (tailleImageEntete + marginTop) + "px";
            
            document.getElementById('barre_bloc_arbo').style.display = "none";
            // pb affichage arborescence si masquée
            if (isIE10)
            {
                document.getElementById('div_menu2').style.height = "0px";
                document.getElementById('div_menu2').style.top = (decalageHauteur + document.getElementById(szIdEcranEnCours).clientHeight) + "px";
            }
            else
            	document.getElementById('div_menu2').style.display = "none";
            document.getElementById("frm_arbo_question").style.height = document.getElementById('div_menu2').style.height;
            
            document.getElementById('div_menu').style.height = document.getElementById(szIdEcranEnCours).clientHeight + "px";
            document.getElementById('menu_fonction').style.height = document.getElementById('div_menu').style.height;
            document.getElementById('img_agrandir_menu').src = '../../../../images/icons/flechejaunebas.gif';
        }
        document.getElementById('img_agrandir_arbo').src = '../../../../images/icons/flechejaunehaut.gif';
    }
    // pas d'affichage du menu
    else
    {
        document.getElementById('barre_bloc_menu').style.display = "none";
        document.getElementById('div_menu').style.display = "none";
        document.getElementById('barre_bloc_arbo').style.display = "";
        document.getElementById('div_menu2').style.display = "";
        document.getElementById('div_menu2').style.width = taille_menu + "px";
        document.getElementById('barre_bloc_arbo').style.left = document.getElementById('div_menu2').offsetLeft  + "px";
        document.getElementById('barre_bloc_arbo').style.width = document.getElementById('div_menu2').clientWidth  + "px";
        document.getElementById('barre_bloc_arbo').style.top = (tailleImageEntete + marginTop) + "px";
        document.getElementById('div_menu2').style.height = hauteurDivCenter + "px";
        document.getElementById("frm_arbo_question").style.height = document.getElementById('div_menu2').style.height;
        document.getElementById('div_menu2').style.top = decalageHauteur + "px";
        
        document.getElementById('img_agrandir_arbo').src = '../../../../images/icons/flechejaunebas.gif';
        document.getElementById('img_agrandir_menu').src = '../../../../images/icons/flechejaunehaut.gif';
    }

    if (isAfficheCenterPleinEcran)
    {
        
        document.getElementById('barre_bloc_menu').style.display = "none";
        document.getElementById('div_menu').style.display = "none";
        document.getElementById('barre_bloc_arbo').style.display = "none";
        document.getElementById('div_menu2').style.display = "none";
        document.getElementById('div_center').style.width = (document.getElementById('div_header').clientWidth - 10)  + "px";
        document.getElementById('div_center').style.left = "5px";
    }
    else
    {
        document.getElementById('div_center').style.width = (document.getElementById('div_header').clientWidth -  taille_menu - 15)  + "px";
        document.getElementById('div_center').style.left = (taille_menu + 15 ) + "px";
    }

    document.getElementById('div_center').style.height = hauteurDivCenter + "px";
	if(isModeOnglet) {
	
		document.getElementById('div_center').style.top = "0px";
	    document.getElementById('barre_bloc_center').style.left = (document.getElementById('div_center').offsetLeft + document.getElementById('div_center').clientWidth - 20) + "px";
	    document.getElementById('barre_bloc_center').style.width = "20px";
	}
	else {
		document.getElementById('div_center').style.top = decalageHauteur + "px";
		document.getElementById('barre_bloc_center').style.left = (document.getElementById(szIdEcranEnCours).offsetLeft) + "px";
    	document.getElementById('barre_bloc_center').style.width = document.getElementById(szIdEcranEnCours).clientWidth + "px";
	}
	
    document.getElementById('barre_bloc_center').style.top = (tailleImageEntete + marginTop)  + "px";
}


function minimizeMaximizeBlocArbo()
{
    isAfficheMenu = !isAfficheMenu;
    positionnement();
}

function minimizeMaximizeBlocMenu()
{
    isAfficheArbo = !isAfficheArbo;
    positionnement();
}

function minimizeMaximizeBlocPrincipal()
{
    isAfficheCenterPleinEcran = !isAfficheCenterPleinEcran;
    positionnement();
}

function changerLargeurBlocArbo(variation)
{
    taille_menu += variation;
    positionnement();
}

function testpositionnement()
{
    // test si la difference est importante pour éviter des repositionnement intempestifs sous IE (affichage/masquage scrollbar)
    if (currentClientHeight - document.body.clientHeight > 25 || document.body.clientHeight - currentClientHeight > 25 ||
        currentClientWidth - document.body.clientWidth  > 25 || document.body.clientWidth - currentClientWidth > 25 )
        positionnement();
}

/* 
 * Fonction pour la barre d'outils
 */ 
function afficherQuestionUrl(szQuestion)
{
   var szUrl = "{URL_ATTENTE}?URL={URL_RESULTAT}&TYPE_RECHERCHE=RECHERCHE_BIB&POS_QUEST_PUBLIC=1&POS_QUEST_NOM=" + escape(szQuestion);
   afficherUrl(szUrl);
}

function afficherRechercheTexte()
{
    var szValeurRecherche = document.getElementById('champ_recherche').value;
    //if (true)
    if (szValeurRecherche.length == 0)
       alert('Veuillez saisir une valeur de recherche');
    else 
    {
	    var szUrl = "{URL_ATTENTE}?URL=../ftx/recherche_ftx.php";
        szUrl += "&POS_CHOIX_LIB=" + escape("NOT;COA;COD;");
        szUrl += "&POS_TRI=0";
        szUrl += "&TYPE_CHOIX_RUB=RUB_ET_FIC";
        szUrl += "&POS_NB_REP=20";
        szUrl += "&POS_QUESTION=" + escape(szValeurRecherche);
        afficherUrl(szUrl);
    }
}

function onCloseApplication()
{
    var bRetour = testOpenDocument(true);
    if (bRetour)
    {
	    bEcranDeconnexion = 1;
	    document.location.href = '{URL_FERMER_APPLICATION}';
    }
    return false;
}
</SCRIPT>

<style type="text/css">
#div_menu, #div_menu2 {
}

.divs_center{
}

.dd-demo {
    position:absolute;
    text-align:center;
    color:#6D739A;
    cursor: move;
    filter : alpha(opacity=70);
    opacity: 0.7;
}

.logger {
    position:absolute;
    border:1px solid #666;
    background-color:#ffffff;
    top:200px; 
    left:1000px;
    height:400px;
    width:200px;
    overflow: scroll;
    display: none;
}




.yui-skin-sam .yui-panel .bd, .yui-skin-sam .yui-panel .ft {
    background-color:#ffffff;
}
</style>
</HEAD>
<body class='accueil yui-skin-sam' onLoad="initEcran();" onResize="testpositionnement();" onBeforeUnLoad='onUnload();'>
<div id='div_header'>
<div id='toolbar1' name='toolbar1'>
<table width="100%" class="containertoolbar" border='0' height='40px' cellspacing='0' cellpadding='0'>
    <tr>
        <td width="220px"></td>
        <td width="150px" rowspan='2' style='vertical-align: middle;'>
                
            <table width="130" border="0" cellpadding="0" height="29" cellspacing="0">
              <tr> 
                <td height="15"> 
                  <div align="right"><img src="/{NOM_APPLICATION}/images/carteviz/utilisateur.gif" width="18" height="15"></div>
                </td>
                <td height="15" background="/{NOM_APPLICATION}/images/carteviz/tirets.gif">&nbsp;</td>
                <td height="15" class="cartevisite_libelle">&nbsp;{NOM_UTILISATEUR}</td>
              </tr>
              <tr> 
                <td height="15"> 
                  <div align="right"><img src="/{NOM_APPLICATION}/images/carteviz/profil.gif" width="18" height="15"></div>
                </td>
                <td height="15" background="/{NOM_APPLICATION}/images/carteviz/tirets.gif">&nbsp;</td>
                <td height="15" class="cartevisite_libelle"><span id='libelle_profil' class="cartevisite_libelle">&nbsp;{PROFIL_UTILISATEUR}</span></td>
              </tr>
            </table>
		</td>
	    <td valign=bottom>
	       <div class="menu" id="contenu-menu" align="right">
            {CONTENU_MENU}
            </div>
        </td>
      
        <td>
            <span style="vertical-align: bottom;">
            <input type='text' id='champ_recherche' size='20' value="Rechercher..." onClick="this.value=''" onKeyPress="javascript:onKeyPressPleinTexte(event);">
            <input type='button' style="background: #F09113;padding:2px 2px; color:#fff; border:none; font-weight:bold" value='ok' onClick='javascript:afficherRechercheTexte();'>
            </span>
        </td>
       <!-- debut  AIDE -->
        <td style="text-align: right;">
            <span style="vertical-align: bottom;" class="libellemenu">
              <A class="libellemenu" href="#" OnClick="javascript:window.open('/{NOM_APPLICATION}/AideCOURRIER/AideCOURRIER.html','','resizable=yes,directories=no,location=no,width=1000, height=600')"  title="Aide">
               <IMG  SRC="/{NOM_APPLICATION}/images/toolbar/aide.png" style="cursor: pointer;" width="20" height="20" border="0">
                &nbsp;Aide
                </A>
             </span>
        </td> 
  <!--  fin  AIDE -->  
        <td style="text-align: right;">
            <span style="vertical-align: bottom;" class="libellemenu">
              <A class="libellemenu" href="javascript:void(0);" onClick="javascript:onCloseApplication();return false;" title="{LIBELLE_TOOLBAR_FERMER}" onMouseOver="roll_img_toolbar('quit')" onMouseOut="normal_img_toolbar('quit');" onMouseDown="initialise_img_toolbar('quit');">
               <IMG name="quit" SRC="/{NOM_APPLICATION}/images/toolbar/deconnex.gif" style="cursor: pointer;" width="20" height="20" border="0">
                &nbsp;&nbsp;{LIBELLE_TOOLBAR_FERMER}
                </A>
             </span>
        </td> 
	</tr> 
</table>
</div>
<!--<iframe src='{URL_TOOLBAR}' allowTransparency="true" style='height: 100%;width: 100%' frameborder='0' id='toolbar1' name='toolbar1'></iframe>-->
</div>
<!-- barre de titre du menu -->
<div id='barre_bloc_menu' style='display:none;' class="arrondi arrondi_accueil">
<table style="width: 100%;" cellspacing='0' cellpadding='0'>
<tr>
<td style="width: 90%;">
<span>&nbsp;{LIBELLE_MENU} </span>
</td>
<td style="text-align: right;">
<span><a onClick="javascript:minimizeMaximizeBlocMenu();"><img id='img_agrandir_menu' src='../../../../images/icons/flechejaunehaut.gif' border='0'></a></span>
</td>
</tr>
</table>
</div>
<!-- menu -->
<div id='div_menu'>
<iframe name='menu_fonction' id='menu_fonction' src='{URL_ACCES_DIRECT_MENU}' allowTransparency="true" style='height: 100%;width: 100%;' frameborder='0' ></iframe>
</div>

<!-- barre de titre de l'arborescence -->
<div id='barre_bloc_arbo' style='display:none;' class="arrondi arrondi_accueil">
    <table style="width: 100%;" cellspacing='0' cellpadding='0'>
    <tr>
        <td style="width: 50%;">
            <span>&nbsp;{LIBELLE_ARBORESCENCE} </span>
        </td>
        <td style="text-align: right;vertical-align: middle;top:2px;">
            <a onClick="javascript:changerLargeurBlocArbo(-50);"><img id='img_retrecir_largeur_arbo2' style='display:none;' src='../../../../images/icons/fleche_dble_gauche.gif' border='0'></a>
            <a onClick="javascript:changerLargeurBlocArbo(-10);"><img id='img_retrecir_largeur_arbo1' style='display:none;' src='../../../../images/icons/fleche_simple_gauche.gif' border='0'></a>
            <a onClick="javascript:changerLargeurBlocArbo(10);"><img id='img_elargir_largeur_arbo1' style='display:none;' src='../../../../images/icons/fleche_simple_droite.gif' border='0'></a>
            <a onClick="javascript:changerLargeurBlocArbo(50);"><img id='img_elargir_largeur_arbo2' style='display:none;' src='../../../../images/icons/fleche_dble_droite.gif' border='0'></a>
            <a onClick="javascript:minimizeMaximizeBlocArbo();"><img id='img_agrandir_arbo' style='display:none;' src='../../../../images/icons/flechejaunehaut.gif' border='0'></a>
        </td>
    </tr>
    </table>
</div>

<!-- arborescence -->
<div id='div_menu2'>
<iframe allowTransparency="false" src='' style='height: 100%;width: 100%;' frameborder='0' id='frm_arbo_question' name='frm_arbo_question'></iframe>
</div>
<!-- BEGIN BLOC_MODE_SANS_ONGLET -->
<div id='barre_bloc_center' style='display:none;' class="arrondi arrondi_accueil">
    <table style="width: 100%;" cellspacing='0' cellpadding='0'>
    <tr>
        <td style="width: 90%;">
            <span style="font-weight:bold;" id='titre_barre_center'>&nbsp;{PAGE_ACCUEIL}</span>
        </td>
        <td style="text-align: right;">
            <a onClick="javascript:minimizeMaximizeBlocPrincipal();"><img id='img_agrandir_bloc_center' style='display:none;' src='../../../../images/icons/flechejaunegauche.gif' border='0'></a>
        </td>
    </tr>
    </table>
</div>
<div id='div_center' style="background-color: transparent;" class="divs_center">
        <iframe src='' allowTransparency="true" style='height: 100%;width: 98%;margin-left:10px;' frameborder='0' id='ifr_centerbal' name='centerbal'></iframe>
        <iframe src='' style='height: 100%;width: 98%;margin-left:10px;' frameborder='0' id='ifr_center' name='center'></iframe>
        <iframe src='{URL_AFFICHER_INDEX}' style='height: 100%;width: 98%;margin-left:10px;' frameborder='0' id='ifr_posdocument' name='posdocument'></iframe>
    </div>
<!-- END BLOC_MODE_SANS_ONGLET -->

<!-- BEGIN BLOC_MODE_ONGLET -->
<style type="text/css">
#barre_bloc_center.arrondi_accueil, 
#barre_bloc_center.arrondi_recherche, 
#barre_bloc_center.arrondi_parametrage {
    background: none;
    border: none; 
}
#nav-content div {
    height: 100%;
}
#nav-content div.yui-hidden {
    height: 0px;
}
</style>     
    <div id='div_center' style="background-color: transparent;border: none;" class="divs_center yui-navset"> 
    <ul class="yui-nav">  
         <li class="selected"><a href="#tab_centerbal"><em>{PAGE_ACCUEIL}</em></a></li>  
     </ul>
                  
     <div class="yui-content" id="nav-content" style="height: 98%;background-color: transparent;">  
         <div id="tab_centerbal"  style="height: 100%;background-color: transparent;">
            <iframe src='' allowTransparency="true" style='height: 100%;width: 98%;margin-left:10px;' frameborder='0' id='ifr_centerbal' name='centerbal'></iframe>
        </div>
        <iframe src='' style='height: 100%;width: 98%;margin-left:10px;display:none;' frameborder='0' id='ifr_center' name='center'></iframe>
     </div> 
    </div>
    <div id='barre_bloc_center' class="arrondi arrondi_accueil">
        <a onClick="javascript:minimizeMaximizeBlocPrincipal();"><img id='img_agrandir_bloc_center' style='display:none;' src='../../../../images/icons/flechejaunegauche.gif' border='0'></a>
    </div>
<!-- END BLOC_MODE_ONGLET --> 
  
<div id="myLogger" class="logger"></div>
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

var myLogReader = new YAHOO.widget.LogReader("myLogger");
// Customize the formatting of output to LogReader
myLogReader.formatMsg = function(oLogMsg) {
  var category = oLogMsg.category;
  return '<span class="labelChamp">' + oLogMsg.msg +'</span><br>';
};

// construit les images qui serviront au drag and drop
var ddobj = document.createElement("img");
ddobj.className = "dd-demo";
ddobj.src = "/{NOM_APPLICATION}/images/dragdrop/croix.gif";
ddobj.id = "dd-demo-0";
ddobj.style.display = "none";
document.body.appendChild(ddobj);

(function() {
    var dd, dd2, dd3;
    YAHOO.util.Event.onDOMReady(function() {

        // ajoute la "couche" drag and drop sur les images crée ci-dessus 
        dd = new YAHOO.util.DD("dd-demo-0");
        dd.useShim = true;
        //dd.resizeFrame = false; 
        dd.on('startDragEvent', 
            function(ev) {
            
                //this.setXConstraint(0, parent.document.getElementById('div_menu2').clientWidth, 10);
                //this.setYConstraint(0, 1024, 10);	

            }, dd, true);
        
        dd.on('mouseDownEvent', 
            function(ev) {
            
                var objDrag = getObjFromEvent(ev);
                var idDrag = objDrag.id;
                var isControl = event.ctrlKey;
                //alert(isControl);
                
                posXDebutDrag = parent.document.getElementById(idDrag).offsetLeft;
                posYDebutDrag = parent.document.getElementById(idDrag).offsetTop;
                
                parent.document.getElementById(idDrag).style.cursor = "default";
            }, dd, true);

        dd.on('endDragEvent', 
            function(ev) {
            
                var objDrag = getObjFromEvent(ev.e);
                objDrag.style.display = "none";
                var isControl = ev.e.ctrlKey;
                var iNumDoc = parent.document.getElementById("dd-demo-0").posNumDoc;
                if (ev.e.clientX < parent.document.getElementById('div_menu2').clientWidth)
                {
                    if (isControl)
                    {
                        iNumDoc = parent.center.getListeNumInfo(true, false);
                        getFrameArborescence().insererDansDossier(ev.e.clientY, iNumDoc, true);
                    }
                    else
                    {
                        getFrameArborescence().insererDansDossier(ev.e.clientY, iNumDoc, false);
                    }
                }
                parent.document.getElementById(idDrag).style.left = posXDebutDrag + "px";
                parent.document.getElementById(idDrag).style.top = posYDebutDrag + "px";

            }, dd, true);
        
        dd.on('dragEvent', 
            function(ev) {
                //posXDebutDrag = ev.e.clientX;
                //sendSpeEventMouseDown(event, fireOnThis);
                if (ev.e.clientX < parent.document.getElementById('div_menu2').clientWidth) {
                    //console.log("Ypos:" + ev.e.clientY);
                        getFrameArborescence().afficherDrop(ev.e.clientY);
                }
            }, dd, true);
    });
})();
</script>
</HTML>
