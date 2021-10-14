<div style="overflow: auto; max-height: 150px;">
<!-- BEGIN GROUPE_BAL -->
<!-- BEGIN TITRE_GROUPE -->
<span class="groupbal"><br><img id="image_fermeture_group_{ICPTGROUP}" src="/{NOM_APPLICATION}/images/icons/{ICONE_ARBRE_PLUS_MOINS}_bal.gif" onClick="javascript:afficheMasqueGroupe('{ICPTGROUP}');">
<!-- BEGIN TITRE_ONLY_GROUPE -->
{ICONE_GROUPE} <span style="{STYLE_BAL}">{POS_BAL_TITRE_GROUPE} </span>
<!-- END TITRE_ONLY_GROUPE -->
<!-- BEGIN TITRE_BAL_GROUPE -->
<A HREF="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');"><IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}" border="0"></A>
<A class="groupbal" HREF="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');" TITLE="{POS_BAL_LIBELLE_COMMENT}">{POS_BAL_LIBELLE}</A>
<span width=30 id="bal{ICPTBAL}"><A HREF="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');">({POS_BAL_NB_REP})</A></span>
<!-- END TITRE_BAL_GROUPE -->
</span>
<br>
<!-- END TITRE_GROUPE -->
<table border='0' cellpadding="2" cellspacing="0" id='group_bal_{ICPTGROUP}' style="display:{DISPLAY_GROUPE_OUVERT}" class='table_groupe_isgroup_{GROUP_ON}'>
<!-- BEGIN BAL -->
<tr>
    <td id="td_bal{ICPTBAL}">
        <A HREF="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');"><IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}" border="0"></A>
		<span width=30 id="bal{ICPTBAL}"><A HREF="{POS_BAL_EXTERNE_LIEN});"  target="_blank">({POS_BAL_NB_REP})</A></span>
		<A style="{STYLE_BAL}" HREF="{POS_BAL_EXTERNE_LIEN}" target="_blank" TITLE="{POS_BAL_LIBELLE_COMMENT}">{POS_BAL_LIBELLE}</A>
    </td>
</tr>
<!-- END BAL -->
</table>
<!-- END GROUPE_BAL -->
</div>
