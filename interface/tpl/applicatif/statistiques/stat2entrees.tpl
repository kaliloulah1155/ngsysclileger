<HTML>
<HEAD>
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<span class=titreAccueil> {TITRE_QUESTION}</span>
{LIBELLE_RUBRIQUE_COLONNE}/{LIBELLE_RUBRIQUE_LIGNE}
<TABLE border=0 cellpadding=0 cellspacing=5 width="100%">
<TR>
	<TD class="titrepage">
    <TABLE {BORDER} align=left cellpadding=2 cellspacing=0  width="100%">
    	<TR>
        	<TH class="titrecolonne"></TH>
        	<!-- BEGIN ENTETE -->
        	<TH class="titrecolonne">{TITRE_COLONNE}</TH>
        	<!-- END ENTETE -->
			<TD>Total</TD>
	        <TD>En %</TD>

    	</TR>
       
        <!-- BEGIN LISTE_REPONSES -->
        <TR>
	        <TD>{TITRE_LIGNE}</TD>
			<!-- BEGIN LR_REPONSE -->
	        <TD class="listeResumee">{NB_REPONSES}&nbsp;</TD>
	        <!-- END LR_REPONSE -->
	        <TD>{TOTAL_LIGNE}</TD>
	        <TD>{POURCENT_LIGNE}</TD>
        </TR>
        <!-- END LISTE_REPONSES -->

		<TR>
        	<TH class="titrecolonne"></TH>
           	<!-- BEGIN TOTAL_COLONNE -->
        	<TH class="titrecolonne">{TITRE_COLONNE}</TH>
        	<!-- END TOTAL_COLONNE -->
        </TR>
		<TR>
        	<TH class="titrecolonne"></TH>
           	<!-- BEGIN TOTAL_COLONNE -->
        	<TH class="titrecolonne">{TITRE_COLONNE}</TH>
        	<!-- END TOTAL_COLONNE -->
        </TR>
	</TABLE>
    </TD>
</TR>
</TABLE>
</FORM>
</BODY>
</HTML>

