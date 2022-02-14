<HTML>
<HEAD>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<title>{TITRE_RECHERCHE}</title>
	<style>
	
.tableau {
	border-color: Gray;
	background-color: #DDE4E4;
	font-family: Arial, Helvetica, sans-serif; 
	font-size: 12px; 
	font-weight: normal; 
	color: #003366; 
	text-align: center
}

.tdfond {
	background-color: White;
	font-family: Arial, Helvetica, sans-serif; 
	font-size: 11px; 
	font-weight: normal; 
	color: #003366; 
	text-align: justify
}
	</style>
	<SCRIPT language="javascript">

	/*
	 * lancement de la recherche
	 */	
	function rechercher()
	{
		with(document.principal)
		{
			dernier_zone = "ZONE_"+(nb_zone.value-1);
			for(i=nb_zone.value-1;i>=0;i--)
			{
				zone=eval("ZONE_"+i);
				
				if(zone.value.length == 0)
					dernier_zone = zone.name;
				else
					break;
			}
		
			visu_zone(eval(dernier_zone));
			
			if (POS_VAL_RUB_K_H.value.length == 0)
			{
				alert(document.principal.MSG_KH_AU_MOINS1ZONE.value);
				return false;
			}
		}
		return true;
	}
	
	function visu_zone(zone_en_cours)
	{
		with(document.principal)
		{
			POS_VAL_RUB_K_H.value="";
			VISU_K_H.value="";
	
			// construction de la cle hierarchique a partir des valeurs des zones	
			for(i=0;i<nb_zone.value;i++)
			{
				zone=eval("ZONE_"+i);
				type_zone=eval("TYPE_"+zone.name);
				longueur_zone=eval("LONGUEUR_"+zone.name);
				zone_tmp=zone.value;
				
				if (arguments.length > 0)
					niveau = zone_en_cours.name.substring(zone_en_cours.name.length , zone_en_cours.name.length-1);
				else
					niveau = nb_zone.value;
					
				
				if(zone.value.length > 0 || i < niveau)
				{
					if(type_zone.value == 1)
					{
						// Numerique.
						while(zone_tmp.length != longueur_zone.value)
						{
							zone_tmp="0"+zone_tmp;
						}
					}
					else
					{
						// Alpha ou date.
						while(zone_tmp.length != longueur_zone.value)
						{
							zone_tmp+=" ";
						}
					}

					// valeur de recherche : pas de separateurs
					POS_VAL_RUB_K_H.value += zone_tmp;
					
					if(i!=0)
						VISU_K_H.value+="/"+zone_tmp;
					else
						VISU_K_H.value+=zone_tmp;
				}
			}
			
			affiche_cle(VISU_K_H.value);
		}
	}

	/*
	 * Vide les zones suivant la zone en cours de saisie
	 */
	function vide_zones_suivantes(zone_en_cours)
	{
		with(document.principal)
		{	
			i_zone=zone_en_cours.name.substring(zone_en_cours.name.length - 1, zone_en_cours.name.length);
			i_zone++;		
	
			if(i_zone < nb_zone.value)
			{
				zone_inc=eval("ZONE_"+i_zone);
				if(zone_inc.value.length != 0)
				{
					for(i=i_zone;i<nb_zone.value;i++)
					{
						zone=eval("ZONE_"+i);
						zone.value="";	
					}
				}
			}
		}
	}

	/*
	 * test les zones precedentes pour s'assurer qu'elles contiennent bien un valeur
	 */
	function test_zones_precedentes(zone_en_cours)
	{
		retour = true;
		with(document.principal)
		{	
			i_zone=zone_en_cours.name.substring(zone_en_cours.name.length - 1, zone_en_cours.name.length);
			i_zone--;
	
			if(i_zone >= 0)
			{
				for(i=i_zone;i>=0;i--)
				{
					zone=eval("ZONE_"+i);
					if (zone.value.length == 0) {
						retour = false;
					}
				}
			}
		}
		return retour;
	}

	function on_focus_zone(zone_en_cours)
	{
		vide_zones_suivantes(zone_en_cours);
		if (!test_zones_precedentes(zone_en_cours))
			alert(document.principal.MSG_KH_ZONES_DS_ORDRE.value);
		else
		{
			visu_zone(zone_en_cours);
			vocabulaire(zone_en_cours);
		}
	}

	function vocabulaire(zone_en_cours)
	{
		with(document.principal)
		{	
			longueur_zone = eval("LONGUEUR_"+zone_en_cours.name);
			if(zone_en_cours.value.length != 0)
			{
				POS_VAL_RUB_K_H.value=POS_VAL_RUB_K_H.value.substring(0,POS_VAL_RUB_K_H.value.length-longueur_zone.value);
			}
		
			ref="{URL_RECH_VOCAB_CLE}";	
			ref+="?POS_TYPEDOC=";
			ref+=POS_TYPEDOC.value;
			ref+="&POS_VAL_RUB_K_H=";
			ref+=escape(POS_VAL_RUB_K_H.value);
			ref+="&LONGUEUR_ZONE=";
			ref+=longueur_zone.value;
			ref+="&ZONE_RETOUR=";
			ref+=zone_en_cours.name;
			parent.frame_vocabulaire.location.href=ref;
		}
	}

	/*
	 * Affichage de la cle dans la zone d'affichage
	 */ 	
	function affiche_cle(cle)
	{
        document.getElementById("visu_cle").innerHTML = cle;
	}
	
	function initEcranRechCle()
	{
        parent.frame_vocabulaire.location.href='{URL_RECH_VOCAB_CLE}';
        // si la zone est vide (on n'est pas en rappel d'une recherche), positionne le focus
        if (document.principal.ZONE_0.value.length == 0)
            document.principal.ZONE_0.focus();
        parent.parent.setTitle();
    }
    
    function effacerForm()
	{
        parent.location.href='{URL_AFF_RECH_CLE_HIER_FRM1}?POS_TYPEDOC={POS_TYPEDOC}';
    }
	
	</SCRIPT>
