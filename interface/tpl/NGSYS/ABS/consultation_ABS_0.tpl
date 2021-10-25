<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de la demande</title>
	 
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href="/{NOM_APPLICATION}/include/alert/sweetalert.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET' />
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/association.js'></script> 
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/vocabulaire.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/fermeture.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/saisie.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/calendrier.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/attente_fichier.js'></script>
	<!-- Masqueur des readonly-->
	  <script type='text/javascript' src='/{NOM_APPLICATION}/include/script/recupcontrolsaisie.js'></script> 
	<!-- Masqueur des readonly-->
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/navigation.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/action_tableau.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/ajax_search.js'></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/ajax_recup_listhier.js'></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/ajax_recup_arbo_dossier.js'></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/action_accueil.js'></script>
	
	
	<!--ABASS INCLUDE-->
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/bootstrap.css" rel="stylesheet" type="text/css" />
		<link type="text/css"  href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.css"></link>
		 
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
	
	 <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet" />
	<link type="text/css"  href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.css"></link>
	<style>
		.col1_partie{
			width: 100%;
			font-family: 'Times New Roman';
			font-size: 15px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			padding: 5px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			/*padding-left: 27px;
			padding-top: 5px;*/
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
			margin: 2.5%;
		}
		
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
			width: 100px;
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


				/*Debut de la Barre de progression  2  */



		.progres2 {
			width: 80%;
			margin: 20px auto;
			text-align: center;
		}
		.progres2 .circle2, .progres2 .bar2 {
			display: inline-block;
			background: #fff;
			width: 40px;
			height: 40px;
			border-radius: 40px;
			border: 1px solid #d5d5da;
		}
		.progres2 .bar2 {
			position: relative;
			width: 100px;
			height: 8px;
			top: -30px;
			margin-left: -5px;
			margin-right: -5px;
			border-left: none;
			border-right: none;
			border-radius: 0;
		}
		.progres2 .circle2 .label2 {
			display: inline-block;
			width: 32px;
			height: 32px;
			line-height: 32px;
			border-radius: 32px;
			margin-top: 3px;
			color: #b5b5ba;
			font-size: 17px;
		}
		.progres2 .circle2 .title2  {
			color: #b5b5ba;
			font-size: 13px;
			line-height: 30px;
			margin-left: -5px;
		}
		/* Done / Active */
		.progres2 .bar2.done2, .progres2 .circle2.done2 {
			background: #eee;
		}
		.progres2 .bar2.active2 {
			background: linear-gradient(to right,  40%, #FFF 60%);
		}
		.progres2 .circle2.done2 .label2 {
			color: #FFF;
			background: #81CE97;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres2 .circle2.done2 .title2  {
			color: #444;
		}
		.progres2 .circle2.active2 .label2 {
			color: #FFF;
			background: #0c95be;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres2 .circle2.active2 .title2  {
			color: #0c95be;
		}
		.progres2 {
			height:auto;
		}
		span {
			transition: background 2s;
		}

		.progres2 .circle2 div{
			display: none;
		}

		.progres2 .circle2:hover div{
			display: block;
			position: absolute;
			width: 20%;
			padding-bottom: 7px;
			margin: 0% -8%;
		}

		.progres2 .circle2 div span{
			font-size: 13px; 
			font-family: 'Times New Roman', Times, serif;
		}

	/*FIN Barre de progression  2  */
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_abs' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formabsence" ACTION='{URL_ATTENTE}' class="cform" method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='ABS'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<input type='hidden' class='appName' value="{NOM_APPLICATION}">
		<!-- END BLOC_OLD_VALUE -->
		
			<input type='hidden' class='appName' value="{NOM_APPLICATION}">
			       

		 <!-- données de l'utilisateur connecté -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					 <!--fin données de l'utilisateur connecté -->
		
		<header class="header-const">
			<div id="actions-container" class="ui-widget-content titre-boutons" style="padding-left: 3%; text-align: center; background: transparent; border: none">
				 {ENTETE}
			</div>
			<div class="navbar navbar-default t3-mainnav marginBottom-0" role="navigation" style="margin-top: -1.7%">
				<div class="navbar-header">
					<button title="Clicquez ici pour voir les onglets" style="float:left;" type="button" class="btn navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-5">
						<i class="fa fa-bars fa-lg"></i> 
					</button>
				</div>
				<div class="collapse navbar-collapse " id="navbar-collapse-3">
					<ul class="nav navbar-nav level0 nav-tabs">
						<li class="active b1" ><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
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
			<a href="javascript:void(0)" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
		</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->

						<nav class="container-fluid">
							<div class="row" style="margin-top: 1%">
								<div class="col-sm-12 mt-5" style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">OBJET DE LA DEMANDE</span>
									</div>
									<div class="col2_partie container-fluid" style="padding-top: 2%; padding-bottom: 1%">
										<div class="row">
											<div class="col-sm-6">
												<label for="selection">Type de demande</label>
											   	<select class="form-control typeDemande" style="width: 100%" name='POS_VAL_RUB_AUN' id='id_rub_AUN'>
										<option disabled='true' selected='true'>S&eacute;lectionner votre demande</option>
										<option value="ABSENCE">Absence</option>
										<option value="BAPTEME DUN ENFANT">Bapt&egrave;me d'un enfant</option>
										<option value="CONGE ANNUEL">Cong&eacute; annuel</option>
										<option value="CONGE DE MATERNITE">Cong&eacute; de maternit&eacute;</option>
										<option value="CONGE DE PATERNITE">Cong&eacute; de paternit&eacute;</option>
										<option value="DECES DUN BEAU-PERE OU DUNE BELLE-MERE">D&eacute;c&egrave;s d'un beau-p&egrave;re ou d'une belle-m&egrave;re</option>
										<option value="DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR">D&eacute;c&egrave;s d'un enfant, du p&egrave;re, de la m&egrave;re du travailleur</option>
										<option value="DECES DUN FRERE OU DUNE SOEUR">D&eacute;c&egrave;s d'un fr&egrave;re ou d'une soeur</option>
										<option value="DECES DU CONJOINT">D&eacute;c&egrave;s du conjoint</option>
										<option value="DEMENAGEMENT">D&eacute;m&eacute;nagement</option>
										<option value="MARIAGE DU TRAVAILLEUR">Mariage du travailleur</option>
										<option value="MARIAGE DUN DE SES ENFANTS, DUN FRERE, DUNE SOEUR">Mariage d'un de ses enfants, d'un fr&egrave;re, d'une s&oelig;ur</option>
										<option value="NAISSANCE DUN ENFANT">Naissance d'un enfant</option>
										<option value="PREMIERE COMMUNION">Premi&eacute;re communion</option>
										<option value="PERMISSION EXCEPTIONNELLE">Permission exceptionnelle</option>
										<option value="REPOS MALADIE">Repos maladie</option>
													</select>
													<input type="hidden" name='POS_VAL_CTRL_AUN' id='POS_VAL_CTRL_AUN' value='{POS_VAL_RUB_AUN}'>
												</div>
												<div class="col-sm-6">
													 <label for="bio">Date de d&eacute;part :</label>
													 <input type="text" class="form-control datedeb" name="POS_VAL_RUB_DT4"  id="d1" required="true"  value="{POS_VAL_RUB_DT4}" style="width: 100%">
												</div>
											</div>
										
											<div class="row" style="margin-top: 2%">
												<div class="col-sm-6">
												   <label for="bio">Motif :</label>
													<textarea  name='POS_VAL_RUB_COM'class="form-control" id="motif"   data-parsley-required="true" data-parsley-trigger="keyup" rows="2"  style="width: 100%;resize: none">{POS_VAL_RUB_COM} </textarea>
												</div>
												<div class="col-sm-6">
													<label for="bio">Heure de d&eacute;part :</label>
												  	<input type="time" class="form-control timedeb" name="POS_VAL_RUB_HRD" data-theme="a" data-clear-btn="true"  id="t1" value="{POS_VAL_RUB_HRD}" style="width: 100%">
												</div>
											</div>

										<div class="row" style="margin-top: 2%">
											<div class="col-sm-6">
											   	<label for="bio">Interimaire :</label>
												<select id="interimaire" style="width: 100%" name='POS_VAL_RUB_INT' class="form-control select2 personnel" rows="1" data-parsley-required="true" >
								     <option value="{POS_VAL_RUB_INT}" selected>{POS_VAL_RUB_INT}</option>
								</select>      
								<input type="hidden" name='POS_VAL_CTRL_INT' class="interselect" id='POS_VAL_CTRL_INT' value='{POS_VAL_RUB_INT}'>
											</div>
											<div class="col-sm-3">
												<label for="bio">Dur&eacute;e (en jour) :</label>
												<input type="number" class="form-control duree" placeholder="Nombre de jours" min="0" name='POS_VAL_RUB_NBR' data-parsley-required="true" data-parsley-trigger="keyup"  value="{POS_VAL_RUB_NBR}"  id="d1" style="width: 100%">
											</div>
											<div class="col-sm-3">
												<label for="bio">Dur&eacute;e (en heure) :</label>
												<input type="number" class="form-control dureedebselect" min="0" max="7" placeholder="Nombre d'heure"      style="width: 100%;">
												<input type="hidden" class="dureedeb" name='POS_VAL_RUB_HRA' value='{POS_VAL_RUB_HRA}'>
											</div>
										</div>

										<div class="row" style="margin-top: 2%">
											<div class="col-sm-6">
											   <label for="bio">Dossier en cours :</label>
											   <input type="text" name='POS_VAL_RUB_DOS' class="form-control" value="{POS_VAL_RUB_DOS}" id="bio"  style="width: 100%;resize: none" data-parsley-required="true" data-parsley-trigger="keyup">
											</div>
											<div class="col-sm-6">
												<label for="bio">Date de retour :</label>
											  	<input type="type" class="form-control res6" readonly="true"  name='POS_VAL_RUB_DRU'  value="{POS_VAL_RUB_DRU}" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 100%">
											  	<input type="hidden" class="datefin" name='POS_VAL_RUB_DFI'  value='{POS_VAL_RUB_DFI}'>
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-12 mt-5 appros"style="margin-top: 3%; margin-bottom: 2%;">
									<div class="col1_partie text-center">
										<span class="title text-while">APPROBATION HIERARCHIE</span>
									</div>
									<div class="col2_partie container-fluid" style="padding-top: 3%;">
										<div class="row">
											<div class="col-sm-6">
												<label for="selection">Avis Direction</label>
											   <br> 
												<input type="radio" name="POS_VAL_RUB_AUS" value="AUTORISATION ACCORDE AVEC TRAITEMENT" class="val_1" style="margin-left: 5%">
											    <label for="contactChoice1">Autorisation accord&eacute;e avec traitement</label>
											    <br>

											    <input type="radio" name="POS_VAL_RUB_AUS" value="AUTORISATION ACCORDE AVEC RETENUE" class="val_1" style="margin-left: 5%">
											    <label for="contactChoice1">Autorisation accord&eacute;e avec retenue</label>
											    <br> 

											    <input type="radio"
											     name="POS_VAL_RUB_AUS" class="val_1" value="AUTORISATION REFUSEE" style="margin-left: 5%">
											    <label for="contactChoice3">Autorisation refus&eacute;e</label>
												<input type="hidden" name='POS_VAL_CTRL_AUS' id='POS_VAL_CTRL_AUS' value='{POS_VAL_RUB_AUS}'>

 
											</div>
											<div class="col-sm-6">
											   <label for="bio">Motif du refus :</label>
												<textarea id="motif_Refus"  class="motif_Refus form-control" rows="3"  name='POS_VAL_RUB_DSC' readonly="true" style="width: 100%;resize: none; margin-bottom: 2%"> {POS_VAL_RUB_DSC}</textarea>
											</div>
										</div>
									</div>
								</div>

							</div>
						</nav>
						<!-- script permettant d' activer le champ motif du refus -->
						<script type="text/javascript">

							$(document).ready(function(){
								if(prof_util == "EMPLOYE"){
									$(".appros").css('display','none');
								}

								$('#motif_Refus').prop("readonly",true);
								$('.val_1').on('click',function(){
									let val_1 = $(this).val();
									if(val_1 == "AUTORISATION REFUSEE"){
										// $('#motif_Refus').text("");
										$('#motif_Refus').prop("readonly",false);   //degrise 
									}
									else{
										$('.motif_Refus').val("");
										$('#motif_Refus').prop("readonly",true);
										   //grise
									}
								});
							});
						</script>
					<!-- fin -->
				</div>
		   </div>   
		<!-- traitement -->
			<div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			     <!-- debut ligne de vie du parcours de l'employe -->
				<div class="info   work_employe"  style="display:none">

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
							<span class="title1">EMPLOYE</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 20%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Nom et Prenom(s) :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_NOM}  {POS_VAL_RUB_PRE}</strong>
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
							<span class="title1">MANAGER</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4A}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 e_mng_visa" style="font-size: 13px;">{POS_VAL_RUB_VC0}</strong>
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
							<span class="title1">RH</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4B}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 e_rh_visa" style="font-size: 13px;">{POS_VAL_RUB_VC1}</strong>
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
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4C}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  e_adm_visa" style="font-size: 13px;">{POS_VAL_RUB_VC2}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT2}</strong>
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
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4C}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  e_dg_visa" style="font-size: 13px;">{POS_VAL_RUB_VC3}</strong>
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

					<div class="row jumbotron emplo" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">MANAGER </label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
								</div>	
							</div>
							<div class="col-sm-5 managerconnex" style="padding-bottom: 3%">
								<label for="bio">COMMENTAIRE</label>
								<textarea class="form-control" id="bio" rows="4" name='POS_VAL_RUB_CT1' style="width: 250%;resize: none">{POS_VAL_RUB_CT1}</textarea>
							</div>
						</div>
						
						<!-- acteur 2 -->
						<div class="acteur2 ">
							<div class="col-sm-4" style="margin-top: 3%;display: none;" style="padding-bottom: 3%;display: none;">
								<label for="bio">RH</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>
							
							<div class="col-sm-5 rhconnex" style="padding-bottom: 3%">
								<label for="bio">COMMENTAIRE</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT2' rows="3" style="width: 250%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur3">				
							
							<div class="col-sm-5 dgaconnex" style="padding-bottom: 3%">
								<label for="bio">COMMENTAIRE</label>
								<textarea class="form-control" id="bio" rows="4" name='POS_VAL_RUB_CT3' style="width: 250%;resize: none">{POS_VAL_RUB_CT3}</textarea>
							</div>
						</div>
						<!-- acteur 4 -->
						<div class="acteur3 ">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4D' value="{POS_VAL_RUB_A4D}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>
							
							
							<div class="col-sm-5 dgconnex" style="padding-bottom: 3%">
								<label for="bio">COMMENTAIRE</label>
								<textarea class="form-control" id="bio" rows="4" name='POS_VAL_RUB_CT4' style="width: 250%;resize: none">{POS_VAL_RUB_CT4}</textarea>
							</div>
						</div>
					</div>
				


						<!-- Fin du commentaire de la ligne de vie du parcours de l'employe -->

				</div>
				<!-- Fin de la ligne de vie du parcours de l'employe -->

			    <!-- debut ligne de vie du parcours du manager   -->
				<div class="info work_manager"  style="display:none">
					<div class="jumbotron container-info" style="display:none;">
						<table class="table" align="center" id="tblMain">
							<tr>
								<td style="font-size: 15px; font-family: 'Times New Roman';">
									<span name="current" class="label2 label-success" data-value="{POS_VAL_RUB_EAD}"><b>{POS_VAL_RUB_EAD}</b></span>
								</td>
							</tr>
						</table>
					</div>
					<div class="progres2">
						<div class="circle2" style="display: none;">
							<span class="label2">0</span>
							<span class="title2">User2</span>
						</div>
						<span class="bar2" style="display: none;"></span>

						<div class="circle2">
							<span class="label2">1</span>
							<span class="title2">MANAGER</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 20%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Nom et prenom(s) :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_NOM}  {POS_VAL_RUB_PRE}</strong>
								</p>
								<!-- Affichage de la date -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DCR}</strong>
								</p>
							</div>
						</div>
						
						<span class="bar2"></span>
						<div class="circle2">
							<span class="label2">2</span>
							<span class="title2">RH</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4E}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  m_rh_visa" style="font-size: 13px;">{POS_VAL_RUB_VC5}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT6}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Commentaire: </span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT5}</strong>
								</p>
							</div>
						</div>
						
						<span class="bar2"></span>
						<div class="circle2">
							<span class="label2">3</span>
							<span class="title2">DGA</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4F}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 m_dga_visa"  style="font-size: 13px;">{POS_VAL_RUB_VC6}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT7}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Commentaire :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT6}</strong>
								</p>
							</div>
						</div>
						
						<span class="bar2"></span>
						<div class="circle2">
							<span class="label2">4</span>
							<span class="title2">DG</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4G}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 m_dg_visa" style="font-size: 13px;">{POS_VAL_RUB_VC7}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT8}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Commentaire :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT7}</strong>
								</p>
							</div>
						</div>
						
						<span class="bar2"></span>
						<div class="circle2">
							<span class="label2">5</span>
							<span class="title2">Fin</span>
						</div>
					</div>


					<!-- Debut du commentaire de la ligne de vie du parcours du manager -->

					
					<div class="row jumbotron manag" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">RH</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text"  class="form-control" name='POS_VAL_RUB_A4E' value="{POS_VAL_RUB_A4E}" placeholder="" style="width: 80%;">
										<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4E', 'POS_VAL_RUB_A4E')">
											<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>
								</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%;display: none;">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC5}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%;display: none;">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT6' value="{POS_VAL_RUB_DT6}" class="form-control" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5 rhmngconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire de la RH</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT5' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT5}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">DGA</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" class="form-control" name='POS_VAL_RUB_A4F' value="{POS_VAL_RUB_A4F}" placeholder="" style="width: 80%;">
											<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4F', 'POS_VAL_RUB_A4F')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>
									</div>

							</div>
							<div class="col-sm-1" style="padding-bottom: 3%;display: none;">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC6}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%;display: none;">
								<label for="bio">Date</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_DT7' value="{POS_VAL_RUB_DT7}" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5 dgamngconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du DGA</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT6' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT6}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" class="form-control" name='POS_VAL_RUB_A4G' value="{POS_VAL_RUB_A4G}" placeholder="" style="width: 80%;">
										<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4G', 'POS_VAL_RUB_A4G')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>
									</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%;display: none;"> 
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC7}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%;display: none;">
								<label for="bio">Date</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_DT8' value="{POS_VAL_RUB_DT8}" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5 dgmngconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du DG</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT7' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT7}</textarea>
							</div>
						</div>
					</div>
				</div>
				<!-- Fin du commentaire de la ligne de vie du parcours du manager -->

					 
			
				<!-- fin de la ligne de vie du parcours du manager -->

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
		   <!-- historique -->
		   <div class="tab-pane fade in "  id="tabs-4" style="margin-top:0.5%;">
			   <nav class="container-fluid">
					<div class="row" style="margin-top: 1%">
								<!-- 12_ 1 infos -->
									<!-- Debut traitement annee-increment absence -->
		<input type="hidden"  name='POS_VAL_RUB_ANN' value="{POS_VAL_RUB_ANN}" class="annee" placeholder="annee"  />
		<input type="hidden" name='POS_VAL_RUB_J1' value="{POS_VAL_RUB_J1}" class="increment" placeholder="increment"  />

		<input type="hidden" name='POS_VAL_RUB_CRE' value="{POS_VAL_RUB_CRE}" class="createur" placeholder="createur"  />
		<script>
				//return  year 
			 var d = new Date();
 			 var n = d.getFullYear();
 			 document.getElementsByClassName('annee')[0].value=n;
		</script>
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 12px">HISTORIQUE</span>
							</div>
							<div class="col3_partie" style="padding: 5%;">
								<!-- N° poseidon -->
								<div class="form-group row" style="margin: 0%">
									<label for="bio">N&#176; poseidon</label>
									<input type="text" id="numposeidon" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}"  placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
								</div>
								<!-- Etat type -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat type</label>
									<input type="text" placeholder="Etat type" name='POS_VAL_RUB_ETD' value="{POS_VAL_RUB_ETD}"   class="form-control etat_type" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" id="bio" name="POS_VAL_RUB_HIS" rows="5"  style="width: 100%;resize: none;"> {POS_VAL_RUB_HIS}</textarea>
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
								  <textarea  class="form-control" name='POS_VAL_RUB_AVU' id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_AMO' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_ASU' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
								</div>
							</div>
						</div>
					</div>
				</nav>
		   </div>
		</div>
	</form>
