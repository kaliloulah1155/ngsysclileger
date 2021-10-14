<html>
<head>
<title>{LIB_CREATION_SITE}</title>
<link REL="stylesheet" TYPE="text/css" href="../../../../include/style/style.css">
<script>
function initEcran()
{
}
</script>
</head>
<BODY onLoad='javascript:initEcran();'>
<form name="principal" action="../application/valider_cst.php" method="post">

<TABLE align="center" cellspacing="2">
	<tr>
        <td valign='top' align='center'>
            <div class='groupe' style='margin:1em 1em 1em 1em'>
				<p class='groupe'>								 														 														 														
					<span class='groupe'>{LIBELLE_PARAM_SITE}</span>													 													 													
				</p>
                <table class='groupe' cellspacing="2" border='0'>
                    <!-- BEGIN CONSTANTE -->
                    <tr>
                    	<td class='labelChamp'>{CST_TITRE}</td>
                        <td class='labelChamp'>
                    	<input type='text' name="{CST_NAME}" VALUE="{CST_VALUE}">
                    	</td>
                    </tr>
                    <!-- END CONSTANTE -->
                </table>  
            </div>
		</td>
	</tr>
</table>
<table ALIGN="CENTER">
<tr>
    <td><input type="submit" class="bouton_sub" VALUE="{LIBELLE_VALIDER}"></td>
    <td><input type="button" class="bouton" VALUE="{LIBELLE_ANNULER}" onClick='window.close();'></td>
</tr>
</table>
</form>
</body>
</html>
