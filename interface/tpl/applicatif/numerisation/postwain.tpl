<HTML>
<HEAD>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="Javascript">

function fermerFenetreApplet()
{     
    if(parent.fichier != null)
    	   parent.fichier.actualiser();
    
    if(parent.actualiserVisuFichier != null)
    	parent.actualiserVisuFichier();
    parent.closeFileModif();
}

function quitter()
{
	/*
    var iY = window.event.clientY;
    if(iY < 0)
        event.returnValue="Attention ! Ne pas fermer cette fenêtre, cela pourrait bloquer le fichier";
    */
}

function initApplet() {
    var s ="";
    s += "<APPLET CODE=\"PosTwainApplet.class\" NAME=\"PosTwainApplet\" ARCHIVE=\"{URL_JAR}PosTwainApplet.jar\" WIDTH=\"320\" HEIGHT=\"120\" MAYSCRIPT>";
    s += "<PARAM NAME=CODE VALUE=\"PosTwainApplet.class\">";
	s += "<PARAM NAME=\"ARCHIVE\" VALUE=\"{URL_JAR}PosTwainApplet.jar\">";
    s += "<PARAM NAME=\"type\" VALUE=\"application/x-java-applet;version=1.4\">";
	s += "<PARAM NAME=\"PATH_URLSAUVER\" VALUE=\"{PATH_URLSAUVER}\">";
	s += "<PARAM NAME=\"BGCOLOR\" VALUE=\"16777215\">";
	s += "<PARAM NAME=\"XRESOLUTION\" VALUE=\"200\">";
	s += "<PARAM NAME=\"YRESOLUTION\" VALUE=\"200\">";
	s += "<PARAM NAME=\"POS_NUM_DOC\" VALUE=\"{POS_NUM_DOC}\">";
	s += "<PARAM NAME=\"POS_NUM_PAGE\" VALUE=\"{POS_NUM_PAGE}\">";
	s += "<PARAM NAME=\"POS_NUM_SSPAGE\" VALUE=\"{POS_NUM_SSPAGE}\">";
	s += "<PARAM NAME=\"TYPE_PJ\" VALUE=\"{TYPE_PJ}\">";
	s += "<PARAM NAME=\"PHPSESSID\" VALUE=\"{PHPSESSID}\">";
	s += "<PARAM NAME=\"LANG\" VALUE=\"{LANG}\">";
	s += "<PARAM NAME=\"SCANNERS_CHOCOLATE\" VALUE=\"FUJITSU fi-6110dj\">";
	s += "<PARAM NAME=\"PATH_DOWNLOAD_URL_DLL\" VALUE=\"{PATH_URL_DOWNLOAD_DLL_NUM_JAR}\">";
    s += "</APPLET>";
    
    var elem = document.getElementById("appletnumerisation");
    elem.innerHTML = s;
}
</SCRIPT>
<TITLE>{LIBELLE_TITRE_PAGE}</title>
</HEAD>
<BODY onbeforeunload="quitter()"  onload="javascript:initApplet();">
<center>
<div id="appletnumerisation">
</div>
<br>
</center>
</BODY>
</HTML>
