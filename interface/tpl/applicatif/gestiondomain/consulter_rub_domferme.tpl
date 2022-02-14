<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE} {POS_LIBELLE_RUB}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_rub_domferme.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/recupcontrolsaisie.js"></SCRIPT>
	<SCRIPT>
	
	
	// tableau contenant tous les codes (rubrique alphanumerique)
	// ou toutes les valeurs (rubrique date, entier ou decimal)
	var tabTousCodesOuValeurs = new Array();
	
	<!-- BEGIN BLOC_TAB_TOUS_CODES_OU_VALEURS -->
	tabTousCodesOuValeurs[{CPT_CODES_OU_VALEURS}] = "{CODES_OU_VALEURS}";
	<!-- END BLOC_TAB_TOUS_CODES_OU_VALEURS -->
			
	function stripslashes(str) {
		str=str.replace(/\\'/g,'\'');
		str=str.replace(/\\"/g,'"');
		return str;
	}
	
	function lancerFormulaire() 
    {	
    	with(document.principal)
	    {
			 var err = 0;
			 var err_mssg = "";
	         var code = document.getElementById("code_domferme").value;
	         var libelle = document.getElementById("libelle_domferme").value;
	         var DomFermeNonAlphanum = POS_DOMFERME_NON_ALPHANUM.value;
	         if(libelle.length == 0)
	         {	
			 	if(DomFermeNonAlphanum == 0)
					libelle = code;
				else
				{
    	         	err = 1;
	         	err_mssg = "{MESSAGE_VERIF_LIBELLE_DOMFERME}";
	         }
	         }
	         if(code.length == 0 && DomFermeNonAlphanum == 0)
	         {
	         	err = 1;
	         	err_mssg = "{MESSAGE_VERIF_CODE_DOMFERME}";
	         }
	         
            if(err == 1)
	         {
	        	parent.posMessageBoxWarning(err_mssg);
	        	return false;
	        }
	    	else 
			{
				// on force l'assignation en majuscule.
				POS_NEW_CODE_DOMFERME.value = code.toUpperCase();
                POS_NEW_LIBELLE_DOMFERME.value = libelle.toUpperCase();
                
                for(i=0;i<tabTousCodesOuValeurs.length;i++)
                {	
					szValeurAController = stripslashes(tabTousCodesOuValeurs[i]);
					if(DomFermeNonAlphanum == 0 && SERVICE.value == "ajout")
					{	
						if (POS_NEW_CODE_DOMFERME.value == szValeurAController)
						{
							parent.posMessageBoxWarning("{MESSAGE_CODE_DOMFERME_EXISTANT}");
							return	false;
						}
					}
				} 
                return true
			} 
	    }
    }
    
    function annuler()
    {
		document.getElementById("bloc_ajout").style.display = "none";
	}
	
	function Trier(sTri)
    {
        var szUrl = "{URL_CONSULTER_RUB_DOMFERME}?POS_CODE_RUB=" + escape(document.principal.POS_CODE_RUB.value);
        szUrl += "&POS_LIBELLE_RUB=" + escape(document.principal.POS_LIBELLE_RUB.value);
        szUrl += "&POS_TRI=" + ((sTri == "CODE") ? "CODE" : "LIBELLE");
		document.location.href = szUrl;
	}
	
	// Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
    <!-- BEGIN BLOC_MENU_DOMFERME_ALPHANUM -->
    
    sitems[i]="{LIBELLE_AJOUTER}";
    sitemlinks[i++]="onCreer()";
    sitems[i]="{LIBELLE_EXPORTER}";
    sitemlinks[i++]="onExporter()";
    
//    sitems[i]="<HR>";
   // sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_MODIFIER}";
    sitemlinks[i++]="onModifier()";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimer()";
    
    <!-- END BLOC_MENU_DOMFERME_ALPHANUM -->
    
    <!-- BEGIN BLOC_MENU_DOMFERME_NON_ALPHANUM -->
    
	    sitems[i]="{LIBELLE_AJOUTER}";
	    sitemlinks[i++]="onCreer()";
	    sitems[i]="{LIBELLE_EXPORTER}";
	    sitemlinks[i++]="onExporter()";
	    
	   // sitems[i]="<HR>";
	   // sitemlinks[i++]="";
	    
	    sitems[i]="{LIBELLE_SUPPRIMER}";
	    sitemlinks[i++]="onSupprimer()";
    
    <!-- END BLOC_MENU_DOMFERME_NON_ALPHANUM -->
    
    
    function initEcranRubDf()
    {
        affiche_boutons();
        parent.setTitle();
        initTableStdAdmin('table_valeur_df');
    }
	</SCRIPT>
</head>

<body topmargin="10" leftmargin="10" onLoad="initEcranRubDf();">
<form NAME=principal ACTION="{URL_ATTENTE}" method="POST" onSubmit="return lancerFormulaire();">
<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_DOMFERME}">
<input TYPE=hidden NAME=MESSAGE_SUPP_DOMFERME VALUE="{MESSAGE_SUPP_DOMFERME}">
<input TYPE=hidden NAME=DROIT_ADMIN_DOMFERME VALUE="{DROIT_ADMIN_DOMFERME}">
<input TYPE=hidden NAME="POS_CODE_RUB" VALUE="{POS_CODE_RUB}">
<input TYPE=hidden NAME="POS_LIBELLE_RUB" VALUE="{POS_LIBELLE_RUB}">
<input TYPE=HIDDEN NAME="SERVICE" VALUE="">
<input TYPE=HIDDEN NAME="URL" VALUE="{CODE_ACTION}">
<input TYPE=HIDDEN NAME="MESSAGE_VERIF_CODE_DOFMERME" VALUE="{MESSAGE_VERIF_CODE_DOMFERME}">
<input TYPE=HIDDEN NAME="MESSAGE_VERIF_LIBELLE_DOMFERME" VALUE="{MESSAGE_VERIF_LIBELLE_DOMFERME}">
<input TYPE=hidden NAME="POS_OLD_LIBELLE_DOMFERME" VALUE="">
<input TYPE=hidden NAME="POS_DOMFERME_NON_ALPHANUM" VALUE="{DOMFERME_NON_ALPHANUM}">
<INPUT TYPE="hidden" NAME="PHPSESSID" VALUE="{PHPSESSID}">