</body>

	<!-- jquery  -->
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-3.5.1.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-ui.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery.validate.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

	 
		<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>-->
		 
		<!--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/abspdf/pdfabs.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script>
		


	<!-- endjquery  -->
	
	 	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/select2/select2tr.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/compteur/compt.js"></script>

	
	 <script>

	 	var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
		$('.bouton_sub').hide();	
			}



	  $(document).ready(function () {
              //select default value of type demande
	  	      $('.typeDemande').val($('#POS_VAL_CTRL_AUN').val());

			 $('#d1').datepicker({
				altField: "#datepicker",
				closeText: 'Fermer',
				prevText: 'Précédent',
				nextText: 'Suivant',
				currentText: 'Aujourd\'hui',
				monthNames: ['Janvier', 'F&#233;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao&#251;t', 'Septembre', 'Octobre', 'Novembre', 'D&#233;cembre'],
				monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
				dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
				dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
				dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
				weekHeader: 'Sem.',
				dateFormat: 'yy-mm-dd',
				minDate: 0,
			});
		});

	   
		 //affichage en fonction du MODE sur le Formulaire 
		 
if($('.get_mode').val()=='CONSULTATION'){
	 $('.btn').hide();
	
}
	$('#formabsence').parsley();
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

		  //fonctionnement du Bouton Annuler
			 function videchamp(){
			
			   var inputArray = document.querySelectorAll('input');
				inputArray.forEach(function (input){
					input.value = "";
				});
			 	var textAreaArray = document.querySelectorAll('textArea');
				textAreaArray.forEach(function (textArea){
					textArea.value = "";
				});
			 	 
				 return false;
		 	 }
		 //Fin fonctionnement du Bouton Annuler
		 
		 
		 
		    //exclusion des weekends
  function getSundayCountBetweenDates(startDate, endDate){
   var totalweeks = 0;
   for (var i = startDate; i <= endDate; i.setDate(i.getDate()+1)){
       if (i.getDay() == 0 || i.getDay() == 6) totalweeks++;
   }
   return totalweeks;
}
//fin exclusion des weekends

