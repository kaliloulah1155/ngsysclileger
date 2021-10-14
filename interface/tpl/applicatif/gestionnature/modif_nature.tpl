<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
	<TITLE>{TITRE_PAGE}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="../../../../include/script/recupcontrolsaisie.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="../../../../include/script/navigation.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="../../../../include/script/vocabulaire.js"></SCRIPT>	
	<SCRIPT language="javascript">
	
	var tabNomToutesNatures = new Array();
	var iCptNature = 0;
	<!-- BEGIN BLOC_TOUTES_NATURES -->
	tabNomToutesNatures[iCptNature++] = "{CODE_NATURE}";
	<!-- END BLOC_TOUTES_NATURES -->
	
	function GestionBlocFormatage(obj)
	{
		if (!obj.checked)
		{
			document.getElementById("outil_formatage").value = "";
            document.getElementById("outil_formatage").readOnly=true;
			document.getElementById("outil_formatage").className = 'verrouille';
			document.getElementById("outil_suppression_formatage").value = "";
			document.getElementById("outil_suppression_formatage").readOnly=true;
            document.getElementById("outil_suppression_formatage").className = 'verrouille';			
		}
		else 
		{
			document.getElementById("outil_formatage").readOnly=false;
			document.getElementById("outil_formatage").className = 'inputChamp';
			document.getElementById("outil_suppression_formatage").readOnly=false;
			document.getElementById("outil_suppression_formatage").className = 'inputChamp';
		}
	}
	
	function verifFormProfilExt(obj)
	{ 
		var szInfoProfilExt= obj.value;
		var szInfoProfilExtRet = szInfoProfilExt.replace(/\r\n/g,'\n');

		var exp=new RegExp("[^A-Z0-9\n]+","g");		
		if (exp.test(szInfoProfilExtRet) == true)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_ALPHANUM.value);
			obj.focus();
			return false;
		}
		else 
			return true;	
	}
	function verifFormLibelleNature(obj)
	{ 
		var szLibelleNature = obj.value;
		var exp = new RegExp("^[A-Z0-9юбгхийнтыш_ '/]*$","g");	
		if (exp.test(szLibelleNature) == false)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_LIBELLE.value);
			obj.focus();
			return false;
		}	
		else 
			return true;	
	}
	
	function lancerFormulaire()
	{
	 	with(document.principal)
		{ 
			if ((POS_CODE_NATURE.value.length) == 0) 
			{
				alert("{MESSAGE_CODE_NATURE_OBLIGATOIRE}");
				return false;
			}
			else if ((POS_LIBELLE_NATURE.value.length) == 0) 
			{
				alert("{MESSAGE_LIBELLE_NATURE_OBLIGATOIRE}");
				return false;
			}
			else if ((POS_EXT_NATURE.value.length) == 0) 
			{
				alert("{MESSAGE_EXT_NATURE_OBLIGATOIRE}");
				return false;
			}
			else if ((POS_TYPE_FICHIER.value.length) == 0) 
			{
				alert("{MESSAGE_TYPE_FICHIER_OBLIGATOIRE}");
				return false;
			}
			else if (verifFormProfilExt(POS_CODE_NATURE)
					&& verifFormProfilExt(POS_EXT_NATURE)
					&& verifFormProfilExt(POS_AUTRES_WEB_EXT_NATURE)
					&& verifFormLibelleNature(POS_LIBELLE_NATURE)) 
			{ 
				for(i=0; i<tabNomToutesNatures.length; i++)
				{
					if(POS_CODE_NATURE.value == tabNomToutesNatures[i])
					{
						alert("{MESSAGE_CODE_NATURE_EXISTANT}");
						return false;
					}					
				}
				return true;
			}
			else 
				return false;
		}
	}
	
	function initEcranNature()
	{
	   GestionBlocFormatage(document.principal.POS_CTRL_BLOC_FORMATAGE);
    }
	
	</SCRIPT>
</HEAD>

<BODY topmargin="2" leftmargin="10" onLoad="javascript:initEcranNature();">
<FORM NAME=principal ACTION="{URL_ATTENTE}" method="POST" onSubmit="return lancerFormulaire();">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="{CODE_ACTION}">
<INPUT TYPE=HIDDEN NAME="POS_AUTRES_WEB_EXT_NATURE_OLD" VALUE="{MULTI_EXT_NATURE}">
<INPUT TYPE=HIDDEN NAME="POS_EXT_NATURE_OLD" VALUE="{EXT_NATURE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_ALPHANUM" VALUE="{MESSAGE_VERIF_FORME_ALPHANUM}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_LIBELLE" VALUE="{MESSAGE_VERIF_FORME_LIBELLE}">

