<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE} </title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_modele.js"></SCRIPT>
	<SCRIPT language="javascript">
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
    sitems[i]="{LIBELLE_AJOUTER}";
    sitemlinks[i++]="onAjouterModele()";
    
   // sitems[i]="<HR>";
   // sitemlinks[i++]="";

    sitems[i]="{LIBELLE_CONSULTER}";
    sitemlinks[i++]="onConsulterModele()";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifierModele()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimerModele()";
    
    var tabListeModeles = new Array();
    i =0;
    <!-- BEGIN BLOC_TAB_MODELE -->
    tabListeModeles[i++] = "{POS_NOM_MODELE}";
    <!-- END BLOC_TAB_MODELE -->
    
    function initEcranModele() {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_liste_modele');
    }
    </SCRIPT>
</head>
<body onLoad="initEcranModele();">
<h1>{TITRE_PAGE}</h1>
<form NAME=principal>
<table id="table_liste_modele" class='posdtable'>
<thead>
<tr>
    <td class="tableau"></td>
	<td class="tableau">{LIBELLE_MODELE}</td>
</tr>
</thead>
<tbody>
<!-- BEGIN BLOC_MODELE -->
<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{VALUE_RADIO_MODELE}'>
    <td data-menu="no" class="tdnormal" width=15 align=center>
		<input data-menu="no" TYPE=RADIO NAME="POS_MODELE" VALUE="{VALUE_RADIO_MODELE}">
	</td>							
	<td class="tdnormal"  NOWRAP>{POS_NOM_MODELE} &nbsp;</td>
</tr>
<!-- END BLOC_MODELE -->
</tbody>
</table>
<center>
<br><br>
	<SCRIPT language="javascript">              
	document.write("<DIV id='bouton'></DIV>");
	</SCRIPT>
</center>
</form>
<br>
<br>
<br>
<div align="center">
<div id='divEnvoiModele' style='width: 430px; display: none;border: 1px solid gray;'>
<h1 align = "center">Ajout d'un modèle</h1>
<br>
<form name="envoimodele" method='post' enctype='multipart/form-data' action="../gestionmodele/gerer_modele.php" onSubmit="return verifNomFichier();">

<input type='hidden' name='MAX_FILE_SIZE' value='15000000'>
<input type='hidden' name='ACTION' value='AJOUTER'>
<table>
<tr>
	<td><input class='inputChamp' type='file' name='POS_FICHIER' size='60'> </td>
</tr>
<tr>
	<td align="center"> 
    <input type="submit" class='bouton' value="{LIBELLE_AJOUTER}">
    &nbsp;&nbsp;&nbsp;
    <input TYPE="button" class='bouton' value="{LIBELLE_FERMER}" onclick="document.getElementById('divEnvoiModele').style.display = 'none';">
    </td>
</tr>
</table>
</form>
</div>
</div>
</body>
</html>
