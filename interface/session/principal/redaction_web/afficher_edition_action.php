<?php
if (!defined("URL_SITE"))
{
	include ("../../../../configuration_w/constantesPHP.conf.php");
}
?>
<html>
	<head>
	<link rel="stylesheet" type="text/css" href="<?php echo URL_SITE;?>/include/style/style.css">
	<script language="javascript">
	function transmettreEdition()
	{
        //parent.frames.edition_vue.document.principal.action = "<?php echo URL_SITE;?>/interface/session/principal/attente/attente.php";
        //parent.frames.edition_vue.document.principal.URL.value = "<?php echo URL_SITE;?>/redaction_web/enregistrer_edition.php";
        parent.frames.edition_vue.document.principal.action = "../redaction_web/enregistrer_edition.php?POS_NUM_PAGE=<?php echo $_REQUEST["POS_NUM_PAGE"];?>";
		if (parent.frames.edition_vue.beforeSubmitEdition())
		parent.frames.edition_vue.document.principal.submit();
	}
	
	function retournerIndex()
	{
	    // le document n'est pas modifié ou l'utilisateur accepte de perdre ses modifications
	    if (typeof(parent.frames.edition_vue.isDocumentModifie) == "undefined" || !parent.frames.edition_vue.isDocumentModifie() ||
            (parent.frames.edition_vue.isDocumentModifie() && confirm("Vous allez perdre vos modifications. Voulez-vous poursuivre ?") ))
            parent.location.href = "../consultation/consulter_index.php?MODE=MODIFICATION&POS_NUM_DOC=<?php echo $_REQUEST["POS_NUM_DOC"];?>";
	}
	
	function convertirEnPdf()
	{
	   if (!parent.frames.edition_vue.isDocumentModifie() || 
            (parent.frames.edition_vue.isDocumentModifie() && confirm("Vos modifications ne seront pas prises en compte. Voulez-vous poursuivre ?") ))
        {
            var szNumDoc= parent.frames.edition_vue.document.principal.POS_NUM_DOC.value;
            var szModeleHtml= parent.frames.edition_vue.document.principal.MODELE_HTML.value;
            parent.location.href = "../redaction_web/convertir_en_pdf.php?POS_NUM_DOC=<?php echo $_REQUEST["POS_NUM_DOC"];?>&POS_NUM_PAGE=<?php echo $_REQUEST["POS_NUM_PAGE"];?>"  + "&MODELE_HTML=" + szModeleHtml;
        } 
	}
	</script>
	</head>
	<body>
		<table>
			<tr>
				<td>
					<a title="Retour à la fiche" href="javascript:retournerIndex()"><IMG SRC="../../../../images/redaction_web/bleug.gif" border=0></a>
				</td>
				<td>
					<a title="Enregistrer" href="javascript:transmettreEdition()"><IMG SRC="../../../../images/redaction_web/save.gif" border="0"></a>
				</td>
				<td>
					<a title="PDF" href="javascript:convertirEnPdf()"><IMG SRC="../../../../images/redaction_web/pdf.gif" border="0"></a>
				</td>
			</tr>
		</table>
    </body>
</html>
