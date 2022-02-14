<!DOCTYPE html>
<html lang="fr">    
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de pret</title>
	 
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
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
	
	<style>

		.hearder_card{
			width: 100%;
			border: 1px solid #4a67b3; 
			padding: 1px;
		}
			
		.col1_partie{
			width: 100%;
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
			margin: -2% 0%; 
			margin-bottom: 2%;
			padding-top: 3%;
			padding-left: 5%;
			padding-right: 5%;
			height: 30rem;
		}
			
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
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
		<input type='hidden' class='appName' value="{NOM_APPLICATION}">
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
     
		<div class="tab-content">    
		   <div class="tab-pane fade active in"  id="tabs-1">
		    <section class="botton_pris" style="display:none" >
				<a href="javascript:void(0)"  style="display:none" class="btn p-1 bg-info print_vbtn">Visualiser le pdf</a>
				<a href="javascript:void(0)" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
			</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="col-sm-12">
								<!-- 12_ 1 infos -->
								<div class="hearder_card jumbotron">
									<div class="h-5 text-primary" style="font-weight: bold">ETAT DE CREANCES</div>

										<!-- etat creance -->
									    <!-- nombre d'emprunt en cours -->
										<input type="hidden"  name='POS_VAL_RUB_A2A' value="{POS_VAL_RUB_A2A}" class="vnbreemprunt"  />
										 <!-- prelevement mensuel -->
										<input type="hidden"  name='POS_VAL_RUB_ADR' value="{POS_VAL_RUB_ADR}" class="vprelevmens"  />
										<input type="hidden"  name='POS_VAL_RUB_DC1' value="{POS_VAL_RUB_DC1}" class="vprelevmens_actuel"  />
										<input type="hidden" class="prelev_mens_lettre" name="POS_VAL_RUB_A1" value="{POS_VAL_RUB_A1}">
										 <!-- Quotité cessible-->
										<input type="hidden"  name='POS_VAL_RUB_QUO' value="{POS_VAL_RUB_QUO}" class="vqutotite"  />

										 <!-- montant d'emprunt en cours -->
										<input type="hidden"  name='POS_VAL_RUB_DDN' value="{POS_VAL_RUB_DDN}" class="vmtnemprunt"  />
										 <!-- date de fin prelevement -->
										<input type="hidden"  name='POS_VAL_RUB_DGR' value="{POS_VAL_RUB_DGR}" class="vdatefinprelev" />
										 <!-- Quotité prelevable-->
										<input type="hidden"  name='POS_VAL_RUB_RDT' value="{POS_VAL_RUB_RDT}" class="vqutotiteprelev" />
									<!--fin etat creance -->

									<div class="row" style="margin: 2%">
										
										<div class="col-sm-6 form-group">
											<label for="bio" style="width:200px">Nombre d'emprunt</label>:
											<span class="viewnombreEmp" style="margin-left: 2%">0</span>
										</div>
										<div class="col-sm-6 form-group">
											<label for="bio" style="width:200px">Montant emprunt</label>:
											<span class="viewmontantEmp" style="margin-left: 2%">0</span>
											<label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
										</div>

										<div class="col-sm-6 form-group">
											<label for="bio" style="width:200px">Pr&eacute;l&egrave;vement mensuel</label>:
											<span class="viewmtnpreleve" style="margin-left: 2%">0</span>
											<label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
										</div>
										<div class="col-sm-6 form-group">
											<label for="bio" style="width:200px">Date fin des pr&eacute;l&egrave;vements</label>:
											<span class="viewdatefin" style="margin-left: 2%">12/06/2021</span>
										</div>

										<div class="col-sm-6 form-group">
											<label for="bio" style="width:200px">Quotit&eacute; cessible</label>:
											<span class="viewquotite" style="margin-left: 2%">0</span>
											<label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
										</div>
										<div class="col-sm-6 form-group">
											<label for="bio" style="width:200px">Quotit&eacute; pr&eacute;l&egrave;vable</label>:
											<span class="viewquotiteprelev" style="margin-left: 2%">0</span>
											<label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
										</div>

									</div>
								</div>
								<!-- 12_ 2 infos -->
								<div class="col1_partie text-center">
									<span class="title text-while">NOUVELLE DEMANDE DE PRET</span>
								</div>
								<div class="col2_partie">
									<div class="alert alert-danger flashalert" role="alert" style="display:none">
					      				 Votre montant prelevable est sup&eacute;rieur &agrave; votre quotit&eacute; cessible!! Veuillez changer le nombre de mois(Dur&eacute;e) et le Montante emprunt&acute;
									</div>
									<div class="row" style="padding-top: 1%">
										<div class="col-sm-6 form-group">
										   <label for="bio">Montant emprunt :</label>
											<input type="number" min="0" name='POS_VAL_RUB_VEM' value="{POS_VAL_RUB_VEM}" class="form-control sommeEmprunt" id="bio" style="width: 100%;"  data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup">
											
					<input type="hidden" name="POS_VAL_RUB_MDT" value="{POS_VAL_RUB_MDT}" class="emprunt_lettre" />
										</div>
										<div class="col-sm-6 form-group">
										   	<label for="bio">Dur&eacute;e (en mois) :</label>
						  					<input type="Number" name='POS_VAL_RUB_DUM' min="0" value="{POS_VAL_RUB_DUM}" class="form-control mois" id="bio"  style="width: 100%;" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?">
											  <input type="hidden" name="POS_VAL_RUB_DLA" value="{POS_VAL_RUB_DLA}" class="mois_lettre" />
										</div>
										<div class="col-sm-6 form-group">
										   <label for="bio">Date d&eacute;but de pr&eacute;l&egrave;vement :</label>
						   					<input type="text" name='POS_VAL_RUB_DIN' value="{POS_VAL_RUB_DIN}"  placeholder="jj/mm/aaaa" class="form-control datedebut" id="date1" style="width: 100%;">
										</div>
										<div class="col-sm-6 form-group">
										   <label for="bio">Date fin de pr&eacute;l&egrave;vement :</label>
						   					<input type="text" name='POS_VAL_RUB_DFI' value="{POS_VAL_RUB_DFI}" placeholder="jj/mm/aaaa" class="form-control dateFin" readonly="true" style="width: 100%;">
										</div>


											<div class="col-sm-12 form-group" >
													<label for="bio">Motif <span class='text'></span></label>
													<input type="text" required="true" name='POS_VAL_RUB_COM' value="{POS_VAL_RUB_COM}" placeholder="Motif du pret" class="form-control" style="width: 100%;">
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
								<!-- Affichage du visa -->
								<input type="hidden" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" class="rh_wk" style="color: black;"  />
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
									<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4B}</strong>
								</p>-->
								<input type="hidden" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="controleur_wk" style="color: black;"  />
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
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4C}</strong>
								</p>-->
								<input type="hidden" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="dga_wk" style="color: black;"  />
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
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4D}</strong>
								</p>-->
								<input type="hidden" name='POS_VAL_RUB_A4D' value="{POS_VAL_RUB_A4D}" class="dg_wk" style="color: black;"  />
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
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4E}</strong>
								</p>-->
								<input type="hidden" name='POS_VAL_RUB_A4E' value="{POS_VAL_RUB_A4E}" class="finance_wk" style="color: black;"  />
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

					<div class="row jumbotron emplconnex" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<!--<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">RH</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
								</div>	
							</div>-->
							<div class="col-sm-5 rhconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT1' style="width: 250%;resize: none">{POS_VAL_RUB_CT1}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">CONTROLEUR DE GESTION</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>
							<div class="col-sm-5 contrconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT2' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur3">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">DGA</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>
							<div class="col-sm-5 dgaconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT3' style="width: 250%;resize: none">{POS_VAL_RUB_CT3}</textarea>
							</div>
						</div>
						<!-- acteur 4 -->
						<div class="acteur4">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4D' value="{POS_VAL_RUB_A4D}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>
							<div class="col-sm-5 dgconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT4' style="width: 250%;resize: none">{POS_VAL_RUB_CT4}</textarea>
							</div>
						</div>
						<!-- acteur 5 -->
						<div class="acteur5">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">FINANCE</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4E' value="{POS_VAL_RUB_A4E}" class="form-control" placeholder="" style="width: 80%;">
									</div>
							</div>
							<div class="col-sm-5 financeconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT5' style="width: 250%;resize: none">{POS_VAL_RUB_CT5}</textarea>
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
					<div class="col-sm-12" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col3_partie" style="padding-top:0%;">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
						</div>
					</div>
					<div class="col-sm-12" style="margin-top:0.7%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">VISUALISEUR</span>
						</div>
						<div class="col3_partie text-center" style="padding-top: 0%">
							<iframe id='frm_affiche_fichier' name='frm_affiche_fichier' src='../afficheur/afficher_menu_fichier.php?POS_NUM_DOC={POS_NUM_DOC}#view=FitH'  height='630px' width='99%' scrolling='auto' frameborder='0' style=""></iframe>
						</div>
					</div>
				</div>
		   </div>
		   <!-- historique -->
		   <div class="tab-pane fade in "  id="tabs-4" style="margin-top:0.7%;">
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
									<input type="text" placeholder="Etat Fiche" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control etat_fiche" style="width: 100%">
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
							<div class="col3_partie" style="padding: 5%;">
								<div class="form-group">
								   <label for="bio">Consultation :</label>
								  <textarea  class="form-control" id="bio" rows="2"  name='POS_VAL_RUB_AVU' style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_AMO' style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_ASU' style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
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
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/prtpdf/pdfpret.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/calcpret/calc_prt.js"></script>  
	<!-- endjquery  -->

		
	
	 <script>

