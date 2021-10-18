<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation heure supplementaire</title>
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

		.fa-archive{
			color: #fff;
			font-size: 10px;
			cursor: pointer;
			width: 20px;
			height: 20px;
			border-radius: 25px;
			background: #4a67b3;
			margin-top: 19px;
			padding: 5px;
		}

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
			padding-left: 27px;
			padding-top: 5px;
		}
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%;
		}

		.button_plus{
			font-size: 11px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			margin-top: 3px;
			margin-right: 8%;
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


		.botton_pris a{
			float: right;
			margin: 1%;
			color: black;
		}
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_hsu' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formheuresupplementaire" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='HSU'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>

		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->

		<input type='hidden' class='appName' value="{NOM_APPLICATION}">


		<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
		<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
		<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
		<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
		<input type="hidden" name='POS_VAL_RUB_MAT' class="viewmatricule" value="{POS_VAL_RUB_MAT}" >


		<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD" value="{POS_VAL_RUB_COD}"  style="width: 100%;">

			<input type="hidden" class="vsalaire_base" name="POS_VAL_RUB_SAB" value="{POS_VAL_RUB_SAB}"  style="width: 100%;">
		
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
							<nav class="container-fluid" style="margin-top: 3%">
			<table class="test" id="table_tache" style="width: 100%;text-align: center; margin-top: 2%;">
				<thead>
					<tr>
						<td style="width: 20px;border:1px solid transparent;">
							<span style="width: 100%;"></span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;border-top-left-radius: 5px;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Date</span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Heure d&#233;but</span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Heure fin</span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;padding-top: 7px">
							<span  style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Nombre heure r&#233;alis&#233;e</span>
						</td>
						<td style="width: 300px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Motifs</span>
						</td>
						<td style="width: 300px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Montant</span>
						</td>
						<td style="width: 50px;height: 7vh;border:none;padding-top: 7px">
							<span style="width: 100%;font-size: 13px;font-weight: 1;">Jour f&#233;ri&#233;</span>
						</td>
					</tr>
				</thead>

				<tbody class="tableL">
					<tr>
						<td style="width: 20px;border:none;">
							<!-- <i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i> -->
						</td>
						<td style="width: 100px;border:none;">
							<input type="text"  name="date[]"  id="date1"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" placeholder="jj / mm / aaaa" class="form-control date" required="true">
						</td>
						<td style="width: 100px;border:none;">
							<input type="time" name="heurein[]"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heurein" required="true">
						</td>
						<td style="width: 100px;border:none;">
							<input type="time"  name="heureout[]"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heureout" required="true">
						</td>
						<td style="width: 100px;border:none;">
							<input type="text" readonly="true" name="duree[]"  style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;" rows="2" placeholder="" class="form-control duree" required="true">
						</td>
						<td style="width: 300px;border:none;">
							<textarea type="text" name='tache[]' style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;resize: none;" rows="2" class="form-control tache" required="true">{POS_VAL_RUB_MOF}</textarea>
						</td>
						<td style="width: 100px;border:none;">
							<input type="text" disabled  name="montant[]"  style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" min='0'  class="form-control montant">
						</td>
						<td style="width: 50px;border:none;">
							<input name="select[]" type="checkbox"  class="cbk"  style="width: 80%;font-size: 12px;margin-left: -37%;" >
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="col-sm">
				<span class="button_plus addRow btn" style="float: right;font-size: 11px">Ajouter une ligne</i></span>
			</div>
			<div class="form-group row" style="margin-top: 6%">
					<div class="col-sm-3" style="font-size: 12px">
						<label>Total heures suppl&#233;mentaires :</label>
						<input class="form-control dureetotale"  name="POS_VAL_RUB_DJ1" value="{POS_VAL_RUB_DJ1}"  id="dureetotale" placeholder="Dur&#233;e">
					</div>
			</div>

			<!-- button -->
			 
		</nav>
					<!-- fin -->
				</div>
		  	</div>
		   	<div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			     <!-- debut ligne de vie -->
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
							<span class="label1">6</span>
							<span class="title1">DG</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<!--<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Nom et prenom() :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4D}</strong>
								</p>-->
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  manager_visa" style="font-size: 13px;">{POS_VAL_RUB_VC3}</strong>
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
							<span class="title1">RH</span>
							
						</div>
					</div>

						<!--commentaire sur  de la ligne de vie -->

					<div class="row jumbotron emplconnex" style="margin: auto;padding: 12px ">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">MANAGER</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
									<!--<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4A', 'POS_VAL_RUB_A4A')">
									   <img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
									</a>-->
								</div>	
							</div>
							<!--<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC0}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT1' value="{POS_VAL_RUB_DT1}" class="form-control" style="width: 100%;">
							</div>-->
							<div class="col-sm-5 mngconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du Manager</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT1' style="width: 250%;resize: none">{POS_VAL_RUB_CT1}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">RH</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="form-control" placeholder="" style="width: 80%;">
										<!--<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4B', 'POS_VAL_RUB_A4B')">
											<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>-->
									</div>
							</div>
							<!--<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC1}.gif" alt="">
								</label>
							</div>-->
							<!--<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT2' value="{POS_VAL_RUB_DT2}" class="form-control" placeholder="" style="width: 100%;">
							</div>-->
							<div class="col-sm-5 rhconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire de la RH</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT2' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur3">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">DGA</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="form-control" placeholder="" style="width: 80%;">
											<!--<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4C', 'POS_VAL_RUB_A4C')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>-->
									</div>
							</div>
							<!--<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC2}.gif" alt="">

								</label>
							</div>-->
							<!--<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT3' value="{POS_VAL_RUB_DT3}" class="form-control" placeholder="" style="width: 90%;">
							</div>-->
							<div class="col-sm-5 dgaconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du DGA</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT3' style="width: 250%;resize: none">{POS_VAL_RUB_CT3}</textarea>
							</div>
						</div>
						<!-- acteur 5 -->
						<div class="acteur5">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4D' value="{POS_VAL_RUB_A4D}" class="form-control" placeholder="" style="width: 80%;">
											<!--<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4D', 'POS_VAL_RUB_A4D')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>-->
									</div>
							</div>
							<!--<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC3}.gif" alt="">

								</label>
							</div>-->
							<!--<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT5' value="{POS_VAL_RUB_DT5}" class="form-control" placeholder="" style="width: 90%;">
							</div>-->

							<div class="col-sm-5 dgconnex " style="padding-bottom: 3%">
								<label for="bio">Commentaire du DG</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT4' style="width: 250%;resize: none">{POS_VAL_RUB_CT4}</textarea>
							</div>
						</div>	
						<!-- acteur 6 -->
						<div class="acteur6">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">RH</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4E' value="{POS_VAL_RUB_A4E}" class="form-control" placeholder="" style="width: 80%;">
											<!--<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4E', 'POS_VAL_RUB_A4E')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>-->
									</div>
							</div>
							<!--<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC4}.gif" alt="">

								</label>
							</div>-->
							<!--<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT6' value="{POS_VAL_RUB_DT6}" class="form-control" placeholder="" style="width: 90%;">
							</div>-->
							<div class="col-sm-5" style="padding-bottom: 3%%;display: none;">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT6' style="width: 250%;resize: none">{POS_VAL_RUB_CT5}</textarea>
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
						<div class="col3_partie text-center" style="padding-top:1.3%;">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
						</div>
					</div>
					<div class="col-sm-12" style="margin-top:0.7%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">VISUALISEUR</span>
						</div>
						<div class="col3_partie text-center" style="padding-top: 1.3%">
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
									<input type="text" id="numposeidon"  name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}"  placeholder="N&#176; poseidon" class="form-control" style="width: 100%">

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
							<div class="col3_partie" style="padding: 5%;">
								<!-- Consultation -->
								<div class="form-group">
								   	<label for="bio">Consultation :</label>
								  	<textarea  class="form-control" name='POS_VAL_RUB_AVU' id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   	<label for="bio">Modification :</label>
									<textarea  class="form-control" name='POS_VAL_RUB_AMO' id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   	<label for="bio">Suppression :</label>
									<textarea  class="form-control" name='POS_VAL_RUB_ASU' id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
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
		<!--<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
 		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
	<!-- endjquery  -->
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-3.5.1.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-ui.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery.validate.min.js"></script>

	
		<!--
		 <script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
		<script src="../dist/jquery-steps.js"></script>-->
		<!--<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>-->
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>	
		<!-- endjquery  -->

		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/HSU/register/register_edit.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/HSU/hsupdf/pdfheuresup.js"></script>

	
	 <script>

	 	
		var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
		$('.bouton_sub').hide();	
			}

			//Traitements des commentaires sur le workflow
		var prof_util = "{PROFIL_UTILISATEUR}";	 
		var str = prof_util;
		var profil_util = str.substring(0, 7); 

			$('.rhconnex,.mngconnex,.dgaconnex,.dgconnex').hide();

			if(profil_util=='EMPLOYE'){
				$('.emplconnex').hide();
			}
			if(profil_util=='MANAGER'){
				$('.mngconnex').show();
			}
			if(profil_util=='DGA'){
				$('.dgaconnex').show();
			}
			if(profil_util=='DIRECTE'){
				$('.dgconnex').show();
			}
			if(profil_util=='RH'){
				$('.rhconnex').show();
			}
			
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


	var $dataRows =$('.tableL');
		var tr=$dataRows.parent().parent();
		// Ajouter de ligne a la table
		$(".addRow").click(function(){
				
			if(tr.find('.duree').val()==""){
					alert("Veuillez bien renseigner les informations");
			}else{
				addRow();
			}	   			
		});


			function  addRow(){ 
			  	var ligne ='<tr>'+
						 '<td style="width: 20px;border:none;">'+
						      '<i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i>'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
								'<input type="text" name="date[]"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" placeholder="jj / mm / aaaa"  class="form-control date">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="time" name="heurein[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heurein">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="time"  name="heureout[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heureout">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="text" name="duree[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" class="form-control duree">'+
						'</td>'+
						'<td style="width: 300px;border:none;">'+
							'<textarea type="text" name="tache[]" style="width: 100%; resize: none;background: transparent;border: 1px solid;margin-top: 2px;resize: none;" rows="2" class="form-control tache"></textarea>'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="text" name="montant[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" class="form-control montant">'+
						'</td>'+
						'<td style="width: 50px;border:none;">'+
							'<input name="select[]" class="cbk" type="checkbox" style="width: 80%;font-size: 12px;margin-left: -20%;" >'+
						'</td>'+
					'</tr>';
              	$('.tableL').append(ligne);
			}


			//Supprimer de ligne a la table
			$(document).on('click','#Suprim',function(){
                $(this).parents("table.test tr").remove();
				findTotalDuree();
			});

			$('#date1').datepicker({
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
				dateFormat: 'dd-mm-yy',
			});


	 
			function findTotalDuree(){

				 var tot=0;
				 var $dataRows =$('.tableL');
				 var tr=$dataRows.parent().parent();
				 tr.find('.duree').each(function (i) {
						time = $(this).val().split(":");
						if(time.length !==1){
							var minutes =  parseInt((time[0])*60,10) + parseInt((time[1]),10) ;
						tot += parseInt(minutes);
						}
				} );

				var hours = Math.floor(tot / 60);          
				var minutes = tot % 60;
					 
				heures1 = hours > 9 ? hours : '0'+hours;
				minutes1 = minutes > 9 ? minutes : '0' + minutes;

				document.getElementById('dureetotale').value = heures1+':'+minutes1  ;

			 }

		 

			  

			//   $("table.test ").find('input[name="select[]"]').each(function() {
 
			// 	  	   console.log($(this));
	                    
	        //         });

			 




			let me_choice=false;
			// $('.tableL').delegate('.cbk','click',function(){
			// 	   $("table.test ").find('input[name="select[]"]').each(function() {

	        //             if ($(this).is(":checked")) {
	        //             	//si cochez
	        //                 // console.log('ok');
			// 				 me_choice=true;

							 

	        //             }else{
	        //             	  //si non cochez
	        //             	//console.log('nok');
			// 				  me_choice=false;
 	        //             }
	        //         });
		    // });
			//ce checkbox recalcul les données de la ligne courante
			$(document).on('click',".cbk",function() {
					var $row = $(this).t("tr");    // Find the row
					//var $text = $row.find(".cbk").val(); // Find the text
					// Let's test it out
					   var $val = $row.find(".cbk").map(function() {
							return this.checked;
						}).toArray();

						me_choice=$val[0];

						//console.log(me_choice);
			});


		    


		$('.tableL').delegate('.heurein,.heureout,.date,.cbk','change',function(){

			      
              

				var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();
				var inphdate=tr.find('.date').val();
                var elem = inphdate.split('-');
               
                var date = elem[2] +'-'+elem[1]+'-'+elem[0];
                var weekday1 = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];

                var day = new Date(date);
                var getNumber= day.getDay(date);
                var getJour = weekday1[getNumber];

                const heureConstMat='07:00';
                const heureConstSoir='21:00';

				//console.log(me_choice);
				var tr_duree='00:00';

                var hourDiff='';

                var init_dateHeureMatin= new Date(date +' '+ heureConstMat); //heure debut 07:00 en date   timeMat (matin)
                var init_dateHeureSoir= new Date(date +' '+ heureConstSoir);  //heure debut 21:00 en date timeSoir (soir)
                var dateHeureStart = new Date(date +' '+ inphdeb);  //heure debut choisie en date timeStart
				var dateHeureEnd = new Date(date +' '+ inphfin);  //heure fin choisie en date timeEnd
                var salaireBrut =parseInt($('.vsalaire_base').val()); //recuperation du salaire de base dans afficher_creation.php
				var paieQuod = salaireBrut/173.33;   //2884.67085905
                var montantSunday= paieQuod + (0.75*paieQuod);
                var montantSunday2= paieQuod + (1*paieQuod);
                var montantJour= paieQuod + (0.15*paieQuod);  //3317.37
                var montantJour2= paieQuod + (0.5*paieQuod);  //4327

                 //  console.log(me_choice);
                
			    function jourferier(choice){
					var mtn=0; 
					if(choice==true){
						//tr.find('.cbk').val(true);
						mtn=parseInt(montantJour2);
					}else{
						mtn=parseInt(montantJour);
 					}
					return mtn;
				}

				function jourweekferier(choice){
					    var w_mtn=0; 
					 if(choice==true){
 						w_mtn=parseInt(montantSunday2);
						
					}else{
						w_mtn=parseInt(montantSunday);
						 
					}
					return w_mtn;
				}


				function cal_tmontant(tduree, tmontant) {

					let hduree = tduree;
					let hmontant = parseInt(tmontant);
					let delta = 0;
					let montant_totale = 0;

					htime = hduree.split(":");
					delta = parseInt(htime[0]) + parseInt(htime[1]) / 60;
					montant_totale = delta * hmontant;

					return montant_totale;

				}
				

                   //si l'heure de fin est inf ou egale à 21h
                if(dateHeureEnd<= init_dateHeureSoir){
                        // console.log('Hfin <=21h ')  ;
					    var differenteTime= init_dateHeureSoir-dateHeureEnd;
                        var newdiff= new Date(differenteTime);
                        var hourTime= newdiff.getHours();
                        var minuteTime = newdiff.getMinutes();

                        hourTimeDiff1 = hourTime > 9 ? hourTime : '0'+hourTime;
                        minuteTimeDiff1 = minuteTime > 9 ? minuteTime : '0' + minuteTime;
                        var countDureeTime=(isNaN(hourTimeDiff1) ? '00' : hourTimeDiff1)+':'+(isNaN(minuteTimeDiff1) ? '00' : minuteTimeDiff1) ;
						 
                }else{
				   //	console.log('Hfin >=21h ')  ;
				}

				if(dateHeureStart <= dateHeureEnd){
					 var difference = dateHeureEnd - dateHeureStart;
                            var diff_result = new Date(difference);


                            var hourDiff = diff_result.getHours();
                            var minuteDiff = diff_result.getMinutes();

                            hourDiff1 = hourDiff > 9 ? hourDiff : '0'+hourDiff;

                            minuteDiff1 = minuteDiff > 9 ? minuteDiff : '0' + minuteDiff;
                            var countDuree=(isNaN(hourDiff1) ? '00' : hourDiff1)+':'+(isNaN(minuteDiff1) ? '00' : minuteDiff1) ;
                            tr.find('.duree').val(countDuree);

							//duree_montant
							tr_duree=countDuree;

							findTotalDuree();
				}else{
					//console.log('Hdeb >=21h ')  ;
				}
              
				 if(dateHeureStart>=init_dateHeureMatin && dateHeureEnd<=init_dateHeureSoir){
                             
							    
							var montant=0;
 							if(getJour==weekday1[getNumber]){

							switch (getJour) {
								case 'Lundi':
								    montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Mardi':
								    montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Mercredi':
								    montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Jeudi':
								     montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Vendredi':
									 montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Dimanche':
								    montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
 							    break;
								case 'Samedi':
									montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
 									break;
								default:
									
								}
								 tr.find('.montant').val( parseInt(montant));
							}else{
							}
				 }else{
					 // console.log('pas coucou');
				 }
			});
			 


			
		
	</script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/HSU/workflowHSU.js"></script>

</body>
</html>