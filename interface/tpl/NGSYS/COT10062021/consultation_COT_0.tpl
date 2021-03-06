<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation du contrat</title>
	<link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET' />
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/association.js'></script> 
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/vocabulaire.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/fermeture.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/saisie.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/calendrier.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/attente_fichier.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/recupcontrolsaisie.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/navigation.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/action_tableau.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/ajax_search.js'></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/ajax_recup_listhier.js'></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/ajax_recup_arbo_dossier.js'></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/action_accueil.js'></script>
	<link href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	          <!--formatage des nombres au format monétaire francais-->
<script>
function number_format(number, decimals, dec_point, thousands_sep) {
    var n = number, prec = decimals ;

    var toFixedFix = function (n,prec) {
        var k = Math.pow(10,prec);
        return (Math.round(n*k)/k).toString();
    };

    n = !isFinite(+n) ? 0 : +n;
    prec = !isFinite(+prec) ? 0 : Math.abs(prec);
    var sep = (typeof thousands_sep === 'undefined') ? ',' : thousands_sep;
    var dec = (typeof dec_point === 'undefined') ? '.' : dec_point;

    var s = (prec > 0) ? toFixedFix(n, prec) : toFixedFix(Math.round(n), prec); 
    //fix for IE parseFloat(0.55).toFixed(0) = 0;

    var abs = toFixedFix(Math.abs(n), prec);
    var _, i;
	

    if (abs >= 1000) {
        _ = abs.split(/\D/);
        i = _[0].length % 3 || 3;

        _[0] = s.slice(0,i + (n < 0)) +
               _[0].slice(i).replace(/(\d{3})/g, sep+'$1');
        s = _.join(dec);
		
    } else {
        s = s.replace('.', dec);
		
    }

    var decPos = s.indexOf(dec);
    if (prec >= 1 && decPos !== -1 && (s.length-decPos-1) < prec) {
        s += new Array(prec-(s.length-decPos-1)).join(0)+'0';
		
    }
    else if (prec >= 1 && decPos === -1) {
        s += dec+new Array(prec).join(0)+'0';	
    }

	//alert(s);
   return s; 
}
function reverseFormat(s){
    return s.replace(/ /g, '');
}

var tabRub = new Array("SLF");
//onLoad = "initFicTextDf();"
function initFicTextDf() {
	 for (var indCoderub in tabRub) {
	eval("principal.POS_VAL_RUB_" + tabRub[indCoderub]).value = number_format(eval("principal.POS_VAL_RUB_" + 	tabRub[indCoderub]).value, 0, ',', ' ' );    
    }
}
//onSubmit="return reverseFormatInForm()"
function reverseFormatInForm()
{
    
    for (var indCoderub in tabRub) {
        eval("principal.POS_VAL_RUB_" + tabRub[indCoderub]).value = reverseFormat(eval("principal.POS_VAL_RUB_" + tabRub[indCoderub]).value);    
    }
    // ne pas oublier, sinon le formulaire risque de ne pas ?tre soumis.
   return true;
}

</script> 

<!-- pour transformer le montant en toutes lettres -->
<script>
function ConvNumberLetter(Nombre) {
    var dblEnt, byDec ; 
    var bNegatif; 
	var strCentimes = new String();
	
    
    if( Nombre < 0 ) {
        bNegatif = true;
        Nombre = Math.abs(Nombre);
    }
    dblEnt = parseInt(Nombre) ;
    byDec = parseInt((Nombre - dblEnt) * 100) ;
	
    if( byDec == 0 ) {
        if (dblEnt > 999999999999999) {
            return "#TropGrand" ;            
        }
	}
    else {
        if (dblEnt > 9999999999999.99) {
            return "#TropGrand" ;            
        }    
	}
	
	if (Nombre == principal.POS_VAL_RUB_SLF.value) {
	principal.POS_VAL_RUB_MTL.value = ConvNumEnt(dblEnt)  ;
	}
	
}

