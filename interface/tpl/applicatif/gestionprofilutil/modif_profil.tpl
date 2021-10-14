<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
	<TITLE>{TITRE_PAGE}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="../../../../include/script/recupcontrolsaisie.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="../../../../include/script/navigation.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="../../../../include/script/vocabulaire.js"></SCRIPT>	
	<SCRIPT language="javascript">
	var tabNomTousProfils = new Array();
	<!-- BEGIN BLOC_TOUS_NOMS_PROFILS -->
	tabNomTousProfils[{CPT_NOM_PROFIL}] = "{NOM_PROFIL}";
	<!-- END BLOC_TOUS_NOMS_PROFILS -->
	
	function lancerFormulaire()
	 {
	 	with(document.principal)
		{ 
			if(MODE.value == 'CREATION')
			{
				if ((POS_CODE_PROFIL.value.length) == 0) 
				{
					alert("{MESSAGE_CODE_PROFIL_OBLIGATOIRE}");
					return false;
				}
				else if (verifFormProfil(POS_CODE_PROFIL) && verifFormProfil(POS_FONC_PROFIL))
				{ 
					for(i=0; i<tabNomTousProfils.length; i++)
					{
						if(POS_CODE_PROFIL.value == tabNomTousProfils[i])
						{
							alert("{MESSAGE_CODE_PROFIL_EXISTANT}");
							return false;
						}					
					}
					return true;
				}
				else
					return false;
					
			}
			else if (verifFormProfil(POS_FONC_PROFIL))
			{
				return true;
			}
			else
				return false;
		}
	 }
	
	function verifFormProfil(obj)
	{ 
		var szInfoProfil= obj.value;
		var exp=new RegExp("^[A-Z0-9юбгхийнтыш_'/]*$","g");
  		if (exp.test(szInfoProfil) == false)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_CODE.value);
			obj.focus();
			return false;
		}		
		else 
			return true;
	}
	
	function verifFormCloisonnement(obj)
	{ 
		var szNomVolume= obj.value;
		var exp=new RegExp("[^A-Z0-9\n]+","g");	
  		if (exp.test(szNomVolume) == true)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_ALPHANUM.value);
			obj.value="";
			return false;
		} 		
		else
			return true;	
	}
	
	function LibereCloisonnementTableau()
	{
		with(document.principal)
		{
	    	var szNomChamp = "";
	    	for(i=1; i<parseInt(MAX_VOL_CLOISONNEMENT.value) +1; i++)	
			{
				szNomChamp = "POS_VOLUME_" + i;
				if(POS_TOUS_LES_VOLUMES.checked == false)
				{
					document.getElementById(szNomChamp).readOnly = false;
					document.getElementById(szNomChamp).className = 'inputChamp';
				}
				else 
				{
					document.getElementById(szNomChamp).value = "";
					document.getElementById(szNomChamp).readOnly = true;
					document.getElementById(szNomChamp).className = 'verrouille';
				
				}
			}		    		        
	    }
	}

	function GestionTypesIndexation()
	{
		with(document.principal)
		{ 
			for(i=1; i<parseInt(MAX_DOCUMENT_TYPE.value) + 1; i++)
			{
				szNomChamp = "DOCUMENT_INDEX_" + i;
				document.getElementById(szNomChamp).checked=false;
				if(POS_TOUS_DOCUMENTS_INDEX.checked == true)
					document.getElementById(szNomChamp).disabled = true;
				else
					document.getElementById(szNomChamp).disabled = false;
			}
		}		
	}
	function GestionTypesRecherche()
	{
		with(document.principal)
		{ 
			for(i=1; i<parseInt(MAX_DOCUMENT_TYPE.value) + 1; i++)
			{
				szNomChamp = "DOCUMENT_RECH_" + i;
				document.getElementById(szNomChamp).checked=false;
				if(POS_TOUS_DOCUMENTS_RECH.checked == true)
					document.getElementById(szNomChamp).disabled=true;
				else
					document.getElementById(szNomChamp).disabled=false;
			}
		}	
	}
	
	</SCRIPT>
</HEAD>

<BODY>
<FORM NAME=principal ACTION="{URL_ATTENTE}" method="POST" onSubmit="return lancerFormulaire();">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="{CODE_ACTION}">

