<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de pret</title>
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
	
	<!--ABASS INCLUDE-->
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/bootstrap.css" rel="stylesheet" type="text/css" />
		<link type="text/css"  href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.css"></link>
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
	
	<style>
			
		.col1_partie{
			width: 100%;
			font-size: 14px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			margin: -1% 0%; 
			padding-top: 9px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -3% 0%; 
			padding-left: 27px;
			padding-top: 5px;
		}
		
		.col_list_01{
			width: 50%;
			margin-top: -4%;
			margin-right: 5%;
			font-size: 17px;
			background-color: transparent;
			font-weight: lighter; 
			float: right;
		}
		
		.col_list_02{
			width: 100%;
			border: 1px solid #4a67b3; 
			padding-left: 27px;
			padding-top: 5px;
			padding-bottom: 0%;
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
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

		/*Debut de la Barre de progression  */

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
			width: 60px;
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

		/*Debut de la Barre de progression  1  */
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_prt' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formpret" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='PRT'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->
		
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
						<li class="active b1" ><a role="button" class="btn btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li>
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>


		            <!-- données de l'utilisateur connecté -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					 <!--fin données de l'utilisateur connecté -->

		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="col-sm-12 mt-5"style="margin-top: 0%;">
								<!-- 12_ 1 infos -->
								<div class="col_list_02 jumbotron">
									<div class="h-5 text-primary" style="font-weight: bold">ETAT DE CREANCES</div>

	<!-- etat creance -->
    <!-- nombre d'emprunt en cours -->
	<input type="hidden"  name='POS_VAL_RUB_A2A' value="{POS_VAL_RUB_A2A}" class="vnbreemprunt"  />
	 <!-- prelevement mensuel -->
	<input type="hidden"  name='POS_VAL_RUB_DC1' value="{POS_VAL_RUB_DC1}" class="vprelevmens1"  />
	 <!-- Quotité cessible-->
	<input type="hidden"  name='POS_VAL_RUB_QUO' value="{POS_VAL_RUB_QUO}" class="vqutotite"  />

	 <!-- montant d'emprunt en cours -->
	<input type="hidden"  name='POS_VAL_RUB_DDN' value="{POS_VAL_RUB_DDN}" class="vmtnemprunt"  />
	 <!-- date de fin prelevement -->
	<input type="hidden"  name='POS_VAL_RUB_DGR' value="{POS_VAL_RUB_DGR}" class="vdatefinprelev1"  />
	 <!-- Quotité prelevable-->
	<input type="hidden"  name='POS_VAL_RUB_RDT' value="{POS_VAL_RUB_RDT}" class="vqutotiteprelev1"  />
<!--fin etat creance -->

									<div class="row">
										<div class="col-sm-6" style="margin: 2% 5%;">
											<div class="form-group">
											<label for="bio">Nombre d'emprunt en cours :</label>
												<span class="viewnombreEmp">
													0
											</span>
											</div>
											<div class="form-group">
											<label for="bio">Pr&eacute;l&egrave;vement mensuel :</label>
											<span class="viewmtnpreleve">
													0
											</span>
											<label for="bio"> XOF</label>
											</div>
											<div class="form-group">
											<label for="bio">Quotit&eacute; cessible :</label>
											<span class="viewquotite">
													0
											</span>
											<label for="bio"> XOF</label>
											</div>
										</div>
										<!-- -->
										<div class="col-sm-6" style="margin: 2% -5%;">
											<div class="form-group">
											<label for="bio">Montant emprunt en cours :</label>
											<span class="viewmontantEmp">
													0
											</span>
											<label for="bio"> XOF</label>
											</div>
											<div class="form-group">
											<label for="bio">Date fin de pr&eacute;l&egrave;vement :</label>
											<span class="viewdatefin">
													12/06/2021
											</span>
											</div>
											<div class="form-group">
											<label for="bio">Quotit&eacute; pr&eacute;l&egrave;vable :</label>
											<span class="viewquotiteprelev">
													0
											</span>
											<label for="bio"> XOF</label>
											</div>
										</div>
									</div>
								</div>
								<!-- 12_ 2 infos -->
								<div class="col1_partie text-center">
									<span class="title text-while">NOUVELLE DEMANDE DE PRET</span>
								</div>
								<div class="col2_partie">
									<div class="row">
										<div class="col-sm-4" style="margin-top: 5%;">
										<div class="alert alert-danger flashalert" role="alert" style="display:none">
						      				 Votre montant prelevable est sup&eacute;rieur &agrave; votre quotit&eacute; cessible!! Veuillez changer le nombre de mois(Dur&eacute;e) et le Montante emprunt&acute;
										</div>
											<div class="form-group">
											   <label for="bio">Montant emprunt :</label>
												<input type="text" placeholder="" name='POS_VAL_RUB_VEM' value="{POS_VAL_RUB_VEM}" class="form-control sommeEmprunt" id="bio" rows="1" style="width: 90%;resize: none"  data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup">
											</div>
											<div class="form-group">
											   <label for="bio">Dur&eacute;e :</label>
							  					 <input type="text" name='POS_VAL_RUB_DUM' value="{POS_VAL_RUB_DUM}" placeholder="Nbres de mois" class="form-control mois" id="bio" rows="1" style="width: 90%;resize: none" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?">
											</div>
											<div class="form-group">
											   <label for="bio">Date d&eacute;but de pr&eacute;l&egrave;vement :</label>
							   					<input type="text" name='POS_VAL_RUB_DIN' value="{POS_VAL_RUB_DIN}"  placeholder="" class="form-control datepicker" id="date1" rows="1" style="width: 90%;resize: none">
											</div>
											<div class="form-group">
											   <label for="bio">Date fin de pr&eacute;l&egrave;vement :</label>
							   					<input type="text" name='POS_VAL_RUB_DFI' value="{POS_VAL_RUB_DFI}" placeholder="" class="form-control" id="date2" rows="1" style="width: 90%;resize: none">
											</div>
										</div>
										
										<div class="col-sm-4" style="margin-top: 5%;">
											<div class="form-group">
											   <label for="selection">Avis RH</label>
												<select class="form-control" style="width: 90%" name='POS_VAL_RUB_AX2' id='id_rub_AX2'>
													<option value="">Statut du Pr&ecirc;t</option>
													<option value="PRET ACCORDE">Pr&ecirc;t accord&eacute;</option>
													<option value="PRET REFUSE">Pr&ecirc;t refus&eacute;</option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_AX2' id='POS_VAL_CTRL_AX2' value='{POS_VAL_RUB_AX2}'>
											</div>
											<div class="form-group">
											   <label for="bio">Commentaire :</label>
											   <textarea class="form-control" name='POS_VAL_RUB_CTM' id="bio" rows="3" style="width: 90%;resize: none">{POS_VAL_RUB_CTM}</textarea>
											</div>
										</div>
										<div class="col-sm-4" style="margin-top: 5%;">
											<div class="form-group">
											   <label for="selection">Avis Direction</label>
												<select  class="form-control" style="width: 90%" name='POS_VAL_RUB_TPT' id='id_rub_TPT'>
													<option value="">Statut du Pr&ecirc;t</option>
													<option value="PRET ACCORDE">Pr&ecirc;t accord&eacute;</option>
													<option value="PRET REFUSE">Pr&ecirc;t refus&eacute;</option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_TPT' id='POS_VAL_CTRL_TPT' value='{POS_VAL_RUB_TPT}'>
											</div>
											<div class="form-group">
											   <label for="bio">Commentaire :</label>
											   <textarea class="form-control" name='POS_VAL_RUB_DSC' id="bio" rows="3" style="width: 90%;resize: none">{POS_VAL_RUB_DSC}</textarea>
											</div>
											<div class="form-group">
											   <label for="bio">Date de mise &agrave; disposition :</label>
							  					 <input type="text" name='POS_VAL_RUB_DAA' value="{POS_VAL_RUB_DAA}" placeholder="" class="form-control datepicker" id="date3" rows="1" style="width: 90%;resize: none"></input>
											</div>
										</div>
									</div>
								</div>
							</div>
						</nav>
					<!-- fin -->
				</div>
		   </div>
		   <div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			     <!-- debut ligne de vie-->
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
							<span class="title1">EMPLOYE</span>
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
							<span class="title1">RH</span>
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
									<strong class="pt-1_pl-5 rh_visa" style="font-size: 13px;">{POS_VAL_RUB_VC0}</strong>
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
							<span class="title1">CONTROLEUR</span>
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
									<strong class="pt-1_pl-5 control_visa" style="font-size: 13px;">{POS_VAL_RUB_VC1}</strong>
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
							<span class="label1">4</span>
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
									<strong class="pt-1_pl-5  dg_visa" style="font-size: 13px;">{POS_VAL_RUB_VC3}</strong>
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
							<span class="label1">5</span>
							<span class="title1">FINANCE</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4E}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  finance_visa" style="font-size: 13px;">{POS_VAL_RUB_VC4}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT6}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT5}</strong>
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

						<!--commentaire sur  de la ligne de vie -->

					<div class="row jumbotron" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">RH</label>
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
								<label for="bio">CONTROLEUR DE GESTION</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="form-control" placeholder="" style="width: 80%;">
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
								<input type="text" name='POS_VAL_RUB_DT2' value="{POS_VAL_RUB_DT2}" class="form-control" placeholder="" style="width: 100%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT2' rows="1" style="width: 90%;resize: none">{POS_VAL_RUB_CT2}</textarea>
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
								<input type="text" name='POS_VAL_RUB_DT3' value="{POS_VAL_RUB_DT3}" class="form-control" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT3' style="width: 90%;resize: none">{POS_VAL_RUB_CT3}</textarea>
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
						<!-- acteur 5 -->
						<div class="acteur5">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">FINANCE</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4E' value="{POS_VAL_RUB_A4E}" class="form-control" placeholder="" style="width: 80%;">
											<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4E', 'POS_VAL_RUB_A4E')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>
									</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC4}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT6' value="{POS_VAL_RUB_DT6}" class="form-control" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT5' style="width: 90%;resize: none">{POS_VAL_RUB_CT5}</textarea>
							</div>
						</div>
												
					</div>
				


						<!-- Fin du commentaire de la ligne de vie -->

				</div>
				<!-- Fin de la ligne de vie du parcours de l'employe -->

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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="Etat Fiche" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_HIS' rows="5" style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
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
								  <textarea  class="form-control" id="bio" rows="2"  name='POS_VAL_RUB_AVU' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_AMO' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
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

	<!-- jquery  -->
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-3.5.1.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-ui.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery.validate.min.js"></script>

		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>-->
		<script src="../dist/jquery-steps.js"></script>
		<!--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
	<!-- endjquery  -->

		
	
	 <script>
	  //affichage en fonction du MODE sur le Formulaire 
	 
		 if($('.get_mode').val()=='CONSULTATION'){
				$('.btn').hide();
				
		 }
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
		 



	//Traitement des creances 

	  Number.prototype.formatMoney = function(decPlaces, thouSeparator, decSeparator) {
		var n = this,
			decPlaces = isNaN(decPlaces = Math.abs(decPlaces)) ? 2 : decPlaces,
			decSeparator = decSeparator == undefined ? "." : decSeparator,
			thouSeparator = thouSeparator == undefined ? "," : thouSeparator,
			sign = n < 0 ? "-" : "",
			i = parseInt(n = Math.abs(+n || 0).toFixed(decPlaces)) + "",
			j = (j = i.length) > 3 ? j % 3 : 0;
		return sign + (j ? i.substr(0, j) + thouSeparator : "") + i.substr(j).replace(/(\d{3})(?=\d)/g, "$1" + thouSeparator) + (decPlaces ? decSeparator + Math.abs(n - i).toFixed(decPlaces).slice(2) : "");
	};


      let mois=1;
	  let sommeEmprunt=0
	  let montantmensuel=0;

      
	   var mtnprelev= parseInt($('.vprelevmens1').val());

	    var quotite = parseInt($('.quotite').text()) ;


		$('.viewmtnpreleve').text( ( parseInt($('.vprelevmens1').val()) ).formatMoney(0,'.','.'));
		$('.viewquotiteprelev').text( ( parseInt($('.vqutotiteprelev1').val()) ).formatMoney(0,'.','.'));

		 $('.vprelevmens').val(montantmensuel) ; 

      
	  //Calcul quotité cessible prelevable
	  if(mtnprelev==0){
		  var a=quotite;
		   $('.vqutotiteprelev').val( isNaN(a) ?  0 : a.formatMoney(0,'','.') ) ;
		  $('.viewquotiteprelev').text((a).formatMoney(0,'.','.')  );
	  }else{
           var b=(quotite*1)-(mtnprelev*1);
		    $('.vqutotiteprelev').val( isNaN(b) ?  0 : b ) ;
			$('.viewquotiteprelev').text((b).formatMoney(0,'.','.')  );
	  }

	  $('.mois, .sommeEmprunt').on('input',function(){
		   mois=parseInt($('.mois').val())*1;
	       sommeEmprunt=parseInt($('.sommeEmprunt').val())*1;

		  

		   if(mois==0 || mois=='' ){
			   //montantmensuel=0 ;
			    //$('.vprelevmens').val(0) ; 	 
			   
			} else{

					 montantmensuel= sommeEmprunt/mois;
                     
					 
					 if(montantmensuel>quotite){
 						   $('.flashalert').show();
						  montantmensuel=0;
						  $('.sommeEmprunt').val(0);
					 }else{
                           $('.flashalert').hide();
					 }

					  //Calcul quotité cessible prelevable
					if(montantmensuel==0){
						var a=quotite;
						// $('.vqutotiteprelev1').val( isNaN(a) ?  0 : a.formatMoney(0,'','.') ) ;
						//$('.viewquotiteprelev').text((a).formatMoney(0,'.','.')  );
					}else{
						var b=(quotite*1)-(montantmensuel*1);

						     
							   $('.vqutotiteprelev1').val( isNaN(b) ?  0 : b.formatMoney(0,'','.') ) ;

							$('.viewquotiteprelev').text((b).formatMoney(0,'.','.')  );
					}
                      
					 $('.viewmtnpreleve').text( ( montantmensuel ).formatMoney(0,'.','.'));

					 $('.vprelevmens1').val(isNaN(montantmensuel) ?  0 : montantmensuel.formatMoney(0,'','.')) ;   
			}

		  
	  });


	  // vnbreemprunt vprelevmens vqutotite vmtnemprunt vdatefinprelev vqutotiteprelev
	     

	   $('.vnbreemprunt').val( $('.nombreEmp').text() ) ;
	   $('.vqutotite').val( $('.quotite').text() ) ;
	   $('.vmtnemprunt').val( $('.montantEmp').text() ) ;
	    $('.vdatefinprelev').val( $('.datefin').text() ) ;

	   $('.viewnombreEmp').text($('.nombreEmp').text());
	   $('.viewmontantEmp').text( ( parseInt($('.montantEmp').text() ) ).formatMoney(0,'.','.')  );
	   $('.viewquotite').text( ( parseInt($('.quotite').text() ) ).formatMoney(0,'.','.')  );
	   $('.viewdatefin').text($('.datefin').text());

//Fin Traitement des creances 
   
		



    $(document).ready(function () {
			 $('#date1, #date2 , #date3').datepicker({
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
		 $('#formpret').parsley();

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
		 
	

		
	</script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/workflowPRT.js"></script>

	
</html>