function ConvNumEnt(Nombre) {
    var byNum, iTmp, dblReste ;
    var StrTmp = new String();
    var NumEnt ;
    iTmp = Nombre - (parseInt(Nombre / 1000) * 1000) ;
    NumEnt = ConvNumCent(parseInt(iTmp)) ;
    dblReste = parseInt(Nombre / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
    switch(iTmp) {
        case 0 :
			break;
        case 1 :
            StrTmp = "mille " ; 
			break;
        default : 
            StrTmp = StrTmp + " mille " ;
    }
    NumEnt = StrTmp + NumEnt ;

    dblReste = parseInt(dblReste / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
    switch(iTmp) {
        case 0 :
			break;
        case 1 :
            StrTmp = StrTmp + " million " ;
			break;
        default : 
            StrTmp = StrTmp + " millions " ;
    }
    NumEnt = StrTmp + NumEnt ;
    dblReste = parseInt(dblReste / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
	switch(iTmp) {
        case 0 :
			break;
        case 1 :
            StrTmp = StrTmp + " milliard " ;
			break;
        default : 
            StrTmp = StrTmp + " milliards " ;
    }
    NumEnt = StrTmp + NumEnt ;
    dblReste = parseInt(dblReste / 1000) ;
    iTmp = dblReste - (parseInt(dblReste / 1000) * 1000) ;
    StrTmp = ConvNumCent(parseInt(iTmp)) ;
   	switch(iTmp) {
        case 0 :
			break;
        case 1 :
            StrTmp = StrTmp + " billion " ;
			break;
        default : 
            StrTmp = StrTmp + " billions " ;
    }
    NumEnt = StrTmp + NumEnt ;
	
 	return NumEnt;    
}

function ConvNumDizaine(Nombre) {
    var TabUnit, TabDiz ;
    var byUnit, byDiz ;
    var strLiaison = new String() ;
  
    TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept",
        "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze",
        "seize", "dix sept", "dix huit", "dix neuf") ;
    TabDiz = Array("", "", "vingt", "trente", "quarante", "cinquante",
        "soixante", "soixante", "quatre vingt", "quatre vingt") ;
    
    byDiz = parseInt(Nombre / 10) ;
    byUnit = Nombre - (byDiz * 10) ;
    strLiaison = " " ;
    if (byUnit == 1) strLiaison = " et " ;
    switch(byDiz) {
        case 0 :
            strLiaison = "" ;
			break;
        case 1 :
            byUnit = byUnit + 10 ;
            strLiaison = "" ;
			break;
        case 7 :
             byUnit = byUnit + 10 ;
			break;
        case 8 :
             strLiaison = " " ;
			break;
        case 9 :
              byUnit = byUnit + 10 ;
              strLiaison = " " ;
			break;
    }
    var NumDizaine = TabDiz[byDiz] ;
    if (byDiz == 8 && byUnit == 0) NumDizaine = NumDizaine + "s" ;
    if (TabUnit[byUnit] != "") {
        NumDizaine = NumDizaine + strLiaison + TabUnit[byUnit] ;
	}
    else {
        NumDizaine = NumDizaine ;
    } 
	return NumDizaine;
}

function ConvNumCent(Nombre) {
    var TabUnit ;
    var byCent, byReste ;
    var strReste = new String() ;
    var NumCent;
    TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept","huit", "neuf", "dix") ;
    
    byCent = parseInt(Nombre / 100) ;
    byReste = Nombre - (byCent * 100) ; 
    strReste = ConvNumDizaine(byReste) 
    switch(byCent) {
        case 0 :
            NumCent = strReste ;
			break;
        case 1 :
            if (byReste == 0)
                NumCent = "cent" ;
            else 
                NumCent = "cent " + strReste ;
            break;
        default :
            if (byReste == 0)
                NumCent = TabUnit[byCent] + " cents" ;
            else 
                NumCent = TabUnit[byCent] + " cent " + strReste ;
	}
	return NumCent;
}
</script>

	<style>
		.col1_partie{
			width: 100%; 
			font-family: 'Times New Roman';
			font-size: 14px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			padding-top: 9px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col2_partie{
			width:100%; 
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 9px;
			padding-top: 5px;
		}
		
		/*.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
		}*/
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
			padding-left: 27px;
			padding-top: 5px;
		}
		
		.col_list{
			width: 50%;
			margin-top: -3%;
			margin-right: 5%;
			font-family: 'Times New Roman';
			font-size: 17px;
			background-color: transparent;
			font-weight: lighter; 
			float: right;
		}
		
		.header-const{
			margin-bottom: 3%;
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

		.botton_pris{
			width: 100%;
			margin-top: -3%;
			padding-top: 0%;
			padding-right: 3%;
		}
		
		.botton_pris a{
			float: right;
			margin: 1%;
			color: black;
		}


		/* Barre de progression  1  */
		
		.progres1 {
			width: 80%;
			margin: 20px auto;
			text-align: center;
		}
		.progres1 .circle1, .progres1 .bar1 {
			display: inline-block;
			background: #fff;
			width: 40px;
			height: 40px;
			border-radius: 40px;
			border: 1px solid #d5d5da;
		}
		.progres1 .bar1 {
			position: relative;
			width: 90px;
			height: 8px;
			top: -30px;
			margin-left: -5px;
			margin-right: -5px;
			border-left: none;
			border-right: none;
			border-radius: 0;
		}
		.progres1 .circle1 .label1 {
			display: inline-block;
			width: 32px;
			height: 32px;
			line-height: 32px;
			border-radius: 32px;
			margin-top: 3px;
			color: #b5b5ba;
			font-size: 17px;
		}
		.progres1 .circle1 .title1  {
			color: #b5b5ba;
			font-size: 13px;
			line-height: 30px;
			margin-left: -5px;
		}
		/* Done / Active */
		.progres1 .bar1.done1, .progres1 .circle1.done1 {
			background: #eee;
		}
		.progres1 .bar1.active1 {
			background: linear-gradient(to right,  40%, #FFF 60%);
		}
		.progres1 .circle1.done1 .label1 {
			color: #FFF;
			background: #81CE97;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres1 .circle1.done1 .title1  {
			color: #444;
		}
		.progres1 .circle1.active1 .label1 {
			color: #FFF;
			background: #0c95be;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres1 .circle1.active1 .title1  {
			color: #0c95be;
		}
		.progres1 {
			height:auto;
		}
		span {
			transition: background 2s;
		}

		.progres1 .circle1 div{
			display: none;
		}

		.progres1 .circle1:hover div{
			display: block;
			position: absolute;
			width: 20%;
			padding-bottom: 7px;
			margin: 0% -8%;
		}

		.progres1 .circle1 div span{
			font-size: 13px; 
			font-family: 'Times New Roman', Times, serif;
		}

		.container-info{
			width: 23%;
			margin: auto;
			margin-top: 11px;
			padding: 12px;
			background: #8097d3;
		}
				/*FIN Barre de progression  1  */


	</style>
</head>
<body  class='tpl_consultation tpl_consultation_pro' onLoad='initTplConsultation();{GRISE_CHAMP};initFicTextDf();' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formcontrat" ACTION='{URL_ATTENTE}' method='POST' onSubmit="return reverseFormatInForm()">
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='COT'>
				<input type='hidden' name='MODE'  class="get_mode" value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

					  <!-- nom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_NOM'  value="{USER_PRS_NOM}" id='input_nom' >
				<!--prénom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_PRE'  value="{USER_PRS_PRE}" id='input_pre'>
				<!--fonction de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_FON'  value="{USER_PRS_FON}" id='input_fon' >
				<!--departement de l'utilisateur-->
				<input class="form-control" type="hidden" name='POS_VAL_RUB_DPT' size='15' value="{USER_PRS_DPT}" >
        </div>
		<header class="header-const">
		<div id="actions-container" class="ui-widget-content titre-boutons" style="padding-left: 3%; text-align: center; background: transparent; border: none">
				 {ENTETE}
			</div>
			<div class="navbar navbar-default t3-mainnav marginBottom-0" role="navigation" style="margin-top: -1.7%">
				<div class="navbar-header">
					<button title="Cliquez ici pour voir les onglets" style="float:left;" type="button" class="btn navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-5">
						<i class="fa fa-bars fa-lg"></i> 
					</button>
				</div>
				<div class="collapse navbar-collapse " id="navbar-collapse-3">
					<ul class="nav navbar-nav level0 nav-tabs">
						<li class="active b1" ><a role="button" class=" btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li>
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>

		
		
		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
		   	<section class="botton_pris">
			<a href="javascript:void(0)"  style="display:none" class="btn p-1 bg-info print_vbtn">Visualiser le pdf</a>
			<a href="javascript:void(0)"  data-contrat="abrege cddi simple" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
		</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="row" style="margin-top: 1%">
										<!-- 12_ 1 infos -->
								<div class="col-sm-6 mt-5" style="margin-top: 0;">
									<div class="col1_partie text-center">
										<span class="title text-while">DESCRIPTIF</span>
									</div>
									<div class="col2_partie" style="padding-top: 7%;">
										<!-- civilite -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -1% 0%;">
												<label>Civilit&eacute;</label>
												<select id="selection" class="form-control" name='POS_VAL_RUB_CVL' id='id_rub_CVL' rows="1">
													<option value="0">Veuillez s&eacute;lectionner</option>
													<option value="M">Monsieur</option>
													<option value="MME">Madame</option>
													<option value="MLLE">Mademoiselle</option>
												</select>
												<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CVL' id='POS_VAL_CTRL_CVL' value='{POS_VAL_RUB_CVL}'>

											</div>
											<div class="col-sm-6" style="margin: -1% 0%;">
												<label>Matricule</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_MAT' oninput="this.value = this.value.toUpperCase()"   value="{POS_VAL_RUB_MAT}" id='input_mat' onBlur="javascript:maximum(this,'119');" autocomplete="on" onClick="closeSearch('search_suggest_mat')" data-parsley-pattern="^[A-Z0-9]*$" data-parsley-trigger="keyup">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Nom</label>
												<input  class="form-control" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" id='input_nom' onBlur="javascript:maximum(this,'119');" onkeyup="searchSuggest(this,'PRS', 'TPL', 'input_tpl', 'search_suggest_tpl');" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
											</div>
											<div class="col-sm-6">
												<label>Pr&eacute;noms</label>
												<input class="form-control" id="bio" rows="1" placeholder="Pr&eacute;noms" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" id='input_pre' onBlur="javascript:maximum(this,'119');" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
											</div>
										</div>
										<!-- Date de naissance & Lieu de naissance -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label>Date de naissance</label>
												<input type="text" id="date1" class="form-control datepicker" name="POS_VAL_RUB_DNS" value="{POS_VAL_RUB_DNS}" size="60" data-parsley-required="true">
											</div>
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label>Lieu de naissance </label>
												<input  class="form-control" name='POS_VAL_RUB_LNS'  value="{POS_VAL_RUB_LNS}" id='input_lns' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_lns')" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
											</div>
										</div>
										<!-- fonction -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 0%">
												<label>Fonction</label>
											  	<input  class="form-control" name='POS_VAL_RUB_FON'  value="{POS_VAL_RUB_FON}" id='input_fon' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_fon')" data-parsley-required="true">
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">INFOS COMPLEMENTAIRES</span>
									</div>
									<div class="col2_partie" style="padding-top: 3%;">
										<!-- nature pièce & numero pièce -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label>Nature du pi&egrave;ce</label>
												<select class=" form-control achievement" name='POS_VAL_RUB_NTP' id='id_rub_NTP'   >
													<option selected="selected" disabled="true">Selectionner la nature</option>
													<option value="ATTESTATION">Atttestation d'identit&eacute; </option>
													<option value="CARTE CONSULAIRE">Carte consulaire </option>
													<option value="CNI">Carte nationale d'identit&eacute; </option>
													<option value="PASSEPORT">Passeport </option>
													<option value="PERMIS DE CONDUIRE">Permis de conduire </option>
												</select> 
											  	<input type="hidden" name='POS_VAL_CTRL_NTP' id='POS_VAL_CTRL_NTP' value='{POS_VAL_RUB_NTP}' data-parsley-required="true">
											</div>
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label>Num&eacute;ro du pi&egrave;ce</label>
											  	<input  class="form-control" name='POS_VAL_RUB_NPI'  value="{POS_VAL_RUB_NPI}" id='input_npi' onBlur="javascript:maximum(this,'119');" autocomplete="on" onClick="closeSearch('search_suggest_ntp')" data-parsley-required="true">
											</div>
										</div>
										<!-- Entrée en vigueur & Modalité de paiement  -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label>Entr&eacute;e en vigueur</label>
												<input type="text" id="date2" class="form-control datepicker" class="form-control datepicker" name='POS_VAL_RUB_MOI'  value="{POS_VAL_RUB_MOI}" id='input_moi' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_moi')" data-parsley-required="true">
											</div>
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label>Modalit&eacute; de paiement</label>
												<input  class="form-control" name='POS_VAL_RUB_MDR'  value="{POS_VAL_RUB_MDR}" id='input_mdr' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_mdr')" data-parsley-required="true">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 0%">
												<label for="bio">P&eacute;riodicit&eacute; de paiement</label>
												<input  class="form-control" name='POS_VAL_RUB_PEI'  value="{POS_VAL_RUB_PEI}" id='input_pei' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_pei')" data-parsley-required="true">
											</div>
										</div>
										
										<!-- Date fin d&#146;&eacute;dition &  Droits et avantages -->
										<div class="form-group row">
											<div class="col-sm-7" style="margin: -0.5% 0%">
												<label for="bio">Droits et avantages</label>
												<textarea style="resize:none;"  class='form-control  ' wrap='SOFT' name='POS_VAL_RUB_DEP' cols='100' rows='3'>{POS_VAL_RUB_DEP}</textarea>
											</div>
										</div>
									</div>
								</div>
								<!-- phase relative -->
								<div class="col-sm-12 mt-5"style="margin-top: 5%;">
									<div class="col1_partie text-center">
										<span class="title text-while">REFERENCES TYPE CONTRAT</span>
									</div>
									<div class="col2_partie" style="padding-top: 3%;">
										<!-- Choix type de contrat & Abréviation & Date d'entrée  -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Choix type de contrat</label>
												<select id="selection" class="form-control contratentier" rows="1" name='POS_VAL_RUB_TYE' id='id_rub_TYE'>
													<option value="0">Veuillez s&eacute;lectionner</option>
													<option value="CONTRAT A DUREE DETERMINEE PROJET">Contrat &agrave; dur&eacute;e determin&eacute;e projet</option>
													<option value="CONTRAT A DUREE DETERMINEE SIMPLE">Contrat &agrave; dur&eacute;e determin&eacute;e simple</option>
													<option value="CONTRAT A DUREE DETERMINEE ESSAI">Contrat &agrave; dur&eacute;e determin&eacute;e essai</option>
													<option value="CONTRAT A DUREE INDETERMINEE ESSAI">Contrat &agrave; dur&eacute;e indetermin&eacute;e essai</option>
													<option value="CONTRAT A DUREE INDETERMINEE SIMPLE">Contrat &agrave; dur&eacute;e indetermin&eacute;e simple</option>
													<option value="CONSULTANT EXTERNE">Contrat consultant externe</option>
													<option value="CONSULTANT INTERNE">Contrat consultant interne</option>
													<option value="STAGE ECOLE">Contrat stage &eacute;cole</option>
													<option value="STAGE QUALIFICATION">Contrat stage professionnel</option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_TYE' id='POS_VAL_CTRL_TYE' value='{POS_VAL_RUB_TYE}' data-parsley-required="true">
											</div>

											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Abr&eacute;viation</label>
												<select id="selection" class="form-control contratabrege" rows="1" name='POS_VAL_RUB_ABR' id='id_rub_ABR'>
													<option value="0">Veuillez s&eacute;lectionner</option>
													<option value="CDD PROJET">CDD PROJET</option>
													<option value="CDD SIMPLE">CDD SIMPLE</option>
													<option value="CDD ESSAI">CDD ESSAI</option>
													<option value="CDI ESSAI">CDI ESSAI</option>
													<option value="CDI SIMPLE">CDI SIMPLE</option>
													<option value="CONSULTANT EXTERNE">CONSULTANT EXTERNE</option>
													<option value="CONSULTANT INTERNE">CONSULTANT INTERNE</option>
													<option value="STAGE ECOLE">STAGE ECOLE</option>
													<option value="STAGE QUALIFICATION">STAGE QUALIFICATION</option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_ABR' id='POS_VAL_CTRL_ABR' value='{POS_VAL_RUB_ABR}' data-parsley-required="true">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Date d&#146;entr&eacute;e</label>
												<input class="form-control datepicker " id="date4" name="POS_VAL_RUB_DEI" value="{POS_VAL_RUB_DEI}" size="60" data-parsley-required="true">
											</div>
										</div>
										<!-- Date de fin de la période d'essai & Date de notification & Salaire -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Date de fin de la p&eacute;riode d&#146;essai</label>
												<input type="text" id="date5" class="form-control datepicker" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" size="60" >
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Date de notification</label>
												<input type="text" id="date6" class="form-control datepicker" name="POS_VAL_RUB_DNO" value="{POS_VAL_RUB_DNO}" size="60">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Date fin contrat</label>
												<input type="text" id="date7" name="POS_VAL_RUB_DFE" value="{POS_VAL_RUB_DFE}" size="60" class="form-control datepicker">
											</div>
										</div>
										<!-- Nombre de mois & Entreprise d'accueil & Salaire -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Nombre de mois</label>
												<select id="selection" class="form-control" rows="1" name='POS_VAL_RUB_MOI' id='id_rub_MOI'>
												<option value="0">mois</option>
												<option value="1">01</option>
												<option value="2">02</option>
												<option value="3">03</option>
												<option value="4">04</option>
												<option value="5">05</option>
												<option value="6">06</option>
												<option value="7">07</option>
												<option value="8">08</option>
												<option value="9">09</option>
												<option value="10">10</option>
												<option value="11">11</option>
												<option value="12">12</option>
											</select>
											<input type="hidden" name='POS_VAL_CTRL_MOI' id='POS_VAL_CTRL_MOI' value='{POS_VAL_RUB_MOI}' data-parsley-required="true">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Entreprise d&#146;accueil</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_ENT'  value="{POS_VAL_RUB_ENT}" id='input_ent' onBlur="javascript:maximum(this,'119');" data-parsley-required="true"/>
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Salaire</label>
												<input type="text" id="salaire" class="form-control" name='POS_VAL_RUB_SLF'  value="{POS_VAL_RUB_SLF}" id='input_slf' onBlur="javascript:maximum(this,'119');" data-parsley-required="true"/>

												
											</div>
										</div>
										<div class="form-group row">
												<div class="col-sm-4" style="margin: -0.5% 0% ;">
													<label for="bio">Salaire en lettre</label>
													<!--Salaire en lettre -->
													<input type="text" class="form-control" name='POS_VAL_RUB_MTL'  value="{POS_VAL_RUB_MTL}" onClick="ConvNumberLetter({POS_VAL_RUB_SLF})" />
													<script type="text/javascript">ConvNumberLetter({POS_VAL_RUB_SLF});</script>
												</div>
											</div>

									</div>
								</div>
							</div>
						</nav>
					<!-- fin -->
				</div>
		   </div>
		   <!-- traitement -->
			 <!-- traitement -->
			<div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			   	<div class="info"  style="">

					<div class="jumbotron container-info" style="display:none;">
						<table class="table" align="center" id="tblMain">
							<tr>
								<td style="font-size: 15px; font-family: 'Times New Roman';">
									<span name="current" class="label1 label-success" data-value="{POS_VAL_RUB_EAC}"><b>{POS_VAL_RUB_EAC}</b></span>
								</td>
							</tr>
						</table>
					</div>
					<div class="progres1">

					   <div class="circle1" style="display: none;">
							<span class="label1">0</span>
							<span class="title1">User1</span>
						</div>
						<span class="bar1" style="display: none;"></span>


						<div class="circle1">
							<span class="label1">1</span>
							<span class="title1">RH</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 20%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CRE}</strong>
								</p>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DCR}</strong>
								</span>
							</div>
						</div>
						<span class="bar1"></span>

						<div class="circle1">
							<span class="label1">2</span>
							<span class="title1">EMPLOYE</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4A}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 empl_visa" style="font-size: 13px;">{POS_VAL_RUB_VC0}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT1}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT1}</strong>
									</span>
								</p>
							</div>
						</div>
						
						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">3</span>
							<span class="title1">MANAGER_ADM</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4B}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 mng_visa" style="font-size: 13px;">{POS_VAL_RUB_VC1}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT2}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT2}</strong>
									</span>
								</p>
							</div>
						</div>
						
						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">4</span>
							<span class="title1">DGA</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4C}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 dga_visa" style="font-size: 13px;">{POS_VAL_RUB_VC2}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT3}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT3}</strong>
									</span>
								</p>
							</div>
						</div>

						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">5</span>
							<span class="title1">DG</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4D}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  e_adm_visa" style="font-size: 13px;">{POS_VAL_RUB_VC3}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT5}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT4}</strong>
									</span>
								</p>
							</div>
						</div>
						
						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">6</span>
							<span class="title1">CLOS</span>
							
						</div>
					</div>

						<!--commentaire sur  de la ligne de vie du parcours de l'employe -->

					<div class="row jumbotron" style="margin: auto;padding: 12px">

					<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">EMPLOYE</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
									<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4A', 'POS_VAL_RUB_A4A')">
									   <img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
									</a>
								</div>	
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC0}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT1' value="{POS_VAL_RUB_DT1}" class="form-control" style="width: 100%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT1' style="width: 90%;resize: none">{POS_VAL_RUB_CT1}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">MANAGER ADM</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" style="width: 80%;">
									<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4B', 'POS_VAL_RUB_A4B')">
									   <img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
									</a>
								</div>	
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC1}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT2' value="{POS_VAL_RUB_DT2}" class="form-control" style="width: 100%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT2' style="width: 90%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur3">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DGA</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="form-control" placeholder="" style="width: 80%;">
										<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4C', 'POS_VAL_RUB_A4C')">
											<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>
									</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC2}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT3' value="{POS_VAL_RUB_DT3}" class="form-control" placeholder="" style="width: 100%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT3' rows="1" style="width: 90%;resize: none">{POS_VAL_RUB_CT3}</textarea>
							</div>
						</div>
						<!-- acteur 4 -->
						<div class="acteur4">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4D' value="{POS_VAL_RUB_A4D}" class="form-control" placeholder="" style="width: 80%;">
											<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4D', 'POS_VAL_RUB_A4D')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>
									</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC3}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT5' value="{POS_VAL_RUB_DT5}" class="form-control" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT4' style="width: 90%;resize: none">{POS_VAL_RUB_CT4}</textarea>
							</div>
						</div>
					</div>
				
	<!-- Fin du commentaire de la ligne de vie -->

				</div>
		   	</div>
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
					<div class="col-sm-6" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 5%. padding-bottom: 0;">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">VISUALISEUR</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 3%">
							<iframe id='frm_affiche_fichier' name='frm_affiche_fichier' src='../afficheur/afficher_menu_fichier.php?POS_NUM_DOC={POS_NUM_DOC}#view=FitH'  height='630px' width='99%' scrolling='auto' frameborder='0' style=""></iframe>
						</div>
					</div>
				</div>
		   </div>
		   <!-- historique -->
		   <div class="tab-pane fade in "  id="tabs-4" style="margin-top:0.5%;">
			   <nav class="container-fluid">
					<div class="row" style="margin-top: 1%">
								<!-- 12_ 1 infos -->
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 12px">HISTORIQUE</span>
							</div>
							<div class="col3_partie" style="padding: 5%;">
								<!-- N° poseidon -->
								<div class="form-group row" style="margin: 0%">
									<label for="bio">N&#176; poseidon</label>
									<input type="text" name='POS_VAL_RUB_NUD' id="numposeidon" value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" name='POS_VAL_RUB_HIS'   style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
								</div>
							</div>
						</div>
								<!-- 12_ 2 infos -->
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 10px">AUTORISATION D'ACCES</span>
							</div>
							<div class="col3_partie" style="padding-top: 10%;">
								<!-- Consultation -->
								<div class="form-group">
								   <label for="bio">Consultation :</label>
								  <textarea  class="form-control" id="bio" name='POS_VAL_RUB_AVU' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_AMO' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_ASU' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
								</div>
							</div>
						</div>
					</div>
				</nav>
		   </div>
		</div>
			
	</form>
