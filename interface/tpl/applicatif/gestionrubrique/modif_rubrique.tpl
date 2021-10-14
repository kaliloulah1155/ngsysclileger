<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
	<TITLE>{TITRE_PAGE}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="../../../../include/script/recupcontrolsaisie.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="../../../../include/script/navigation.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="../../../../include/script/vocabulaire.js"></SCRIPT>
    <SCRIPT language="javascript" SRC="../../../../include/script/popup_menu.js"></SCRIPT>	
	<SCRIPT language="javascript">
	
	var tabNomToutesRubriques = new Array();
	
	<!-- BEGIN BLOC_TOUTES_RUBRIQUES -->
		
	tabNomToutesRubriques[{CPT_CODE_RUBRIQUE}] = "{CODE_RUBRIQUE_CONTROLE}";
		
	<!-- END BLOC_TOUTES_RUBRIQUES -->
	
	function verifFormCodeRubrique(obj)
	{ 
		var szCodeRubrique= obj.value;
		var exp=new RegExp("^[A-Z0-9_-]*$","g");
		if (exp.test(szCodeRubrique) == false)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_CODE.value);
			obj.focus();
			return false;
		}		
		else
			return true;		
	}
	
	function verifFormLibelleRubrique(obj)
	{ 
		var szLibelleRubrique= obj.value;
		var exp=new RegExp("^[\\\sa-zA-Z0-9àâçèéêîôùû_\\-'/\\.\\(\\)\\[\\]]*$","g");
  		if (exp.test(szLibelleRubrique) == false)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_LIBELLE.value);
			obj.focus();
			return false;
		}		
		else 
			return true;		
	}
 		
 	// Si Type Domaine fermé = "Aucun", Controle Domaine fermé = "Aucun" et "Verrouillé"
	function GererChangemementTypeDomFerme()
	{
		var szTypeRubrique = getCheckedValue(document.principal.POS_CHOIX_TYPE_RUBRIQUE);
		if (szTypeRubrique == 0)
			szNameSelectTypeDomFerme =  "document.principal.POS_TYPE_ALPHA_DOMFERME_RUBRIQUE";
		else
			szNameSelectTypeDomFerme =  "document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE";		
		var szTypeDomFermeSelectedIndex = eval(szNameSelectTypeDomFerme).options.selectedIndex;
		var szTypeDomFermeValue = eval(szNameSelectTypeDomFerme).options[szTypeDomFermeSelectedIndex].value;
		if (szTypeDomFermeValue == "0")
		{
			document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.disabled=true;
			document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.options.selectedIndex=0;
			document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.className = 'verrouille';
			document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.readOnly=true;			
		}
		else
		{ 
			document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.disabled=false;
			document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.className = 'inputChamp';
			document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.readOnly=false;
		}
	}
	
	function verrouillerInput(objInput, bVerrouille)
	{
	   objInput.className = bVerrouille ?  'verrouille' : 'inputChamp';
	   objInput.readOnly = bVerrouille ?  true : false;
    }
    
	function GererChangemementTypeRub(bRazDf)
	{ 
	    var szTypevalue = getCheckedValue(document.principal.POS_CHOIX_TYPE_RUBRIQUE);
		if(szTypevalue != "0")
		{	
			document.principal.POS_ATTRIBUT_MONO.checked=true;
			document.principal.POS_ATTRIBUT_MONO.disabled=true;
			document.getElementById("alpha_type_domferme").style.display="none";
			document.getElementById("nonalpha_type_domferme").style.display="";

			if(szTypevalue != "3")
			{				
				document.principal.POS_ATTRIBUT_SECOND.disabled=false;			
				document.principal.POS_ATTRIBUT_INVISIBLE.disabled=false;
                if (bRazDf)
				    document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE.options.selectedIndex=0;
				document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE.disabled = false;
                document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE.className = 'inputChamp';
				document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE.readOnly = false;												
			}
			else
			{
				document.principal.POS_ATTRIBUT_SECOND.checked=false;
			    document.principal.POS_ATTRIBUT_INVISIBLE.checked=false;
                document.principal.POS_ATTRIBUT_SECOND.disabled=true;
				document.principal.POS_ATTRIBUT_INVISIBLE.disabled=true;
				if (bRazDf)
				    document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE.options.selectedIndex=0;
				    
				document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE.disabled=true;
				document.principal.POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE.className = 'verrouille';
			}
			
			document.principal.POS_CODE_THESAURUS_RUBRIQUE.className = 'verrouille';
			document.principal.POS_CODE_THESAURUS_RUBRIQUE.readOnly=true;
            if (bRazDf)
            {
                if (szTypevalue == "1" || szTypevalue == "3")
                    document.principal.POS_NB_CAR_MAX_INDEX_RUBRIQUE.value = "11";
                else if (szTypevalue == "4")
                    document.principal.POS_NB_CAR_MAX_INDEX_RUBRIQUE.value = "20";
                else  if (szTypevalue == "2")
                    document.principal.POS_NB_CAR_MAX_INDEX_RUBRIQUE.value = "10";
            }  
                
			if (szTypevalue == "4" || szTypevalue == "2" || szTypevalue == "3")
			     verrouillerInput(document.principal.POS_NB_CAR_MAX_INDEX_RUBRIQUE, true);
			else
			     verrouillerInput(document.principal.POS_NB_CAR_MAX_INDEX_RUBRIQUE, false);
		}	
		else
		{
		    if (bRazDf)
			    document.principal.POS_ATTRIBUT_MONO.checked=false;
			document.principal.POS_ATTRIBUT_MONO.disabled=false;
			document.principal.POS_ATTRIBUT_SECOND.disabled=false;			
			document.principal.POS_ATTRIBUT_INVISIBLE.disabled=false;
			//document.principal.POS_CODE_THESAURUS_RUBRIQUE.setAttribute("className",'inputChamp');
			//document.principal.POS_CODE_THESAURUS_RUBRIQUE.readOnly=false;
			// précautions en cours de développement
			document.principal.POS_CODE_THESAURUS_RUBRIQUE.className = 'verrouille';
			document.principal.POS_CODE_THESAURUS_RUBRIQUE.readOnly=true;
			
			verrouillerInput(document.principal.POS_NB_CAR_MAX_INDEX_RUBRIQUE, false);
			if (bRazDf)
			document.principal.POS_NB_CAR_MAX_INDEX_RUBRIQUE.value="119";
			document.getElementById("alpha_type_domferme").style.display="";
			document.getElementById("nonalpha_type_domferme").style.display="none";
			document.principal.POS_TYPE_ALPHA_DOMFERME_RUBRIQUE.disabled=false;
			if (bRazDf)
			 document.principal.POS_TYPE_ALPHA_DOMFERME_RUBRIQUE.options.selectedIndex=0;
			document.principal.POS_TYPE_ALPHA_DOMFERME_RUBRIQUE.className = 'inputChamp';
			document.principal.POS_TYPE_ALPHA_DOMFERME_RUBRIQUE.readOnly = false;
		}
		document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.disabled=true;
		if (bRazDf)
		  document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.options.selectedIndex=0;
		document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.className = 'verrouille';
		document.principal.POS_CONTROLE_DOMFERME_RUBRIQUE.readOnly=true;
	}
	
	function verifNbCarMax(obj)
	{ 
		var iNbCar = eval(obj).value;
		var exp=new RegExp("^[0-9]*$","g");
  		if (exp.test(iNbCar) == false)
		{
			alert("{MESSAGE_VERIF_FORM_NUM}");
			obj.focus();
		}
		else
		{
			var ObjChoixTypeRub = document.principal.POS_CHOIX_TYPE_RUBRIQUE;
			for(var i=0; i < ObjChoixTypeRub.length; i++)
			{
				if (ObjChoixTypeRub[i].checked)
				{
					szTypeRubrique = ObjChoixTypeRub[i].value;
					break;
				}
			}
			
			if(szTypeRubrique == 0)
			{
				if (iNbCar > 119 || iNbCar == 0)
					alert("{MESSAGE_ALPHA_NB_CAR_AUTORISE}");
			}
			else if (szTypeRubrique == 1)
			{
				if (iNbCar > 11 || iNbCar == 0)
					alert("{MESSAGE_ENTIER_NB_CAR_AUTORISE}");
			}
		}
	}
	
	function lancerFormulaire()
	{ 
	 	with(document.principal)
		{
			if ((POS_CODE_RUBRIQUE.value.length) == 0) 
			{
				alert("{MESSAGE_CODE_RUBRIQUE_OBLIGATOIRE}");
				return false;
			}
			else if ((POS_LIBELLE_RUBRIQUE.value.length) == 0) 
			{
				alert("{MESSAGE_LIBELLE_RUBRIQUE_OBLIGATOIRE}");
				return false;
			}
			else if (verifFormCodeRubrique(POS_CODE_RUBRIQUE) && verifFormLibelleRubrique(POS_LIBELLE_RUBRIQUE))
			{ 
				for(i=0; i<tabNomToutesRubriques.length; i++)
				{
					if(POS_CODE_RUBRIQUE.value == tabNomToutesRubriques[i])
					{
						alert("{MESSAGE_CODE_RUBRIQUE_EXISTANT}");
						return false;
					}					
				}
		
    			// Si la case à coché est "checkéd" mais "disabled" (valeur constante pour les non alphanumériques),
    			// la valeur ne passe pas dans le formulaire
    			if (POS_ATTRIBUT_MONO.checked == true)
    				POS_MONOCRITERE.value = "1";
    			else 
    				POS_MONOCRITERE.value = "0";
    				
    			return true;
		    }
			else
				return false;
		
		}
	}
	
	function initEcran()
	{
	   if (document.principal.MODE.value == "CREATION")
	   {
	       document.principal.POS_CODE_RUBRIQUE.className = 'inputChamp';
	       document.principal.POS_CODE_RUBRIQUE.readOnly = false;
	       document.principal.POS_CODE_RUBRIQUE.focus();
       }
	   else if (document.principal.MODE.value == "MODIFICATION")
	   {
	       document.principal.POS_CODE_RUBRIQUE.className = 'verrouille';
	       document.principal.POS_CODE_RUBRIQUE.readOnly = true;
	       GererChangemementTypeRub(false);
	       GererChangemementTypeDomFerme();
        }
    }
	</SCRIPT>
