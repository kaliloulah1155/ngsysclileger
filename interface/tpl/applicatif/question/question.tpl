<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
	<TITLE>{TITRE_PAGE}</TITLE>
	<LINK REL="stylesheet" TYPE="text/css" HREF="../../../../include/style/style.css">
	<style>
	.table_groupe_isgroup_o {
	   margin-left: 12px;
    }

	.table_groupe_isgroup_n {
	   margin-left: 0px;
    }
    
     
	</style>
	<SCRIPT language="javascript" SRC="../../../../include/script/action_tableau.js"></SCRIPT>
	<SCRIPT language="javascript" SRC="../../../../include/script/action_accueil.js"></SCRIPT>
    <script type="text/javaScript">
	var set_reload_bal = "{SET_RELOAD_BAL}";
	</script>
    <SCRIPT language="javascript">
    var i=0;
    var tabBal = new Array();
    var tabBalhtmlEncode = new Array();
    var tabIfBalOpen = new Array();
    var tabBalIcone = new Array();
    var tabNbRepBal = new Array();
    <!-- BEGIN BLOC_NOM_BAL -->
    tabBal[i]="{SZ_CODE_BAL}";
    tabBalhtmlEncode[i]="{SZ_CODE_BAL_HTML_ENCODE}";
    tabBalIcone[i] = "{ICONE_BAL}";
    tabNbRepBal[i] = -1;
    tabIfBalOpen[i++]={BAL_OPEN};
    <!-- END BLOC_NOM_BAL -->


function onConsulterIndex(iNumDoc)
{
	var szUrl = "../consultation/consulter_index.php?MODE=CONSULTATION&POS_NUM_DOC=" +iNumDoc;
	//parent.posdocument.document.location.href = szUrl;
	//parent.basculerEcran('posdocument');
	parent.center.document.location.href = szUrl;
	parent.basculerEcran('center');

}

function onAfficherQuestion(szCodeQuestion)
{
	var szUrl = document.principal.URL_RESULTAT.value;
	var szUrlAttente = document.principal.URL_ATTENTE.value;
	// NB : il y a un & plutot qu'un "?" car l'url est passe en parametre de l'ecran d'attente.
	szUrl += "&TYPE_RECHERCHE=RECHERCHE_BIB&POS_QUEST_PUBLIC=1&POS_QUEST_NOM=" + escape(szCodeQuestion);
    parent.center.location.href = szUrlAttente + "?URL="+ szUrl;
	parent.basculerEcran('center');
}

</SCRIPT>
</HEAD>

<BODY topmargin="0" leftmargin="0" onLoad="javascript:initEcranAccueil();">
<h1> <!-- {LIBELLE_BIENVENUE_ACCUEIL} --> CORBEILLE DES TACHES</h1>
<form name="principal">
<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}">
<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
</form>
<div>
	<!-- BEGIN BLOC_PANIER -->
	<a href='javascript:void(0)' onClick='javascript:void lancePanier();'>
	<IMG src="/{NOM_APPLICATION}/images/icons/panier.png" alt=""> {LIBELLE_PANIER}</a>
	<div id="panier" style="display:inline"></div> 
	<!-- END BLOC_PANIER -->
</div>