function timeConverter(UNIX_timestamp){
	  var a = new Date(UNIX_timestamp * 1000);
	  var months = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','Aout','Septembre','Octobre','Novembre','Décembre'];
	  var year = a.getFullYear();
	  var month = months[a.getMonth()];
	  var date = a.getDate();     
	  var hour = a.getHours();
	  var min = a.getMinutes();
	  var sec = a.getSeconds();
	  var weekday = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
	  var dayGetName=weekday[a.getDay()];
	  hour1 = hour > 9 ? hour : '0' + hour;
	  min1 = min > 9 ? min : '0' + min;
	  sec1 = sec > 9 ? sec : '0' + sec;
	  var time = dayGetName + ' ' +date + ' ' + month + ' ' + year + ' \u00E0 ' + hour1 + ':' + min1 + ':' + sec1 ;
	  return time;    
	}
var timestpdeb=0;
    var dureeheure=0;
    var dureesec=0;
    var tamp1=0;
    var tamp2=0;
    var tamp3=0;
     var date1;

    var formatDeb='';
    
    
  $('.datedeb').on('change ',function(){
  
       // var date1=$('.datedeb').val();


         var formattedDateStart = new Date( $('.datedeb').val()); //date de debut
			 var d = formattedDateStart.getDate();
			 var m =  formattedDateStart.getMonth();
			 m += 1;  // JavaScript months are 0-11
			 var y = formattedDateStart.getFullYear();

			  d1 = d > 9 ? d : '0'+d;
              m1 = m > 9 ? m : '0'+m;

			  formatDeb= d1 + "/" + m1 + "/" + y;

			  d1 = d > 9 ? d : '0'+d;
              m1 = m > 9 ? m : '0'+m;

			  formatDeb= d1 + "/" + m1 + "/" + y;

            $('.datedeb').val(formatDeb)

            //console.log(formatDeb);

			date1=y+"-" +m1+ "-"+ d1;      
         
  });

  $('.timedeb').on('change ',function(){ 


  	    var time1=$('.timedeb').val();
        timestpdeb=new Date(date1+' '+time1);
        
        tamp1=timestpdeb.getTime()/1000;


		 $('.datedeblettre').val(timeConverter(tamp1)) ;


  });
	

