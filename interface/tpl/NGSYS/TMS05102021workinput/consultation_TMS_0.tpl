<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de timesheet</title>
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
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/testNum.js'></script>
	
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
		
		.col_list_02{
			position: absolute;
			font-size: 11px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			z-index: 999;
		}
		
		.Affi_calendor{
			position: absolute;
			margin-top: 4%;
			margin-left: 33%;
			list-style: none;
			z-index: 1;
			opacity: 0;
			transform-origin: top left;
			transform: scale(0);
			transition: all 750ms;
		}
		.Affi_calendor.open{
			opacity: 1;
			transform: scale(1);
		}
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
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

		.button_plus{
			font-size: 11px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			margin-top: 3px;
		}
		.fa-archive{
			color: #fff;
			font-size: 10px;
			cursor: pointer;
			width: 20px;
			height: 20px;
			border-radius: 25px;
			background: #4a67b3;
			margin-top: 15px;
			margin-right: 3px;
			padding-top: 4px;
			text-align: center;
		}
		
		.header-const{
			margin-bottom: 3%;
		}
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
<body  class='tpl_consultation tpl_consultation_tms' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC'  value='TMS'/>
		<input type='hidden' name='MODE' value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->

		<input type='hidden' class='appName' value="{NOM_APPLICATION}">


		<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
				<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
				<input type="hidden" name='POS_VAL_RUB_SER' class="viewservice" value="{POS_VAL_RUB_SER}" >
		
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

		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="text-center" style="font-weight: 1;color: #023b7c;font-size: 19px;margin-top: -1%">
								<div class="h4" style="text-transform: uppercase;">
									<span>TIMESHEET</span>
								</div>
								<div class="h6" style="text-transform: uppercase;">
									<span>SEMAINE: <span class="tacheweek"> 00</span> , 
									<input class="form-control semaine" name='POS_VAL_RUB_SXM' value="{POS_VAL_RUB_SXM}" type="hidden"/>
									<span class="datecheck">Jeudi 26 Novembre 2020</span>
									<input class="form-control datechck" name='POS_VAL_RUB_DXT' value="{POS_VAL_RUB_DXT}" type="hidden"/>
								</div>
								<div class="contenu_calendor" style="margin-top: 1.5%;margin-left: -9%">
									<span class="col_list_02 btn">Changer la date</span>
								</div>
								<div class="Affi_calendor text-center"></div>
							</div>

							<div class="col-sm-12" style="margin-top: 3%;">

								<!--Donnée relative aux traitement des heures sup -->
								<!--<input type="text" class="datepick" name="POS_VAL_RUB_DT4" value="{POS_VAL_RUB_DT4}" width="50" /> -->
						    <input type="text" class="loadcode" name="POS_VAL_RUB_COD" value="{POS_VAL_RUB_COD}" style="width: 30%;" />

						    <input type="text" class="totalduree" name="POS_VAL_RUB_U3" value="{POS_VAL_RUB_U3}" style="width: 30%;" />
						    <input type="text" class="etat" name="POS_VAL_RUB_X8" value="{POS_VAL_RUB_X8}" style="width: 30%;" />

						    <input type="text" class="vsalaire_base" name="POS_VAL_RUB_SAB" value="{POS_VAL_RUB_SAB}"  style="width: 30%;">
						    <!--Donnée relative aux traitement des heures sup -->

								<!--Message d'erreur -->
              <span class="msg_err"> </span>

              <span class="resul"></span>
								<!--debut table  -->
								<table class="test" id="table_tache" style="width: 100%;text-align: center; margin-top: 2%;">
									 <thead>
										<tr>
											<td style="width: 20px;border:1px solid transparent;">
												<span style="width: 100%;"></span>
											</td>
											<td style="width: 150px;height: 7vh;border:none;background: #4a67b3;border-top-left-radius: 5px; border-bottom-left-radius: 5px;text-align: center;padding-top: 6px">
												<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Activit&#233;s</span>
											</td>
											<td style="width: 300px;height: 7vh;border:none;background: #4a67b3;text-align: center;padding-top: 6px">
												<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Taches</span>
											</td>
											<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;text-align: center;padding-top: 6px">
												<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Heure d&#233but</span>
											</td>
											<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;text-align: center;padding-top: 6px">
												<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Heure fin</span>
											</td>
											<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;text-align: center;padding-top: 6px">
												<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Dur&#233;e</span>
											</td>
											<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;text-align: center;padding-top: 6px">
												<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Taux en %</span>
											</td>
											<td style="width: 150px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px; border-bottom-right-radius: 5px;text-align: center;padding-top: 6px">
												<span style="width: 105%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">R&#233;sultat</span>
											</td>
											<td style="width: 150px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px; border-bottom-right-radius: 5px;text-align: center;padding-top: 6px">
												<span style="width: 105%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">HS</span>
											</td>
											<td style="width: 150px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px; border-bottom-right-radius: 5px;text-align: center;padding-top: 6px">
												<span style="width: 105%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Ferie</span>
											</td>
										</tr>
									 </thead>

									<tbody class="tableL">
										<tr>
										    <!--bouton plus-->
											<td style="width: 20px;border:none;">
												<!-- <span class="button_plus addRow" style="width: 100%;"><i class="fa fa-plus"></i></span> -->
											</td>
											 <!--fin bouton plus-->
											<td style="width: 150px;border:none;">
				 								  <input type="text" name="activite[]" style="width: 100%;height: 11vh;" class="form-control activite">
											</td>
											<td style="width: 300px;border:none;">
												<textarea type="text" name="tache[]" style="width: 100%; resize: none" rows="2" class="form-control tache"></textarea>
											</td>
											<td style="width: 100px;border:none;">
												<input type="time" name="heurein[]" style="width: 100%;height: 11vh;" class="form-control heurein">
											</td>
											<td style="width: 100px;border:none;">
												<input type="time"  name="heureout[]" style="width: 100%;height: 11vh;" class="form-control heureout">
											</td>
											<td style="width: 100px;border:none;">
												<input type="text" onkeypress="return testNum(event, this,2);" name="duree[]" style="width: 100%;height: 11vh;" class="form-control duree">
											</td>
											<td style="width: 100px;border:none;">
												<input type="text" onkeypress="return testNum(event, this,2);" name="taux[]" step="1" min="1" max="100" style="width: 100%;height: 11vh;" class="form-control taux"  id="taux">
											</td>
											<td style="width: 150px;border:none;">
												<input type="text" name="resultat[]" style="width: 100%;height: 11vh;" class="form-control resultat"  id="resultat">
											</td>
											 <td>
                 					 <input type="checkbox" name="hsu[]" class="hsu" > 
				              </td>
				              <td>
				                  <input type="checkbox" name="ferie[]" class="ferie" style="display: none;"> 
				              </td>
										</tr>
									</tbody>
								</table>
							<!--fin table  -->

								<!--resultat apres retour des données  -->
								<span class="res"></span>
								<div class="col-sm">
									<span class="button_plus addRow btn" style="float: right;font-size: 11px">Ajouter une ligne</i></span>
								</div>
								 
								<div class="form-group row" style="margin-top: 6%">
									<div class="col-sm-8">
										<label></label>
									</div>
									<div class="col-sm-2" style="font-size: 12px">
										<label>Dur&#233;e totale</label>
										<input class="form-control dureetotale"  name="POS_VAL_RUB_DJ1" value="{POS_VAL_RUB_DJ1}"  id="dureetotale" placeholder="Dur&#233;e totale">
									</div>
									<div class="col-sm-2" style="font-size: 12px">
										<label>Taux journalier (%)</label>
										<input class="form-control tauxjournaliere"  name="POS_VAL_RUB_TAC" value="{POS_VAL_RUB_TAC}" id="bio" placeholder="Taux journalier">
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
							<span class="title1">EMPLOYE</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 20%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
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
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4A}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 mng_visa" style="font-size: 13px;">{POS_VAL_RUB_VC0}</strong>
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
							<span class="title1">CLOS</span>
							
						</div>
						
					</div>

						<!--commentaire sur  de la ligne de vie -->

					<div class="row jumbotron emplconnex" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">EMPLOYE</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
								</div>	
							</div>
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">MANAGER</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" style="width: 80%;">
								</div>	
							</div>
							<div class="col-sm-5 mngconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du manager</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT2' style="width: 250%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
							
						</div>						
					</div>
				


						<!-- Fin du commentaire de la ligne de vie -->

				</div>
				<!-- Fin de la ligne de vie du parcours de l'employe -->

		   	</div>
		   <!-- document -->
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
								<!-- date de modification -->
							   	<input class="form-control date_modif" name="POS_VAL_RUB_DT4" value="{POS_VAL_RUB_DT4}" type="hidden"/>
									<input type="hidden" name="{POS_VAL_RUB_DCR}" value="{POS_VAL_RUB_DCR}" class="form-control dateenreg">
									<input type="hidden" name="{POS_VAL_RUB_CRE}" value="{POS_VAL_RUB_CRE}" class="form-control createur">
								<div class="form-group row" style="margin: 0%">
									<label for="bio">N&#176; poseidon</label>
									<input type="text" name="{POS_VAL_RUB_NUD}" value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" name="{POS_VAL_RUB_ETF}" value="{POS_VAL_RUB_ETF}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea name="{POS_VAL_RUB_HIS}"class="form-control" id="bio" rows="5" style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
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
								  <textarea  name="{POS_VAL_RUB_AVU}"  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea name="{POS_VAL_RUB_AMO}"   class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea name="{POS_VAL_RUB_ASU}"  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
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
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
		<script src="../dist/jquery-steps.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- endjquery  -->
	
	 <script>
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

		var str = prof_util;
		var profil_util = str.substring(0, 7); 

		$('.mngconnex').hide();

		if(profil_util=='EMPLOYE'){
				$('.emplconnex').hide();
			}

			if(profil_util=='MANAGER'){
				$('.mngconnex').show();
			}


	//affichage en fonction du MODE sur le Formulaire  
		if($('.get_mode').val()=='CONSULTATION'){
			$('.btn').hide();
		}

		var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
		$('.bouton_sub').hide();	
			}


