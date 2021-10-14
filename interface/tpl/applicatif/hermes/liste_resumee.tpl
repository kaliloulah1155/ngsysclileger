<HTML>
<HEAD>
<LINK rel=STYLESHEET type=text/css href=/{NOM_APPLICATION}/include/style/style.css>
<SCRIPT LANGUAGE="JavaScript">
function motif_refus(code, libelle)
{	
	window.document.principal.POS_HERM_CODEACT.value=code;
	window.document.principal.POS_HERM_LIBACT.value=libelle;
	
	if(code=="AC_REFUSER")
	{
		motifrefus = prompt('Donner le motif du refus :','');
		if(motifrefus)
		{
			window.document.principal.POS_HERM_AC_REFUSER_MRF.value=motifrefus;
			return true;
		}
		else
		{
			return false;
		}
		
	}
	else
	{
		return true;
	}
}

function actualiser()
{
	window.location.href="{URL_RECH_ACTION}{POS_QUERY}";
}

var cpt_pass_fct=0;
function select_all()
{
	cpt_pass_fct++;
	reste = cpt_pass_fct % 2;

    var tabElementsForm = document.principal.elements;
	for (i=0; i<tabElementsForm.length; i++)
	{
		var type = tabElementsForm[i].type;
	
			switch (type)
			{
				// Choix par cochage.
				case "checkbox" :
				if((tabElementsForm[i].checked == false && reste) || (tabElementsForm[i].checked == true && !reste))
					tabElementsForm[i].click();
				break;

				// Pour tous les autres types (submit, hidden, button, ...)
				default : break;
			}
		}
	}

function lancerActionHermes(szCodeAction, szLibelleAction)
{
    var bElementChecked = false;
    var tabElementsForm = document.principal.elements;
	for (i=0; i<tabElementsForm.length; i++)
	{
		if (tabElementsForm[i].type == "checkbox" && tabElementsForm[i].checked == true)
		{
		  bElementChecked = true;
		  break;
        }
	}
	
	if (!bElementChecked)
	{
	   alert("Vous devez sélectionner au moins une ligne (par clic sur la case à cocher de la ligne).");
    }
    else
    {
        document.principal.URL.value="{URL_LANCER}";
        if(motif_refus(szCodeAction, szLibelleAction)) 
            document.principal.submit();
    }
}

</SCRIPT>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/fermeture.js"></SCRIPT>
</HEAD>

<BODY  topmargin="0" leftmargin="0">
<FORM NAME="principal" action="{URL_ATTENTE}">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="">
<INPUT TYPE=HIDDEN NAME=motif>
<INPUT TYPE=HIDDEN NAME=POS_HERM_CODEACT>
<INPUT TYPE=HIDDEN NAME=POS_HERM_LIBACT>
<INPUT TYPE=HIDDEN NAME=POS_QUERY VALUE="{POS_QUERY}">

<!-- BEGIN LISTE_HERM_VALRUB -->
<INPUT TYPE=HIDDEN NAME="{POS_HERM_CODE_RUB}" VALUE="{POS_HERM_VAL_RUB}">
<!-- END LISTE_HERM_VALRUB -->

Nombre de réponses : {NB_REPONSES} 
<TABLE border=1 width=95% align=center cellspacing=0>
  <TR>
    <TD colspan=2 class=titrecolonne><INPUT type=CHECKBOX onClick="select_all()">Tous
    </TD>
<!-- BEGIN ENTETE -->
           <TH class=titrecolonne>{TITRE_COLONNE}</TH>
	<!-- END ENTETE -->
  </TR>

  <!-- BEGIN LISTE_REPONSES -->
  <TR>
	<TD>
	<INPUT TYPE=CHECKBOX NAME=POS_NUM_DOC[] VALUE={POS_NUM_DOC}>
	</TD>
	<TD align=center>
	<A HREF="javascript:void(window.open('{URL_CONSULT}?POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&POS_NUM_FICHE={POS_NUM_FICHE}', '{MODE}', 'left=25,top=90,height=250,width=950,scrollbars=yes,location=no,toolbar=no,status=no,resizable=no'))"><IMG SRC="/{NOM_APPLICATION}/images/menu/doc.gif"  border=0 title="Voir le document"></A>
	</TD>
	<!-- BEGIN LR_REPONSE -->
		<TD class=listeResumee>
			{ZONE_LR}	
		</TD>
	<!-- END LR_REPONSE -->
  </TR>
  <!-- END LISTE_REPONSES -->

</TABLE>

<BR>

<TABLE>
<TR>
	<!-- BEGIN LISTE_ACTIONS -->
	<TD width=15>
	<INPUT TYPE=BUTTON class=bouton VALUE="{POS_HERM_LIBACT}" onClick='document.principal.URL.value="{URL_LANCER}";if(motif_refus("{POS_HERM_CODEACT}", "{POS_HERM_LIBACT}")) submit();'>
	</TD>			
	<!-- END LISTE_ACTIONS -->
	
	<TD width=15>
	<INPUT TYPE=BUTTON class=bouton VALUE=Annuler onClick='fermeture()'>
	</TD>
	</TR>
</TABLE>

</FORM>
</BODY>
</HTML>