<HTML>
<HEAD>
	<TITLE>{TITRE_PAGE} : {POS_QUEST_NOM}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<link type="text/css" rel="stylesheet" href="/{NOM_APPLICATION}/include/script/widget/columnlist/columnlist.css" />
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/widget/columnlist/sortabletable.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/widget/columnlist/columnlist.js"></SCRIPT>
<SCRIPT language="javascript">

var tabCodeParType = new Array();
tabCodeParType["{LIB_FONCTION}"] = "{TYPE_QUESTION_BIB_FONCTION}";
tabCodeParType["{LIB_PROFIL}"] = "{TYPE_QUESTION_BIB_PROFIL}";
tabCodeParType["{LIB_SERVICE}"] = "{TYPE_QUESTION_BIB_SERVICE}";
tabCodeParType["{LIB_UTIL}"] = "{TYPE_QUESTION_BIB_UTILISATEUR}";
tabCodeParType["{LIB_PUBLIC}"] = "{TYPE_QUESTION_BIB_PUBLIC}";

var tabPropositionParType = new Array();
tabPropositionParType["{LIB_FONCTION}"] = new Array();
tabPropositionParType["{LIB_PROFIL}"] = new Array();
tabPropositionParType["{LIB_SERVICE}"] = new Array();
tabPropositionParType["{LIB_UTIL}"] = new Array();
var j = 0;
<!-- BEGIN BLOC_USER -->
tabPropositionParType["{LIB_UTIL}"][j++]="{POS_CODE_UTIL}";
<!-- END BLOC_USER -->
j = 0;
<!-- BEGIN BLOC_PROFIL -->
tabPropositionParType["{LIB_PROFIL}"][j++]="{POS_PROFIL_UTIL}";
<!-- END BLOC_PROFIL -->
j = 0;
<!-- BEGIN BLOC_FONCTION -->
tabPropositionParType["{LIB_FONCTION}"][j++]="{POS_FONCTION}";
<!-- END BLOC_FONCTION -->

var tabService=new Array();
j = 0;
<!-- BEGIN BLOC_SERVICE -->
tabPropositionParType["{LIB_SERVICE}"][j++]="{POS_SERVICE}";
<!-- END BLOC_SERVICE -->

function choixPartage(typePartage)
{
    switch (typePartage)
    {
        case "{LIB_FONCTION}":
        case "{LIB_PROFIL}":
        case "{LIB_SERVICE}":
        case "{LIB_UTIL}":
            document.principal.POS_SELECT_VALEUR_PARTAGE.disabled = false;
			document.principal.POS_SELECT_VALEUR_PARTAGE.options.length = tabPropositionParType[typePartage].length;
			
            for(i=0; i<tabPropositionParType[typePartage].length; i++)
            {
				var ligneSelect=new Option(tabPropositionParType[typePartage][i],
					tabPropositionParType[typePartage][i]);
				document.principal.POS_SELECT_VALEUR_PARTAGE.options[i]=ligneSelect;
            }
        break;

		// cas du partage public, le combo box est desactivee        
        case "{LIB_PUBLIC}":
            // Public
            document.principal.POS_SELECT_VALEUR_PARTAGE.options.length=0;
            document.principal.POS_SELECT_VALEUR_PARTAGE.disabled = true;
        break;      
      
        default:
        break;
    }
}

function AjouterPartage()
{
	var aData = new Array();
	aData[0] = document.principal.POS_TYPE_PARTAGE.options[document.principal.POS_TYPE_PARTAGE.selectedIndex].text;
	if (!document.principal.POS_SELECT_VALEUR_PARTAGE.disabled)
		aData[1] = document.principal.POS_SELECT_VALEUR_PARTAGE.options[document.principal.POS_SELECT_VALEUR_PARTAGE.selectedIndex].text;
	else
		aData[1] = "";
	aData[2] = (document.principal.CACHEE.checked == true) ? "OUI" : "NON";
	o.addRow(aData);
	// decocher la case pour le prochain partage
    if(document.principal.CACHEE.checked == true)
        document.principal.CACHEE.click();  
}

function SupprimerPartage()
{
	o.removeRow(o.getSelectedRow());
}

function PreparerEnvoiPartage() 
{
	var listePartage = "";
	for(var i=0;i<o.getRowCount();i++)
	{
		var libTypePartage = o.getCellValue(i, 0, false);
		if (libTypePartage.length > 0)
		{
			var codeTypePartage = tabCodeParType[libTypePartage];
			var libCachee = o.getCellValue(i, 2, false);
			boolCachee = 0;
			if (libCachee == "OUI")
				boolCachee = 1;
			var valeurPartage = o.getCellValue(i, 1, false);
			listePartage += codeTypePartage + ":" + boolCachee + ":" + valeurPartage.length + ":" + valeurPartage + ":";
		}
	}
	document.principal.POS_LISTE_PARTAGE.value = listePartage;
}
</SCRIPT>
	
</HEAD>

