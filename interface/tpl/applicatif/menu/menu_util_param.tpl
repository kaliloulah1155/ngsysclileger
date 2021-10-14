<HTML>
<HEAD>
<TITLE>Menu paramétrage</TITLE>
<link href="../../../../include/style/style.css" type="text/css" rel="STYLESHEET"/>
<SCRIPT SRC="../../../../configuration/constantes.js" language="JavaScript"></SCRIPT>
<SCRIPT language='JavaScript' SRC='../../../../include/script/menu_util.js'></SCRIPT>
</HEAD>
<BODY onLoad="initialise_img();" class="fond_menu">
<br>
<TABLE width="95%" align="CENTER">
<TR>
<TD class="blocmenu">
<TABLE cellspacing="0" cellpadding="0" width="100%" class="blocmenu">
<TR>
<TD>
<TABLE cellspacing="0" width="100%">
<TR>
<TH class="titremenucolonne">{CST_LIBELLE_TOOLBAR_BLOC_PARAMETRAGE}</TH>
</TR>
<!-- BEGIN BLOC_GESTION_LR -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_ges_profil','{URL_AFFICHE_GEST_PROFIL_LR}')" onMouseOver="roll_img('pplr_10')" onMouseOut="normal_img('pplr_10');" onMouseDown="initialise_img('pplr_10');">
<IMG name="pplr_10" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_PROFIL}</a>
</TD>
</TR>
<!-- END BLOC_GESTION_LR -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_AFFICHER_CHANGER_PWD}')" onMouseOver="roll_img('Password_19')" onMouseOut="normal_img('Password_19');" onMouseDown="initialise_img('Password_19');">
<IMG name="Password_19" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_PASSWORD}</a>
</TD>
</TR>
</TABLE>
</TD>
</TR>
</TABLE>
</TD>
</TR>

