<HTML>
<HEAD>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript">
function remplis_zones(select_value)
{
	var zone_retour="{ZONE_RETOUR}";
	parent.recherche.document.principal.{ZONE_RETOUR}.value=select_value;
	parent.recherche.visu_zone(parent.recherche.document.principal.{ZONE_RETOUR});
	parent.recherche.affiche_cle(parent.recherche.document.principal.VISU_K_H.value);
}
</SCRIPT>
</HEAD>
<BODY>
<FORM NAME=principal>

<FONT CLASS=labelChamp>{LIBELLE_VOCABULAIRE}</FONT>
<BR>
<SELECT class="inputChamp" NAME=VOCAB_ZONE SIZE=6 style="width:100%" onChange="remplis_zones(this.options[this.selectedIndex].value)">
<!-- BEGIN BLOC_VOCABULAIRE -->
<OPTION VALUE="{VOCAB}">{VOCAB}</OPTION>
<!-- END BLOC_VOCABULAIRE -->
</SELECT>

</FORM>

</BODY>
</HTML>
