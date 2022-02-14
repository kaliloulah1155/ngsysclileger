<HTML>
<HEAD>
	<TITLE>Ajout d'une annotation</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
</HEAD>

<BODY topmargin="0" leftmargin="0">
<FORM NAME="principal" METHOD="POST" ACTION="{URL_AJOUT_NOTE}">
<INPUT TYPE=HIDDEN NAME=POS_NUM_DOC VALUE="{POS_NUM_DOC}">
<INPUT TYPE=HIDDEN NAME=POS_NUM_PAGE VALUE="{POS_NUM_PAGE}">
<INPUT TYPE=HIDDEN NAME=POS_NUM_SSPAGE VALUE="{POS_NUM_SSPAGE}">

<TABLE align=center cellspacing="0" cellpadding=2 border="1"> 
<TR>
	<TD>
		<TABLE align=center cellspacing="0" cellpadding=2 border="0">	
		<TR>
			<TD CLASS=labelChamp>Libellé</TD>
			<TD><INPUT TYPE=TEXT class="inputChamp" NAME=POS_NOTE_LIBELLE SIZE="40"></TD>
		</TR>
		<TR>
			<TD CLASS=labelChamp>Texte</TD>
			<TD><TEXTAREA class="inputChamp" NAME=POS_NOTE_TEXTE ROWS="3" COLS="40"></TEXTAREA></TD>
		</TR>
		<TR>
			<TD CLASS=labelChamp>Partage<INPUT type=checkbox name=POS_NOTE_PARTAGE value=1></TD>
			<TD align=center>
				<INPUT TYPE=submit class=bouton_sub VALUE="Enregistrer">
				<INPUT TYPE=BUTTON class=bouton VALUE="Annuler" onClick="javascript:history.back(1);">
			</TD>
		</TR>
		</TABLE>
	</TD>
</TR>
</TABLE>
</FORM>

</BODY>
</HTML>