</HEAD>

<BODY topmargin="2" leftmargin="10" onLoad="javascript:initEcran();">
<FORM NAME=principal ACTION="{URL_ATTENTE}" method="POST" onSubmit="return lancerFormulaire();">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="{CODE_ACTION}">
<INPUT TYPE=HIDDEN NAME="MODE" VALUE="{MODE}">
<INPUT TYPE=HIDDEN NAME="POS_MONOCRITERE" VALUE="{MONOCRITERE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_CODE" VALUE="{MESSAGE_VERIF_FORME_CODE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_LIBELLE" VALUE="{MESSAGE_VERIF_FORME_LIBELLE}">


<h1 align = "center">{TITRE_PAGE}</h1>
<table role='presentation' align="center">
<tr>
	<td valign='top' align='center'>
		<div class='groupe' style='margin:1em 1em 1em 1em'>
		<p class='groupe' style='display:{DISPLAY_LIBELLE_RUBRIQUE};'>								 														 														 														
			<span class='groupe'>{LIBELLE_RUBRIQUE} </span>													 													 													
		</p>
		<table role='presentation' class='groupe' cellpadding="5" cellspacing="5">
		  <tr>
    		<td>
				<table role='presentation' WIDTH="100%">																	
						<tr>									
							<td class="labelChamp">{LIBELLE_CODE_RUBRIQUE_LONG} </td>
							<td NOWRAP>
								<INPUT class="verrouille" NAME="POS_CODE_RUBRIQUE"  SIZE="3" VALUE="{CODE_RUBRIQUE}" MAXLENGTH=3 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormCodeRubrique(this);">
							</td>
												
							<td class="labelChamp">{LIBELLE_LIBELLE_RUBRIQUE} </td>
							<td NOWRAP>
								<INPUT class="inputChamp" NAME="POS_LIBELLE_RUBRIQUE" SIZE="30" VALUE="{LIBELLE_RUBRIQUE}" MAXLENGTH=47 onChange="javascript:verifFormLibelleRubrique(this);">
							</td>
						</tr>
						<tr>									
							<td class="labelChamp">{LIBELLE_CODE_THESAURUS_LONG} </td>
							<td NOWRAP>
								<INPUT class="verrouille" readonly NAME="POS_CODE_THESAURUS_RUBRIQUE"  SIZE="3" VALUE="{CODE_THESAURUS_RUBRIQUE}" MAXLENGTH=3>
							</td>		
							<td class="labelChamp">{LIBELLE_NB_CAR_A_INDEXER} </td>
							<td NOWRAP>
								<INPUT class="inputChamp" NAME="POS_NB_CAR_MAX_INDEX_RUBRIQUE" SIZE="5" VALUE="{NB_CAR_MAX_INDEX_RUBRIQUE}" MAXLENGTH=3 onChange="javascript:verifNbCarMax(this);">
							</td>
						</tr>
            		</table>
                </td>
        	</tr>
        	<tr>
				<td>
					<table role='presentation' class='groupe' border=1 cellspacing=0 cellpadding=0>								
					<tr>
						<td valign="top">
							<table role='presentation'>
								<tr>
									<th>{LIBELLE_ENTETE_TYPE_RUBRIQUE} </th>
								</tr>
								<tr>										
									<td class="normalleftalign">
										<input type="radio" name="POS_CHOIX_TYPE_RUBRIQUE" value="0" {CHECKED_ALPHA} OnClick="javascript:GererChangemementTypeRub(true);">{LIBELLE_TYPE_RUBRIQUE_ALPHA_LONG}
									</td>
								</tr>
								<tr>
									<td class="normalleftalign">
										<input type="radio" name="POS_CHOIX_TYPE_RUBRIQUE" value="1" {CHECKED_ENTIER} OnClick="javascript:GererChangemementTypeRub(true);">{LIBELLE_TYPE_RUBRIQUE_ENTIER}
									</td>
								</tr>
								<tr>
									<td class="normalleftalign">
										<input type="radio" name="POS_CHOIX_TYPE_RUBRIQUE" value="4" {CHECKED_DECIMAL} OnClick="javascript:GererChangemementTypeRub(true);">{LIBELLE_TYPE_RUBRIQUE_DECIMAL}
									</td>
								</tr>
								<tr>
									<td class="normalleftalign">
										<input type="radio" name="POS_CHOIX_TYPE_RUBRIQUE" value="2" {CHECKED_DATE} OnClick="javascript:GererChangemementTypeRub(true);">{LIBELLE_TYPE_RUBRIQUE_DATE}
									</td>
								</tr>
								<tr>
									<td class="normalleftalign">
										<input type="radio" name="POS_CHOIX_TYPE_RUBRIQUE" value="3" {CHECKED_TABLEAU} OnClick="javascript:GererChangemementTypeRub(true);">{LIBELLE_TYPE_RUBRIQUE_TABLEAU}
									</td>
								</tr>
							</table>
						</td>
						<td valign="top">
								<table role='presentation'>
									<tr>
										<th>{LIBELLE_ENTETE_ATTRIBUTS_RUBRIQUE} </th>
									</tr>							
									<tr>										
										<td class="normalleftalign">
											<input type="checkbox" {CHECKED_CHOIX_MONO_RUBRIQUE} name="POS_ATTRIBUT_MONO" value="1">{LIBELLE_ATTRIBUTS_RUBRIQUE_MONOCRITERE}
										</td>
									</tr>
									<tr>
										<td class="normalleftalign">
											<input type="checkbox" {CHECKED_CHOIX_SECOND_RUBRIQUE} name="POS_ATTRIBUT_SECOND" value="1">{LIBELLE_ATTRIBUTS_RUBRIQUE_SECONDAIRE}
										</td>
									</tr>
									<tr>
										<td class="normalleftalign">
											<input type="checkbox" {CHECKED_CHOIX_INVISIBLE_RUBRIQUE} name="POS_ATTRIBUT_INVISIBLE" value="1">{LIBELLE_ATTRIBUTS_RUBRIQUE_INVISIBLE}
										</td>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr><td>&nbsp;</td></tr>								
								</table>
							</td>
							<td valign="top" rowspan="2">
								<table role='presentation'>
									<tr>
										<th>{LIBELLE_ENTETE_CONTENUE_DANS_TYPE} </th>
									</tr>
									<tr><td>&nbsp;</td></tr>
									<tr>
										<td align='center'>
											<TEXTAREA class="verrouille" readonly WRAP='SOFT' NAME="POS_CONTENUE_DANS_TYPES"  COLS="10" ROWS="10">{CONTENUE_DANS_TYPES}</TEXTAREA>
										</td>
									</tr>
								</table>																
							</td>
						</tr>
						
						<tr>
							<td colspan="2">
								<table role='presentation'>
									<tr>
										<th colspan="2">{LIBELLE_ENTETE_DOMAINES_FERMES_RUBRIQUE} </th>
									</tr>
									<tr>
										<td class="labelChamp">{LIBELLE_TYPE_DOMAINES_FERMES_RUBRIQUE} </td>
										<td NOWRAP id="alpha_type_domferme" align="left" style="display:;">
											<SELECT class="inputChamp" NAME="POS_TYPE_ALPHA_DOMFERME_RUBRIQUE"  SIZE="1" onChange="javascript:GererChangemementTypeDomFerme();">																			
												<OPTION VALUE="0" {ALPHA_SELECTED_TYPE_DOMFERME_AUCUN}>{LIBELLE_DOMFERME_AUCUN}</OPTION>
												<OPTION VALUE="1" {ALPHA_SELECTED_TYPE_DOMFERME_NORMAL}>{LIBELLE_DOMFERME_NORMAL}</OPTION>
												<OPTION VALUE="2" {ALPHA_SELECTED_TYPE_DOMFERME_UTIL}>{LIBELLE_DOMFERME_UTIL}</OPTION>
												<!--
												<OPTION VALUE="3" {ALPHA_SELECTED_TYPE_DOMFERME_REQUETE_LDAP}>{LIBELLE_DOMFERME_REQUETE_LDAP}</OPTION>
												-->
												<OPTION VALUE="4" {ALPHA_SELECTED_TYPE_DOMFERME_PROFIL_UTIL}>{LIBELLE_DOMFERME_PROFIL_UTIL}</OPTION>
											</SELECT>
										</td>
						
										<td NOWRAP id="nonalpha_type_domferme" align="left" style="display:none;">
											<SELECT class="inputChamp" NAME="POS_TYPE_NONALPHA_DOMFERME_RUBRIQUE"  SIZE="1"  onChange="javascript:GererChangemementTypeDomFerme();">																			
												<OPTION VALUE="0" {NONALPHA_SELECTED_TYPE_DOMFERME_AUCUN}>{LIBELLE_DOMFERME_AUCUN}</OPTION>
												<OPTION VALUE="1" {NONALPHA_SELECTED_TYPE_DOMFERME_NORMAL}>{LIBELLE_DOMFERME_NORMAL}</OPTION>
											</SELECT>
										</td>
									</tr>
									<tr>
										<td class="labelChamp">{LIBELLE_CONTROLE_DOMAINES_FERMES_RUBRIQUE} </td>
										<td NOWRAP style="text-align:center">
											<SELECT class="inputChamp" NAME="POS_CONTROLE_DOMFERME_RUBRIQUE"  SIZE="1">																			
												<OPTION VALUE="2" {SELECTED_CONTROLE_DOMFERME_AUCUN}>{CONTROLE_DOMFERME_AUCUN}</OPTION>
												<OPTION VALUE="1" {SELECTED_CONTROLE_DOMFERME_VERIF_APPARTENANCE}>{CONTROLE_DOMFERME_VERIF_APPARTENANCE}</OPTION>
												<OPTION VALUE="3" {SELECTED_CONTROLE_DOMFERME_VERIF_NON_APPARTENANCE}>{CONTROLE_DOMFERME_VERIF_NON_APPARTENANCE}</OPTION>
											</SELECT>
										</td>
									</tr>													
								</table>	
							</td>
						</tr>							
				</table>
			</td>
		</tr>
		</TABLE>
		</div>
	</td>
</tr>
</TABLE>
<BR>
<CENTER>
    <INPUT TYPE=SUBMIT class="bouton_sub" VALUE="{LIBELLE_VALIDER}">
    <INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}" onClick="location.href='{URL_ANNULER}'">
</CENTER>
</FORM>
</BODY>
</HTML>
