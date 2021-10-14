<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation adherent</title>
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
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_adh' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='ADH'/>
		<input type='hidden' name='MODE' value='{MODE}'>
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
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Mode de vie et Sant&#233;(2 ans)</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Maladie 1</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Maladie 2</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-5" style="width: 100%;padding-top: -11px;">Assurance ant&#233;rieure</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-6" style="width: 100%;padding-top: -11px;">Traitement</a></li>
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-7" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-8" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>

		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="row" style="margin-top: 1%">
								<!-- 12_ 1 infos -->
								<div class="col-sm-6 mt-5" style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">SOUSCRIPTEUR</span>
									</div>
									<div class="col2_partie" style="padding: 2% 10%;">
										<!-- Dénomination client -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">D&#233;nomination client</label>
												<input type="text" class="form-control" placeholder="D&#233;nomination client" style="width: 100%">
											</div>
										</div>
										<!-- Adresse -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">Adresse</label>
												<input type="text" class="form-control" placeholder="Adresse" style="width: 100%">
											</div>
										</div>
										<!-- E-mail -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">E-mail</label>
												<input type="text" class="form-control" placeholder="E-mail" style="width: 100%">
											</div>
										</div>
										<!-- T&#233;l&#233;phone -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">T&#233;l&#233;phone</label>
												<input type="text" class="form-control" placeholder="T&#233;l&#233;phone" style="width: 100%">
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">IDENTIFICATION ASSURE PRINCIPAL</span>
									</div>
									<div class="col2_partie" style="padding: 10px;">
										<!-- Nom & Prénom -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Nom</label>
												<input type="text" class="form-control" placeholder="T&#233;l&#233;phone" style="width: 100%">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Pr&#233;nom</label>
												<input type="text" class="form-control" placeholder="Pr&#233;nom" style="width: 100%">
											</div>
										</div>
										<!-- E-mail & Téléphone -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">E-mail</label>
												<input type="text" class="form-control" placeholder="E-mail" style="width: 100%">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">T&#233;l&#233;phone</label>
												<input type="text" class="form-control" placeholder="T&#233;l&#233;phone" style="width: 100%">
											</div>
										</div>
										<!-- N° assuré ou Matricule & Option -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">N&#146;assur&#233; ou Matricule</label>
												<input type="text" class="form-control" placeholder="N&#146;assur&#233; ou Matricule" style="width: 100%">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Option</label>
												<input type="text" class="form-control" placeholder="Option" style="width: 100%">
											</div>
										</div>
										<!-- Date d'adhésion -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Date d&#146;adh&#233;sion</label>
												<input type="text" class="form-control" style="width: 100%">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 3%">
								<div class="col-sm-12 mt-5">
									<div class="col1_partie text-center">
										<span class="title text-while">COMPOSOTION DE LA FAMILLE</span>
									</div>
									<div class="col2_partie" style="padding-top: 10px;">
										<table class="table">
											<thead>
												<tr style="padding-top:7%">
													<th>PARTENAIRES</th>
													<th>NOM ET PRENOM</th>
													<th>DATE NAISSANCE</th>
													<th>SEXE</th>
													<th>DATE D&#146;INCORPORATION</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td style="padding-left: 5%">Assur&#233;</td>
													<td>
														<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
												</tr>
												<tr>
													<td style="padding-left: 5%">Conjoint</td>
													<td>
														<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
												</tr>
												<!-- Enfant 1 -->
												<tr>
													<td style="padding-left: 5%">Enfant 1</td>
													<td>
														<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
												</tr>
												<!-- Enfant 2 -->
												<tr>
													<td style="padding-left: 5%">Enfant 2</td>
													<td>
														<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
												</tr>
												<!-- Enfant 3 -->
												<tr>
													<td style="padding-left: 5%">Enfant 3</td>
													<td>
														<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
												</tr>
												<!-- Enfant 4 -->
												<tr>
													<td style="padding-left: 5%">Enfant 4</td>
													<td>
														<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
													<td>
														<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</nav>
					<!-- fin -->
				</div>
		   </div>
		   <!-- mode de vie et santé -->
			<div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			    <table class="table table-borderless">
					<thead>
					  <tr>
						<th style="text-align: center">###</th>
						<th style="text-align: center">Assur&#233;(e)</th>
						<th style="text-align: center">Conjoint(e)</th>
						<th style="text-align: center">1er enfant</th>
						<th style="text-align: center">2eme enfant</th>
						<th style="text-align: center">3eme enfant</th>
						<th style="text-align: center">4eme enfant</th>
					  </tr>
					</thead>
					<tbody>
						<!-- 1 Profession exerc&#233;e -->
					  <tr>
						<td style="width: 18%;padding-top: 3%;text-align: center">
							<span>Profession exerc&#233;e.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 2 Fumez-vous? -->
					  <tr>
						<td style="width: 18%;padding-top: 3%;text-align: center">
							<span>Fumez-vous?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 3 Consommez-vous de l&#146;alcool? -->
					  <tr>
						<td style="width: 18%;text-align: center">
							<span>Consommez-vous de l&#146;alcool?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 4 Fi&#232;vre fr&#233;quente -->
					  <tr>
						<td style="width: 18%;padding-top: 3%;text-align: center">
							<span>Fi&#232;vre fr&#233;quente.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 5 perte de poids, pour quelle raison? -->
					  <tr>
						<td style="width: 18%;text-align: center">
							<span>perte de poids, pour quelles raisons?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 6 Diarrh&#233;e, dysenterie fr&#233;quente -->
					  <tr>
						<td style="width: 18%;text-align: center">
							<span>Diarrh&#233;e, dysenterie fr&#233;quente.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 7 Vertiges, palpitations -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 3%">
							<span>Vertiges, palpitations.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 8 Toux, gêne respiratoire -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 3%">
							<span>Toux, g&#234;ne respiratoire.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 9 Gêne à uriner -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 3%">
							<span>G&#234;ne &#224; uriner.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 10 Maux de tête -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 3%">
							<span>Maux de t&#234;te.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					</tbody>
				 </table>
		   </div>
		   <!-- Maladie 1 -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
			   <table class="table table-borderless">
					<thead>
					  <tr>
						<th style="text-align: center">###</th>
						<th style="text-align: center">Assur&#233;(e)</th>
						<th style="text-align: center">Conjoint(e)</th>
						<th style="text-align: center">1er enfant</th>
						<th style="text-align: center">2eme enfant</th>
						<th style="text-align: center">3eme enfant</th>
						<th style="text-align: center">4eme enfant</th>
					  </tr>
					</thead>
					<tbody>
					  <!-- 1 Hospitalisation -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 3%">
							<span>Hospitalisation: quelles maladies? &#224; quelles dates?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 2 Opération chirurgicale -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 3%">
							<span>Op&#233;ration chirurgicale: Pourquoi et &#224; quelles dates?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					   <!-- 3 Coeur -->
					  <tr>
						<td style="width: 18%;text-align: center;">
							<span>Hypotension-Hypertension, Art&#233;rielle, palpitation, Essouflement, Trouble, Circulatoire, Varice phl&#233;bite.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					   <!-- 4 Poumon -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Asthme, Bronchite chronique pneumonie, Tuberculose, Pleur&#233;sie</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 5 ORL -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Otite, Surdit&#233;, Sinusite, Mutit&#233;</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 6 Yeux -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Myopie, Strabisme, Presbytie, Glaucome, Cataracte, Astygmatisme</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 7 Bouche -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Avez-vous des caries, des dents absentes, des proth&#232;ses</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 8 Système digestif -->
					  <tr>
						<td style="width: 18%;text-align: center;">
							<span>Ulc&#232;re, Gastrite, H&#233;patite, Cirrhose,Hernie, Crise d&#146;appendicite,H&#233;morro&#239;de, Inflammation du c&#244;lon</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 9 Reins -->
					  <tr>
						<td style="width: 18%;text-align: center;">
							<span>Calculs, Coliques n&#233;phr&#233;tiques, Cystite, Ur&#233trite, ad&#233;nome prostatique, Bilharziose</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 10 organes génitaux -->
					  <tr>
						<td style="width: 18%;text-align: center;">
							<span>St&#233;rilit&#233;, Maladie v&#233;n&#233;rienne, Fibrome, Kyste ovaire, Hydroc&#232;le, Salpingite</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					</tbody>
				</table>
		   </div>
		   <!-- maladie 2 -->
		   <div class="tab-pane fade in "  id="tabs-4" style="margin-top:0.5%;">
			   <table class="table table-borderless">
					<thead>
					  <tr>
						<th style="text-align: center">###</th>
						<th style="text-align: center">Assur&#233;(e)</th>
						<th style="text-align: center">Conjoint(e)</th>
						<th style="text-align: center">1er enfant</th>
						<th style="text-align: center">2eme enfant</th>
						<th style="text-align: center">3eme enfant</th>
						<th style="text-align: center">4eme enfant</th>
					  </tr>
					</thead>
					<tbody>
					  <!-- 1 Gynécologie -->
					  <tr>
						<td style="width: 18%;text-align: center;">
							<span>Fausse couche, Combien? Avez-vous connaissance d&#146;&#233;tat de grossesse? Si oui, combien de mois?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 2 Glande endocrime -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 3%">
							<span>Diab&#232;te, go&#238;te: depuis quand?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					   <!-- 3 peau -->
					  <tr>
						<td style="width: 18%;text-align: center;">
							<span>Acn&#233;e, Ecz&#233;ma, Furoncle, Ganglions, L&#232;pre, Herp&#232;s, Zona, Mycose</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					   <!-- 4 Sang -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>An&#233;mie, Dr&#233;panocytose, leuc&#233;mie</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 5 Os -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Rhumatisme, Goutte, Arthrose, Arthrite</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 6 Système nerveux -->
					  <tr>
						<td style="width: 18%;text-align: center;">
							<span>Paralysie, Epilepsie, Convulsion, D&#233;pression nerveuse, Trouble du comportement, Trouble de la parole</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 7 Malformation congénitale -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Malformation cong&#233;nitale: Laquelle? Acquise par maladie ou accident?</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 8 Cancer-SIDA -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 5%">
							<span>Cancer-SIDA</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 9 Autres maladies -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 5%">
							<span>Autres maladies</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 10 Vaccins effectués -->
					  <tr>
						<td style="width: 18%;text-align: center; padding-top: 5%">
							<span>Vaccins effectu&#232;s</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					  <!-- 10 Taille, Poids, Tension art&#233;rielle -->
					  <tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Taille, Poids, Tension art&#233;rielle</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="4" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					</tbody>
				</table>
		   </div>
		   <!-- assurance -->
		   <div class="tab-pane fade in "  id="tabs-5" style="margin-top:0.5%;">
			   <table class="table table-borderless">
					<thead>
					  <tr>
						<th style="text-align: center">###</th>
						<th style="text-align: center">Assur&#233;(e)</th>
						<th style="text-align: center">Conjoint(e)</th>
						<th style="text-align: center">1er enfant</th>
						<th style="text-align: center">2eme enfant</th>
						<th style="text-align: center">3eme enfant</th>
						<th style="text-align: center">4eme enfant</th>
					  </tr>
					</thead>
					<tbody>
						<tr>
						<td style="width: 18%;text-align: center;padding-top: 3%">
							<span>Avez-vous d&#233;j&#224; &#233;t&#233; assur&#233;(e) en maladie? Aupr&#232;s de quel organisme ou compagnie d&#146;assurances? Motif du changement.</span>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="7" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="7" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="7" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="7" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="7" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
						<td>
							<textarea  class="form-control" id="bio" rows="7" style="width: 100%;resize: none;margin-top: -1%"></textarea>
						</td>
					  </tr>
					</tbody>
				</table>
		   </div>
		   <!-- traitement -->
		   <div class="tab-pane fade in "  id="tabs-6" style="margin-top:0.5%;">
			   tabs5
		   </div>
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-7" style="margin-top:0.5%;">
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
		   <div class="tab-pane fade in "  id="tabs-8" style="margin-top:0.5%;">
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
									<input type="text" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" id="bio" rows="5" style="width: 100%;resize: none;"></textarea>
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
								  <textarea  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%"></textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%"></textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%"></textarea>
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
	//affichage en fonction du MODE sur le Formulaire  
	if($('.get_mode').val()=='CONSULTATION'){
		$('.btn').hide();
	}
		 
  
   
	</script>
	
</html>


