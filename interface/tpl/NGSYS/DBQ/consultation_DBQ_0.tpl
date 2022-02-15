<!DOCTYPE html>
<html lang="fr">
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation domiciliation bancaire</title>
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

	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />

	<!-- END JQUERY UI -->
	 
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
			padding-left: 30px;
			padding-right: 30px;
		}
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
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
		
		/* Barre de progression */
		
		 .progres {
			width: 80%;
			margin: 20px auto;
			text-align: center;
		}
		.progres .circle, .progres .bar {
			display: inline-block;
			background: #fff;
			width: 40px;
			height: 40px;
			border-radius: 40px;
			border: 1px solid grey;
		}
		.progres .bar {
			position: relative;
			width: 150px;
			height: 7px;
			top: -25px;
			margin-left: -5px;
			margin-right: -5px;
			border-top: 1px solid grey;
			border-bottom: 1px solid grey;
			border-left: none;
			border-right: none;
			border-radius: 0;
		}
		.progres .circle .label {
			display: inline-block;
			width: 32px;
			height: 32px;
			line-height: 32px;
			border-radius: 32px;
			margin-top: 3px;
			color: #b5b5ba;
			font-size: 17px;
		}
		.progres .circle .title {
			color: #b5b5ba;
			font-size: 13px;
			line-height: 30px;
			margin-top: 7px;
			margin-left: -5px;
		}
		/* Done / Active */
		.progres .bar.done, .progres .circle.done {
			background: rgb(175, 167, 167);
		}
		.progres .bar.active {
			background: linear-gradient(to right, #EEE 40%, #FFF 60%);
		}
		.progres .circle.done .label {
			color: #FFF;
			background: #81CE97;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres .circle.done .title {
			color: #444;
		}
		.progres .circle.active .label {
			color: #FFF;
			background: #0c95be;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres .circle.active .title {
			color: #0c95be;
		}
		.progres {
			height:auto;
		}
		span {
			transition: background 2s;
		}

		.progres .circle div{
			display: none;
		}

		.progres .circle:hover div{
			display: block;
			position: absolute;
			float: left;
			background: #cfd4df;
			width: 20%;
			padding: 7px;
			margin: 0% -8%;
			z-index: 999;
		}

		.progres .circle div span{
			font-size: 13px; 
			font-family: 'Times New Roman', Times, serif;
		}

		.container-info{
			width: 23%;
			margin: auto;
			margin-top: 11px;
			padding: 12px;
			background: #4a67b3;
		}
		.parsley-error{
			border-style: solid;
  			border-color: red;
		}

		/*Debut de la Barre de progression  1  */

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
				/*FIN Barre de progression  1  */

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
		
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_dbq' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='DBQ'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>

		<!-- Appel du lien ngser -->
		<input type="hidden" class="user_url" />


		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->
		    <input type='hidden' class='appName' value="{NOM_APPLICATION}">
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
						<li class="active b1" ><a role="button" class="btn btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
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
							<div class="row hidden" >
								<div class="col-sm-6 text-center">
									<input type="radio" class="val_choix"  name="POS_VAL_RUB_E2" value="OUI">
									<label for="bio">Je fais une domiciliation bancaire.</label>
								</div>
								<div class="col-sm-6 text-center">
									<input type="radio" class="val_choix controlrad"  name="POS_VAL_RUB_E2" value="NON" >
									<label for="bio">Je fais un changement de banque.</label>
								</div>
								<input type="hidden" name='POS_VAL_CTRL_E2' id='POS_VAL_CTRL_E2' value='{POS_VAL_RUB_E2}'>
							</div>   

							<div class="row" style="margin-top: 1%;">
								<!-- 12_ 1 infos -->
								<div class="col-sm-12" style="margin-bottom: 2%;display:">
									<div class="col1_partie text-center">
										<span class="title text-while;font-size: 12px">CERTIFICAT DE NON REDEVANCE</span>
									</div>
									<div class="col3_partie text-center">
										<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
										name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent;opacity: 0px"></iframe>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="col1_partie text-center">
										<span class="title text-while">INFORMATIONS BANCAIRES</span>
									</div>
									<div class="col2_partie" style="padding-top: 3%;">
										<div class="form-group">
										   	<label for="bio">Banque :</label>
						   					<input type="text" class="form-control" id='input_bqe' name='POS_VAL_RUB_BQE' value="{POS_VAL_RUB_BQE}" readonly='true' style="width: 100%;" data-parsley-required="true" readonly data-parsley-trigger="keyup">
										</div>
										<div class="form-group">
										   	<label for="bio">RIB :</label>
						   					<input type="text" class="form-control" id="input_rib"  name='POS_VAL_RUB_RIB' value="{POS_VAL_RUB_RIB}" readonly='true' data-parsley-required="true" data-parsley-trigger="keyup" readonly style="width: 100%;"/>
										</div>
										<div class="form-group">
											<input class="form-check-input cbk1" type="checkbox" id="input_radio" name="POS_VAL_RUB_E1" value="OUI"  required>
				                    		<span class="form-check-label" for="cgu" style="opacity: 0px">Je certifie les informations bancaires conforme !</span>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6">
									<div class="col1_partie text-center">
										<span class="title text-while">CHANGEMENT DE BANQUE</span>
									</div>
									<div class="col2_partie" style="padding-top: 3%;">
										<div class="form-group">
										   	<label for="bio">Nouvelle Banque :</label>
						   					 <select  name='POS_VAL_RUB_NBQ' id="nvlle_bnq" class="form-control" rows="1" style="margin: 0% 0%" rows="1" style="width: 100%;" >
															<option value="" selected>Veuillez s&#233;lectionner</option>
															<option value="Afrilan First Bank">Afrilan First Bank</option>
															<option value="Bank Of Africa">Bank Of Africa</option>
															<option value="Banque Atlantique">Banque Atlantique</option>
															<option value="BDA">BDA</option>
															<option value="Banque Populaire">Banque Populaire</option>
															<option value="BSIC">BSIC</option>
															<option value="BDU-CI">BDU-CI</option>
															<option value="BGFIBank">BGFIBank</option>
															<option value="BHCI">BHCI</option>
															<option value="BICICI">BICICI</option>
															<option value="BMS-CI">BMS-CI</option>
															<option value="BNI">BNI</option>
															<option value="Bridge Bank Group">Bridge Bank Group</option>
															<option value="CITI">CITI</option>
															<option value="Coris Bank">Coris Bank</option>
															<option value="Diamond">Diamond</option>
															<option value="Ecobank">Ecobank</option>
															<option value="GTBank">GTBank</option>
															<option value="NSIA">NSIA</option>
															<option value="Orabank">Orabank</option>
															<option value="Orange Banque">Orange Banque</option>
															<option value="Société Ivoirienne de Banque">Soci&#233;t&#233; Ivoirienne de Banque</option>
															<option value="SGBCI">SGBCI</option>
															<option value="Stanbic Bank">Stanbic Bank</option>
															<option value="Standard Chartered">Standard Chartered</option>
															<option value="UBA">UBA</option>
															<option value="Versus Bank">Versus Bank</option>
														</select>
														<input type="hidden" name='POS_VAL_CTRL_NBQ' id='POS_VAL_CTRL_NBQ' value="{POS_VAL_RUB_NBQ}" placeholder="Banque" />
										</div>
										<div class="form-group">
						  				 	<input type="text"class="form-control" id="nveau_rib" name='POS_VAL_RUB_NRI' value="{POS_VAL_RUB_NRI}" data-parsley-required="true" data-parsley-trigger="keyup" readonly="true" style="width: 100%;">
										</div>
										<div class="form-group" style="color: transparent;">
											<!-- <input class="form-check-input" type="checkbox" id="input_radio" required> -->
				                    		<span class="form-check-label" for="cgu">Je certifie les informations bancaires conforme !</span>
										</div>
									</div>
								</div>
							</div>
						</nav>
					<!-- fin -->
				</div>
		   </div>
			<!-- traitement -->
			<div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			     <!-- debut ligne de vie du parcours de l'employe -->
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
							<span class="title1" style="margin-left:-2rem">COLLABORATEUR</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 20%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Nom et prenom(s) :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_NOM} {POS_VAL_RUB_PRE}</strong>
								</p>
								 <input type="hidden" name='POS_VAL_RUB_CRE' value="{POS_VAL_RUB_CRE}" class="createur"   style="color: black;"  />
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
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4A}</strong>
								</p>-->
								<input type="hidden" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" class="rh_wk" style="color: black;"  />
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
							<span class="title1">DGA</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4B}</strong>
								</p>-->
								<input type="hidden" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="dga_wk" style="color: black;"  />
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 dga_visa" style="font-size: 13px;">{POS_VAL_RUB_VC1}</strong>
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
							<span class="title1">DG</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4C}</strong>
								</p>-->
								<input type="hidden" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="dg_wk" style="color: black;"  />
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  dg_visa" style="font-size: 13px;">{POS_VAL_RUB_VC2}</strong>
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
							<span class="title1">CLOS</span>
							
						</div>
					</div>

						<!--commentaire sur  de la ligne de vie -->

					<div class="row jumbotron employ" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<!--<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">RH</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
								</div>	
							</div>-->
							<div class="col-sm-5 rhconnex " style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT1' style="width: 250%;resize: none">{POS_VAL_RUB_CT1}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<!--<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DGA</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>-->
							<div class="col-sm-5 dgaconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT2' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur3">
							<!--<div class="col-sm-4 " style="padding-bottom: 3%">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>-->
							<div class="col-sm-5 dgconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT3' style="width: 250%;resize: none">{POS_VAL_RUB_CT3}</textarea>
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
					<!-- <div class="col-sm-12" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col3_partie text-center">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
						</div>
					</div> -->
					<div class="col-sm-12">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">VISUALISEUR</span>
						</div>
						<div class="col3_partie text-center">
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

							<input type="hidden" class="createur" name="POS_VAL_RUB_CRE" value="{POS_VAL_RUB_CRE}">
							<div class="col3_partie" style="padding: 5%;">
								<!-- N° poseidon -->
								<div class="form-group row" style="margin: 0%">
									<label for="bio">N&#176; poseidon</label>
									<input type="text" id="numposeidon" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" name='POS_VAL_RUB_HIS' id="bio" rows="5" style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
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
									<textarea  class="form-control" name='POS_VAL_RUB_AMO' id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   	<label for="bio">Suppression :</label>
									<textarea  class="form-control" name='POS_VAL_RUB_ASU' id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
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
	<!-- <script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script> -->
	<!-- <script src="http://code.jquery.com/jquery-latest.min.js"></script> -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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