//DEBUT SCRIPT DE CONVERSION DES MONTANTS EN LETTRE
 function ConvNumberLetter(Nombre) {
     var dblEnt, byDec;
     var bNegatif;
     var strCentimes = new String();


     if (Nombre < 0) {
         bNegatif = true;
         Nombre = Math.abs(Nombre);
     }
     dblEnt = parseInt(Nombre);
     byDec = parseInt((Nombre - dblEnt) * 100);

     if (byDec == 0) {
         if (dblEnt > 999999999999999) {
             return "#TropGrand";
         }
     } else {
         if (dblEnt > 9999999999999.99) {
             return "#TropGrand";
         }
     }
     if (Nombre == $('.vprelevmens1').val()) {
         $('.prelev_mens_lettre').val(ConvNumEnt(dblEnt));
     }

      if (Nombre == $('.sommeEmprunt').val()) {
          $('.emprunt_lettre').val(ConvNumEnt(dblEnt));
      }
     if (Nombre == $('.mois').val()) {
          $('.mois_lettre').val(ConvNumEnt(dblEnt));
      }
 }

 function ConvNumEnt(Nombre) {
     var byNum, iTmp, dblReste;
     var StrTmp = new String();
     var NumEnt;
     iTmp = Nombre - (parseInt(Nombre / 1000) * 1000);
     NumEnt = ConvNumCent(parseInt(iTmp));
     dblReste = parseInt(Nombre / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = "mille ";
             break;
         default:
             StrTmp = StrTmp + " mille ";
     }
     NumEnt = StrTmp + NumEnt;

     dblReste = parseInt(dblReste / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = StrTmp + " million ";
             break;
         default:
             StrTmp = StrTmp + " millions ";
     }
     NumEnt = StrTmp + NumEnt;
     dblReste = parseInt(dblReste / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = StrTmp + " milliard ";
             break;
         default:
             StrTmp = StrTmp + " milliards ";
     }
     NumEnt = StrTmp + NumEnt;
     dblReste = parseInt(dblReste / 1000);
     iTmp = dblReste - (parseInt(dblReste / 1000) * 1000);
     StrTmp = ConvNumCent(parseInt(iTmp));
     switch (iTmp) {
         case 0:
             break;
         case 1:
             StrTmp = StrTmp + " billion ";
             break;
         default:
             StrTmp = StrTmp + " billions ";
     }
     NumEnt = StrTmp + NumEnt;

     return NumEnt;
 }

 function ConvNumDizaine(Nombre) {
     var TabUnit, TabDiz;
     var byUnit, byDiz;
     var strLiaison = new String();

     TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept",
         "huit", "neuf", "dix", "onze", "douze", "treize", "quatorze", "quinze",
         "seize", "dix sept", "dix huit", "dix neuf");
     TabDiz = Array("", "", "vingt", "trente", "quarante", "cinquante",
         "soixante", "soixante", "quatre vingt", "quatre vingt");

     byDiz = parseInt(Nombre / 10);
     byUnit = Nombre - (byDiz * 10);
     strLiaison = " ";
     if (byUnit == 1) strLiaison = " et ";
     switch (byDiz) {
         case 0:
             strLiaison = "";
             break;
         case 1:
             byUnit = byUnit + 10;
             strLiaison = "";
             break;
         case 7:
             byUnit = byUnit + 10;
             break;
         case 8:
             strLiaison = " ";
             break;
         case 9:
             byUnit = byUnit + 10;
             strLiaison = " ";
             break;
     }
     var NumDizaine = TabDiz[byDiz];
     if (byDiz == 8 && byUnit == 0) NumDizaine = NumDizaine + "s";
     if (TabUnit[byUnit] != "") {
         NumDizaine = NumDizaine + strLiaison + TabUnit[byUnit];
     } else {
         NumDizaine = NumDizaine;
     }
     return NumDizaine;
 }

 function ConvNumCent(Nombre) {
     var TabUnit;
     var byCent, byReste;
     var strReste = new String();
     var NumCent;
     TabUnit = Array("", "un", "deux", "trois", "quatre", "cinq", "six", "sept", "huit", "neuf", "dix");

     byCent = parseInt(Nombre / 100);
     byReste = Nombre - (byCent * 100);
     strReste = ConvNumDizaine(byReste)
     switch (byCent) {
         case 0:
             NumCent = strReste;
             break;
         case 1:
             if (byReste == 0)
                 NumCent = "cent";
             else
                 NumCent = "cent " + strReste;
             break;
         default:
             if (byReste == 0)
                 NumCent = TabUnit[byCent] + " cents";
             else
                 NumCent = TabUnit[byCent] + " cent " + strReste;
     }
     return NumCent;
 }
 //FIN SCRIPT DE CONVERSION DES MONTANTS EN LETTRE

	  //affichage en fonction du MODE sur le Formulaire 

	  var bouton_initial = $('.bouton_sub').val();
	var caractere_hermes = "LIBELLE_ACTION_HERMES";
	var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
			$('.bouton_sub').hide();	
		}else{
			//$('.btn').show();	
		}
	 
		 if($('.get_mode').val()=='CONSULTATION'){
				$('.btn').hide();
				
		 }
		  var prof_util = "{PROFIL_UTILISATEUR}";	
		  var str = prof_util;
			var profil_util = str.substring(0, 7); 

			$('.rhconnex,.financeconnex,.contrconnex,.dgaconnex,.dgconnex').hide();

			//if(profil_util=='EMPLOYE'){
			if(profil_util=='COLLABORATEUR'){
				
				$('.emplconnex').hide();
			}

			if(profil_util=='RH'){
				$('.rhconnex').show();
			}

			if(profil_util=='CONTROL'){
				$('.rhconnex').show();
			}
			if(profil_util=='DGA'){
				$('.dgaconnex').show();
			}
			if(profil_util=='DIRECTE'){
				$('.dgconnex').show();
			}
			if(profil_util=='FINANCE'){
				$('.financeconnex').show();
			}
					 
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
		 


