<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_listhier.js"></SCRIPT>
    <SCRIPT language="javascript">
    
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
    
    sitems[i]="{LIBELLE_AJOUTER}";
    sitemlinks[i++]="RenseignerInfosListeHier()";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifier_listhier()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimer_listhier()";
    
    function initEcranGestionListeHier()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_rub_hier');
    }
    </SCRIPT>
</head>
<body onLoad="initEcranGestionListeHier();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_LISTHIER}">
<input TYPE=hidden NAME=DROIT_ADMIN_LISTHIER VALUE="{DROIT_ADMIN_LISTHIER}">
<input TYPE=hidden NAME=MESSAGE_NO_ADMIN_LISTHIER VALUE="{LIBELLE_NO_ADMIN_LISTHIER}">
<input TYPE=hidden NAME=CST_MESSAGE_SUPP_LISTEHIER VALUE="{CST_MESSAGE_SUPP_LISTEHIER}">
<table id='table_liste_rub_hier' class='posdtable' style='width:100%;'>
<thead>
	<tr>
        <th class="tableau"></th>
		<th class="tableau">{LIBELLE_CODE_LISTHIER}</th>
		<th class="tableau">{LIBELLE_LIBELLE_LISTHIER}</th>
	</tr>
</thead>
<tbody>
<!-- BEGIN BLOC_LISTHIER -->
	<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_IDENT_LISTHIER}'>
		<td data-menu="no" class="tdnormal" width="20px" align="center" width="5%">
            <input data-menu="no" TYPE="RADIO" NAME="IDENT_LISTHIER" VALUE="{POS_IDENT_LISTHIER}"></td>
		<td class="tdnormal">{POS_CODE_LISTHIER}</td>
		<td class="tdnormal">{POS_LIBELLE_LISTHIER}</td>	
	</tr>
<!-- END BLOC_LISTHIER -->
</tbody>
</table>

<center>
<br><br>
	<SCRIPT language="javascript">              
	document.write("<DIV id='bouton'></DIV>");
	</SCRIPT>
</center>
<br><br>		
<table role='presentation' id="infos_listehier" style="display:none;" align="center" border="0" cellpadding="0" cellspacing="0">
<tr align="center">
	<td>
		<table role='presentation' border="1" cellpadding="5" frame="border" rules="groups">
			<thead>
			<tr>
				<th colspan="4" align="center">{LIBELLE_NOUVELLE_LISTEHIER}</th>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td class="labelChamp">{LIBELLE_CODE_NEW_LISTEHIER}</td>
				<td>
      				<input type="text" class="inputChamp" size="3" maxlength="3" name="POS_CODE_NEW_LISTHIER" style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();" value="">
  				</td>
				<td class="labelChamp">{LIBELLE_LIBELLE_NEW_LISTEHIER}</td>
				<td>
      				<input type="text" class="inputChamp" size="25" maxlength="40" name="POS_LIBELLE_NEW_LISTHIER" value="">
  				</td>	
			</tr>
			<tr>
				<td align="center" colspan="4">
					<input class="bouton" type="button" onClick="AjouterListeHier();" value="{LIBELLE_VALIDER}">
					
					<input class="bouton" type="button" onClick="document.getElementById('infos_listehier').style.display='none';" value="{LIBELLE_ANNULER}">
				</td>	
			</tr>
			</tbody>
		</table>
	</td>
</tr>
</table>
</form>

</body>
</html>    
