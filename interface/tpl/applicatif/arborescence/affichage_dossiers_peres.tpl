<HTML>
<HEAD>
<TITLE>{LIBELLE_DOSSIER_PERES}</TITLE>
<LINK rel=STYLESHEET type=text/css href=/{NOM_APPLICATION}/include/style/style.css>
<SCRIPT language="javascript" SRC="../../../../configuration/constantes.js"></SCRIPT>
<script>
function garderEnReponse(iNumDossier, typeHisto)
{
    var szUrl;
    if(CST_TYPE_APPLI == 1)
		szUrl = "garder_en_reponse_dossiers_peres.php?";
    else if (CST_TYPE_APPLI == 2)
        szUrl = "../../../../servlet/interface/session/principal/dossier.GarderEnReponseDossiersPeres?";
    szUrl += "POS_NUM_DOC=" + document.principal.POS_NUM_DOC.value;
    szUrl += "&NUM_DOS_ADDHISTO=" + iNumDossier;
    szUrl += "&TYPE_HISTO=" + typeHisto;
    document.location.href = szUrl; 
}
</script>
</HEAD>

<BODY leftmargin="20" >
<form NAME="principal">
<INPUT TYPE="HIDDEN" NAME="POS_NUM_DOC" VALUE="{POS_NUM_DOC}">
</form>
<TABLE width="100%" style='border: 1px solid #aaaaaa;' cellspacing='0' cellpadding='0'>
<TR>
<TH class='titrecolonne'>{LIBELLE_DOSSIER_PERES}</TH>
</TR>
<!-- BEGIN LISTE_CHEMIN -->
<TR>
<TD class='labelChamp'>
    <TABLE width="100%" border='0'>
    <!-- BEGIN LISTE_DOSSIER_CHEMIN -->
    <TR>
    <!-- BEGIN BLOC_REPRODUIT_INV_NUM_NIVEAU -->
    <TD>&nbsp;</TD>
    <!-- END BLOC_REPRODUIT_INV_NUM_NIVEAU -->
    <TD colspan='{INV_NUM_NIVEAU}'>
    &nbsp;<img src='/{NOM_APPLICATION}/images/menu/win/folderopen_sans_marge.gif' border='0' valign='bottom'>
    {NOM_DOSSIER}
    <img src='/{NOM_APPLICATION}/images/menu/win/histor.gif' border='0' valign='bottom' title="{LIBELLE_GARDER_EN_REPONSE_HISTO_DOC}" onClick="javascript:garderEnReponse('{NUM_DOSSIER}', 'HISTO_DOC');">
    <img src='/{NOM_APPLICATION}/images/menu/win/recher.gif' border='0' valign='bottom' title="{LIBELLE_GARDER_EN_REPONSE_HISTO_QUEST}" onClick="javascript:garderEnReponse('{NUM_DOSSIER}', 'HISTO_QUEST');">
    </TD>
    </TR>
    <!-- END LISTE_DOSSIER_CHEMIN -->
    </TABLE>
    <hr/>
</TD>
</TR>
<!-- END LISTE_CHEMIN -->
<TR><TD NOWRAP> {MESS_PAS_DE_DOSSIER} </TD></TR> </TABLE>

<BR>
</BODY>
</HTML>

