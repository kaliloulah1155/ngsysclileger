<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
	<TITLE>{LIBELLE_TITRE} '{CODE_UTIL}'</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="/{NOM_APPLICATION}/include/style/style.css">
	<SCRIPT language="javascript" SRC="../../../../include/script/vocabulaire.js"></SCRIPT>
	<script src="../../../../include/script/md5.js"></script>
	<script src="../../../../include/script/cryptor.js"></script>
	<SCRIPT language="javascript">
	
	// gestion du mot de passe en modification
	
	function getXmlHttpRequestObject()
	{	
		if (window.XMLHttpRequest)
		{
			return new XMLHttpRequest();
		}
		else if(window.ActiveXObject)
		{
			return new ActiveXObject("Microsoft.XMLHTTP");
		}
	}
	
	function replaceAll(str, search, repl) { 
      while (str.indexOf(search) != -1) 
    	 str = str.replace(search, repl); 
    	return str; 
    }
	
	function ReinitialisePwdUtil()
	{
		var searchReq = getXmlHttpRequestObject();
		var szRequete = "/{NOM_APPLICATION}/interface/session/principal/gestionutil/modif_pwd_util.php";
        if(CST_TYPE_APPLI == 2)
            szRequete = "../../../../servlet/interface/session/principal/gestionutil.ModifierPwdUtil";
		var szCorps = "POS_NV_PWD=" + replaceAll(escape(crypt_text(document.principal.POS_NV_PWD.value,'{SESS_CRYPTKEY}')), "+", "%2B");
		szCorps += "&POS_COPIE_NV_PWD=" + replaceAll(escape(crypt_text(document.principal.POS_COPIE_NV_PWD.value,'{SESS_CRYPTKEY}')), "+", "%2B");
		szCorps += "&POS_CODE_UTIL=" + document.principal.POS_CODE_UTIL.value;
		
		searchReq.open("POST", szRequete, false);
		searchReq.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
		searchReq.send(szCorps);
	    if (searchReq.readyState == 4 || searchReq.readyState == 0)
		{		  	
		  	var obj = eval('(' + searchReq.responseText + ')');
			if (obj.code_retour == 1)
        	{   
				alert(obj.msg_retour);
		   		document.principal.POS_NV_PWD.value = "";
				document.principal.POS_COPIE_NV_PWD.value = ""; 
				document.getElementById('bloc_v1').style.display = "none";
				document.getElementById("img_v1").src = "/{NOM_APPLICATION}/images/icons/plus1.gif";
			}
        	else
				alert(obj.msg_retour);
		}
	}
	
	
	function verifCodeUtil()
	{
	    if(document.principal.POS_CODE_UTIL.value.length==0)
	    {
	        alert("{MESSAGE_REMPLIR_CODE_UTIL}");
	        return false;
	    }
	    
        if(document.principal.POS_NOM_UTIL.value.length==0)
	    {
	        alert("{MESSAGE_REMPLIR_NOM_UTIL}");
	        return false;
	    }
	    return true;
	}

	function verifProfilDefaut()
	{
		with(document.principal)
		{
		    if(POS_PROFIL_DEFAUT.value == "")
		    {
		    	// Defini l'unique profil comme defaut
		    	if(UTIL_PROFIL.options.length == 1)
		    	{
		    		POS_PROFIL_DEFAUT.value = UTIL_PROFIL.options[0].value;
		    		return true;
		    	}
		    	else if(UTIL_PROFIL.options.length >= 1)
		    	// Impose le choix d'un profil par defaut
		    	{
		        	alert("{MESSAGE_DEFINIR_PROFIL_DEFAUT}");
		        	return false;
		        }
		    }
		    else
		        return true;
	    }
        return true;
	}
	
	// En cas de creation seulement, la saise se fait par le formulaire.
	// Avec une requete Ajax, il y aurait risque d'envoyer une creation 
	//de mot de passe sur un utilisateur dont le code n'a pas encore ete saisi.
	function verifMotsDePasse()
	{
		if(document.principal.POS_CREATION_PWD.value != document.principal.POS_COPIE_CREATION_PWD.value)
		{
			alert("{MESSAGE_MOTS_DE_PASSE_DIFFERENTS}");
			return false;
		}
		else
		{
			document.principal.POS_CREATION_PWD.value = crypt_text(document.principal.POS_CREATION_PWD.value,'{SESS_CRYPTKEY}');
    		document.principal.POS_COPIE_CREATION_PWD.value = crypt_text(document.principal.POS_COPIE_CREATION_PWD.value,'{SESS_CRYPTKEY}');
			return true;
		}
	}
	
	function AjouterProfil()
	{
	    with(document.principal)
	    {
    	    var selectedIndex = LISTE_TOUS_PROFIL.options.selectedIndex;
    		if(selectedIndex >= 0) 
    		{
                var tabOptProfilUtil = UTIL_PROFIL.options;
                var addprofil = 1;
                for(var i=0;i<tabOptProfilUtil.length;i++)
				{    
                    if(LISTE_TOUS_PROFIL.options[selectedIndex].value == UTIL_PROFIL.options[i].value)
                    {
						alert("{MESSAGE_PROFIL_DEJA_ASSOCIE}");
						addprofil = 0;
						break;
                    }
               	}
                if (addprofil == 1)
                    tabOptProfilUtil[tabOptProfilUtil.length] = new Option(LISTE_TOUS_PROFIL.options[selectedIndex].text,LISTE_TOUS_PROFIL.options[selectedIndex].value);
    	    }
		}
	}
	
	function SupprimerValListe()
	{
        with(document.principal)
        {
            var selectedIndex = UTIL_PROFIL.selectedIndex;
            var tabOptProfilUtilDep = UTIL_PROFIL.options;
            var tabOptProfilUtilArr = new Array();

            if (selectedIndex >= 0 && selectedIndex < UTIL_PROFIL.options.length)
            {
                if (POS_PROFIL_DEFAUT.value == UTIL_PROFIL.options[selectedIndex].value)
                    POS_PROFIL_DEFAUT.value = "";

                UTIL_PROFIL.remove(selectedIndex);
            }
        }
	}
	
	function lancerFormulaire() 
    {
    	with(document.principal)
        {
        	var bVerifMDP = true;
        					
	        if (verifCodeUtil() && verifProfilDefaut())
	        {
	        	if (B_CREATION.value ==1 && CONNEXION_LDAP.value == 0)
					bVerifMDP = verifMotsDePasse();
									
				if(bVerifMDP)
				{	
                    var tabOptProfilUtil = UTIL_PROFIL.options;
                    POS_LISTE_PROFIL_UTIL.value = "";
                    for(var i=0;i<tabOptProfilUtil.length;i++)
                    {
                        POS_LISTE_PROFIL_UTIL.value += UTIL_PROFIL.options[i].value;
                        // on ajoute un separateur apres les n-1 valeurs a ajouter
                        if(i != tabOptProfilUtil.length - 1)
                            POS_LISTE_PROFIL_UTIL.value += "###";
                    }
                    return true;
                }
                else
                    return false;
            }
        	else
            	return false;
    	}
    }
    
    function DefinirProfilDefaut()
    {
    	with(document.principal)
	    {
    		var selectedIndex = UTIL_PROFIL.options.selectedIndex;
	    	var tabOptProfilUtil = UTIL_PROFIL.options;
	        if(selectedIndex != -1)
	        {
	    		POS_PROFIL_DEFAUT.value = UTIL_PROFIL.options[selectedIndex].value;
	    		
	    		// pour eviter la creation de l'utilisateur 
				if (B_CREATION.value == 1)
	    		{
                    var tabOptProfilUtilArr = new Array();
					// on place le profil par defaut en premiere position en violet.
	    			for(var i=0; i<tabOptProfilUtil.length; i++)
					{
						if (UTIL_PROFIL.options[i].value != POS_PROFIL_DEFAUT.value)
	  						tabOptProfilUtilArr.push(UTIL_PROFIL.options[i]);
	  					else
	  						tabOptProfilUtilArr.unshift(UTIL_PROFIL.options[i]);
                    }
    
					for(var i=0;i<tabOptProfilUtil.length;i++)
			        	tabOptProfilUtil[i] = null;
			    
			    	for(i=0;i<tabOptProfilUtilArr.length;i++)
			        {	
						tabOptProfilUtil[i] = tabOptProfilUtilArr[i];
			        	UTIL_PROFIL.options[i].className = (i==0) ? "violet" : "standard";
			    	}
				}
				else
				{
        			if(lancerFormulaire())
        			{
        		    	POS_REAFFICHAGE.value = "1";
        		    	submit();
        			}
				}
	    	}
	    }	
    }
	</SCRIPT>
    <style>
    .violet {
        color: rgb(153, 0, 255);
    }
    </style>
