<HTML>
<HEAD>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="Javascript">
function changeLibelle()
{
	// appel a la fin du start de l'applet : le fichier n'est pas encore ouvert...
}
function quitter()
{
    /*
    var iY = window.event.clientY;
    if(iY < 0)
        event.returnValue="Attention ! Ne pas fermer cette fenêtre, cela pourrait bloquer le fichier";
    */
}
function AffMessageSave()
{
    alert("{CST_MSG_FICHIER_FERMER_AVANT_ENREG}");
} 
function AffMessageClose()
{
    alert("{CST_MSG_FICHIER_FERMER_AVANT_ANNUL}");
}

function closeApplet()
{
    parent.parent.closeFileModif();
    var frDocument = parent.parent.getFramePosDocument({POS_NUM_DOC}); 
    if(frDocument.frm_affiche_fichier != null && frDocument.frm_affiche_fichier.actualiser) 
        frDocument.frm_affiche_fichier.actualiser();
}

function initialise()
{
    // ne fonctionne pas avec JRE1.06_011
	//document.getElementById("applet").style.display = "none";
	document.getElementById("attente").style.display="";
}

//Gets the browser specific XmlHttpRequest Object
function getXmlHttpRequestObject() {	
	
	if (window.XMLHttpRequest) {
	
		return new XMLHttpRequest();
	} else if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} 
}

//Our XmlHttpRequest object to get the auto suggestvar 
var searchReq = getXmlHttpRequestObject();

function sauverSession() 
{	
	if (searchReq.readyState == 4 || searchReq.readyState == 0) 
	{		
		searchReq.open("GET", '/{NOM_APPLICATION}/interface/session/principal/ajax/sauver_session.php', true);
		searchReq.onreadystatechange=function(){
		}
    	searchReq.send(null);
	}		
}
function initApplet() {
    var s ="";
    s += "<APPLET CODE=\"PosDAVApplet.class\" NAME=\"PosDAVApplet\" ARCHIVE=\"{URL_JAR}PosDAVApplet.jar,{URL_JAR}lib/commons-httpclient-2.0.2.jar,{URL_JAR}lib/commons-logging.jar,{URL_JAR}lib/jakarta-slide-webdavlib-2.1.jar,{URL_JAR}lib/jdom-1.0.jar\" WIDTH=\"200\" HEIGHT=\"50\" MAYSCRIPT>";
    s += "<PARAM NAME=CODE VALUE=\"PosDAVApplet.class\">";
	s += "<PARAM NAME=\"ARCHIVE\" VALUE=\"{URL_JAR}PosDAVApplet.jar,{URL_JAR}lib/commons-httpclient-2.0.2.jar,{URL_JAR}lib/commons-logging.jar,{URL_JAR}lib/jakarta-slide-webdavlib-2.1.jar,{URL_JAR}lib/jdom-1.0.jar\" >";
    s += "<PARAM NAME=\"type\" VALUE=\"application/x-java-applet;version=1.5\">";
	s += "<PARAM NAME=\"TYPE_FERMETURE\" VALUE=\"2\">";
	s += "<PARAM NAME=\"URLNAME\" VALUE=\"{POS_URL_NAME}\">";
	s += "<PARAM NAME=\"URLSAUVER\" VALUE=\"{URLSAUVER}\">";
	s += "<PARAM NAME=\"URLANNULER\" VALUE=\"{URLANNULER}\">";

	s += "<PARAM NAME=\"PATHNAME\" VALUE=\"{POS_PATHNAME}\">";
	s += "<PARAM NAME=\"PATHSAUVER\" VALUE=\"{PATHSAUVER}\">";
	s += "<PARAM NAME=\"PATHANNULER\" VALUE=\"{PATHANNULER}\">";

	s += "<PARAM NAME=\"POS_NUM_DOC\" VALUE=\"{POS_NUM_DOC}\">";
	s += "<PARAM NAME=\"POS_NUM_PAGE\" VALUE=\"{POS_NUM_PAGE}\">";
	s += "<PARAM NAME=\"POS_NUM_SSPAGE\" VALUE=\"{POS_NUM_SSPAGE}\">";
	s += "<PARAM NAME=\"PHPSESSID\" VALUE=\"{PHPSESSID}\">";
	s += "<PARAM NAME=\"BGCOLOR\" VALUE=\"16777215\">";
	s += "<PARAM NAME=\"DEBUG\" VALUE=\"1\">";
	s += "<PARAM NAME=\"USE_FORM_HTTP_METHOD\" VALUE=\"{USE_FORM_HTTP_METHOD}\">";
    s += "<PARAM NAME=\"USE_SUN_HTTP_METHOD\" VALUE=\"{USE_SUN_HTTP_METHOD}\">";
	s += "<PARAM NAME=\"PATHSAUVER_FICHIER_POST\" VALUE=\"{PATHSAUVER_FICHIER_POST}\">";
    s += "</APPLET>";
    var elem = document.getElementById("appletposdav");
    elem.innerHTML = s;
}


function alertSession()
{
	window.focus();
	sauverSession();
    alert("{CST_MSG_FICHIER_SESSION_EXPIRE_BIENTOT}");
}
window.setTimeout('alertSession()', 3600 * 1000);
</SCRIPT>

<TITLE>{LIBELLE_TITRE_PAGE}</title>

</HEAD>
<BODY onbeforeunload="quitter()" onload="javascript:initApplet();">
<HR>
<b>{LIBELLE_MESSAGE_1}</b>
<br>
<br>
{LIBELLE_MESSAGE_2}
<br>
<br>
<img src="/{NOM_APPLICATION}/images/menu/win/ext_{ICONE_FICHIER}.gif" border='0'>&nbsp;{POS_NOM_FICHIER_ORIG}
<br>
<p>
<center>
<IMG id="attente" style="display: none;" SRC="/{NOM_APPLICATION}/images/icons/attente.gif" border=0>
<br>
<div id="appletposdav">
</div>
</center>
<HR>
</BODY>
</HTML>
