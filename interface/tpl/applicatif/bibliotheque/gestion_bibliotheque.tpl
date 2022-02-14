<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
    <link REL="stylesheet" type="text/css" href="/{NOM_APPLICATION}/include/script/jquery/datatable/css/jquery.dataTables.min.css">
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/jquery-1.11.1.min.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/jquery/datatable/js/jquery.dataTables.min.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_bibliotheque.js"></SCRIPT>
<SCRIPT language="javascript">

var tabNomBib=new Array();
var j = 0;
<!-- BEGIN NOM_BIB -->
tabNomBib[j++]="{LIBELLE_QUEST_BIB}";
<!-- END NOM_BIB -->

j = 0;
var tabIsPublicBib=new Array();
<!-- BEGIN TAB_IS_PUBLIC_BIB -->
tabIsPublicBib[j++]="{BIB_IS_PUBLIC}";
<!-- END TAB_IS_PUBLIC_BIB -->

function actualiser()
{
	window.location.href="{LIEN_ACTUALISATION}";
}

if(typeof String.prototype.trim !== 'function') {
  String.prototype.trim = function() {
    return this.replace(/^\s+|\s+$/g, ''); 
  }
}

function actualiseArboApresAjout()
{
	try {
        parent.updateMenuAddBib("{SZ_NOM_QUESTION}", '{POS_QUEST_PUBLIC}');
    }catch(e) {}
	parent.centerbal.location.reload();
}

function actualiseArboApresSupp()
{
	try {
        parent.updateMenuRemoveBib("{SZ_NOM_QUESTION}", '{POS_QUEST_PUBLIC}');
    }catch(e) {}
	parent.centerbal.location.reload();
}

function EnregistrerQuestion()
{
    document.principal.POS_NOM_QUEST.value = document.principal.POS_NOM_QUEST.value.trim();
	if(document.principal.POS_NOM_QUEST.value != "")
	{
		// on refuse les caracteres speciaux
		// " # & \ @
		var reg = /["#&\\@]/;
		if(!reg.test(document.principal.POS_NOM_QUEST.value))
		{
	    	var bEnregQuest = true;
	    	var iNumQuestionExiste = -1;
	    	for(i=0; i<tabNomBib.length; i++)
	    	{
	        	if(tabNomBib[i] == document.principal.POS_NOM_QUEST.value)
	        	{
	        	    iNumQuestionExiste = i;
	        	    // la question est partagee mais l'utilisateur n'est pas administrateur
	        	    if (document.principal.POS_ADMIN.value != "1" && tabIsPublicBib[i] == "1")
                    {
                        alert("{LIBELLE_MESS_QUEST_EXIST_DEJA_NO_DROITS}");
                        document.principal.POS_NOM_QUEST.focus();
                        bEnregQuest = false;
                    }
                    else
                    {
    	        	    if(!confirm("{LIBELLE_MESS_QUEST_EXIST_DEJA}"))
    	            	{
                            bEnregQuest = false;
                            document.principal.POS_NOM_QUEST.focus();
                        }
                    }
                    break;
	        	}
	    	}
    
			if(bEnregQuest)
	    	{    
	    		if (document.getElementById("POS_CHECK_QUEST_PARTAGEABLE") != null) 
				{
					if(document.principal.POS_CHECK_QUEST_PARTAGEABLE.checked == true)
	    				document.principal.POS_QUEST_PARTAGEABLE.value = 1;
				}
                if (iNumQuestionExiste != -1)
                {
                    document.principal.POS_QUEST_EXISTE_DEJA.value = 1;
                    document.principal.POS_QUEST_PUBLIC.value = tabIsPublicBib[i];
                }
			}
            
            if(bEnregQuest)
	    	    return true;
		}
		else
			alert('{LIBELLE_MESS_NOK_CHAR}');	
	}
	else  {
    	alert("{LIBELLE_MESS_NO_NOM_QUEST}");
        document.principal.POS_NOM_QUEST.focus();
    }
	
    return false;	
}

// Liste des boutons
var sitems=new Array();
var sitemlinks=new Array();

var i = 0;
<!-- BEGIN MENU_PARTAGE -->
sitems[i]="{LIBELLE_PARTAGER}";
sitemlinks[i++]="onPartager()";
<!-- END MENU_PARTAGE -->

sitems[i]="{LIBELLE_DETAIL}";
sitemlinks[i++]="onConsulter()";

sitems[i]="{LIBELLE_RAPPEL}";
sitemlinks[i++]="onRappeler()";

sitems[i]="{LIBELLE_RECHERCHE}";
sitemlinks[i++]="onRechercher()";

sitems[i]="{LIBELLE_SUPPRESSION}";
sitemlinks[i++]="onSupprimer()";

sitems[i]="<HR>";
sitemlinks[i++]="";

sitems[i]="{LIBELLE_AJOUTER}";
sitemlinks[i++]="onCreer()";

function initEcranBib()
{
    affiche_boutons();
    {ACTUALISE_ARBO_ADD};
    {ACTUALISE_ARBO_SUPP};
    parent.setTitle();
    if(document.principal.POS_NOM_QUEST)
        document.principal.POS_NOM_QUEST.focus();
    initTableStdAdmin('table_liste_question');
}

</SCRIPT>
	
</head>

<body onLoad="initEcranBib();">
<h1>{TITRE_PAGE}</h1>
<form NAME="principal"  method="POST" action="{URL_ENREG_QUEST}" onSubmit="return EnregistrerQuestion()">
<input TYPE="hidden" NAME="MESSAGE_SELECT_REP" VALUE="{MESSAGE_SELECT_REP}">
<input TYPE="hidden" NAME="MESSAGE_SUPP_QUEST_BIB" VALUE="{MESSAGE_SUPP_QUEST_BIB}">
<input TYPE="hidden" NAME="MESSAGE_NO_DROIT_SUPP_QUEST_BIB" VALUE="{MESSAGE_NO_DROIT_SUPP_QUEST_BIB}">
<input TYPE="hidden" NAME="MESSAGE_NO_DROIT_PART_QUEST_BIB" VALUE="{MESSAGE_NO_DROIT_PART_QUEST_BIB}">
<input type="hidden" name="POS_ADMIN" value="{POS_ADMIN}">
<input type="hidden" name="POS_QUEST_PARTAGEABLE" value="0">
<input type="hidden" name="POS_QUEST_EXISTE_DEJA" value="0">
<input type="hidden" name="POS_QUEST_PUBLIC" value="0">

<table id="table_liste_question" class='posdtable' style='width:100%;'>
<!-- BEGIN VISU_PARTAGE_YES -->
<thead>
    <tr>
        <th class="tableau"></th>
        <th class="tableau">{LIBELLE_BIB_ENTETE}</th>
        <th class="tableau">{LIBELLE_BIB_PARTAGEABLE}</th>
        <th class="tableau">{LIBELLE_BIB_PARTAGE}</th>
    </tr>
</thead>
<tbody>
<!-- BEGIN BIBLIO_YES -->
<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_STRU_QUESTION}'>
	<td class="tdnormal" data-menu="no" width="20px" align="center" >
    <input data-menu="no" TYPE="RADIO" NAME="INFO_STRU_QUESTION" VALUE="{POS_INFO_STRU_QUESTION}"></td>
	<td class="tdnormal">{POS_BIB_LIBELLE}</td>
	<td class="tdnormal">{POS_PARTAGEABLE}</td>
	<td class="tdnormal">{POS_PARTAGE}&nbsp;</td>