</HEAD>

<BODY topmargin="15" leftmargin="10">
<h1 align ="center">{TITRE_PAGE}</h1>
<FORM NAME=principal ACTION="{URL_ATTENTE}" method="POST" onSubmit="return lancerFormulaire();">
<INPUT TYPE=HIDDEN NAME="URL" VALUE="URL_MODIFIE_UTILISATEUR">

<INPUT TYPE=HIDDEN NAME="POS_OLD_NOM_UTIL" VALUE="{NOM_UTIL}">
<INPUT TYPE=HIDDEN NAME="POS_OLD_MAIL_UTIL" VALUE="{MAIL_UTIL}">
<INPUT TYPE=HIDDEN NAME="POS_OLD_ORGANISATION_UTIL" VALUE="{ORGANISATION_UTIL}">
<INPUT TYPE=HIDDEN NAME="POS_OLD_UNITE_UTIL" VALUE="{UNITE_UTIL}">
<INPUT TYPE=HIDDEN NAME="POS_OLD_LISTE_PROFIL_UTIL" VALUE="{OLD_LISTE_PROFIL_UTIL}">
<INPUT TYPE=HIDDEN NAME="POS_LISTE_PROFIL_UTIL" VALUE="">
<INPUT TYPE=HIDDEN NAME="POS_PROFIL_DEFAUT" VALUE="{PROFIL_DEFAUT}">
<INPUT TYPE=HIDDEN NAME="POS_REAFFICHAGE" VALUE="0">
<INPUT TYPE=HIDDEN NAME="B_CREATION" VALUE="{B_CREATION}">
<INPUT TYPE=HIDDEN NAME="CONNEXION_LDAP" VALUE="{CONNEXION_LDAP}">
<br>
<br>
<TABLE role='presentation' align="center">
<tr>
	<td valign='top' align='center'>
		<div class='groupe' style='margin:1em 1em 1em 1em'>
		<p class='groupe'>								 														 														 														
			<span class='groupe'>{GEST_PARAM_UTILISATEUR} </span>													 													 													
		</p>
		<table role='presentation' class='groupe' cellpadding="5" cellspacing="5">
        <tr>    
            <td>
                <table role='presentation'>
            	<TR>
        		    <TD class="labelObligatoire">{LIBELLE_CODE_UTIL}</TD>
        			<TD>
                        <INPUT TYPE=text {CLASS_READONLY_CODE} NAME="POS_CODE_UTIL" VALUE="{CODE_UTIL}" SIZE=45 MAXLENGTH=47 onChange="javascript:this.value=this.value.toUpperCase();" style="text-transform:uppercase;">
            		</TD>
                </TR>
                <TR>
        		    <TD class="labelObligatoire">{LIBELLE_NOM_UTIL}</TD>
        			<TD>
                        <INPUT TYPE=text {CLASS_READONLY_INFO} NAME="POS_NOM_UTIL" VALUE="{NOM_UTIL}" SIZE=45 MAXLENGTH=47 CLASS="inputChamp">
            		</TD>
                </TR>
                <TR>
        		    <TD class="labelChamp">{LIBELLE_MAIL_UTIL}</TD>
        			<TD>
                        <INPUT TYPE=text {CLASS_READONLY_INFO} NAME="POS_MAIL_UTIL" VALUE="{MAIL_UTIL}" SIZE=45 MAXLENGTH=59 CLASS="inputChamp">
            		</TD>
                </TR>
                <TR>
        		    <TD class="labelChamp">{LIBELLE_ORGANISATION_UTIL}</TD>
        			<TD>
                        <INPUT TYPE=text {CLASS_READONLY_INFO} NAME="POS_ORGANISATION_UTIL" VALUE="{ORGANISATION_UTIL}" SIZE=45 MAXLENGTH=119 CLASS="inputChamp">
            		</TD>
                </TR>
                <TR>
        		    <TD class="labelChamp">{LIBELLE_UNITE_UTIL}</TD>
        			<TD>
                        <INPUT TYPE=text {CLASS_READONLY_INFO}  NAME="POS_UNITE_UTIL" VALUE="{UNITE_UTIL}" SIZE=45 MAXLENGTH=119 CLASS="inputChamp">
            		</TD>
                </TR>
                <!-- BEGIN BLOC_CREATION_PWD -->
                <TR>
        			<TD class="labelChamp">
        				{LIBELLE_PWD_UTIL}
        			</TD>
        			<TD colspan=2>
        				<INPUT type=password class='inputChamp' name=POS_CREATION_PWD size=20>
        			</TD>
        		</TR>
        		<TR>
        			<TD class="labelChamp">
        				{LIBELLE_CONFIRM_PWD_UTIL}
        			</TD>
        			<TD colspan=2>
        				<INPUT type=password class='inputChamp' name=POS_COPIE_CREATION_PWD size=20>
        			</TD>
        		</TR>
                <!-- END BLOC_CREATION_PWD -->
        		</TABLE>
            </TD>
        </TR>
        <tr>
            <td colspan='2'><hr>
            </td>
        </tr>

        <TR>
            <TD width="50%" valign=top>
                <TABLE role='presentation' style="width: 100%;">
                <TR>
                    <TD>
                        {LIBELLE_LISTE_PROFIL}<BR>
                        <SELECT style='width: 100%' NAME="LISTE_TOUS_PROFIL" class="inputChamp" size=10 ondblclick="AjouterProfil()">
                        <!-- BEGIN BLOC_TOUS_PROFIL -->
                        <OPTION VALUE="{CODE_PROFIL}">{CODE_PROFIL}</OPTION>
                        <!-- END BLOC_TOUS_PROFIL -->
                        </SELECT>
                    </TD>
                    <TD align='center' width="25%"><input class='bouton' type='BUTTON' title="Ajouter un profil" value=">>" onClick="AjouterProfil()"></TD>
                </TR>
                </TABLE>
            </TD>
            <TD width="50%" valign=top>
                <TABLE role='presentation' style="width: 100%;">
                    <TR>
                        <TD>
                            {LIBELLE_PROFIL_UTIL}<BR>
                            <SELECT style='width: 100%' NAME="UTIL_PROFIL" class="inputChamp" size=10 multiple>
                            <!-- BEGIN BLOC_PROFIL_UTIL -->
                            <OPTION VALUE="{PROFIL_UTIL}" class="{PROFIL_COLOR}">{PROFIL_UTIL}</OPTION>
                            <!-- END BLOC_PROFIL_UTIL -->
                            </SELECT>
                        </TD>
                    </TR>
                    <TR>
                        <TD align=center>
                        	<INPUT class=bouton TYPE=BUTTON VALUE="{LIBELLE_DEFINIR_PROFIL_DEFAUT}" onClick="DefinirProfilDefaut()">
                            <INPUT class=bouton TYPE=BUTTON VALUE="{LIBELLE_SUPPRIMER}" onClick="SupprimerValListe()">
                        </TD>
                    </TR>
                </TABLE>
            </TD>
        </TR>
        <tr>
            <td colspan='2'><hr>
            </td>
        </tr>
        <TR>
        	<TD style="padding: 10px;" colspan=2 align="center">
        		<INPUT TYPE=SUBMIT class="bouton_sub" VALUE="{LIBELLE_VALIDER}">
            	<INPUT TYPE=BUTTON class="bouton" VALUE="{LIBELLE_ANNULER}" onClick="location.href='{URL_ANNULER}'">
            </TD>
        </TR>
        </TABLE>
		</div>
	</td>
