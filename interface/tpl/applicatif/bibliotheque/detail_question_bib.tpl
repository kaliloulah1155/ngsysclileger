<HTML>
<HEAD>
	<TITLE>{CST_LIBELLE_FENETRE_DETAIL_QUEST_BIB} "{LIBELLE_QUESTION}"</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
</HEAD>

<BODY>
<h1>{CST_LIBELLE_FENETRE_DETAIL_QUEST_BIB} "{LIBELLE_QUESTION}"</h1>
<p>
{POS_LIB_NB_LOCUTIONS}
</p>
<TABLE cellpadding="0" cellspacing="5" width="100%">
<TR>
        <TD class="tdfond">
        	<TABLE align="left" cellpadding="2" cellspacing="0" width="100%">
            <TR>
            	<TD class="tableau" nowrap align="center">(</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_LIEN}</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_TYPE}</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_RUBRIQUE}</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_COLONNE}</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_OPERATEUR}</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_VALEUR1}</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_VALEUR2}</TH>
            	<TD class="tableau" nowrap align="center">)</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_THESAURUS}</TH>
            	<TD class="tableau" nowrap>{POS_LIB_ENTETE_LIEN_MULTI}</TH>
			</TR>
			<!-- BEGIN LOCUTION -->
			<TR>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_PAR_OUV}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_LIEN}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_TYPE}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_RUB}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_COL}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_OPE}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_VAL1}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_VAL2}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_PAR_FER}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_THE}&nbsp;</TD>
				<TD class="tdnormal" align="left" nowrap>{POS_BIB_LIEN_MULTI}&nbsp;</TD>
			</TR>
			<!-- END LOCUTION -->
			</TABLE>
        </TD>
</TR>
</TABLE>

<TABLE border=0 cellpadding="0" cellspacing="5" width="100%">
<TR>
<TD align="right"><FORM><INPUT TYPE="BUTTON" class="bouton" VALUE="{LIBELLE_FERMER}" onClick="parent.parent.closeFileModif();"></FORM></TD>
</TR>
</TABLE>

</FORM>
</BODY>
</HTML>