</tr>
<!-- END BIBLIO_YES -->
</tbody>        
<!-- END VISU_PARTAGE_YES -->
		
<!-- BEGIN VISU_PARTAGE_NO -->
<thead>
    <tr>
        <th class="tableau"></th>        
		<th class="tableau">{LIBELLE_BIB_ENTETE}</th>
		<th class="tableau">{LIBELLE_BIB_PARTAGEABLE}</th>
    </tr>
</thead>    
<tbody>
<!-- BEGIN BIBLIO_NO -->
	<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" data-info='{POS_INFO_STRU_QUESTION}'>
		<td class="tdnormal" data-menu="no" width="20px" align="center"><input data-menu="no" TYPE="RADIO" NAME="INFO_STRU_QUESTION" VALUE="{POS_INFO_STRU_QUESTION}"></td>
		<td class="tdnormal">{POS_BIB_LIBELLE}</td>
		<td class="tdnormal">{POS_PARTAGEABLE}</td>
	</tr>
<!-- END BIBLIO_NO -->
</tbody>
<!-- END VISU_PARTAGE_NO -->
</table>	
<center>
<br><br>
	<SCRIPT language="javascript">              
	document.write("<DIV id='bouton'></DIV>");
	</SCRIPT>
</center>

<br>
<br>
<br>
<div style='text-align: center'>
<!-- BEGIN BLOC_CREATION -->
<div style='border: 1px solid #aaa'>
    <div class="tableau" style='border-bottom: 1px solid #aaa;text-align:center; padding-top:3px;'>{LIBELLE_ENREG_QUEST_BIB}</div>
    <div style='margin: 10px;'>
    	<span class="labelChamp">{LIBELLE_TITRE_QUEST_BIB} </span>
        &nbsp;&nbsp;
        <span><input type=text class="inputChamp" name="POS_NOM_QUEST" size="40" maxlength="51"> </span>
        &nbsp;&nbsp;
        <!-- BEGIN BLOC_CREATION_CHECKBOX -->
    	<span><input type="checkbox" id="POS_CHECK_QUEST_PARTAGEABLE" name="POS_CHECK_QUEST_PARTAGEABLE" VALUE=1>{LIBELLE_BIB_PARTAGEABLE} </span>
        <!-- END BLOC_CREATION_CHECKBOX -->
        <span>
             &nbsp;&nbsp;<input type='submit' class='bouton' value="{LIBELLE_ENREGISTRER}">
        </span>
<!-- END BLOC_CREATION -->
</div>
</form>
</body>
</html>