</HEAD>
<BODY onLoad="javascript:initEcranRechCle();">
<h1 align="center">{TITRE_RECHERCHE}</h1>
<TABLE class="texteaide" align=center CELLPADDING=5>
<TR>
	<TD class="texteaide">
		<DIV class="titretexteaide">
<SCRIPT language="javascript">
if("{LANGUE}" == "fr")
{
	szText = "Recherche par clé hiérarchique : </DIV>";
	szText+= "Faites apparaître le vocabulaire du premier champ de la clé hiérarchique en cliquant dessus puis sélectionnez le vocabulaire ";
	szText+= "de votre choix. Le champ sera automatiquement renseigné.";
	szText+= "Répétez l'opération pour renseigner les champs suivants si vous souhaitez affiner votre recherche.";
	szText+= "Lancer la recherche en cliquant sur \"Rechercher\" ou vider les champs de la clé en cliquant sur \"{LIBELLE_EFFACER}\".";
}
else
{
	szText = "ID search : </DIV>";
	szText+= "Click on the first field of the hierarchical key to make appeared the available vocabulary list, then select a term in this list. ";
	szText+= "The field is automatically filled in. ";
	szText+= "To narrow down your research, repeat the operation for the other fields. ";
	szText+= "Launch the research clicking on \"{LIBELLE_RECHERCHER}\", erase all fields clicking on \"{LIBELLE_EFFACER}\". ";
}
document.write(szText);
</SCRIPT>
	</TD>
</TR>
</TABLE><BR><BR>

<DIV ALIGN="CENTER">
<FONT CLASS=labelChamp>{LIBELLE_KH}</FONT>
<span id="visu_cle" style="position:absolute"></span>

<FORM NAME=principal action="{URL_ATTENTE}" TARGET="_parent" method="POST" onSubmit="javascript:return rechercher();">
<INPUT TYPE=HIDDEN NAME=URL VALUE="{URL_ACTION_FORM}">

<INPUT TYPE=hidden NAME="TYPE_RECHERCHE" VALUE="RECHERCHE_CLE">
<INPUT TYPE=hidden NAME="POS_TYPEDOC" VALUE={POS_TYPEDOC}>
<INPUT TYPE=hidden NAME="POS_VAL_RUB_K_H" VALUE="">
<INPUT TYPE=hidden NAME=nb_zone VALUE="{NB_ZONE_TT}">
<INPUT TYPE=hidden NAME="VISU_K_H" VALUE="">
<INPUT TYPE="hidden" NAME="MSG_KH_ZONES_DS_ORDRE" VALUE="{MSG_KH_ZONES_DS_ORDRE}">
<INPUT TYPE="hidden" NAME="MSG_KH_AU_MOINS1ZONE" VALUE="{MSG_KH_AU_MOINS1ZONE}">
<TABLE border=0 cellpadding="0" cellspacing="5" align="center"> 
<TR>
	<TD class="tdfond">
    	<TABLE cellpadding="2" cellspacing="0" width="100%" class="tdfond">
<TR>
<!-- BEGIN LIBELLES_ZONES -->
		<TD class="tableau" nowrap colspan=2 align=center>{LIBELLE}</TD>
<!-- END LIBELLES_ZONES -->
</TR>
<TR>
<!-- BEGIN BLOC_ZONES -->
		<TD align=right>{SEPARATEUR}</TD>
		<TD align=center>
		<INPUT class="inputChamp" TYPE="text" NAME="{ZONE}" SIZE="{LONGUEUR}" MAXLENGTH="{LONGUEUR}" onFocus="on_focus_zone(this)" VALUE="{POS_VALEUR_ZONE}">
<INPUT TYPE=hidden NAME=TYPE_{ZONE} VALUE={TYPE}>
<INPUT TYPE=hidden NAME=LONGUEUR_{ZONE} VALUE={LONGUEUR}>
</TD>
<!-- END BLOC_ZONES -->
</TR>
</TABLE>
   </TD>
</TR>
</TABLE>
<BR>
<div style="margin:auto;width: 30%;text-align:center;">
<INPUT TYPE="submit" class="bouton" VALUE="{LIBELLE_RECHERCHER}">
<INPUT TYPE=RESET class="bouton" VALUE="{LIBELLE_EFFACER}" onClick="effacerForm();">
</div>
</FORM>
</DIV>
</BODY>
</HTML>