<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DBQ/dbqpdf/pdfdomiciliation.js"></script>
	<!-- imporation du fichier de desactivation des champs -->
		<script src="../../../../disable_fields.js"></script>
	<script>
if($('.cbk1').val()=="OUI"){
	  $('.cbk1').prop('checked', true);
	 
}

var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
		$('.bouton_sub').hide();	
			}

	//traitement sur la connection de chaque profil sur le workflow 


		var prof_util = "{PROFIL_UTILISATEUR}";	
	 		var str = prof_util;
			var profil_util = str.substring(0, 7);

		$('.rhconnex,.dgconnex,.dgaconnex').hide();

		if(profil_util=="EMPLOYE"){
		
			$('.employ').hide();
		}

		if(profil_util=="RH"){
		
			$('.rhconnex').show();
		}

		if(profil_util=="DGA"){
		
			$('.dgaconnex').show();
		}

		if(profil_util=="DIRECTE"){
			$('.dgconnex').show();

		}	


			    



	$('#formDBQ').parsley();

	//affichage en fonction du MODE sur le Formulaire  
	if($('.get_mode').val()=='CONSULTATION'){
		$('.btn').hide();
	}

	if($('.get_mode').val()=='MODIFICATION'){
		 $('.cbk1').prop('disabled', true);
		  $('#input_rib,#input_bqe').prop("disabled",true);
		  //$('.val_choix').prop("disabled",true);
	}


		 
   
	//Fin fonctionnement du Bouton Annuler

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
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DBQ/workflowDBQ.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DBQ/notification.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DBQ/valideurs/validateur.js"></script>

	
</html>


