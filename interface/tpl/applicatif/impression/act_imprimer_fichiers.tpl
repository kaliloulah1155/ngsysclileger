<HTML>
<HEAD>
<TITLE>Impression</TITLE>
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="Javascript">
function changeLibelle()
{
	// document.all.attente.innerHTML = "";
}

function quitter()
{
    var iY = window.event.clientY;
    if(iY < 0)
        event.returnValue="Opération non permise veuillez cliquer sur ANNULER";
}

function closeWindow()
{
	window.close();
}

</SCRIPT>
</HEAD>
<TITLE>Impression en cours</title>
<BODY onbeforeunload="quitter()">
<HR>
<b>Impression en cours...</b>
<BR>
Ne fermez pas cette fenêtre.
<BR>
<p>
<center>
<OBJECT classid="clsid:8AD9C840-044E-11D1-B3E9-00805F499D93"
	WIDTH ="10" HEIGHT="10"  codebase="http://java.sun.com/products/plugin/1.2/jinstall-12-win32.cab#Version=1,2,0,0">
<PARAM NAME="CODE" VALUE="PosPrintApplet.class">
<PARAM NAME="ARCHIVE" VALUE="{URL_JAR}PosPrintApplet.jar,{URL_JAR}lib/commons-httpclient-2.0.2.jar,{URL_JAR}lib/commons-logging.jar,{URL_JAR}lib/jakarta-slide-webdavlib-2.1.jar,{URL_JAR}lib/jdom-1.0.jar,{URL_JAR}lib/jaxp.jar" >
<PARAM NAME="type" VALUE="application/x-java-applet;version=1.4">
<PARAM NAME="NB_FICHIERS" VALUE="{NB_FICHIERS}">
<!-- BEGIN BLOC_FICHIERS -->
<PARAM NAME="URL_FICHIER_{NUM_FICHIER}" VALUE="{URL_FICHIER}">
<!-- END BLOC_FICHIERS -->
<PARAM NAME="URL_PROGRAMME" VALUE="{URL_PROGRAMME}">
<PARAM NAME="PHPSESSID" VALUE="{PHPSESSID}">
<PARAM NAME="BGCOLOR" VALUE="15658734">
</OBJECT>
</center>
<HR>
</BODY>
</HTML>