$(document).ready(function () {

		$('#date1').datepicker({
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

		});


		function addMonths(date, months) {
			var d = date.getDate();
			date.setMonth(date.getMonth() + +months);
			if (date.getDate() != d) {
			date.setDate(0);
			}
			return date;
		}

		$(document).on('change keyup','.mois, .datedebut',function(){
		    var dureemois=parseInt($('.mois').val());
			var datedepo_sp=($('.datedebut').val()).split('/');
			var datedepo_sp_str=datedepo_sp[2]+'-'+datedepo_sp[1]+'-'+datedepo_sp[0];
			var formattedDatedepo = new Date( datedepo_sp_str); //date de debut

         	var result_date_mois = addMonths(formattedDatedepo,parseInt(dureemois)+0); 
         	  //calcul des durees en mois
         	  		//console.log(result_date_mois);


			var d = result_date_mois.getDate();
			var m =  result_date_mois.getMonth();
			m += 1;  // JavaScript months are 0-11
			var y = result_date_mois.getFullYear();

			d1 = d > 9 ? d : '0'+d;
			m1 = m > 9 ? m : '0'+m;

			formatDeb= d1 + "/" + m1 + "/" + y;

			d1 = d > 9 ? d : '0'+d;
			m1 = m > 9 ? m : '0'+m;

			date1= d1 + "/" + m1 + "/" + y;

            //date1=y+"-" +m1+"-"+ d1;  

			//timestpdeb=new Date(date1);
			//tamp1=parseInt( parseInt(timestpdeb.getTime())/1000 );

			 if (!isNaN( y)) {
			   $('.dateFin').val(date1);
		    }

		 
			});

		       
	</script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/workflowPRT.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/notification.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/valideurs/validateur.js"></script>

	
</html>