<BODY onLoad="choixPartage(document.principal.POS_TYPE_PARTAGE.options[document.principal.POS_TYPE_PARTAGE.selectedIndex].value);">
<h1>{TITRE_PAGE}&nbsp;:&nbsp;{POS_QUEST_NOM_HTML}</h1>
<FORM NAME="principal" ACTION="{URL_PARTAGER_QUEST_BIB}" METHOD="POST" onSubmit="PreparerEnvoiPartage();">
<INPUT name="POS_QUEST_PARTAGEABLE" type="hidden" value=0>
<INPUT name="POS_LISTE_PARTAGE" type="hidden" value="">
<INPUT name="POS_QUEST_NOM" type="hidden" value="{POS_QUEST_NOM}">
<center>
<TABLE border=0 cellpadding="0" cellspacing="5" width="80%">
<TR>
    <TD class="tdnormal">
    	<TABLE style='border: 1px solid #ddd' align="left" cellpadding="2" cellspacing="0" width="100%">
		<TR>
		    <TD class="tdfond">
                    <TABLE width="100%" cellpadding=0>
                    <TR>
                        <TD class="labelChamp"><BR>{LIBELLE_TYPE_PARTAGE}</TD>
                        <TD><BR>
                            <select class="inputChamp" name="POS_TYPE_PARTAGE" onChange="choixPartage(this.options[this.selectedIndex].value)">
                                <OPTION VALUE="{LIB_FONCTION}">{LIB_FONCTION}</OPTION>
                     			<OPTION VALUE="{LIB_PROFIL}">{LIB_PROFIL}</OPTION>
                     			<OPTION VALUE="{LIB_PUBLIC}">{LIB_PUBLIC}</OPTION>
                     			<OPTION VALUE="{LIB_SERVICE}">{LIB_SERVICE}</OPTION>
                     			<OPTION VALUE="{LIB_UTIL}">{LIB_UTIL}</OPTION>
                            </select>
                        </TD>
                        <TD align="right">
                        	<BR><input type="BUTTON" class="bouton" value=">>" onClick="AjouterPartage()">
                        </TD>
                        <TD rowspan="2">
                        <div id="container" class="webfx-columnlist" style="margin-left: 50px; width: 320px; height: 140px;">
							<div id="head" class="webfx-columnlist-head">
								<table cellspacing="0" cellpadding="0">
									<tr>
										<td>{LIBELLE_TYPE_PARTAGE}</td>
										<td>{LIBELLE_VALEUR_PARTAGE}</td>
										<td>{LIBELLE_BIB_CACHEE}</td>
									</tr>
								</table>
							</div>
							<div id="body" class="webfx-columnlist-body">
								<table cellspacing="0" cellpadding="0">
									<colgroup span="4">
										<col style="width: auto;" />
										<col style="width: auto;" />
										<col style="width: auto;" />
									</colgroup>
									<tr><td></td><td></td><td></td></tr>
									<!-- BEGIN BLOC_AFFICHE_PARTAGE -->
									<tr><td>{PARTAGE_TYPE}</td><td>{PARTAGE_VALEUR}</td><td>{PARTAGE_CACHE}</td></tr>
									<!-- END BLOC_AFFICHE_PARTAGE -->
								</table>
							</div>
						</div>
					</TD>
					</TR>
                    <TR>
                        <TD class="labelChamp">{LIBELLE_VALEUR_PARTAGE}</TD>
                        <TD id="select_value" style="display:inline">
                            <SELECT class="inputChamp" name="POS_SELECT_VALEUR_PARTAGE">
                                <OPTION VALUE="">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                </OPTION>
                            </select>
                        </TD>
                        <TD align="right">
                        	<input type="BUTTON" class="bouton" value="<<" onClick="SupprimerPartage()">
                        </TD>
                    </TR>
                    <TR>
                        <TD></TD>
                        <TD class="labelChamp"><INPUT type=checkbox name=CACHEE>{LIBELLE_BIB_CACHEE}
                        </TD>
                    </TR>
                    </TABLE>
		    </TD>
		</TR>
		</TABLE>
    </TD>
</TR>
<TR>
	<TD align="center">
		<!--table liste boutons-->
		<TABLE BORDER="0" ALIGN="CENTER" CELLPADDING="0" CELLPADDING="2">
		<TR>
			<TD ALIGN="CENTER"><INPUT TYPE="SUBMIT" class="bouton" VALUE="Valider"></TD>
			<TD ALIGN="CENTER"><INPUT TYPE="BUTTON" class="bouton" VALUE="Annuler" onClick="parent.parent.closeFileModif();";></TD>
		</TR>
		</TABLE>
	</TD>
</TR>
</TABLE>
</center>
<script>
/*
var aColumns = [
	'Rank',
	'Flavor',
	'Color',
];
var aData = [
	['13','Coffee','Dark brown', '1.6%'],
	['14','Rocky road','brown', '1.5%'],
	['15','Chocolate marshmallow','Light brown','1.3%']
];
var o = new WebFXColumnList();
var el = document.getElementById('container');
o.create(el, aColumns);
o.addRows(aData);
*/
var o = new WebFXColumnList();
var rc = o.bind(document.getElementById('container'), document.getElementById('head'), document.getElementById('body'));
o.moveColumns = false;
</script>
</FORM>
</BODY>
</HTML>