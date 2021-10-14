<!--<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">-->
<html> 
<head>
<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
<SCRIPT language="javascript">

function onModelAction(action) {
	
	var selectedIndex = 0;
	var szMsg;
	
	var szaction = action;
	
	if (szaction == "modifier") {
		selectedIndex = document.principal.MODELE.options.selectedIndex;
		szMsg = "{NO_MODELE_SELECTIONNE}";
	}
	else { 
		selectedIndex = document.principal.DOCUMENT.options.selectedIndex;
		szMsg = "{NO_TYPEDOC_SELECTIONNE}";
	}
		
	if (selectedIndex > 0) {
		document.principal.POS_TYPE_ACTION.value=szaction;
		document.principal.submit();
		}
	else
		alert(szMsg);		
}

</SCRIPT>
</head>
  
<body topmargin="10">
<h1 align = "center">{TITRE_PAGE}</h1>
<FORM NAME="principal" action="/{NOM_APPLICATION}/interface/session/principal/redaction_web/creer_modele.php">
<INPUT TYPE=HIDDEN NAME="POS_TYPE_ACTION" VALUE="">
<br>
<table class="tdfond" align="center" border="1" width="705" cellpadding="2" cellspacing="0">	
<tr>
	<td align="center" class="tableau">{MODIFICATION_MODELE}</td>
</tr>
<tr>
	<td align="center">
		<table>
		<tr>
			<td align="center">{MODELES_PREEXISTANT}</td>
		</tr>
		<tr>	
			<td align="center">		
		   		<SELECT class="inputChamp" NAME="MODELE" SIZE="10">
		   		   	<OPTION VALUE="">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 			</OPTION>
			    	<!-- BEGIN LISTE_MODELE -->
					<OPTION VALUE="{NOM_MODELE}"> {NOM_MODELE} </OPTION>
			    	<!-- END LISTE_MODELE -->
		    	</SELECT>
			</td>	
		</tr>
		<tr>
			<td align="center">
			<INPUT class="bouton" TYPE="BUTTON" VALUE="{MODIFIER_MODELE}" onClick='onModelAction("modifier")'>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
<br>
<br>
<HR align="center" width="28%">
<br>
<br>
<table class="tdfond" align="center" border="1" width="705" cellpadding="2" cellspacing="0">
<tr>
	<td  align="center" class="tableau">{CREATION_MODELE}</td>
</tr>
<tr>
	<td align="center">
		<table>
		<tr>
			<td align="center">{TYPES_DOCUMENT}</td>
		</tr>
		<tr>	
			<td align="center">
					<SELECT class="inputChamp" NAME="DOCUMENT" SIZE="10">
		   		   	<OPTION VALUE="">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		 			</OPTION>
			    	<!-- BEGIN LISTE_TYPE_DOCUMENT -->
					<OPTION VALUE="{CODE_DOCUMENT}"> {LIBELLE_DOCUMENT} </OPTION>
			    	<!-- END LISTE_TYPE_DOCUMENT -->
		    	</SELECT>
			</td>	
		</tr>
		<tr>
			<td align="center">
				<INPUT class="bouton" TYPE="BUTTON" VALUE="{CREER_MODELE}" onClick='onModelAction("creer")'>	 
			 </td>
		</tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>