<TABLE width="100%" cellspacing="5" align='center' role='presentation' >
    <tr>
		<TD valign="top">
		<!-- BEGIN BLOC_BAL -->
		   <div class='box'>
                <div class='title'>
                    <h2> <!--{POS_BAL_ENTETE}--> Rafraichir la corbeille &nbsp;&nbsp;<A HREF="{URL_RAFRAICHISSEMENT_BAL}" title="{NOTE_RAFRAICHISSEMENT_BAL}"><IMG SRC="/{NOM_APPLICATION}/images/icons/actualise.png" border=0 alt="{NOTE_RAFRAICHISSEMENT_BAL}"></A></h2>
                </div>
                <div class='content'  style='overflow: auto;height:228px'>
                <ul style='list-style: none; padding-top: 3px;padding-left: 2px;margin-top: 0px;'>
				<!-- BEGIN GROUPE_BAL -->
                <!-- BEGIN TITRE_GROUPE -->
				<li class="groupbal" style='padding-top: 15px;'><img id="image_fermeture_group_{ICPTGROUP}" src="/{NOM_APPLICATION}/images/icons/{ICONE_ARBRE_PLUS_MOINS}_bal.gif" onClick="javascript:afficheMasqueGroupe('{ICPTGROUP}');" alt="Ouvrir/Fermer">
				    <!-- BEGIN TITRE_ONLY_GROUPE -->
                    {ICONE_GROUPE} <span style="{STYLE_BAL_GROUP}">{POS_BAL_TITRE_GROUPE} </span>
                    <!-- END TITRE_ONLY_GROUPE -->
                    <!-- BEGIN TITRE_BAL_GROUPE -->
                    <A class="groupbal" title="{POS_BAL_LIBELLE_COMMENT}" href="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');">
                    <IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}" border="0" alt=''>
                    {POS_BAL_LIBELLE}<span id="bal{ICPTBAL}">({POS_BAL_NB_REP})</span></A>
                    <!-- END TITRE_BAL_GROUPE -->
                    <ul style='list-style: none;margin-left: -10px;display:{DISPLAY_GROUPE_OUVERT};' id='group_bal_{ICPTGROUP}' class='table_groupe_isgroup_{GROUP_ON}'>
    				<!-- BEGIN BAL -->
                    <li id="td_bal{ICPTBAL}">
                        <a title="{POS_BAL_LIBELLE_COMMENT}" href="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');"><IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}" border="0" alt="">
						<span id="bal{ICPTBAL}">({POS_BAL_NB_REP})</span>
						<span style="{STYLE_BAL}">{POS_BAL_LIBELLE}</span></a>
                    </li>
    				<!-- END BAL -->
    			     </ul>
                </li>
                <!-- END TITRE_GROUPE -->
				<!-- BEGIN BAL_SEULE -->
                <li id="td_bal{ICPTBAL}">
			        <a title="{POS_BAL_LIBELLE_COMMENT}" href="javascript:void lanceBibBal('{POS_BAL_LIEN}', 'QUESTION_BAL');">
					<IMG SRC="/{NOM_APPLICATION}/images/icons/balvide.png" name="img_bal{ICPTBAL}" border="0" alt="">
					<span id="bal{ICPTBAL}">({POS_BAL_NB_REP})</span>
					<span style="{STYLE_BAL}">{POS_BAL_LIBELLE}</span></a>
                </li>
            	<!-- END BAL_SEULE -->
    			<!-- END GROUPE_BAL --> 
                </ul>
				</div>
                </div> 

		<!-- END BLOC_BAL -->
    	<!-- BEGIN BLOC_CHANGE_PROFIL -->
        <div class='box' style="display:none">
        <div class='title'>
            <h2>{LIBELLE_TITRE_ACCES_PROFIL}</h2>
        </div>
        <div class='content'>
        <ul style="list-style: none;padding-top: 3px;padding-left: 2px;margin-top: 0px;">
			<!-- BEGIN LISTE_PROFIL -->
			<li>
                <a  href="javascript:changerProfil('{LIBELLE_PROFIL}')" title="{LIBELLE_CHANGER_PROFIL}">
                <img SRC="../../../../images/portail/puce.gif" alt="">{LIBELLE_ACCES_PROFIL} {LIBELLE_PROFIL}</a>
            </li>
			<!-- END LISTE_PROFIL -->
		 </ul>
         </div>
         </div>
		<!-- END BLOC_CHANGE_PROFIL -->
	</TD>
	<TD width="50%" valign="top" style="display:none">
		<!-- BEGIN BLOC_BIBLIO -->
		<!-- BEGIN BLOC_BIBLIO_PUB -->
        <div class='box'>
        <div class='title'>
            <h2>{POS_BIB_ENTETE_PUB}</h2>
        </div>
        <div class='content'  style='overflow: auto;height:100px'>
		<ul style="list-style: none;padding-top: 3px;padding-left: 2px;margin-top: 0px;">
		<!-- BEGIN BIBLIO_PUB -->
    		<li>
                <a href="javascript: void afficherResultat('qpubliques', '{POS_BIB_LIEN_PORTAIL}');"><img src="../../../../images/portail/puce.gif" alt="">&nbsp;{POS_BIB_LIBELLE}</a>
            </li>
		<!-- END BIBLIO_PUB -->
		</ul>
		</div>
       </div>
        <!-- END BLOC_BIBLIO_PUB -->
        <!-- BEGIN BLOC_BIBLIO_PRIV -->
        <div class='box' >
        <div class='title'>
            <h2>{POS_BIB_ENTETE_PRIV}</h2>
        </div>
        <div class='content'  style='overflow: auto;height:100px'>
			<ul style="list-style: none;padding-top: 3px;padding-left: 2px;margin-top: 0px;">
			<!-- BEGIN BIBLIO_PRIV -->
			<li>
                <a href="javascript: void afficherResultat('qprivees', '{POS_BIB_LIEN_PORTAIL}');"><img src="../../../../images/portail/puce.gif" alt="">&nbsp;{POS_BIB_LIBELLE}</a>
			</li>
			<!-- END BIBLIO_PRIV -->
			</ul>
            </div>
        </div>
        <!-- END BLOC_BIBLIO_PRIV -->
		<!-- END BLOC_BIBLIO -->
	</TD>