<!-- BEGIN BLOC_ADMIN -->
<tr>
<td>
<br/>
</td>
</tr>
<TR>
<TD class="blocmenu">
<TABLE cellspacing="0" cellpadding="0" width="100%" class="blocmenu">
<TR>
<TD>
<TABLE cellspacing="0" width="100%">
<TR>
<TH class="titremenucolonne">{CST_LIBELLE_TOOLBAR_BLOC_ADMIN}</TH>
</TR>
<!-- BEGIN BLOC_ADMIN_UTILISATEUR -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_ges_profil','{URL_AFFICHE_UTILISATEUR}')" onMouseOver="roll_img('users_1')" onMouseOut="normal_img('users_1');" onMouseDown="initialise_img('users_1');">
<IMG name="users_1" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_UTIL}</a>
</TD>
</TR>
<!-- END BLOC_ADMIN_UTILISATEUR -->
<!-- BEGIN BLOC_ADMIN_DOMAINE_FERME -->				
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_LIST_RUB_DOMFERME}')" onMouseOver="roll_img('dom_ferme_1')" onMouseOut="normal_img('dom_ferme_1');" onMouseDown="initialise_img('dom_ferme_1');">
<IMG name="dom_ferme_1" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_DOMAIN}</a>
</TD>
</TR>
<!-- END BLOC_ADMIN_DOMAINE_FERME -->
<!-- BEGIN BLOC_ADMIN_LISTE_HIER -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_LIST_LISTHIER}')" onMouseOver="roll_img('listehier_1')" onMouseOut="normal_img('listehier_1');" onMouseDown="initialise_img('listehier_1');">
<IMG name="listehier_1" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_LISTHIER}</a>
</TD>
</TR>
<!-- END BLOC_ADMIN_LISTE_HIER -->
<!-- BEGIN BLOC_ADMIN_THESAURUS -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_LIST_THESAURUS}')" onMouseOver="roll_img('thesaurus_1')" onMouseOut="normal_img('thesaurus_1');" onMouseDown="initialise_img('thesaurus_1');">
<IMG name="thesaurus_1" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_THESAURUS}</a>
</TD>
</TR>
<!-- END BLOC_ADMIN_THESAURUS -->
<!-- BEGIN BLOC_ADMINISTRATION -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_AFFICHE_PROFIL_UTILISATEUR}')" onMouseOver="roll_img('profilutil_3')" onMouseOut="normal_img('profilutil_3');" onMouseDown="initialise_img('profilutil_3');">
<IMG name="profilutil_3" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_PROFIL_UTIL}</a>
</TD>
</TR>
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_AFFICHE_LIST_PROFILHIER}')" onMouseOver="roll_img('thesaurus_2')" onMouseOut="normal_img('thesaurus_2');" onMouseDown="initialise_img('thesaurus_2');">
<IMG name="thesaurus_2" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_PROFIL_HIER}</a>
</TD>
</TR>
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_LIST_NATURE}')" onMouseOver="roll_img('dom_ferme_2')" onMouseOut="normal_img('dom_ferme_2');" onMouseDown="initialise_img('dom_ferme_2');">
<IMG name="dom_ferme_2" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_NATURE}</a>
</TD>
</TR>
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_AFFICHE_CONNEXION}')" onMouseOver="roll_img('users_2')" onMouseOut="normal_img('users_2');" onMouseDown="initialise_img('users_2');">
<IMG name="users_2" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_SESS_UTIL}</a>
</TD>
</TR>
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_AFFICHE_DOC_EN_MODIFICATION}')" onMouseOver="roll_img('pplr_11')" onMouseOut="normal_img('pplr_11');" onMouseDown="initialise_img('pplr_11');">
<IMG name="pplr_11" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_GEST_DOC_EN_MODIF}</a>
</TD>
</TR>
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_STAT_ADMIN}')" onMouseOver="roll_img('stat_1')" onMouseOut="normal_img('stat_1');" onMouseDown="initialise_img('stat_1');">
<IMG name="stat_1" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_STAT_ADMIN}</a>
</TD>
</TR>
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_LIST_RUBRIQUE}')" onMouseOver="roll_img('rubriques_4')" onMouseOut="normal_img('rubriques_4');" onMouseDown="initialise_img('rubriques_4');">
<IMG name="rubriques_4" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_RUBRIQUES}</a>
</TD>
</TR>
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('lien_param','{URL_LIST_TYPEDOC}')" onMouseOver="roll_img('types_3')" onMouseOut="normal_img('types_3');" onMouseDown="initialise_img('types_3');">
<IMG name="types_3" border="0" height="18" width="18"/>&nbsp;{CST_LIBELLE_TOOLBAR_TYPES_DOC}</a>
</TD>
</TR>
<!-- END BLOC_ADMINISTRATION -->
</TABLE>
</TD>
</TR>
</TABLE>
</TD>
</TR>
<!-- END BLOC_ADMIN -->

<!-- BEGIN BLOC_CHANGE_PROFIL -->
<tr>
<td>
<br/>
</td>
</tr>
<TR>
<TD class="blocmenu">
<TABLE cellspacing="0" cellpadding="0" width="100%" class="blocmenu">
<TR>
<TD>
<TABLE cellspacing="0" width="100%">
<TR>
<TH class="titremenucolonne">{LIBELLE_TITRE_ACCES_PROFIL_COURT}</TH>
</TR>
<!-- BEGIN LISTE_PROFIL -->
<TR>
<TD class="tdmenu">
<a href="javascript:void(0)" onClick="javascript:affichePage('changeprofil','../../../../interface/session/principal/connexion/changer_profil.php?POS_PROFIL={CODE_PROFIL}')" onMouseOver="roll_img('changeprofil_{CPT}')" onMouseOut="normal_img('changeprofil_{CPT}');" onMouseDown="initialise_img('changeprofil_{CPT}');">
<IMG name="changeprofil_{CPT}" border="0" height="18" width="18"/>&nbsp;{LIBELLE_ACCES_PROFIL_COURT}&nbsp;{LIBELLE_PROFIL}</a>
</TD>
</TR>
<!-- END LISTE_PROFIL -->
</TABLE>
</TD>
</TR>
</TABLE>
</TD>
</TR>
<!-- END BLOC_CHANGE_PROFIL -->
</TABLE>
</BODY>
</HTML>
