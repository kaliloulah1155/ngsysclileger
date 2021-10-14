<HTML>
<HEAD>
</HEAD>
<BODY topmargin="5" leftmargin="5">
<input type="hidden" name="NB_ELTS_TAB_{CODE_RUB_TABLEAU}" VALUE="{NB_REPONSE}">
<input type="hidden" name="DROITS_MOD_SUP_CRE_{CODE_RUB_TABLEAU}" VALUE="{DROIT_MODIF}{DROIT_SUP}{DROIT_CRE}">
<input type="hidden" name="HERM_DROITS_{CODE_RUB_TABLEAU}" VALUE="{HERM_DROITS}">
<TABLE id="table_tableau_{CODE_RUB_TABLEAU}" width="98%" class="rubriquetableau">
<TR>
	<th width="80px" class="rubriquetableau">&nbsp;</TD>
	<!-- BEGIN ENTETE -->
	<th class="rubriquetableau" style="text-align: center;">&nbsp;{TITRE_COLONNE}</TD>
	<!-- END ENTETE -->
</TR>
<!-- BEGIN LISTE_REPONSES -->

<TR class="ligne_tableau" data-line="pair" id="ligne_tab_{CODE_RUB_TABLEAU}_{NUM_ELEMENT}">
	<TD width="95px" class="rubriquetableau" style="text-align: left">&nbsp;		
        <a href="javascript:void(0)" id="consulter_{CODE_RUB_TABLEAU}_{NUM_ELEMENT}" style="display:{DISPLAY_CONSULTER}" onClick="onConsulter('{INFO_LIEE}','{CODE_RUB_TABLEAU}')" title="{CST_LIBELLE_CONSULT}"><img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_consulter.gif"></a>
		<a href="javascript:void(0)" id="modifier_{CODE_RUB_TABLEAU}_{NUM_ELEMENT}" style="display:{DISPLAY_MODIFIER}"  onClick="onModifier('{INFO_LIEE}','{CODE_RUB_TABLEAU}')" title="{CST_LIBELLE_MODIF}"><img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_modifier.gif"></a>
        <a href="javascript:void(0)" id="supprimer_{CODE_RUB_TABLEAU}_{NUM_ELEMENT}" style="display:{DISPLAY_SUPPRIMER}" onClick="onSupprimer('{INFO_LIEE}','{CODE_RUB_TABLEAU}')" title="{CST_LIBELLE_SUPP}"><img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_supprimer.gif"></a>
    	<a href="javascript:void(0)" id="creer_{CODE_RUB_TABLEAU}_{NUM_ELEMENT}" style="display:{DISPLAY_CREER}"     onClick="onCreer('{INFO_LIEE}','{CODE_RUB_TABLEAU}')" title="{CST_LIBELLE_AJOUTER}"><img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_ajouter.gif"></a>
    </TD>
	<!-- BEGIN LR_REPONSE -->
	<TD class="rubriquetableau" style="text-align: {ZONE_ALIGN_LR};">{ZONE_LR}</TD>
	<!-- END LR_REPONSE -->
</TR>
<!-- END LISTE_REPONSES -->
</TABLE>
</BODY>
</HTML>