</TR>
</TABLE>
<!-- BEGIN BLOC_AFFICHER_QUESTION -->
<H1>{TITRE_QUESTION}</H1>
<div style='overflow: auto;height:100px' style="display:none">
<table width='100%'   >
<tr>
	<td colspan='3' align='center'>
		<div id='res_quest'>  
		<input type="hidden" name="NB_ELTS_TAB_{NUM_QUESTION}" VALUE="{NB_REPONSE}">
        <TABLE class="tablelr" id="table_tableau_question_{NUM_QUESTION}" cellpadding='2' cellspacing='1' width="98%"> 
        <TR>
        	<th class="titrecolonne">&nbsp;
            <a href="javascript:void(0)" onClick="javascript:onAfficherQuestion('{CODE_QUESTION}')" title="{LIBELLE_BASCULER_LISTE_RESULTAT}">
                <img class="img_act_tableau" src="/{NOM_APPLICATION}/images/menu/win/questions_posees.gif" alt=""></a>                
            </th>
        	<!-- BEGIN ENTETE -->
        	<th class="titrecolonne" style="text-align: center;">&nbsp;{TITRE_COLONNE}</th>
        	<!-- END ENTETE -->
        </TR>
        <!-- BEGIN LISTE_REPONSES -->
        <TR class='lr_{PAIR_OU_IMPAIR}'>
        	<TD width="95px" class="listeResumee">&nbsp;		
                <a href="javascript:void(0)" onClick="javascript:onConsulterIndex('{POS_NUM_DOC}')" title="{CST_LIBELLE_CONSULT}">
                <img class="img_act_tableau" src="/{NOM_APPLICATION}/images/icons/tab_consulter.gif" alt=""></a>
            </TD>
        	<!-- BEGIN LR_REPONSE -->
        	<TD class="listeResumee" style="text-align: {ZONE_ALIGN_LR};">&nbsp;{ZONE_LR}</TD>
        	<!-- END LR_REPONSE -->
        </TR>
        <!-- END LISTE_REPONSES -->
        </TABLE>
        </div>
	
		</td>
</tr>
</table>
</div>
<!-- END BLOC_AFFICHER_QUESTION -->

</BODY>
</HTML>