$(document).on('keyup keydown','.taux',function(e) {
		limit(this);
});

function limit(element)
{
    var max_chars = 2;
    if(element.value==100){
    	 element.value = element.value.substr(0, 3);
    }else if(element.value.length > max_chars) {
        element.value = element.value.substr(0, max_chars);
    }
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
	
	//initialisation du calendrier datepicker
		$.datepicker.regional['fr'] = {
			closeText: 'Fermer',
			prevText: 'Précédent',
			nextText: 'Suivant',
			currentText: 'Aujourd\'hui',
			monthNames: ['Janvier', 'F&eacute;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao&ucirc;t', 'Septembre', 'Octobre', 'Novembre', 'D&eacute;cembre'],
			monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
			dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
			dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
			dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
			weekHeader: 'Sem.',
			dateFormat: 'yy-mm-dd'
	   };
		
		$.datepicker.setDefaults($.datepicker.regional['fr']);
		
	   const event = new Date();
	   const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
 	   $('.datecheck').text($('.datechck').val());
	   $('.tacheweek').text($('.semaine').val()); 


		
	   //fin initialisation du calendrier datepicker
		
		
		$(document).ready(function() {


			// Affi_calendor
			$('.contenu_calendor').on('click', function(){
				$('.toggle').toggleClass('open');
				$('.Affi_calendor').toggleClass('open');
				//$('.contenu_calendor').toggleClass('open');
			});
			// Ajoute de ligne a la table
			
			$(document).on('click','.addRow',function() {
				    
 				 var $dataRows =$('.tableL');
				 var tr=$dataRows.parent().parent();


				 if(
				 	  tr.find('.activite:last').val()=="" ||
				 	  tr.find('.tache:last').val()=="" ||
				 	  tr.find('.heurein:last').val()=="" ||
				 	  tr.find('.heureout:last').val()=="" ||
				 	  tr.find('.duree:last').val()=="" ||
				 	  tr.find('.taux:last').val()=="" ||
				 	  tr.find('.resultat:last').val()==""
				 	
				 ){
					  alert("Veuillez bien renseigner les informations") ;
				  }else{


					 addRow();
				  } 
       });


				 function  addRow(){ 
				  var ligne ='<tr>'+
							 '<td style="width: 20px;border:none;">'+
							      '<i class="fa fa-archive" title="Suprimer la ligne" id="suprim">'+
							'</td>'+
							'<td style="width: 150px;border:none;">'+
 								'<input type="text" name="activite[]" style="width: 100%;height: 11vh;" class="form-control activite">'+
							'</td>'+
							'<td style="width: 300px;border:none;">'+
								'<textarea type="text" name="tache[]" style="width: 100%; resize: none" rows="2" class="form-control tache"></textarea>'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="time" name="heurein[]" style="width: 100%;height: 11vh;" rows="1" class="form-control heurein">'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="time"  name="heureout[]" style="width: 100%;height: 11vh;" rows="1" class="form-control heureout">'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="text" onkeypress="return testNum(event, this,2);" name="duree[]" style="width: 100%;height: 11vh;" class="form-control duree">'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="text" onkeypress="return testNum(event, this,2);" name="taux[]" step="1" min="1" max="100" style="width: 100%;height: 11vh;" class="form-control taux"  id="taux">'+
							'</td>'+
							'<td style="width: 150px;border:none;">'+
								'<input type="text" name="resultat[]" style="width: 100%;height: 11vh;" class="form-control resultat"  id="resultat">'+
							'</td>'+
							 '<td>'+
                '<input type="checkbox" style="margin-left:50%" name="hsu[]" class="hsu" >'+ 
	            '</td>'+
	            '<td>'+
	                  '<input type="checkbox" name="ferie[]" class="ferie" style="display: none; margin-left:50%">'+ 
	            '</td>'
						'</tr>';
                  $('.tableL').append(ligne);
				 
			 }

			 //Debut supprimer de ligne a la table
          $(document).on('click',"#suprim",function(){

                      $(this).parents("table.test tr:last").remove();

											findTotalDuree();
											findTotalDay();
        });
			//Fin supprimer de ligne a la table



          /*
						Marius
            $(".delete").click(function() {
                $("table.test").find('input[name="select"]').each(function() {
                    if ($(this).is(":checked")) {
                        $(this).parents("table.test tr").remove();

                        var ligne ='<tr>'+
							 '<td style="width: 20px;border:none;">'+
							      '<input name="select" type="checkbox" style="width: 80%;font-size: 12px;margin-left: -1%;">'+
							'</td>'+
							'<td style="width: 150px;border:none;">'+
 								'<input type="text" name="activite[]" style="width: 100%;height: 11vh;" class="form-control activite">'+
							'</td>'+
							'<td style="width: 300px;border:none;">'+
								'<textarea type="text" name="tache[]" style="width: 100%; resize: none" rows="2" class="form-control tache"></textarea>'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="time" name="heurein[]" style="width: 100%;height: 11vh;" rows="1" class="form-control heurein">'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="time"  name="heureout[]" style="width: 100%;height: 11vh;" rows="1" class="form-control heureout">'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="text" onkeypress="return testNum(event, this,2);" name="duree[]" style="width: 100%;height: 11vh;" class="form-control duree">'+
							'</td>'+
							'<td style="width: 100px;border:none;">'+
								'<input type="text" onkeypress="return testNum(event, this,2);" step="1" min="1" max="100" style="width: 100%;height: 11vh;" class="form-control resultat"  id="resultat">'+
							'</td>'+
							'<td style="width: 150px;border:none;">'+
								'<input type="text" name="resultat[]" style="width: 100%;height: 11vh;" class="form-control resultat"  id="resultat">'+
							'</td>'+
						'</tr>';
                  $('.tableL').append(ligne);
                     
                    }
                });
            });*/
			
			///calcul date et semaine
			var userLang = navigator.language || navigator.userLanguage;
			var options = $.extend({
				   onSelect: function() {
					 var selected = $(this).val();
					 //debut traitement lecture date timesheet
					 datepickdeb = new Date(selected.slice(0, 10));
					 let dateLocale = datepickdeb.toLocaleString('fr-FR', {
					   weekday: 'long',
					   year: 'numeric',
					   month: 'long',
					   day: 'numeric',
					   hour: 'numeric',
					   minute: 'numeric',
					   second: 'numeric'
					 });

            $('.date_modif').val(selected);


					var dateform= (dateLocale.split(' ')[0] + ' ' + dateLocale.split(' ')[1] + ' ' + dateLocale.split(' ')[2] + ' ' + dateLocale.split(' ')[3]).replace(',','');
					$('.datecheck').text(dateform);
					$('.datechck').val(dateform);
					$('.tacheweek').text(getWeek(datepickdeb)); 

					$('.semaine').val($('.tacheweek').text()); 




					testdatecheck($('.date_modif').val(),$('.createur').val());
					 //fin traitement 
					},
			});
			$(".Affi_calendor").datepicker(options);
			
		});  
		
		function getWeek(date) {
		  if (!(date instanceof Date)) date = new Date();

			  // ISO week date weeks start on Monday, so correct the day number
			  var nDay = (date.getDay() + 6) % 7;
			  // ISO 8601 states that week 1 is the week with the first Thursday of that year
			  // Set the target date to the Thursday in the target week
			  date.setDate(date.getDate() - nDay + 3);
			  // Store the millisecond value of the target date
			  var n1stThursday = date.valueOf();
			  // Set the target to the first Thursday of the year
			  // First, set the target to January 1st
			  date.setMonth(0, 1);
			  // Not a Thursday? Correct the date to the next Thursday
			  if (date.getDay() !== 4) {
				date.setMonth(0, 1 + ((4 - date.getDay()) + 7) % 7);
			  }
			  // The week number is the number of weeks between the first Thursday of the year
			  // and the Thursday in the target week (604800000 = 7 * 24 * 3600 * 1000)
			 return 1 + Math.ceil((n1stThursday - date) / 604800000);
		}






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

			 function findTotalDay(){
				  var tot=0;
				   var $dataRows =$('.tableL');
				   var tr=$dataRows.parent().parent();

				   tr.find('.taux').each(function (i) {
					    Tjours = $(this).val().split(":") ;
						var jrs =parseInt( Tjours[0],10 ) ;
						tot +=isNaN(jrs) ? 0 : jrs;
					});

					var table = document.getElementById('table_tache');
					var rowCount = ((table.rows.length)*1)-1;
					var count=0;

					tr.find('.resultat').each(function (i,e) {
						if($.trim($(this).val())==""){
						}else{
							++count;
						};
					});

					//console.log(count+' -- '+tot +' -- '+ tot/count );

					 var totj= tot/count;
					$('.tauxjournaliere').val(isNaN(totj) ? "0" : totj.toFixed(0) );


			 }

			  //heure deb sup heure fin
			$('.tableL').delegate('.heurein','change',function(){
			 	var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();

				if(inphfin<inphdeb){
					   
					if(inphfin !=''){
						$('.msg_err').text('La date de debut est sup\u00e9rieure \u00e0 la date de fin');
						$('.duree').prop('readonly',true);
						//$('.duree').val('00:00');
				 	}else{
				 		$('.duree').prop('readonly',true);
						//$('.duree').val('00:00');
				 	}
					
				}else{
					$('.msg_err').text('');
					$('.duree').prop('readonly',true);
				}
			 });

               //heure fin inf heure deb
			 $('.tableL').delegate('.heureout','change',function(){
			 	var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();

				 
				
					if(inphfin<inphdeb){
							$('.msg_err').text('La date de fin est inf\u00e9rieure \u00e0 la date de debut');
							$('.duree').prop('readonly',true);
							//$('.duree').val('00:00');
					}else{
						$('.msg_err').text('');
						$('.duree').prop('readonly',true);
					}

			 

				


			 });


			$('.tableL').delegate('.heurein,.heureout','change',function(){

				var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();


				var timeStart = new Date("01/01/2010 " + inphdeb);
				var timeEnd = new Date("01/01/2010 " + inphfin);

				//console.log(timeStart,' ',timeEnd);
				 

                 
				if(timeStart <= timeEnd){
						var difference = timeEnd - timeStart;
						var diff_result = new Date(difference);

						var hourDiff = diff_result.getHours();
						var minuteDiff = diff_result.getMinutes();

						hourDiff1 = hourDiff > 9 ? hourDiff : '0'+hourDiff;
						minuteDiff1 = minuteDiff > 9 ? minuteDiff : '0' + minuteDiff;

						var countDuree=(isNaN(hourDiff1) ? '00' : hourDiff1)+':'+(isNaN(minuteDiff1) ? '00' : minuteDiff1) ;

					/* if(inphdeb !='' && inphfin !=''){
							tr.find('.duree').val(countDuree);
							findTotalDuree();
				     }else{
				     		tr.find('.duree').prop('readonly',true);
				     		tr.find('.duree').val('00:00');
				     }*/

				     tr.find('.duree').val(countDuree);
							findTotalDuree();
						
				} 
			 
				
						 
     		});

			 //total accomplishment
			 $('.tableL').delegate('.taux','keyup',function(){



				 var tr=$(this).parent().parent();
          		 var choice=tr.find('.taux').val()*1;


                  tr.find('.resultat').val(" ");
				  
				 
				 if(choice==0){
							  tr.find('.resultat').val(" ");
				 }else{
						switch(true) {
						case choice < 30: 
								//0-20
								tr.find('.resultat').val("INSUFFISANT");
							break;
						case choice >=30 && choice <60: 
								//21-50
							tr.find('.resultat').val("MOYEN");
							break;
						case choice >=60 && choice <80: 
								//51-70
							tr.find('.resultat').val("ASSEZ-BON");
							break;
						case choice >=80 && choice <= 100: 
								//71-100
							tr.find('.resultat').val("EXCELLENT");
							break;

						}			 	 
				};
				  

				  findTotalDay();

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



			 //Fin total accomplishment

   
	</script>


	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/vue_consult.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/workflowTMS.js"></script>

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/updated.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/notification.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/heuresup/app_tms.js" defer></script>
	
</html>