</body>
	<!-- JQUERY  -->
	   <script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-ui.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery.validate.min.js"></script>

		
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>

		 <!-- requete de la mise en oeuvre d'une requete ajax-->
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/traitementjs/cotjs.js"></script>
	<!-- END JQUERY  -->
	<script>
				 
if($('.get_mode').val()=='CONSULTATION'){
	 $('.btn').hide();
	
}


        $('.contratentier').on('change',function(){

			     var  contratentier=$(this).val();
				 switch(contratentier){
					  case "CONTRAT A DUREE DETERMINEE PROJET": $('.contratabrege').val("CDD PROJET");break;
					  case "CONTRAT A DUREE DETERMINEE SIMPLE":  $('.contratabrege').val("CDD SIMPLE");break;
					  case "CONTRAT A DUREE DETERMINEE ESSAI":  $('.contratabrege').val("CDD ESSAI");break;
					  case "CONTRAT A DUREE INDETERMINEE ESSAI":  $('.contratabrege').val("CDI ESSAI");break;
					  case "CONTRAT A DUREE INDETERMINEE SIMPLE":  $('.contratabrege').val("CDI SIMPLE");break;
					  case "CONSULTANT EXTERNE":  $('.contratabrege').val("CONSULTANT EXTERNE");break;
					  case "CONSULTANT INTERNE":  $('.contratabrege').val("CONSULTANT INTERNE");break;
					  case "STAGE ECOLE":  $('.contratabrege').val("STAGE ECOLE");break;
					  case "STAGE QUALIFICATION":  $('.contratabrege').val("STAGE QUALIFICATION");break;
				 }
				//alert($(this).val());
		});

		 $('.contratabrege').on('change',function(){
			  var  contratabrege=$(this).val();
			   switch(contratabrege){
				    case "CDD PROJET": $('.contratentier').val("CONTRAT A DUREE DETERMINEE PROJET");break;
					 case "CDD SIMPLE":  $('.contratentier').val("CONTRAT A DUREE DETERMINEE SIMPLE");break;
					 case "CDD ESSAI":  $('.contratentier').val("CONTRAT A DUREE DETERMINEE ESSAI");break;
					 case "CDI ESSAI":  $('.contratentier').val("CONTRAT A DUREE INDETERMINEE ESSAI");break;
					 case "CDI SIMPLE":  $('.contratentier').val("CONTRAT A DUREE INDETERMINEE SIMPLE");break;
					  case "CONSULTANT EXTERNE":  $('.contratentier').val("CONSULTANT EXTERNE");break;
					  case "CONSULTANT INTERNE":  $('.contratentier').val("CONSULTANT INTERNE");break;
					 case "STAGE ECOLE":  $('.contratentier').val("STAGE ECOLE");break;
					 case "STAGE QUALIFICATION":  $('.contratentier').val("STAGE QUALIFICATION");break;

			   }

			   $(".print_btn").attr("data-contrat", contratabrege);

		});





	 	$(document).ready(function () {
			 $('#date1 , #date2, #date3, #date4, #date5, #date6, #date7').datepicker({
				altField: "#datepicker",
				closeText: 'Fermer',
				prevText: 'Précédent',
				nextText: 'Suivant',
				currentText: 'Aujourd\'hui',
				monthNames: ['Janvier', 'F&#233;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'D&#233;cembre'],
				monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
				dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
				dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
				dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
				weekHeader: 'Sem.',
				dateFormat: 'dd/mm/yy'
			});
		});

	 $('#formcontrat').parsley();
		var prof_util = "{PROFIL_UTILISATEUR}";	 
	
		switch (prof_util) {
			case "ADMIN" :
				$('.rhdmdabs').show();
				$('.mydmdabs').hide();
				
				break;
			case "RH":
				$('.rhdmdabs').show();
				$('.mydmdabs').hide();
				
				break;
		default:
			$('.mydmdabs').show();
		
		}

		$('.dureedebselect').on('change',function(){
			console.log($(this).val());
		});
		

		//  Barre de progression 


		$('.progres1 .circle1').removeClass().addClass('circle1');
		$('.progres1 .bar1').removeClass().addClass('bar1');
		$(".circle1").first().addClass("active1");

		
			var timer = setInterval(increment, 1000);

		function increment() {
			$(".circle1:not(.done1)").first().removeClass("active1").addClass("done1").children(":first-child").html("&#10003;");
			$(".circle1:not(.done1)").first().addClass("active1");
			$(".circle1.done1").next().addClass("done1");
			if ($(".active1").find(".title1").text() === $("tr:last-child").find(".label1").text()) {
				clearInterval(timer);
			}
		}
		// Fin de la Barre de progression 
		 
	</script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/workflowCOT.js"></script>

	
</html>