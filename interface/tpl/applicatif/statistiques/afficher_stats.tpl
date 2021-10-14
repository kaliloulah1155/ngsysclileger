<HTML>
<HEAD>
    <LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
    <TITLE>Statistiques</TITLE>
</HEAD>
<BODY>
<br>
<TABLE border="1" align=center CELLPADDING=3 CELLSPACING=0>
    <TR>
        <TH CLASS='titrePage'>{LIBELLE_QUESTION}</TH>
        <TH CLASS='titrePage'>Nombre</TH>
        <TH CLASS='titrePage'>%</TH>
    </TR>

<!-- BEGIN BLOC_LIGNE_STAT -->
    <TR>
        <TD>{LIGNE_VALEUR}</TD>
        <TD>{LIGNE_NOMBRE}</TD>
        <TD>{LIGNE_POURCENT}</TD>
    </TR>
<!-- END BLOC_LIGNE_STAT -->
    <TR>
        <TD><B>Total</B></TD>
        <TD><B>{LIGNE_TOTAL_NOMBRE}</B></TD>
        <TD><B>100 %</B></TD>
    </TR>
</TABLE>

<br><br>
<center>
<FORM>
<INPUT class=bouton TYPE="BUTTON" VALUE="Imprimer" onClick='javascript:print()'>
<INPUT class=bouton TYPE="BUTTON" VALUE="Fermer" onClick='javascript:history.back()'>
</FORM>
</center>
</BODY>
<HTML>

