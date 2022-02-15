<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation Demeande de formation</title>
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
	<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
	<link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>
	
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
			padding: 5px;
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
<body  class='tpl_consultation tpl_consultation_dfm' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formdmdformation"  ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='DFM'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>

		<!-- important pour lancer la boite aux lettres  -->
		<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
		<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
		<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
		<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
		<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
		<!-- important pour lancer la boite aux lettres  -->

   <input type='hidden' class='appName' value="{NOM_APPLICATION}">

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



		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
		   	 <section class="botton_pris">
				<a href="javascript:void(0)"  style="display:none" class="btn p-1 bg-info print_vbtn">Visualiser le pdf</a>
				<a href="javascript:void(0)" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
			</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="row">
								<div class="col-sm-12">
									<div class="col1_partie text-center">
										<span class="title text-while">RECAPITULATIF</span>
									</div>
									<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD" value='{POS_VAL_RUB_COD}'>
									<div class="col2_partie" style="padding-top: 2%;padding-right: 2%;padding-left: 2%">
										<div class="row">
											<div class="col-sm-4">
												<label>Ann&#233;e du plan :</label>
												<input type="text" name='POS_VAL_RUB_APL'  value="{POS_VAL_RUB_APL}" class="form-control" placeholder="Ann&#233;e de plan" style="width: 100%">
											</div>
											<div class="col-sm-4">
								<label>Action de formation n&#176; :</label>
								<input type="text" name="POS_VAL_RUB_ANF" value="{POS_VAL_RUB_ANF}"  class="form-control" placeholder="Action de formation n&#176;" style="width: 100%">
							</div>
							<div class="col-sm-4">
								<label>Intitul&#233; de l&#145;action de formation :</label>
								<input type="text" name="POS_VAL_RUB_IAF" value="{POS_VAL_RUB_IAF}" class="form-control" placeholder="Intitul&#233; de l&#145;action de formation" style="width: 100%">
							</div>
											<div class="col-sm-4" style="margin-top: 13px;padding-left: 5%">
												<label>Intitul&#233; de l&#145;action de formation :</label><br>
												<input type="radio" name="POS_VAL_RUB_TA1" value="INTRA" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Intra</span><br>
												<input type="radio" name="POS_VAL_RUB_TA1"  value="INTER" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Inter</span><br>
												<input type="radio" name="POS_VAL_RUB_TA1" value="INTERNE" style="margin-right: 1%"><span style="font-size: 12px;">Interne</span><br>
												<input type="hidden" name="POS_VAL_CTRL_TA1" value="{POS_VAL_RUB_TA1}">
											</div>
											<div class="col-sm-4" style="margin-top: 13px;padding-left: 5%">
												<label class="but">But de la formation :</label><br>
												<input type="radio" class="btnFors" checked name="POS_VAL_RUB_BUF" value="INITIATION" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Initiation</span><br>
												<input type="radio" class="btnFors" name="POS_VAL_RUB_BUF" value="PERFECTIONNEMENT" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Perfectionnement</span><br>
												<input type="radio" class="btnFors" name="POS_VAL_RUB_BUF" value="RECONVERSION" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Reconversion</span><br>
												<input type="radio" class="btnFors" name="POS_VAL_RUB_BUF"  value="AUTRES" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Autres (&#224; pr&#233;ciser)</span><br>
												<input type="text" name="POS_VAL_RUB_BU1" value="{POS_VAL_RUB_BU1}" class="form-control" id="autresLigne" placeholder="" style="width: 100%;">
												<input type="hidden" name="POS_VAL_CTRL_BUF" value="{POS_VAL_RUB_BUF}">
											</div>
										</div>
										<div class="row">
											<div class="col-sm-12">
												<label>Objectifs p&#233;dagogiques :</label>
												<br>
												<span style="font-size: 12px;margin-left: 1%;">A l&#146;issue de la formation, le (s) b&#233;n&#233;ficiaire (s) doit (vent) &#234;tre capable (s) de :</span>
												<textarea type="text" rows="3" name='POS_VAL_RUB_OBP' class="form-control" style="width: 100%; resize:none">{POS_VAL_RUB_OBP}</textarea>
											</div>
										</div>
										<div class="row" style="margin-top: 15px">
											<div class="col-sm-12">
												<label>B&#233;n&#233;ficiaires de la formation :</label>
												<table class="table" id="table" style="width: 100%;margin: auto;">
													<thead>
														<tr>
															<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<label for="bio">Nom & Pr&#233;noms</label>
															</td>
															<td style="width: 45px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<label for="bio">Genre</label>
															</td>
															<td style="width: 45px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<label for="bio">Date de naissance</label>
															</td>
															<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<span>Nationalit&#233;</span>	
															</td>
															<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<span>Fonction</span>	
															</td>
															<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<span>Cat&#233;gorie</span>	
															</td>
															<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<span>Ann&#233;e d&#145;embauche</span>	
															</td>
															<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
																<span>CNPS</span>	
															</td>
														 
														</tr>
										</thead>
								<tbody class="estimation">
														<tr>
															<td style="width: 30px; border: 1px solid">
																<select name="personnel[]" class="form-control selectNom lib_personnel" style="width: 100%;">
 																</select>	
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="civilite[]" type="text" class="form-control civilite" style="width: 100%;background: transparent;">
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="datenaiss[]" type="text" class="form-control datenaiss" style="width: 100%;background: transparent;">
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="nationalite[]" type="text" class="form-control nationalite" style="width: 100%;background: transparent;">
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="fonction[]" type="text" class="form-control fonction" style="width: 100%;background: transparent;">
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="categorie[]" type="text" class="form-control categorie" style="width: 100%;background: transparent;">
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="dtembauche[]" type="text" class="form-control dtembauche" style="width: 100%;background: transparent;">
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="cnps[]" type="text" class="form-control cnps" style="width: 100%;background: transparent;">
															</td>
															<td style="width: 45px; border: 1px solid">
																<input name="position[]" type="text" class="form-control position" style="width: 100%;background: transparent;">
															</td>
														</tr>
													</tbody>
												</table>
												<div class="col-sm-12">
													<i class="fa fa-archive btn" id="suprimeNvlls" title="Suprimer la derni&#232;re ligne" style="margin-left: -1%;margin-top: 3px;background: #4a67b3;color: #FFF;position: absolute;"></i>
													<span class="btn" id="ligneNvlls" style="float: right;margin-top: 3px;margin-right: -1%;color: #FFF;background: #4a67b3;">Ajouter une ligne</span>
												</div>
											</div>
										</div>
									</div>

									<div class="row" style="margin-top: 1%">
										<div class="col-sm-12" style="margin-top: 2%;">
											<div class="col1_partie text-center">
												<span class="title text-while">DESCRIPTIFS</span>
											</div>
											<div class="col2_partie" style="padding-top: 2%;padding-left: 2%;padding-right: 2%">
												<div class="row">
													<div class="col-sm-4">
														<label>Entreprise :</label>
														<select name='POS_VAL_RUB_ENT' class="form-control selectEnp entreprise" style="width: 100%;">
															</select>
															<input type="hidden"  class="interselectentreprise" name='POS_VAL_CTRL_ENT' id='POS_VAL_CTRL_ENT' value='{POS_VAL_RUB_ENT}'> 
													</div>
													<div class="col-sm-4">
														<label>Lieu de formation :</label>
														<input name="POS_VAL_RUB_LIF" value="{POS_VAL_RUB_LIF}" type="text" class="form-control" placeholder="Lieu de formation" style="width: 100%">
													</div>
													<div class="col-sm-4">
														<label>Structure ou &#233;tablissement de formation :</label><br>
														<input type="checkbox" class="btnFors cbk1" name="POS_VAL_RUB_E1" value="{POS_VAL_RUB_E1}" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Etranger</span>

														<input type="checkbox" class="btnFors cbk2" name="POS_VAL_RUB_E2" value="{POS_VAL_RUB_E2}" style="margin-right: 1%;margin-left: 10%"><span style="font-size: 12px;margin-right: 3%">Diplomant</span>

														<input type="text" style="width: 100%;visibility: hidden;">
													</div>
												</div>
												<div class="row">
													<div class="col-sm-4">
														<label>Date d&#233;but de formation :</label>
														<input name='POS_VAL_RUB_DEI' value="{POS_VAL_RUB_DEI}" type="text" class="form-control" id="date1" placeholder="jj/mm/aaaa" style="width: 100%">
													</div>
													<div class="col-sm-4">
														<label>Date fin de formation :</label>
														<input name='POS_VAL_RUB_DFI' value="{POS_VAL_RUB_DFI}" type="text" class="form-control" id="date2" placeholder="jj/mm/aaaa" style="width: 100%">
													</div>
													<div class="col-sm-4">
														<label>Nombre de groupe :</label>
														<input type="text" name='POS_VAL_RUB_NGP' value="{POS_VAL_RUB_NGP}" class="form-control" placeholder="Cout total" style="width: 100%">
													</div>
												</div>
												<div class="row" style="margin-top: 13px">
													<div class="col-sm-4">
														<label>Nombre d&#146;heure par groupe</label>
														<input type="text" name='POS_VAL_RUB_NHG' value="{POS_VAL_RUB_NHG}" class="form-control" placeholder="Nombre d&#146;heure par groupe" style="width: 100%">
													</div>
													<div class="col-sm-4">
														<label>Co&#251;t total de formation :</label>
														<input type="text" name='POS_VAL_RUB_COT'  value="{POS_VAL_RUB_COT}" class="form-control"  style="width: 100%">
													</div>
													<div class="col-sm-4">
														<label>Structure et &eacute;tablissement de formation :</label>
														<input type="text" name="POS_VAL_RUB_SET" value="{POS_VAL_RUB_SET}" class="form-control"   style="width: 100%">
													</div>
												</div>
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
							<span class="title1">RH</span>
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
									<strong class="pt-1_pl-5 rh_visa" style="font-size: 13px;">{POS_VAL_RUB_VC1}</strong>
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
							<span class="title1">ADM</span>
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
									<strong class="pt-1_pl-5  ADM_visa" style="font-size: 13px;">{POS_VAL_RUB_VC2}</strong>
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
							<span class="title1">DGA</span>
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
									<strong class="pt-1_pl-5  dga_visa" style="font-size: 13px;">{POS_VAL_RUB_VC3}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT6}</strong>
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
							<span class="title1">DG</span>
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
									<strong class="pt-1_pl-5 dg_visa" style="font-size: 13px;">{POS_VAL_RUB_VC4}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT5}</strong>
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
							<span class="label1">7</span>
							<span class="title1">CLOS</span>
							
						</div>
					</div>

						<!--commentaire sur  de la ligne de vie -->

					<div class="row jumbotron" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">MANAGER </label>
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
								<label for="bio">RH</label>
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
								<label for="bio">MANAGER_ADM</label>
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
								<label for="bio">DGA</label>
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
								<input type="text" name='POS_VAL_RUB_DT6' value="{POS_VAL_RUB_DT6}" class="form-control" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT4' style="width: 90%;resize: none">{POS_VAL_RUB_CT4}</textarea>
							</div>
						</div>
						<!-- acteur 5 -->
						<div class="acteur5">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DG</label>
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
								<input type="text" name='POS_VAL_RUB_DT5' value="{POS_VAL_RUB_DT5}" class="form-control" placeholder="" style="width: 90%;">
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
						<div class="col2_partie text-center" style="padding-top: 0%.;">
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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}"   placeholder="N&#176; poseidon" class="form-control numposeidon" style="width: 100%">
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

	<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DFM/packs/packages_edit_dfm.js"></script>

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DFM/packs_rows/rows_loader_dfm.js"></script>

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DFM/dfmpdf/pdfdemandeform.js"></script>
	
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
	$('#formdmdformation').parsley();

	$(document).ready(function () {

		// select2 
        $('.selectNom').select2({
            theme:'bootstrap4',
            tags:true,
            allowClear: true
        });

        $("#autresLigne").css("display","none");
        $(document).on('click','.btnFors',function(){
        	let valbnt = $(this).val();
        	if(valbnt == "AUTRES"){
        		$("#autresLigne").css("display","block");
        	}
        	else{
        		$("#autresLigne").css("display","none");
        	}
        });


		$('#date1 , #date2').datepicker({
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

		// Ajouter de ligne mission 
			/*$("#ligneNvlls").click(function(){   
				addRowMs();
				$("#suprimeNvlls").css("display","block");
            });
			function  addRowMs(){ 
			  	var Nouvell_ligne ='<tr>'+
						'<td style="width: 30px; border: 1px solid">'+
							'<select name="category" class="form-control selectNom" style="width: 100%;">'+
							    '<option value="0">Veuillez s&#233;lectionner</option>'+
							'</select>'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
					'</tr>';
              	$('.estimation').append(Nouvell_ligne);
			}*/
				//Supprimer de ligne a la table
			$(document).on('click','#suprimeNvlls',function(){
				  let rowcount=$('.table > .estimation').children().length;
				  if(rowcount==3){
				  	$(this).hide();
				  }else{$(this).show();}
                 $('.estimation tr:gt(0):last').remove();
			});

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
		 		
   
	</script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DFM/workflowDFM.js"></script>

	
</html>