<INPUT TYPE=HIDDEN NAME="MODE" VALUE="{MODE}">
<h1 align = "center">{TITRE_PAGE}</h1>
<table role='presentation' align="center" cellspacing="2">
	<tr>
        <td valign='top' align='center'>
            <div class='groupe' style='margin:1em 1em 1em 1em'>
				<p class='groupe'>								 														 														 														
					<span class='groupe'>{ENTETE_LIBELLE_NATURE}</span>													 													 													
				</p>
                <table role='presentation' class='groupe' cellspacing="2" border='0'>
                    <tr>									
                        <td class="labelChamp">{LIBELLE_CHAMP_CODE_NATURE}</td>
                        <td>
                            <INPUT class="{CLASS_CODE_NATURE}" {READONLY_CODE_NATURE} NAME="POS_CODE_NATURE"  SIZE="3" VALUE="{CODE_NATURE}" MAXLENGTH=3 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormProfilExt(this);">
                        </td>
                    </tr>
                    <tr>
                        <td class="labelChamp">{LIBELLE_CHAMP_LIBELLE_NATURE}</td>
                        <td>
                            <INPUT class="inputChamp" NAME="POS_LIBELLE_NATURE" SIZE="25" VALUE="{LIBELLE_NATURE}" MAXLENGTH=23 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormLibelleNature(this);">
                        </td>	
                    </tr>
                    <tr>												
                        <td class="labelChamp">{LIBELLE_CHAMP_EXTENSION_NATURE}</td>
                        <td>
                            <INPUT class="inputChamp" NAME="POS_EXT_NATURE"  SIZE="10" VALUE="{EXT_NATURE}" MAXLENGTH="10" style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormProfilExt(this);">	
                        </td>
                    </tr>
                    <tr>
                        <td class="labelChamp">{LIBELLE_CHAMP_TYPE_FICHIER_NATURE}</td>                        
                        <td>
                        <SELECT class="inputChamp" NAME="POS_TYPE_FICHIER"  SIZE="1">
                        <!-- BEGIN BLOC_TOUS_TYPES_FICHIER -->
                        <OPTION VALUE="{TYPE_FICHIER}" {TYPE_FICHIER_SELECTED}>{LIBELLE_TYPE_FICHIER}</OPTION>
                        <!-- END BLOC_TOUS_TYPES_FICHIER -->
                        </SELECT>
                        </td>
                    </tr>
                    <tr>												
                        <td class="labelChamp">{LIBELLE_CHAMP_TYPE_MIME}</td>
                        <td>
                            <INPUT class="inputChamp" NAME="POS_TYPE_MIME"  SIZE="30" VALUE="{POS_TYPE_MIME}">	
                        </td>
                    </tr>
                    <tr>												
                        <td class="labelChamp">{LIBELLE_CHAMP_CHARSET}</td>
                        <td>
                            <INPUT class="inputChamp" NAME="POS_CHARSET"  SIZE="20" VALUE="{POS_CHARSET}">	
                        </td>
                    </tr>
                    
                    <tr><td colspan='2'><hr/></td></tr>
                    <tr>
                        <td colspan='2'>
                            <table role='presentation' cellspacing='2' cellpadding='2' width=100%>
                                <tr>
                                    <td colspan='2' class="labelChamp"><input type="checkbox" name="POS_CTRL_BLOC_FORMATAGE" {NATURE_FORMATAGE_CHECKED} onClick="GestionBlocFormatage(this);">{LIBELLE_CHAMP_AVEC_FORMATAGE_NATURE}</td>
                                </tr>
                                <tr>
                                    <td class="labelChamp">{LIBELLE_CHAMP_OUTIL_FORMATAGE_NATURE}</td>
                                    <td NOWRAP>
                                        <INPUT class="inputChamp" NAME="POS_OUTIL_FORMATAGE"  id="outil_formatage" SIZE="20" VALUE="{OUTIL_FORMATAGE}" MAXLENGTH=31 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();">
                                    </td>
                                </tr>
                                <tr style="vertical-align: top"> 
                                    <td class="labelChamp">{LIBELLE_CHAMP_OUTIL_SUPPRESSION_FORMAT_NATURE}</td>
                                    <td NOWRAP>
                                        <INPUT class="inputChamp" NAME="POS_OUTIL_SUPP_FORMATAGE" id="outil_suppression_formatage" SIZE="20" VALUE="{OUTIL_SUPP_FORMATAGE}" MAXLENGTH=31 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();">
                                    </td>
                                </tr>	
                            </table>
                        </td>
                    </tr>
                    <tr><td colspan='2'><hr/></td></tr>
                    <tr style="vertical-align: top">
                        <td class="labelChamp" style="vertical-align: top">{LIBELLE_CHAMP_AUTRES_EXTENSIONS_NATURE}</td>
                        <td>
                            <TEXTAREA class="inputChamp" id="autres_extensions" style="text-transform:uppercase;" WRAP='SOFT' NAME="POS_AUTRES_WEB_EXT_NATURE"  COLS="10" ROWS="5" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormProfilExt(this);">{MULTI_EXT_NATURE}</TEXTAREA> 					
                        </td>
                    </tr>
                </table>  
            </div>
		</td>
	</tr>
</table>
<BR>
<CENTER>
    <INPUT TYPE=SUBMIT class="bouton_sub" VALUE="{LIBELLE_VALIDER}">
    <INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}" onClick="location.href='{URL_ANNULER}'">
</CENTER>
</FORM>
</BODY>
</HTML>
