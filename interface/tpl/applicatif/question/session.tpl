<HTML>
<HEAD>
<title>{TITRE_RECHERCHE} </title>
<link rel='stylesheet' type='text/css' href='/{NOM_APPLICATION}/include/style/style.css'>
<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/vocabulaire.js"></SCRIPT>
<SCRIPT language="javascript">
/* 
 * Ouvre la fenetre de parametrage pour la combinaison des questions
 */
function ouvreParam()
{
	var iCptChecked = 0;
	with(window.document.principal)
	{
		for (var i=0; i<elements.length; i++)
		{
			type = elements[i].type;
			switch (type)
			{
				// Choix par cochage.
				case "checkbox" :
					if(elements[i].checked == true)
						iCptChecked++;
				break;

				// Pour tous les autres types (submit, hidden, button, ...)
				default : break;
			}
		}

		if(iCptChecked == 2)
		{
			ref= "{URL_PARAM_COMBINER}";
			modelesswin(ref,'600','200');
		}
		else
		{
			alert("{MESSAGE_SELECT_QUESTION}");
			return false;
		}
	}
	return false;
}

function initEcran() 
{
    parent.setTitle();
}

</SCRIPT>
</HEAD>
<BODY  onLoad="javascript:initEcran();">
<h1 align="center">{TITRE_RECHERCHE}</h1>
<FORM NAME=principal ACTION="{URL_COMBINER}" METHOD="POST">
<INPUT TYPE=hidden NAME=POS_LIEN>
<INPUT TYPE=hidden NAME=POS_TITRE>

<TABLE class="tdfond" cellpadding="2" align=center cellspacing="1" width="80%">
	<TR>
	   <TD class="titrecolonne" colspan='5'>{POS_HIS_ENTETE}</TD>
	</TR>
	<!-- BEGIN QUESTIONS -->
	<TR class="ligne" data-line="{PAIR_OU_IMPAIR}">
		<TD width=30><INPUT TYPE=CHECKBOX NAME="POS_QUESTION[]" VALUE="{INUMQUEST}"></TD>
		<TD width=30>({POS_QST_NB_REP})</TD>
		<TD><A HREF="{POS_QST_LIEN_RAPPEL}">{POS_QST_DESCRIPTIF}</A></TD>
		<TD NOWRAP width=110>{POS_QST_HEURE}</TD>
		<TD width=25><A HREF="{POS_QST_LIEN_MODIF}">{POS_IMG_MODIF}</A></TD>
	</TR>
	<!-- END QUESTIONS -->
    <!-- BEGIN NO_QUESTIONS -->
	<TR class="ligne" data-line="pair">
		<TD colspan='5'>{MESSAGE}</TD>
	</TR>
	<!-- END NO_QUESTIONS -->
</TABLE>
<br>
<div style="margin:auto;width: 30%;">
<INPUT type=button class=bouton value="{LIBELLE_COMBINER}" onClick="ouvreParam()">
</div>
</FORM>

</BODY>
</HTML>
