<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de la demande</title>
	 
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
		 
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->

	 <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet" />
	
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
			width: 120px;
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
			width: 120px;
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

	<form name='principal' id="formabsence" ACTION='{URL_ATTENTE}' method='POST'>
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

		 <!-- donn??es de l'utilisateur connect?? -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					 <!--fin donn??es de l'utilisateur connect?? -->
		
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
							<div class="row" style="margin-top: 1%">
										<!-- 12_ 1 infos -->
								<div class="col-sm-6 mt-5" style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">OBJECT DE LA DEMANDE</span>
									</div>
									<div class="col2_partie" style="padding-top: 5%;">
										<div class="form-group">
										   <label for="selection">Type de demande</label>
											
											   <select class="form-control type_dmd" style="width: 90%" name='POS_VAL_RUB_AUN' id='id_rub_AUN' >
														<option disabled='true' selected='true'>S&eacute;lectionner votre demande</option>
														<option value="ABSENCE">Absence</option>
														<option value="BAPTEME D'UN ENFANT">Bapt&egrave;me d'un enfant</option>
														<option value="CONGE ANNUEL">Cong&eacute; annuel</option>
														<option value="CONGE DE MATERNITE">Cong&eacute; de maternit&eacute;</option>
														<option value="CONGE DE PARTENITE">Cong&eacute; de paternit&eacute;</option>
														<option value="DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE">D&eacute;c&egrave;s d'un beau-p&egrave;re ou d'une belle-m&egrave;re</option>
														<option value="DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR">D&eacute;c&egrave;s d'un enfant, du p&egrave;re, de la m&egrave;re du travailleur</option>
														<option value="DECES D'UN FRERE OU D'UNE SOEUR">D&eacute;c&egrave;s d'un fr&egrave;re ou d'une soeur</option>
														<option value="DECES DU CONJOINT">D&eacute;c&egrave;s du conjoint</option>
														<option value="DEMENAGEMENT">D&eacute;m&eacute;nagement</option>
														<option value="MARIAGE DU TRAVAILLEUR">Mariage du travailleur</option>
														<option value="MARIAGE D'UN DE SES ENFANTS, D'UN FRERE, D'UNE SOEUR">Mariage d'un de ses enfants, d'un fr&egrave;re, d'une s&oelig;ur</option>
														<option value="NAISSANCE D'UN ENFANT">Naissance d'un enfant</option>
														<option value="PREMIERE COMMUNION">Premi&eacute;re communion</option>
														<option value="REPOS EXEPTIONEL">Repos exceptionnel</option>
														<option value="REPOS MALADIE">Repos maladie</option>
													</select>
													<input type="hidden" name='POS_VAL_CTRL_AUN' id='POS_VAL_CTRL_AUN' value='{POS_VAL_RUB_AUN}'>
										</div>
										<div class="form-group">
										   <label for="bio">Motif :</label>
											<textarea  name='POS_VAL_RUB_COM'class="form-control" id="bio" data-parsley-required="true" data-parsley-trigger="keyup"   style="width: 90%;resize: none"> {POS_VAL_RUB_COM}</textarea>
										</div>
										<div class="form-group">
						   <label for="bio">Interimaire :</label>
							  <select id="interimaire" style="width: 90%" name='POS_VAL_RUB_INT' class="form-control select2 personnel" rows="1" data-parsley-required="true" >
								     <option value="{POS_VAL_RUB_INT}" selected>{POS_VAL_RUB_INT}</option>
								</select>      
								<input type="hidden" name='POS_VAL_CTRL_INT' class="interselect" id='POS_VAL_CTRL_INT' value='{POS_VAL_RUB_INT}'>
 						</div>
										<div class="form-group">
										   <label for="bio">Dossier en cours :</label>
										   <textarea  name='POS_VAL_RUB_DOS' class="form-control" id="bio"  style="width: 90%;resize: none" data-parsley-required="true" data-parsley-trigger="keyup"> {POS_VAL_RUB_DOS}</textarea>
										</div>
										<label for="bio">Date de d&eacute;part :</label>
										<div class="row">
											<div class="col-sm-5">
							  					<input type="text" class="form-control datedeb" placeholder="01/01/2021" name="POS_VAL_RUB_DT4"  id="d1" required="true"  value="{POS_VAL_RUB_DT4}">
											</div>
											<input type="hidden" class="form-control datedeblettre" style="color:black"  name="POS_VAL_RUB_A1" value="{POS_VAL_RUB_A1}" />
											<div class="col-sm-4" style="margin-left: -5.5%;">
											  <input type="time" class="form-control timedeb" name="POS_VAL_RUB_HRD" data-theme="a" data-clear-btn="true"  id="t1" value="{POS_VAL_RUB_HRD}">
											</div>
										</div>
										<label for="bio">Dur&eacute;e :</label>
										<div class="row">
											<div class="col-sm-5">
											  <input type="type" class="form-control duree" placeholder="Nombre de jours" name='POS_VAL_RUB_NBR' data-parsley-required="true" data-parsley-trigger="keyup"  value="{POS_VAL_RUB_NBR}"  id="d1">
											</div>
											<div class="col-sm-4" style="margin-left: -5.5%;">
											  <select class="form-control dureedebselect" style="width: 90%" name='POS_VAL_RUB_HRA' id='id_rub_HRA'>
												<option value="0">Heure</option>
												<option value="0">0</option>
												<option value="1">1</option>
												<option value="2">2</option>
												<option value="3">3</option>
												<option value="4">4</option>
												<option value="5">5</option>
												<option value="6">6</option>
												<option value="7">7</option>
											 </select>
												<input type="hidden" class="dureedeb" name='POS_VAL_CTRL_HRA' id='POS_VAL_CTRL_HRA' data-parsley-required="true" data-parsley-trigger="keyup" value='{POS_VAL_RUB_HRA}'>
											</div>
										</div>
										<label for="bio">Date de retour :</label>
										<div class="row">
											<div class="col-sm-8">
											  <input type="type" class="form-control res6" readonly="true"  name='POS_VAL_RUB_DRU'  value="{POS_VAL_RUB_DRU}" data-parsley-required="true" data-parsley-trigger="keyup">

											  <input type="hidden" class="datefin" name='POS_VAL_RUB_DFI'  value='{POS_VAL_RUB_DFI}'>
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">APPROBATION HIERARCHIE</span>
									</div>
									<div class="col2_partie" style="padding-top: 3%;">
										<div class="form-group">
										   <label for="selection">Avis Manager</label>
											<!--<select id="selection" class="form-control" style="width: 90%">
												<option value="">Statut de la demande</option>
												<option value="">Demande accept&eacute;e</option>
												<option value="">Demande refus&eacute;e</option>
											</select>-->
											 <select class="form-control" style="width: 90%"  name='POS_VAL_RUB_AX1' id='id_rub_AX1' >
												<option disabled='true' selected='true'>S&eacute;lectionner votre statut</option>
												<option value="DEMANDE ACCEPTEE">Demande accept&eacute;e</option>
												<option value="DEMANDE REFUSEE">Demande refus&eacute;e</option>
											 </select>
											 <input type="hidden" name='POS_VAL_CTRL_AX1' id='POS_VAL_CTRL_AX1' value='{POS_VAL_RUB_AX1}'>
										</div>
										<div class="form-group">
										   <label for="bio">Commentaires :</label>
											<textarea class="form-control" id="bio" rows="2"  name='POS_VAL_RUB_CTM' style="width: 90%;resize: none"> {POS_VAL_RUB_CTM}</textarea>
											
										</div>
										<div class="form-group">
										   <label for="selection">Avis RH</label>
											 <select class="form-control" style="width: 90%"  name='POS_VAL_RUB_AX2' id='id_rub_AX2' >
												<option disabled='true' selected='true'>S&eacute;lectionner votre statut</option>
												<option value="DEMANDE ACCEPTEE">Demande accept&eacute;e</option>
												<option value="DEMANDE REFUSEE">Demande refus&eacute;e</option>
											 </select>
											 <input type="hidden" name='POS_VAL_CTRL_AX2' id='POS_VAL_CTRL_AX2' value='{POS_VAL_RUB_AX2}'>
										</div>
										<div class="form-group">
										   <label for="bio">Commentaires :</label>
										   
											<textarea  class="form-control" id="bio" rows="2"  name='POS_VAL_RUB_DEP' style="width: 90%;resize: none"> {POS_VAL_RUB_DEP}</textarea>
										</div>
										<div class="form-group">
										   <label for="selection">Avis Direction</label>
											<select class="form-control" style="width: 90%" name='POS_VAL_RUB_AUS' id='id_rub_AUS' >
												<option disabled='true' selected='true'>S&eacute;lectionner votre statut</option>
												<option value="AUTORISATION ACCORDE AVEC RETENUE"  >Autorisation accord&eacute; avec retenue</option>
												<option value="AUTORISATION ACCORDE AVEC TRAITEMENT">Autorisation accord&eacute; avec traitement</option>
												<option value="AUTORISATION REFUSEE">Autorisation refus&eacute;e</option>
											</select>
											<input type="hidden" name='POS_VAL_CTRL_AUS' id='POS_VAL_CTRL_AUS' value='{POS_VAL_RUB_AUS}'>
										</div>
										<div class="form-group">
										   <label for="bio">Commentaires :</label>
											<textarea  class="form-control" id="bio" rows="2"  name='POS_VAL_RUB_DSC' style="width: 90%;resize: none"> {POS_VAL_RUB_DSC}</textarea>
											
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
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4B}</strong>
								</p>
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
							<span class="title1">CLOS</span>
							
						</div>
					</div>

						<!--commentaire sur  de la ligne de vie du parcours de l'employe -->

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
								<label for="bio">MANAGER ADM</label>
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
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CRE}</strong>
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
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4E}</strong>
								</p>
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
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4F}</strong>
								</p>
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
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4G}</strong>
								</p>
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

					
					<div class="row jumbotron" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">RH</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text"  class="form-control" name='POS_VAL_RUB_A4E' value="{POS_VAL_RUB_A4E}" placeholder="" style="width: 80%;">
										<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4E', 'POS_VAL_RUB_A4E')">
											<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>
								</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC5}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT6' value="{POS_VAL_RUB_DT6}" class="form-control" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT5' rows="1" style="width: 90%;resize: none">{POS_VAL_RUB_CT5}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DGA</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" class="form-control" name='POS_VAL_RUB_A4F' value="{POS_VAL_RUB_A4F}" placeholder="" style="width: 80%;">
											<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4F', 'POS_VAL_RUB_A4F')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>
									</div>

							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC6}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_DT7' value="{POS_VAL_RUB_DT7}" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT6' rows="1" style="width: 90%;resize: none">{POS_VAL_RUB_CT6}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" class="form-control" name='POS_VAL_RUB_A4G' value="{POS_VAL_RUB_A4G}" placeholder="" style="width: 80%;">
										<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4G', 'POS_VAL_RUB_A4G')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>
									</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%"> 
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC7}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_DT8' value="{POS_VAL_RUB_DT8}" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT7' rows="1" style="width: 90%;resize: none">{POS_VAL_RUB_CT7}</textarea>
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
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 12px">HISTORIQUE</span>
							</div>
							<div class="col3_partie" style="padding: 5%;">
								<!-- N?? poseidon -->
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

	<!-- endjquery  -->

	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/select2/select2tr.js"></script>
	 
	
	 <script>

	  $(document).ready(function () {
			 $('#d1').datepicker({
				altField: "#datepicker",
				closeText: 'Fermer',
				prevText: 'Pr??c??dent',
				nextText: 'Suivant',
				currentText: 'Aujourd\'hui',
				monthNames: ['Janvier', 'F&#233;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao&#251;t', 'Septembre', 'Octobre', 'Novembre', 'D&#233;cembre'],
				monthNamesShort: ['Janv.', 'F??vr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'D??c.'],
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
		  $('.dureedebselect').on('change',function(){
			console.log($(this).val());
		});
		 
 
		 
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
	  var months = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','Aout','Septembre','Octobre','Novembre','D??cembre'];
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
	
 $('.dureedebselect').on('change ',function(){
	   $('.dureedeb').val( $(this).val());
});

  $('.dureedebselect,.duree , .timedeb').on('change ',function(){

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


			// debut grise heure depart
		 
      $('.datedeb').on('change',function(){
      		$('.timedeb').prop('disabled',false);

      		if($(this).val() ==''){
      			$('.timedeb').prop('disabled',true);
      			$('.timedeb').val('');
      			$('.res6').val('');
      		}
      });

//fin grise heure depart

			//Debut Traitement des dur??es-type de demande
   
    if( $('.type_dmd').val() !=null ){



    }else{ 
    	
    	//$('.dureedebselect').prop('disabled',true); 
    	//$('.timedeb').prop('disabled',true); 
    	//$('.datedeb').prop('disabled',true); //date de depart
    	//$('.duree').prop('disabled',true);

    }

    $('.type_dmd').on('change',function(){

    	let type_dmd=$(this).val();

    	$('.duree').val('');

    //	console.log(type_dmd);

    	switch (type_dmd) {
			case "MARIAGE DU TRAVAILLEUR" :
			    $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(4);
				break;
			case "MARIAGE D'UN DE SES ENFANTS, D'UN FRERE, D'UNE SOEUR":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				break;
			case "DECES DU CONJOINT":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(5);
				break;
			case "DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(5);
				break;
			case "DECES D'UN FRERE OU D'UNE SOEUR":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				break;
			case "DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				break;
			case "NAISSANCE D'UN ENFANT":
				 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				break;
			case "BAPTEME D'UN ENFANT":
				 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(1);
				break;
			case "PREMIERE COMMUNION":
			     $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(1);
				break;
			case "DEMENAGEMENT":
				 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',true); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart

				 $('.duree').prop('disabled',true);
				$('.duree').val(1);
				break;
		default:

		 $('.dureedebselect').prop('disabled',false); 
    	 $('.timedeb').prop('disabled',true); 
    	 $('.datedeb').prop('disabled',false); //date de depart
    	 $('.duree').prop('disabled',false);
			// $('.duree').prop('disabled',false);
			$('.duree').val('');
		}
    });
//Fin Traitement des dur??es-type de demande
	</script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/workflow.js"></script>
	
</html>