$('.dureedebselect').val( $('.dureedeb').val()); //vue de modification 
 $('.dureedebselect').on('change keyup ',function(){
	   $('.dureedeb').val( $(this).val());
});

  $('.dureedebselect,.duree , .timedeb').on('change',function(){

		var dureeheure0=$('.dureedeb').val() ;
		var dureeheure;

           if (isNaN(dureeheure0)) {
			    dureeheure=0;
			}else{
				dureeheure=dureeheure0;
			}

         
        
          
          dureesec=$('.duree').val();
        
        var caldureesec= (dureesec*1)*24*60*60;
        
        
        var caldureeheure=(dureeheure*1)*60*60 ;
        
        
        var sommesec=(caldureesec*1)+(caldureeheure*1)
        
        var Tsommesec=new Date(sommesec);
        
        tamp2=Tsommesec.getTime();
	  
         
        
        
        
      // console.log('tamp2 '+ dureeheure );
        
        
        //Calcul le nombre de weekend
			 var formattedDateStart = new Date( $('.datedeb').val()); //date de debut
			 var d = formattedDateStart.getDate();
			 var m =  formattedDateStart.getMonth();
			 m += 1;  // JavaScript months are 0-11
			 var y = formattedDateStart.getFullYear();

			  d1 = d > 9 ? d : '0'+d;
              m1 = m > 9 ? m : '0'+m;

			  formatDeb= d1 + "/" + m1 + "/" + y;
            var formatStart=m + "/" + d + "/" + y;


           

			
            
                  
			
			 var formattedDateEnd = new Date((tamp1+tamp2)* 1000); //date de fin
			 var d = formattedDateEnd.getDate();
			 var m =  formattedDateEnd.getMonth();
			 m += 1;  // JavaScript months are 0-11
			 var y = formattedDateEnd.getFullYear();
            var formatEnd=m + "/" + d + "/" + y;

		 var startFrom = formatStart;
		 var startDate = new Date(startFrom);
		 var endDate = new Date(formatEnd);
		  var weeksCnt = getSundayCountBetweenDates(startDate, endDate);



          //////date de fin -date de retour//////
		  d1 = d > 9 ? d : '0'+d;
          m1 = m > 9 ? m : '0'+m;

         var dfin= d1 + "/" + m1 + "/" + y;   //date de fin DFI

		// console.log('Date de fin ',dfin);

		 $('.datefin').val(dfin);
      
      
       var TweeksCntsec=new Date(weeksCnt*48*60*60);
        
        tamp3=TweeksCntsec.getTime();
     
      
		 
		 //Fin Calcul le nombre de weekend
        
         
        //date de retour final
        //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
        if (isNaN(tamp1)) {
			    
			}else{
				$('.res6').val(timeConverter(tamp1+tamp2) ) ;
			}
		 
	  
	   

	  //console.log(tamp1+'- '+tamp2+' - '+tamp3 );

	  
        
        
   });
		
		 $('.dureedebselect').on('change blur',function(){
				 //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
				 $('.res6').val(timeConverter(tamp1+tamp2) ) ;
	          }); 
	//   Barre de progression 1
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
			//  Fin Barre de progression 1

			//   Barre de progression 2
			$('.progres2 .circle2').removeClass().addClass('circle2');
			$('.progres2 .bar2').removeClass().addClass('bar2');
			$(".circle2").first().addClass("active2");

         
			var timer2 = setInterval(increment2, 1000);

			function increment2() {
				$(".circle2:not(.done2)").first().removeClass("active2").addClass("done2").children(":first-child").html("&#10003;");
				$(".circle2:not(.done2)").first().addClass("active2");
				$(".circle2.done2").next().addClass("done2");
				if ($(".active2").find(".title2").text() === $("tr:last-child").find(".label2").text()) {
					clearInterval(timer2);
				}
			}
			//  Fin Barre de progression 2

	$('.typeDemande').on('change',function(){
            $('#motif').val('');
			var selectDemande=$.trim($(this).val());
			 


	//Debut Durée en fonction du choix
			$('.duree').val('');
			$('.timedeb').val(':');
			$('.res6').val('');
			$('.datedeb').val('JJ/MM/AA');
		switch (selectDemande) {
			case "ABSENCE" : 
				$('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',false);
				$('.duree').val(1);
				//$('#motif').prop("readonly",false);
				break;
			case "MARIAGE DU TRAVAILLEUR" :
			    $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(4);
				$('#motif').val("MARIAGE DU TRAVAILLEUR" );
				//$('#motif').prop("readonly",true);
				break;
			case "MARIAGE DUN DE SES ENFANTS, DUN FRERE, DUNE SOEUR":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("MARIAGE D'UN DE SES ENFANTS, D'UN FRERE, D'UNE SOEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DU CONJOINT":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(5);
				$('#motif').val("DECES DU CONJOINT");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(5);
				$('#motif').val("DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN FRERE OU DUNE SOEUR":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("DECES D'UN FRERE OU D'UNE SOEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN BEAU-PERE OU DUNE BELLE-MERE":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE");
				//$('#motif').prop("readonly",true);
				break;
			case "NAISSANCE DUN ENFANT":
				 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("NAISSANCE D'UN ENFANT");
				//$('#motif').prop("readonly",true);
				break;
			case "BAPTEME DUN ENFANT":
				 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(1);
				$('#motif').val("BAPTEME D'UN ENFANT");
				//$('#motif').prop("readonly",true);
				break;
			case "PREMIERE COMMUNION":
			     $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(1);
				$('#motif').val("PREMIERE COMMUNION");
				//$('#motif').prop("readonly",true);
				break;
			case "DEMENAGEMENT":
				 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart

				 $('.duree').prop('readonly',true);
				$('.duree').val(1);
				$('#motif').val("DEMENAGEMENT");
				//$('#motif').prop("readonly",true);
				break;
		default:

		 $('.dureedebselect').prop('readonly',false); 
    	 $('.timedeb').prop('readonly',false); 
    	 $('.datedeb').prop('readonly',false); //date de depart
    	 $('.duree').prop('readonly',false);
			// $('.duree').prop('disabled',false);
			$('.duree').val('');
			$('#motif').val(selectDemande);
				//$('#motif').prop("readonly",true);
		}
});
	// fonctionnement de la selection du nombre de jour du type ABSENCE
	$('.duree').on('keyup',function(){

		var selectDuree=$.trim($(this).val());
		var selectAbsence=$.trim($('.typeDemande').val());
		var selectDemande=$.trim($('#motif').val());
	//console.log(selectDuree);
			if(selectDuree>1){

				if(selectAbsence=='ABSENCE'){


					//$('#motif').val($('.typeDemande').val()).prop('disabled',true);
					if ( confirm( "La duree de votre demande est superieur \u00e0 1 jour. Nous allons ajouter sur votre cong\u00e9  annuel." ) ) {
						$('.typeDemande').val('CONGE ANNUEL');
						$('#motif').val($('.typeDemande').val()).prop('readonly',true);
					}
					else {
		    				$('.duree').val(1);
					}	

			}


			}
		


	});
	</script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/workflow.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/notification.js"></script>

	
</html>