</tr>
</TABLE>
<br>
<br>
<!-- BEGIN BLOC_MODIF_PWD -->
<TABLE role='presentation' align="center">
<tr>
	<td valign='top' align='center'>
		<div class='groupe' style='margin:1em 1em 1em 1em; width: 600px;'>
		<p class='groupe'>								 														 														 														
			<span class='groupe'>{GEST_PWD_UTILISATEUR} <a onClick="afficheMasqueBloc('v1')"><img id="img_v1" src="../../../../images/icons/plus1.gif" class="iconbloc"></a></span>													 													 													
		</p>
		<table role='presentation' class='groupe' cellpadding="5" cellspacing="5">
    	<TR>
			<TD colspan=2 width='100%'>

				<TABLE  role='presentation' id="bloc_v1" style='display:none;' border=0 align="center" width="80%">
					<TR>
						<TD>
					<TABLE role='presentation' cellpadding="3" cellspacing="0"  border=0>
						<TR>
							<TD class="labelChamp" width="255px">
								{LIBELLE_PWD_UTIL}
							</TD>
							<TD colspan=2>
								<INPUT type=password class='inputChamp' name=POS_NV_PWD size=20>
							</TD>
						</TR>
						<TR>
							<TD class="labelChamp" width="255px">
								{LIBELLE_CONFIRM_PWD_UTIL}
							</TD>
							<TD colspan=2>
								<INPUT type=password class='inputChamp' name=POS_COPIE_NV_PWD size=20>
							</TD>
						</TR>
						<TR>
						<TD>
							&nbsp;
						</TD>
						<TD align="center">
							<INPUT class=bouton TYPE=BUTTON VALUE="{LIBELLE_REINITIALISER_PWD}"  onClick='ReinitialisePwdUtil();return false;'>
						</TD>
	    				</TR>
</TABLE>
						</TD>
					</TR>
				</TABLE>
			</TD>
		</TR>		
        </TABLE>
        </div>
    </TD>
</TR>
</TABLE>
<!-- END BLOC_MODIF_PWD -->
<BR>
</FORM>
</BODY>
</HTML>
