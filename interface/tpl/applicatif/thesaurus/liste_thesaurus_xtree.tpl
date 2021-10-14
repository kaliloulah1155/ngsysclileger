<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">

	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_thesaurus.js"></SCRIPT>
    <SCRIPT language="javascript">
    
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifier_thesaurus()";
    
    function initEcranGestionThesaurus()
    {
        affiche_boutons();
        parent.setTitle();
    }
    </SCRIPT>
</head>
<body topmargin="10" leftmargin="10" onLoad="initEcranGestionThesaurus();">
<h1 align = "center">{TITRE_PAGE}</h1>
<table role='presentation' align="center" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
		<form NAME=principal>
		<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_THESAURUS}">
		<input TYPE=hidden NAME=DROIT_ADMIN_THESAURUS VALUE="{DROIT_ADMIN_THESAURUS}">
		<input TYPE=hidden NAME=MESSAGE_NO_ADMIN_THESAURUS VALUE="{LIBELLE_NO_ADMIN_THESAURUS}">
		<table role='presentation' align="center" width="750px" cellpadding="0" cellspacing="5">
		<tr>
		    <td class="tdfond">
				<table role='presentation' class="tdfond" width="705px" cellpadding="2" cellspacing="1">
					<tr>
						<td class="tableau" width="730px">{CST_TITRE_TABLEAU_ALL_THESAURUS}</td>
					</tr>
				</table>
				<div style="height: 200px; width=730px; overflow-x : hidden; overflow-y: auto;">
					<table role='presentation' class="tdfond" width="705px" cellpadding="2" cellspacing="1">
			<!-- BEGIN BLOC_THESAURUS -->
						<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" onclick="selectLigne(event, this, '{POS_IDENT_THESAURUS}');">
							<td data-menu="no" class="tdnormal" width="20px" align="center" width="5%">
                            <input data-menu="no" TYPE="RADIO" NAME="IDENT_THESAURUS" VALUE="{POS_IDENT_THESAURUS}"></td>
							<td class="tdnormal" width="500px">{POS_TYPETHE}&nbsp;:&nbsp;{POS_LIBELLETHE}</td>	
						</tr>
			<!-- END BLOC_THESAURUS -->
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
		</tr>
		<tr>
			<td align="center">
			<SCRIPT language="javascript">              
			document.write("<DIV id='bouton'></DIV>");
			</SCRIPT>
			</td>
		</tr>
		</table>
		</form>
	</td>
</tr>
</table>
</body>
</html>    
