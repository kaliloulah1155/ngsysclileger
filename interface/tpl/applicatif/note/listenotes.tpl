<HTML>

<HEAD>
	<TITLE>Liste des annotations</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="JavaScript">
	
	function setNote(numnote)
	{
		var note ="document.listenotes.NOTE_" + numnote;
		var obj = eval(note);

		if (document.layers)
		{
			document.layers["textenote"].document.open();
			document.layers["textenote"].document.writeln(obj.value);
			document.layers["textenote"].document.close();
		}
		else
		{
			document.all["textenote"].innerHTML = obj.value;
		}
	}
		
	</SCRIPT>
</HEAD>

<BODY topmargin="0" leftmargin="0">
<FORM NAME="listenotes">
<TABLE border=1 cellpadding=0 cellspacing=0 width=100%>
<TR>
<TD width=50%>
<TABLE align=center cellspacing="0" cellpadding="1" border="1"> 
	<TR>
		<TH align=left class=titrecolonne>Numéro</TH>
		<TH align=left class=titrecolonne>Date</TH>
		<TH align=left class=titrecolonne>Auteur</TH>
		<TH align=left class=titrecolonne>Libellé</TH>
		<TH align=left class=titrecolonne>Texte</TH>
		<TH align=left class=titrecolonne>Suppression</TH>
	</TR>
   <!-- BEGIN NOTE -->
	<TR>
		<TD class=listeResumee>{POS_NOTE_NUM}</TD>
		<TD class=listeResumee>{POS_NOTE_DATE}</TD>
		<TD class=listeResumee>{POS_NOTE_CREATEUR}</TD>
		<TD class=listeResumee>{POS_NOTE_LIBELLE}</TD>
		<TD align=center>
			<A href="javascript:setNote('{POS_NOTE_NUM}')"><IMG SRC="/{NOM_APPLICATION}/images/menu/win/txt.gif" border=0></A>
			<INPUT TYPE=HIDDEN NAME=NOTE_{POS_NOTE_NUM} VALUE="{POS_NOTE_TEXTE}">
		</TD>
		<TD align=center>
			<A href='{URL_SUP_NOTE}POS_NUM_DOC={POS_NUM_DOC}&POS_NUM_PAGE={POS_NUM_PAGE}&POS_NUM_SSPAGE={POS_NUM_SSPAGE}&POS_NOTE_NUM={POS_NOTE_NUM}'><IMG SRC="/{NOM_APPLICATION}/images/icons/supprime.gif" border=0></A></TD>
	</TR>
  <!-- END NOTE -->
</TABLE>
</TD>
</FORM>
<TD WIDTH=200>
<!--ILAYER ID="textenote"-->
<DIV ID="textenote" style="position:relative">
</DIV>
</TD>
</TR>
</TABLE>

<FORM NAME="principal" METHOD=POST ACTION="{URL_AFF_AJOUT_NOTE}">
<INPUT TYPE=HIDDEN NAME=POS_NUM_DOC VALUE="{POS_NUM_DOC}">
<INPUT TYPE=HIDDEN NAME=POS_NUM_PAGE VALUE="{POS_NUM_PAGE}">
<INPUT TYPE=HIDDEN NAME=POS_NUM_SSPAGE VALUE="{POS_NUM_SSPAGE}">
<INPUT TYPE=SUBMIT class=bouton_sub VALUE="Ajouter une note">
</FORM>

</BODY>
</HTML>
