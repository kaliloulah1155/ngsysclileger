<HTML>
<HEAD>
<TITLE>REcherche par date</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<link rel="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/yui/build/calendar/assets/skins/sam/calendar.css" />
	<link rel="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/agenda.css">
	
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/yahoo-dom-event/yahoo-dom-event.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/calendar/calendar-min.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/yui/build/json/json.js"></script>
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/agenda/agenda.js"></script>
	
	<SCRIPT language="javascript">
	
	//var bIntranet = "{INTRANET}";
	var bIntranet = true;
	function construitUrl(_date, _tabDate) {
	if(!(_tabDate[_date])) {
		//szUrl = "http://www.laltruiste.com/document.php?page=1&rep=10"
	}
	else {
		var tabNumDoc = _tabDate[_date];
		
		if (bIntranet == true)
			szUrl= URL_SITE + "/interface/session/principal/intranet/rechercher.php?bAgenda=true&TAB_NUM_DOC="+tabNumDoc;
		else 
			szUrl= URL_SITE + "/interface/session/principal/resultat/rechercher_db.php?TYPE_RECHERCHE=RECHERCHE_TAB_NUM_DOC&TAB_NUM_DOC="+tabNumDoc;
	}
	return szUrl;
	}	
	</SCRIPT>
	
	<script type="text/javascript" src="/{NOM_APPLICATION}/include/script/agenda/agenda.js"></script>

	<SCRIPT language="javascript">
	
	var objSeances = "{SEANCES}";
	var MoisAnneeDebutTmp= "{MOIS_ANNEE_DEBUT}";
	var nbMoisTmp = {NBMOIS};

	</SCRIPT>

</HEAD>

<BODY topmargin="5" class=" yui-skin-sam">



<table align="center" width="700px">
<tr>
<td>
<div id="calendarContainer"></div>
</td>
</tr>
</table>
<table align="center">
<tbody id="legende" style="display:none;" cellpadding="0" cellspacing="0" border="0">
<tr><td align="center" colspan="2">Légende</td></tr>
<!-- BEGIN BLOC_LEGENDE -->
<tr>
<td id="{CLASSCOULEUR}-RADIO" width="15px"><!--INPUT Type='radio' name='radiolegend' value='{CLASSCOULEUR}'--></td>
<td id="{CLASSCOULEUR}-LIBELLE"></td>
</tr>
<!-- END BLOC_LEGENDE -->
<tr id="class99">
<td id="class99-RADIO" width="15px"></td>
<td id="class99-LIBELLE"></td>
</tr>
</tbody>
</table>

</BODY>
</HTML>