<h1>{TITRE_PAGE}</h1>
<h1>{LIBELLE_RUB} {POS_LIBELLE_RUB}</h1>
<table id="table_valeur_df" class='posdtable' style='width:100%;'>
<thead>
<tr>
    <th class="tableau"></th>
	<td class="tableau" style="display:{DISPLAY_CODE};"><a class="tableau" >{LIBELLE_CODE_DOMFERME}</a></td>
	<td class="tableau"><a class="tableau">{LIBELLE_LIBELLE_DOMFERME}</a></td>
</tr>
</thead>
<tbody>
<!-- BEGIN BLOC_DICO -->
<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_VOCAB_RUB}'>
	<td data-menu="no" class="tdnormal" width="20px" align="center">
    <input data-menu="no" TYPE="RADIO" NAME="VOCAB_RUB" VALUE="{POS_VOCAB_RUB}"></td>
	<td class="tdnormal" style="display:{DISPLAY_CODE};" nowrap>{POS_CODE_DOMFERME}</td>
	<td class="tdnormal" nowrap>{POS_LIBELLE_DOMFERME}</td>
</tr>
<!-- END BLOC_DICO -->
</tbody>
</table>
<br>
<div style='float: left; width: 90%;margin: auto;'>
<center>
<SCRIPT language="javascript">              
document.write("<DIV id='bouton'></DIV>");
</SCRIPT>
</center>
</div>
<div style='float: right;'>
<input TYPE=BUTTON class="bouton" VALUE="{LIBELLE_FERMER}" onClick="location.href='{URL_FERMER}'">
</div>


<table align="center" width="750px" cellpadding="0" cellspacing="5">
<tr>
	<td class="tdfond" colspan='2'>
		<table id="bloc_ajout" style="display: none" width="680px" align="center" border=0 cellpadding="0" cellspacing="0">		
		<tr>
			<td class="tdnormal">
				<table cellpadding="2" cellspacing="0" width="100%">
				<tr>
					<td class="tableau" nowrap>{LIBELLE_ENREG_VAL_DOMFERME}</td>
				</tr>
				<tr>
					<td class="tdfond">
						<table width="100%">
						<tr>
							<td class="labelChamp" style="display:{DISPLAY_CODE};">{LIBELLE_CODE_DOMFERME}</td>
							<td><input TYPE="text"  class="inputChamp" id="code_domferme" style="display:{DISPLAY_CODE};" NAME="POS_NEW_CODE_DOMFERME" SIZE="119" MAXLENGTH="119"></td>
						</tr>
						<tr>
							<td class="labelChamp">{LIBELLE_LIBELLE_DOMFERME}</td>
    						<td><input TYPE="text" class="inputChamp" id="libelle_domferme" NAME="POS_NEW_LIBELLE_DOMFERME" SIZE="119" MAXLENGTH="119" {CTRL_SAISIE}></td>    				
    					</tr>
    					</table>
    				</td>
    			</tr>
    			<tr>
    				<td class="tdfond">
						<table width="100%">
    					<tr>	
							<td width="50%" align="right"><input TYPE=SUBMIT class="bouton_sub" VALUE="{LIBELLE_VALIDER}"></td>
							<td align="left"><input TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}" onClick="return annuler();"></td>
						</tr>
						</table>
					</td>	
				</tr>
				</table>
			</td>
		</tr>
		</table>
	</td>
</tr>
</table>
</form>
</body>
</html>
