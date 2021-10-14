<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
    <LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
    <TITLE>Statistiques</TITLE>
</HEAD>
<BODY>
<BR>
<H1 align=center>Statistiques {LIBELLE_QUESTION}</h1>
<br>
<TABLE class='titresonglet' CELLSPACING="0" border="1" align=center>
<!--TABLE border="1" align=center CELLPADDING=3 CELLSPACING=0-->
    <TR>
        <TH CLASS='titrepage'>{LIBELLE_RUBRIQUE}</TH>
        <TH CLASS='titrepage'>Nombre</TH>
        <TH CLASS='titrepage'>%</TH>
        <TH CLASS='titrepage'>Histogramme</TH>
    </TR>

<!-- BEGIN BLOC_LIGNE_STAT -->
    <TR>
        <TD>{LIGNE_VALEUR}</TD>
        <TD style='text-align: right;'>{LIGNE_NOMBRE}</TD>
        <TD style='text-align: right;'>{LIGNE_POURCENT}</TD>
        <TD><img src="/{NOM_APPLICATION}/images/icons/pixciel.gif" border='0' height='10' width='{LIGNE_POURCENT}'></TD>
    </TR>
<!-- END BLOC_LIGNE_STAT -->
    <TR>
        <TD class=labelObligatoire>Total</TD>
        <TD class=labelObligatoire>{LIGNE_TOTAL_NOMBRE}</TD>
        <TD class=labelObligatoire>100 %</TD>
        <TD>&nbsp;</TD>
    </TR>
</TABLE>

<br><br>
<center>
<FORM>
<INPUT class=bouton TYPE="BUTTON" VALUE="Imprimer" onClick='javascript:print()'>
<INPUT class=bouton TYPE="BUTTON" VALUE="Fermer" onClick="document.location.href='../../../../interface/tpl/applicatif/statistiques/accueil.html'">
</FORM>
</center>
</BODY>
<HTML>

