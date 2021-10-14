<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
<title>{TITRE_PAGE}</title>
<LINK rel="STYLESHEET" type="text/css" href="/{NOM_APPLICATION}/include/style/style.css">
<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/gestionbib.css">
<script>
function initEcran()
{
    parent.setTitle(); 
}
</script>
</HEAD>
<BODY  onLoad='javascript:initEcran();'>
<H1 align = "center">{TITRE_PAGE}</h1>
<table align="center"  width="80%">
<tr>
    <td class="tdfond">
    	<table class="tdfond" align="left" cellpadding="2" cellspacing="1" width="100%">
	       <tr>
            	<!-- BEGIN ENTETE -->
                <th class="tableau">{TITRE_COLONNE}</th>
                <!-- END ENTETE -->
            </tr>
            <!-- BEGIN LISTE_REPONSES -->
            <tr class="line-bib" data-line="{PAIR_OU_IMPAIR}">
				<!-- BEGIN LR_REPONSE -->
                <td class="tdnormal"  NOWRAP>	{ZONE_LR}&nbsp; </td>
                <!-- END LR_REPONSE -->
            </tr>
                <!-- END LISTE_REPONSES -->
         </table>
    </td>
</tr>
</table>
</BODY>
</HTML>