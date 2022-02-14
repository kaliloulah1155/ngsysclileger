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
			margin: -1% 0%; 
			padding: 5px;
		}
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
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
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->
		
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
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="row" style="margin-top: 1%">
								<!-- 12_ 1 infos -->
								<div class="col-sm-6 mt-5" style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">INFORMATIONS BANCAIRES</span>
									</div>
									<div class="col2_partie" style="padding-top: 8%;">
										<div class="form-group">
										   	<label for="bio">Banque :</label>
						   					<textarea class="form-control" id='input_bqe' rows="1" name='POS_VAL_RUB_BQE' style="width: 90%;resize: none" data-parsley-required="true" data-parsley-trigger="keyup">{POS_VAL_RUB_BQE}</textarea>
										</div>
										<div class="form-group">
										   	<label for="bio">RIB :</label>
						   					<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_RIB' style="width: 90%;resize: none" data-parsley-required="true" data-parsley-trigger="keyup">{POS_VAL_RUB_RIB}</textarea>
										</div>
										<div class="form-group" style="padding-top: 5%;">
										   <label for="bio">Voulez-vous domicilier votre compte &agrave; votre banque ?</label>
										   <input type="radio" id="male" name="gender" value="male" style="margin: 0 9px;">Non
										   <input type="radio" id="male" name="gender" value="male" style="margin: 0 10px;">Oui
										</div>						
										<div class="form-group" style="padding-top: 5%;">						
											<a href="../../../../images/menu/doc.pdf" style="color:#4a67b3;">
												<span style="color:#4a67b3;">Cliquez ici pour consulter la domiciliation</span>
											</a>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">CHANGEMENT DE BANQUE</span>
									</div>
									<div class="col2_partie" style="padding-top: 5%;">
										<div class="form-group">
										   	<label for="bio">Ancienne Banque :</label>
						   					<textarea class="form-control" id="bio" name='POS_VAL_RUB_ABQ' rows="1" style="width: 90%;resize: none" data-parsley-required="true" data-parsley-trigger="keyup">{POS_VAL_RUB_ABQ}</textarea>
										</div>
										<div class="form-group">
										   	<label for="bio">Ancien RIB :</label>
						   					<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_ARI' style="width: 90%;resize: none" data-parsley-required="true" data-parsley-trigger="keyup">{POS_VAL_RUB_ARI}</textarea>
										</div>
										<div class="form-group" style="display:none">
										   <label for="bio">Certificat de redevance  :</label>
										   <input type="file" class="text-center file" style="margin-top: 0%;">
										</div>
										<div class="form-group">
										   	<label for="bio">Nouvelle Banque :</label>
						   					<textarea class="form-control" id="bio" name='POS_VAL_RUB_NBQ' rows="1" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 90%;resize: none">{POS_VAL_RUB_NBQ}</textarea>
										</div>
										<div class="form-group">
										   	<label for="bio">Nouveau RIB :</label>
						   					<textarea class="form-control" id="bio" name='POS_VAL_RUB_NRI' rows="1" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 90%;resize: none">{POS_VAL_RUB_NRI}</textarea>
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
			   <!-- debut ligne de vie -->
				<div class="info">
					<div class="jumbotron container-info" style="display:none;">
						<table cl="table" align="center" id="tblMain">
							<tr>
								<td class="pr-3">Etat de la fiche:</td>
								<td style="font-size: 15px; font-family: 'Times New Roman', Times, serif;">
									<span class="label label-success" data-value="Manager"><b>Manager<b></span>
								</td>
							</tr>
						</table>
					</div>
					<div class="progres">
						<div class="circle">
							<span class="label">1</span>
							<span class="title1">User</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1 pb-4">
								<span class="d-flex">
									<span class="pr-3">Login :</span>
									<!-- Affichage du login  -->
									<strong class=" pl-5">Sgsys</strong>
								</span><br>
								<span class="d-flex pt-2">
									<span class="pr-3">N&#186; document :</span>
									<!-- Affichage du numero  -->
									<strong class="pl-2">2</strong>
								</span><br>
								<span class="d-flex pt-1">
									<span class="pr-4">Date :</span>
									<!-- Affichage de la date -->
									<strong class="pt-1 pl-5">09/03/2021</strong>
								</span>
							</div>
						</div>
						<span class="bar"></span>
					
						<div class="circle">
							<span class="label">2</span>
							<span class="title1">Manager</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1">
								<span class="d-flex">
									<span class="pr-3">Login :</span>
									<!-- Affichage du login  -->
									<strong class=" pl-5">Sgsys</strong>
								</span><br>
								<span class="d-flex pt-1">
									<span class="pr-4">Visa :</span>
									<!-- Affichage du visa -->
									<strong class="pt-1 pl-5">Accepter</strong>
								</span><br>
								<span class="d-flex pt-1">
									<span class="pr-4">Date :</span>
									<!-- Affichage de la date -->
									<strong class="pt-1 pl-5">09/03/2021</strong>
								</span><br>
								<span class="d-flex pt-1 pl-0 pm-1" style="display: none">
									<!-- Affichage du commmentaire -->
									<strong>Evadez-vous de la jumgle Urbaine.</strong>
								</span>
							</div>
						</div>
						<span class="bar"></span>
					
						<div class="circle">
							<span class="label">3</span>
							<span class="title1">RH</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1">
								<span class="d-flex">
									<span class="pr-3">Login :</span>
									<!-- Affichage du login  -->
									<strong class=" pl-5">Sgsys</strong>
								</span><br>
								<span class="d-flex pt-1">
									<span class="pr-4">Visa :</span>
									<!-- Affichage du visa -->
									<strong class="pt-1 pl-5">En attente</strong>
								</span><br>
								<span class="d-flex pt-1">
									<span class="pr-4">Date :</span>
									<!-- Affichage de la date -->
									<strong class="pt-1 pl-5">09/03/2021</strong>
								</span><br>
								<span class="d-flex pt-1 pl-0 pm-1" style="display: none">
									<!-- Affichage du commmentaire -->
									<span style="font-size: 13px; font-family: 'Times New Roman', Times, serif;">
										<strong>Le tour du monde des senteurs fins.</strong>
									</span>
								</span>
							</div>
						</div>
						<span class="bar"></span>
					
						<div class="circle">
							<span class="label">4</span>
							<span class="title1">Direction</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1">
								<span class="d-flex">
									<span class="pr-3">Login :</span>
									<!-- Affichage du login  -->
									<strong class=" pl-5">Sgsys</strong>
								</span><br>
								<span class="d-flex pt-1">
									<span class="pr-4">Visa :</span>
									<!-- Affichage du visa -->
									<strong class="pt-1 pl-5">Refuser</strong>
								</span><br>
								<span class="d-flex pt-1">
									<span class="pr-4">Date :</span>
									<!-- Affichage de la date -->
									<strong class="pt-1 pl-5">09/03/2021</strong>
								</span><br>
								<span class="d-flex pt-1 pl-0 pm-1" style="display: none">
									<!-- Affichage du commmentaire -->
									<span style="font-size: 13px; font-family: 'Times New Roman', Times, serif;">
										<strong>Batir votre projets en accompagnant vos reves.</strong>
									</span>
								</span>
							</div>
						</div>
					</div>
					<div class="row jumbotron" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="col-sm-3" style="padding-bottom: 3%">
							<label for="bio">Acteur 1</label>
							<input type="text" class="form-control" placeholder="" style="width: 90%;">
						</div>
						<div class="col-sm-1" style="padding-bottom: 3%">
							<label for="bio">Visa</label>
							<label for="bio" class="input-group-addon">
								<img src="../../../../images/visa/visa_accapter.gif" alt="">
							</label>
						</div>
						<div class="col-sm-3" style="padding-bottom: 3%">
							<label for="bio">Date</label>
							<input type="text" class="form-control" placeholder="" style="width: 90%;">
						</div>
						<div class="col-sm-5" style="padding-bottom: 3%">
							<label for="bio">Commentaire</label>
							<textarea class="form-control" id="bio" rows="1" style="width: 90%;resize: none"></textarea>
						</div>
						<!-- acteur 2 -->
						<div class="col-sm-3" style="padding-bottom: 3%">
							<label for="bio">Acteur 2</label>
							<input type="text" class="form-control" placeholder="" style="width: 90%;">
						</div>
						<div class="col-sm-1" style="padding-bottom: 3%">
							<label for="bio">Visa</label>
							<label for="bio" class="input-group-addon">
								<img src="../../../../images/visa/visa_refuser.gif" alt="">
							</label>
						</div>
						<div class="col-sm-3" style="padding-bottom: 3%">
							<label for="bio">Date</label>
							<input type="text" class="form-control" placeholder="" style="width: 90%;">
						</div>
						<div class="col-sm-5" style="padding-bottom: 3%">
							<label for="bio">Commentaire</label>
							<textarea class="form-control" id="bio" rows="1" style="width: 90%;resize: none"></textarea>
						</div>
					</div>
				</div>
				<!-- fin ligne de vie -->
				<script>
					$(document).ready(function () {
						//   Barre de progression
						$('.progres .circle').removeClass().addClass('circle');
						$('.progres .bar').removeClass().addClass('bar');
						$(".circle").first().addClass("active");
						var timer = setInterval(increment, 1000);
						function increment() {
							$(".circle:not(.done)").first().removeClass("active").addClass("done").children(":first-child").html("&#10003;");
							$(".circle:not(.done)").first().addClass("active");
							$(".circle.done").next().addClass("done");
							if ($(".active").find(".title1").text() === $("tr:last-child").find("span").text()) {
								clearInterval(timer);
							}
						}
					});
				</script>
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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" class="form-control" style="width: 100%">
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
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
 		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- endjquery  -->
	
	 <script>

	$('#formDBQ').parsley();

	//affichage en fonction du MODE sur le Formulaire  
	if($('.get_mode').val()=='CONSULTATION'){
		$('.btn').hide();
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
   
	</script>
	
</html>