<INPUT TYPE=HIDDEN NAME="MODE" VALUE="{MODE}">
<INPUT TYPE=HIDDEN NAME="MAX_VOL_CLOISONNEMENT" VALUE="{MAX_VOL_CLOISONNEMENT_VALUE}">
<INPUT TYPE=HIDDEN NAME="MAX_DOCUMENT_TYPE" VALUE="{MAX_DOCUMENT_TYPE_VALUE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_CODE" VALUE="{MESSAGE_VERIF_FORME_CODE}">
<INPUT TYPE=HIDDEN NAME="MESSAGE_VERIF_FORME_ALPHANUM" VALUE="{MESSAGE_VERIF_FORME_ALPHANUM}">

<h1>{TITRE_PAGE}</h1>
<table role='presentation' width="100%" align="center">
<tr>
	<td class='sansonglet' colspan='5'>
		<table role='presentation' WIDTH="100%">
		<tr>
			<td colspan='5' valign='top' align='center'>
				<div class='groupe' style='margin:1em 1em 1em 1em'>
					<table role='presentation' WIDTH="95%">
					   <tr>
                    		<td class="labelChamp">{LIBELLE_CHAMP_PROFIL_PROFIL_UTIL}</td>
                			<td NOWRAP>
                				<INPUT class="{CLASS_INFOS}" {READONLY_INFOS} NAME="POS_CODE_PROFIL"  SIZE="30" VALUE="{CODE_PROFIL}" MAXLENGTH=47 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormProfil(this);">
                			</td>
                			<td class="labelChamp">{LIBELLE_FONCTION}</td>
                			<td NOWRAP>
                				<INPUT class="inputChamp" NAME="POS_FONC_PROFIL" SIZE="30" VALUE="{FONC_PROFIL}" MAXLENGTH=23 style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormProfil(this);">
                			</td>
                			<td class="labelChamp">{LIBELLE_SERVICE}</td>
                			<td NOWRAP>
                				<SELECT class="inputChamp" NAME="POS_SERVICE_PROFIL"  SIZE="1">						
                				<!-- BEGIN BLOC_TOUS_SERVICES -->
                				<OPTION VALUE="{SERVICE_PROFIL}" {TOUS_SERVICE_SELECTED}>{SERVICE_PROFIL}</OPTION>
                				<!-- END BLOC_TOUS_SERVICES -->
                				</SELECT>
                			</td>
			
                			<td class="labelChamp">{LIBELLE_PROFIL_INDEX}</td>
                			<td NOWRAP>
                					<SELECT class="inputChamp" NAME="POS_PROFIL_INDEX"  SIZE="1">
                					<!-- BEGIN BLOC_TOUS_PROFILS_INDEX -->
                					<OPTION VALUE="{PROFIL_INDEX}" {TOUS_PROFIL_INDEX_SELECTED}>{PROFIL_INDEX}</OPTION>
                					<!-- END BLOC_TOUS_PROFILS_INDEX -->
                					</SELECT>
                			</td>
                			<td class="labelChamp">{LIBELLE_PROFIL_HIER}</td>
                			<td NOWRAP>
                				<SELECT class="inputChamp" NAME="POS_PROFIL_HIER"  SIZE="1">
                				<!-- BEGIN BLOC_TOUS_PROFILS_HIERARCHIQUES -->
                				<OPTION VALUE="{PROFIL_HIERARCHIQUE}" {TOUS_PROFIL_HIERARCHIQUE_SELECTED}>{PROFIL_HIERARCHIQUE}</OPTION>
                				<!-- END BLOC_TOUS_PROFILS_HIERARCHIQUES -->
                				</SELECT>
                			</td>
						</tr>										
					</table>
				</div>
			</td>
		</tr>
		<tr>	
			<td colspan='1' valign='top'>
				<div class='groupe' style='margin:1em 1em 1em 1em;'>
				<p class='groupe'><span class='groupe'>{LIBELLE_ENTETE_PERMISSIONS_PROFIL_UTIL}</span></p>
						<table role='presentation'>
							<tr>
                                <td>
								<table role='presentation' class='contenugroupe'>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_ADMIN" {DRT_ADMIN_CHECKED}>{LIBELLE_CHAMP_ADMINISTRER_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_ADMIN_THES" {DRT_ADMIN_THES_CHECKED}>{LIBELLE_CHAMP_ADMIN_THES_PROFIL_UTIL}</td>
						</tr>
						<tr>	
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_CREER_INDEX" {DRT_CREER_INDEX_CHECKED}>{LIBELLE_CHAMP_CREER_INDEX_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_CONSULT_INDEX" {DRT_CONSULT_INDEX_CHECKED}>{LIBELLE_CHAMP_CONSULT_INDEX_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_MODIF_INDEX" {DRT_MODIF_INDEX_CHECKED}>{LIBELLE_CHAMP_MODIF_INDEX_PROFIL_UTIL}</td>
						</tr>	
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_SUPPRIM_INDEX" {DRT_SUPPRIM_INDEX_CHECKED}>{LIBELLE_CHAMP_SUPPRIM_INDEX_PROFIL_UTIL}</td>
						</tr>	
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_MODIF_FICHIER" {DRT_MODIF_FICHIER_CHECKED}>{LIBELLE_CHAMP_MODIF_FICHIER_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_NUMERISER" {DRT_NUMERISER_CHECKED}>{LIBELLE_CHAMP_NUMERISER_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_LR" {DRT_GEST_LR_CHECKED}>{LIBELLE_CHAMP_GEST_LISTRES_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_DOSSIER" {DRT_GEST_DOSSIER_CHECKED}>{LIBELLE_CHAMP_GEST_DOSSIER_PROFIL_UTIL}</td>
						</tr>								
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_MAJ_RAFALE" {DRT_MAJ_RAFALE_CHECKED}>{LIBELLE_CHAMP_MAJRAF_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_DOM_FERME" {DRT_GEST_DOM_FERME_CHECKED}>{LIBELLE_CHAMP_GEST_DOMFERME_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_LISTHIER" {DRT_GEST_LISTHIER_CHECKED}>{LIBELLE_CHAMP_GEST_LISTHIER_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_UTIL" {DRT_GEST_UTIL_CHECKED}>{LIBELLE_CHAMP_GEST_UTIL_PROFIL_UTIL}</td>
						</tr>
						<tr><td>&nbsp;</td></tr>
						<tr>
							<td  class="normalleftalign" nowrap>{LIBELLE_INFO_PERMIS_NON_WEB_PROFIL_UTIL}</td>
						</tr>
						<tr>
							<td align="left">
								<span class="tableonglet">{LIBELLE_ENTETE_AFFICHER_PERMIS_NON_WEB_PROFIL_UTIL}<a onClick="afficheMasqueBloc('v1')"><img id="img_v1" src="../../../../images/icons/plus1.gif" class="iconbloc"></a></span></p>
								<table role='presentation' id="bloc_v1" style='display:none;' width="100%">	
								<tr>
									<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_NOTE_EXT" {DRT_GEST_NOTE_EXT_CHECKED}>{LIBELLE_CHAMP_GEST_NOTE_EXT_PROFIL_UTIL}</td>
								</tr>
								<tr>
									<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_ANNOTATION" {DRT_GEST_ANNOTATION_CHECKED}>{LIBELLE_CHAMP_GEST_ANNOTATION_PROFIL_UTIL}</td>
								</tr>
								<tr>
									<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_GEST_FOND_PAGE" {DRT_GEST_FOND_PAGE_CHECKED}>{LIBELLE_CHAMP_GEST_FOND_PAGE_PROFIL_UTIL}</td>
								</tr>
								<tr>
									<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_VISU_HISTO" {DRT_VISU_HISTO_CHECKED}>{LIBELLE_CHAMP_VISU_HISTO_PROFIL_UTIL}</td>
								</tr>							
								<tr>
									<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_CONNECTION_NT" {DRT_CONNECTION_NT_CHECKED}>{LIBELLE_CHAMP_CONECT_NT_PROFIL_UTIL}</td>
								</tr>
								<tr>
									<td class="normalleftalign" nowrap><input type="checkbox" name="POS_DRT_IMPRIMER" {DRT_IMPRIMER_CHECKED}>{LIBELLE_CHAMP_IMPRIMER_PROFIL_UTIL}</td>
								</tr>
								</table>
							</td>
						</tr>
					</table>
					
					</td></tr>
					</table>
				</div>					
			</td>					
			<td colspan='1' valign='top' align='center'>
				<div class='groupe' style='margin:1em 1em 1em 1em;height:100%;min-height:435px;'>
				<p class='groupe'>								 														 														 														
					<span class='groupe'>{LIBELLE_ENTETE_DISPONIBILITE_PROFIL_UTIL}</span>													 													 													
				</p>
						<table role='presentation' align="center" width="40%">
						<tr>
							<td align='center'>
								<table role='presentation'>										
								<tr>
									<td>
										<table role='presentation'>													
											<tr style="font-weight:bold">
												<td nowrap>{LIBELLE_ENTETE_EN_INDEXATION_PROFIL_UTIL}</td>
											</tr>
											
											<tr style="font-weight:bold">
												<td class="normalleftalign" nowrap><input type="checkbox" name="POS_TOUS_DOCUMENTS_INDEX" {TOUS_DOCUMENTS_INDEX_CHECKED} onClick=GestionTypesIndexation(this)>{LIBELLE_ENTETE_TOUS_PROFIL_UTIL}</td>
												<td nowrap align="right" valign="bottom">{LIBELLE_ENTETE_CODE_PROFIL_UTIL}</td>
												<td nowrap class="normalleftalign" valign="bottom">{LIBELLE_ENTETE_LIBELLE_PROFIL_UTIL}</td>
												
											</tr>
											<tr>
												<td nowrap>&nbsp;</td>
											</tr>						
											<!-- BEGIN BLOC_DOCUMENT_INDEX -->
											<tr>
												<td class="normalleftalign" nowrap><input type="checkbox" name="{POS_DOCUMENT_INDEX}" id="{DOCUMENT_INDEX_ID}" {DOCUMENT_INDEX_CHECKED} {DOCUMENT_INDEX_DISABLED}><!--{CODE_DOCUMENT_INDEX}--></td>
												<td nowrap valign="bottom">{CODE_DOCUMENT_INDEX}</td>
												<td nowrap class="normalleftalign" valign="bottom">{LIBELLE_DOCUMENT_INDEX}</td>
											</tr>
											<!-- END BLOC_DOCUMENT_INDEX -->
										</table>
									</td>
									<td align='center'>
										<table role='presentation'>							
										<tr style="font-weight:bold">														
												<td nowrap  colspan='2'>{LIBELLE_ENTETE_EN_RECHERCHE_PROFIL_UTIL}</td>
										</tr>
										
										<tr  style="font-weight:bold">
											<td class="normalleftalign" nowrap><input type="checkbox" name="POS_TOUS_DOCUMENTS_RECH" {TOUS_DOCUMENTS_RECH_CHECKED} onClick=GestionTypesRecherche(this)>{LIBELLE_ENTETE_TOUS_PROFIL_UTIL}</td>
										</tr>	
										<tr>
											<td nowrap>&nbsp;</td>
										</tr>														
										<!-- BEGIN BLOC_DOCUMENT_RECH -->
										<tr>
											<td class="normalleftalign" nowrap><input type="checkbox" name="{POS_DOCUMENT_RECH}" id="{DOCUMENT_RECH_ID}" {DOCUMENT_RECH_CHECKED} {DOCUMENT_RECH_DISABLED}><!--{CODE_DOCUMENT_RECH}--></td>
											<!--td nowrap valign="bottom">{LIBELLE_DOCUMENT_RECH}</td-->
										</tr>	
										<!-- END BLOC_DOCUMENT_RECH -->
										</table>
									</td>
									
								</tr>
								</table>
							</td>
					</tr>
					</table>
				</div>
			</td>
			<td valign='top' align='right'>
				<table role='presentation'>
					<tr>
						<td valign='top'>
							<div class='groupe' style='margin:1em 1em 1em 1em;'>
							<p class='groupe'>								 														 														 														
								<span class='groupe'>{LIBELLE_ENTETE_CLOISONNEMENT_PROFIL_UTIL}</span>													 													 													
							</p>
								<table role='presentation' align="center">
									<tr>
										<td>
											<table role='presentation' width="100%">
												<tr>
													<td nowrap><input type="checkbox" name="POS_TOUS_LES_VOLUMES" {TOUS_LES_VOLUMES_CHECKED} onClick=LibereCloisonnementTableau(this)>{LIBELLE_ENTETE_TOUS_VOLUMES_PROFIL_UTIL}</td>
												</tr>
												<tr style="font-weight:bold" align='center'>
													<td>{LIBELLE_ENTETE_VOLUMES_PROFIL_UTIL}</td>															
												</tr>																							
												<!-- BEGIN BLOC_CLOISONNEMENT_1 -->
												<tr>
													<td  align="center" NOWRAP>
														<INPUT class="{CLASS_CLOISONNEMENT}" {READONLY_CLOISONNEMENT} NAME="POS_VOLUME_{CPT}" id="POS_VOLUME_{CPT}" SIZE="2" maxlength="3" style="text-transform:uppercase;" VALUE="{VOLUME}" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormCloisonnement(this);">
													</td>
												</tr>
												<!-- END BLOC_CLOISONNEMENT_1 -->
												<tr><td>&nbsp;</td></tr>														
											</table>
											</td>
											</tr>
											<tr>
											<td align="left">
											<span class="tableonglet">{LIBELLE_ENTETE_VOLUMES_SUIVANTS_PROFIL_UTIL}<a onClick="afficheMasqueBloc('v3')"><img id="img_v3" src="../../../../images/icons/plus1.gif" class="iconbloc"></a></span></p>
											<table role='presentation' id="bloc_v3" style='display:none;' width="100%">																									
											<!-- BEGIN BLOC_CLOISONNEMENT_2 -->
											<tr>
												<td  align="center" NOWRAP>
													<INPUT class="{CLASS_CLOISONNEMENT}" {READONLY_CLOISONNEMENT} NAME="POS_VOLUME_{CPT}" id="POS_VOLUME_{CPT}" SIZE="2" maxlength="3" style="text-transform:uppercase;" VALUE="{VOLUME}" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormCloisonnement(this);">
												</td>
											</tr>
											<!-- END BLOC_CLOISONNEMENT_2 -->	
											</table>
										</td>
									</tr>
								</table>
							</div>
						</td>   
					</tr>
						<tr>
							<td valign='top'>
								<div class='groupe' style='margin:1em 1em 1em 1em;min-height:159px'>
								<p class='groupe'>								 														 														 														
									<span class='groupe'>{LIBELLE_ENTETE_CONFIDENTIALITE_PROFIL_UTIL}</span>													 													 													
								</p>
									<table role='presentation' align="center">
										<tr>
											<td>
												<table>
													<tr>
														<th class="normalleftalign" nowrap>{LIBELLE_ENTETE_NUMERO_PROFIL_UTIL}</th>
														<th class="normalleftalign" nowrap>{LIBELLE_ENTETE_HABILITATION_PROFIL_UTIL}</th>
														<th class="normalleftalign" nowrap>{LIBELLE_ENTETE_NIVEAU_PROFIL_UTIL}</th>
													</tr>
														<!-- BEGIN BLOC_CONFIDENTIALITE_1 -->
													<tr>
														<td class="normalleftalign" nowrap>{NUMERO_CONFIDENTIALITE}</td>
														<td class="normalleftalign" nowrap>{HABILITATION_CONFIDENTIALITE}</td>
														<td><INPUT class="inputChamp" NAME="{POS_NIVEAU_CONFIDENTIALITE_NAME}"  size="2" maxlength="3" VALUE="{NIVEAU_CONFIDENTIALITE_VALUE}" onBlur="javascript:isANumber(this);"></td>
													</tr>	
														<!-- END BLOC_CONFIDENTIALITE_1 -->
													<tr><td>&nbsp;</td></tr>	
												</table>
											</td>
										</tr>
										<tr>
											<td align="left">
												<span class="tableonglet">{LIBELLE_ENTETE_NIVEAUX_SUIVANTS_PROFIL_UTIL}<a onClick="afficheMasqueBloc('v2')"><img id="img_v2" src="../../../../images/icons/plus1.gif" class="iconbloc"></a></span></p>
												<table id="bloc_v2" style='display:none;'>
													<tr style="visibility:hidden;">
														<th class="normalleftalign" nowrap>{LIBELLE_ENTETE_NUMERO_PROFIL_UTIL}</th>
														<th class="normalleftalign" nowrap>{LIBELLE_ENTETE_HABILITATION_PROFIL_UTIL}</th>
														<th class="normalleftalign" nowrap>{LIBELLE_ENTETE_NIVEAU_PROFIL_UTIL}</th>
													</tr>
													<!-- BEGIN BLOC_CONFIDENTIALITE_2 -->
													<tr>
														<td class="normalleftalign" nowrap>{NUMERO_CONFIDENTIALITE}</td>
														<td class="normalleftalign" nowrap>{HABILITATION_CONFIDENTIALITE}</td>
														<td><INPUT class="inputChamp" NAME="{POS_NIVEAU_CONFIDENTIALITE_NAME}"  size="2" maxlength="3" VALUE="{NIVEAU_CONFIDENTIALITE_VALUE}" onBlur="javascript:isANumber(this);"></td>
													</tr>	
														<!-- END BLOC_CONFIDENTIALITE_2 -->		
												</table>
											</td>
										</tr>
									</table>
								</div>					
							</td>
						</tr>
				</table>
			</td>										
		</tr>				
				
		</TABLE>
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
