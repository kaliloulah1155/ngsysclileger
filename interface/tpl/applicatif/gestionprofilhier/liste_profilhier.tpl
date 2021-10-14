<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
	<title>{TITRE_PAGE}</title>
	<link REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="/{NOM_APPLICATION}/include/script/action_profilhier.js"></SCRIPT>
    <SCRIPT language="javascript">
    
    var tabNomTousProfilsHier = new Array();
	
	<!-- BEGIN BLOC_TAB_PROFILS_HIER -->
		
	tabNomTousProfilsHier[{CPT_PROFIL_HIER}] = "{PROFIL_HIERARCHIQUE}";
		
	<!-- END BLOC_TAB_PROFILS_HIER -->
	
	function verifFormProfilHier(obj)
	{ 
		var szInfoProfilHier= obj.value;
		var exp=new RegExp("^[A-Z0-9юбгхийнтыш_'/]*$","g");
		if (exp.test(szInfoProfilHier) == false)
		{
			alert(document.principal.MESSAGE_VERIF_FORME_LIBELLE.value);
			obj.focus();
			return false;
		}		
		else
			return true;		
	}
	
	function AjoutProfilHier()
	{
		szProfilHier = document.principal.POS_PROFIL_HIER.value;
		
		if ((szProfilHier.length) == 0) 
		{
			alert("{MESSAGE_CODE_PROFILHIER_OBLIGATOIRE}");
			return false;
		}
		else if (verifFormProfilHier(document.principal.POS_PROFIL_HIER)) 
		{ 
			for(i=0; i<tabNomTousProfilsHier.length; i++)
			{
				if(szProfilHier == tabNomTousProfilsHier[i])
				{
					alert("{MESSAGE_CODE_PROFILHIER_EXISTANT}");
					return false;
				}					
			}
			
			if(CST_TYPE_APPLI == 1)
				szUrlAjoutProfilHier="../../../../interface/session/principal/gestionprofilhier/modifier_liste_profilhier.php?MODE=CREATION&POS_PROFIL_HIER="+escape(szProfilHier);
	 		else
	 			szUrlAjoutProfilHier="../../../../servlet/interface/session/principal/gestionprofilhier.ModifierListeProfilHier?MODE=CREATION&POS_PROFIL_HIER="+escape(szProfilHier);
	 		
	 		afficherLien(szUrlAjoutProfilHier);
	 		
			return true;
		}
		else 
			return false;
	}
	
	function AnnulerAjoutProfilHier()
	{
	 	document.getElementById("bloc_choix_action").style.display='';
		document.getElementById("bloc_ajout_profilhier").style.display='none';
		document.principal.POS_PROFIL_HIER.value= "";
	
	}
    // Liste des boutons
    var sitems=new Array();
    var sitemlinks=new Array();
    
    var i = 0;
    
    sitems[i]="{LIBELLE_AJOUTER}";
    sitemlinks[i++]="onCreerProfilHier()";
    
//    sitems[i]="<HR>";
   // sitemlinks[i++]="";
    
    sitems[i]="{LIBELLE_SUPPRIMER}";
    sitemlinks[i++]="onSupprimerProfilHier()";
    
    
    function initEcranGestionProfilHier()
    {
        affiche_boutons();
        parent.setTitle();
    }
    </SCRIPT>
</head>
<body topmargin="10" leftmargin="10" onLoad="initEcranGestionProfilHier();">
<h1 align = "center">{TITRE_PAGE}</h1>
<table align="center" border="0" cellpadding="0" cellspacing="0">
<tr>
	<td align="center">
		<form NAME=principal>
		<input TYPE=hidden NAME=MESSAGE_SELECT_REP VALUE="{MESSAGE_SELECT_PROFILHIER}">
		<input TYPE=hidden NAME=MESSAGE_SUPP_PROFIL VALUE="{MESSAGE_SUPP_PROFILHIER}">		
		<input TYPE=hidden NAME=DROIT_ADMINISTRATION VALUE="{DROIT_ADMINISTRATION}">
		<input TYPE=hidden NAME=MESSAGE_NO_ADMINISTRATION VALUE="{MESSAGE_NO_ADMINISTRATION}">
		<input TYPE=hidden NAME=MESSAGE_VERIF_FORME_LIBELLE VALUE="{MESSAGE_VERIF_FORME_LIBELLE}">
		
		<table align="center" width="350px" cellpadding="0" cellspacing="5">
		<tr>
		    <td class="tdfond" colspan='2'>
				<table class="tdfond" width="305px" cellpadding="2" cellspacing="1">
					<tr>
						<td class="tableau" width="300px">{LIBELLE_LISTE_PROFILHIER}</td>
					</tr>
				</table>
				<div style="height: 200px; width=330px; overflow-x : hidden; overflow-y: auto;">
					<table class="tdfond" width="305px" cellpadding="2" cellspacing="1">
			<!-- BEGIN BLOC_PROFIL_HIER -->
						<tr class="line-bib" data-line="{PAIR_OU_IMPAIR}" onclick="selectLigne(event, this, '{POS_INFO_PROFIL_HIER}');">
							<td data-menu="no" class="tdnormal" width="20px" align="center" width="5%">
                            <input data-menu="no" TYPE="RADIO" NAME="INFO_PROFIL_HIER" VALUE="{POS_INFO_PROFIL_HIER}"></td>
							<td class="tdnormal" width="175px">{PROFIL_HIERARCHIQUE}</td>
						</tr>
			<!-- END BLOC_PROFIL_HIER -->
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<td  colspan='2'>&nbsp;</td>
		</tr>
		<tr id='bloc_choix_action'>
			<td  colspan='2'align="center">
			<SCRIPT language="javascript">              
	document.write("<DIV id='bouton'></DIV>");
			</SCRIPT>
			</td>
		</tr>
		<tr id='bloc_ajout_profilhier' style='display:none;'>
			<td align="center">
				<table>
						<tr>
							<td>{LIBELLE_NOUVEAU_PROFILHIER}</td>
							<td><input TYPE="text" class="inputChamp" NAME="POS_PROFIL_HIER" SIZE="12" MAXLENGTH="12" style="text-transform:uppercase;" onChange="javascript:this.value=this.value.toUpperCase();javascript:verifFormProfilHier(this);"></td>
						</tr>
						<tr>&nbsp;</tr>
						<tr>&nbsp;</tr>
						<tr>&nbsp;</tr>
						<tr>&nbsp;</tr>
						<tr>
							<td colspan="2" align="center">
							<INPUT class=bouton TYPE=BUTTON align='right' VALUE="{LIBELLE_AJOUTER}" onClick="AjoutProfilHier()">
							<INPUT class=bouton TYPE=BUTTON align='left' VALUE="{LIBELLE_ANNULER}" onClick="AnnulerAjoutProfilHier()">
							</td>
						</tr>
				</table>
			</td>
		</tr>
		</table>
		</form>
	</td>
</tr>
</table>
</body>
</html>    
