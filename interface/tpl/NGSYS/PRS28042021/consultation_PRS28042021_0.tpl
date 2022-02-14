<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de la Fiche d&#146;identification</title>
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
	
	<style>
		.col_list{
			height: 7vh;
			margin: 0 70%;
			padding: 1%;
			font-family: 'Times New Roman';
			font-size: 14px;
			background-color: transparent;
			font-weight: lighter; 
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
		
		.col12_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 17px;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 13px;
			padding-top: 5px;
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

		
		/* media query 
		@media (min-width: 576px) { 
			.col2_partie{
				height: 110vh;
			}
			
			.btn{
				font-size: 12px;
			}
		}

		@media (min-width: 992px) { 
			.col2_partie{
				height: 110vh
			}
		}

		@media (min-width: 1200px) {  
			.col2_partie{
				height: 110vh;
			}
		}*/
	</style>
	<script>
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
				dateFormat: 'dd-mm-yy'
			});
		});
	</script>
</head>
<body  class='tpl_consultation tpl_consultation_prs' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formperso" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		 <input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='PRS'/>
		<input type='hidden' class="get_mode" name='MODE' value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">

		<input type='hidden' class='appName' value="{NOM_APPLICATION}">
         
		 

		<!-- END BLOC_OLD_VALUE -->
		
		<header class="header-const ">
			<div id="actions-container" class="ui-widget-content titre-boutons entete" style="padding-left: 3%; text-align: center; background: transparent; border: none">
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
						<li class="active b1" ><a role="button" class=" btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li>
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>
		<section class="botton_pris">
			<a href="javascript:void(0)"  style="display:none" class="btn p-1 bg-info print_vbtn">Visualiser le pdf</a>
			<a href="javascript:void(0)" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
		</section>

		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
  					 
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="row">
								<!-- 12_ 1 infos -->
								<div class="col-sm-12">
									<div class="col1_partie text-center">
										<span class="title text-while">INFORMATIONS PERSONNELLES</span>
									</div>
									<div class="col12_partie" style="padding-top: 3%;">
										<!-- civilite -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -1% 0%;">
												<label>Civilit&eacute;</label>
													<select class="form-control civilite" name='POS_VAL_RUB_CIV' id='id_rub_CIV' rows="1"   >
														<option  disabled="true">Veuillez selectionner</option>
														<option value=""></option>
														<option value="M" >Monsieur</option>
														<option value="MME" >Madame</option>
														<option value="MLLE">Mademoiselle</option>
													</select>    
												<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV' value='{POS_VAL_RUB_CIV}'>
											</div>
											<div class="col-sm-4 epoux" style="margin: -1% 0%;display:none">
												<label>Nom &amp; Pr&eacute;noms de l&#146;epoux</label>
												<input type="text" name='POS_VAL_RUB_NEP' value="{POS_VAL_RUB_NEP}" placeholder="Nom &amp; Pr&eacute;noms" class="form-control" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" >
											</div>
										</div>
										<!-- login & nom & prenom -->
										<div class="form-group row">
											<div class="col-sm-4" >
												<label>Login</label>
							  					<input type="text" name='POS_VAL_RUB_LOG'  value="{POS_VAL_RUB_LOG}" placeholder="exemple: AZERTY" class="form-control" data-parsley-required="true" data-parsley-pattern="^[A-Z0-9_]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
											<div class="col-sm-4">
												<label>Nom</label>
												<input type="text"  class="form-control" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" placeholder="Nom"  data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%"  />
											</div>
											<div class="col-sm-4">
												<label>Pr&eacute;noms</label>
												<input type="text"  class="form-control" name='POS_VAL_RUB_PRE'  value="{POS_VAL_RUB_PRE}" placeholder="Pr&eacute;noms"  data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup"  style="width: 100%" />
											</div>
										</div>
										<!-- date naiss & lieu naiss & pay naiss -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Date de naissance</label>
												<input type="text" id="date1" name="POS_VAL_RUB_DNS" value="{POS_VAL_RUB_DNS}" class="form-control text-center" data-parsley-required="true" style="width: 100%">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Lieu de naissance</label>
												<input type="text" name='POS_VAL_RUB_LNS' value="{POS_VAL_RUB_LNS}" placeholder="Lieu de naissance" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Pays de naissance</label>
							 					 <input type="text" placeholder="Pays de naissance" name='POS_VAL_RUB_PNS'  value="{POS_VAL_RUB_PNS}" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
										</div>
										<!-- nationnalit & nature pièce & numero pièce -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Nationalit&eacute;</label>
							  					<input type="text" name='POS_VAL_RUB_NAT' value="{POS_VAL_RUB_NAT}"  placeholder="Nationalit&eacute;" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Nature de pi&egrave;ce</label>
												<select id='id_rub_NTP' name='POS_VAL_RUB_NTP' class="form-control" rows="1"  data-parsley-required="true" >
													<option value="0" disabled="disabled" selected>Veuillez selectionner</option>
														<option value="ATTESTATION">Atttestation d'identit&eacute; </option>
														<option value="CARTE CONSULAIRE">Carte consulaire </option>
														<option value="CNI">Carte nationale d'identit&eacute; </option>
														<option value="PASSEPORT">Passeport </option>
														<option value="PERMIS DE CONDUIRE">Permis de conduire </option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_NTP' id='POS_VAL_CTRL_NTP' value='{POS_VAL_RUB_NTP}'>
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Num&eacute;ro de pi&egrave;ce</label>
							  					<input type="text" name='POS_VAL_RUB_NPI' value="{POS_VAL_RUB_NPI}" placeholder="Num&eacute;ro de pi&egrave;ce" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[A-Z0-9 ]*$" style="width: 100%" />
											</div>
										</div>
										<!-- ville & commune & quartier -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Ville</label>
												<input type="text" name='POS_VAL_RUB_VLE' value="{POS_VAL_RUB_VLE}" placeholder="Ville" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$" style="width: 100%">
											</div>
											<div class="col-sm-4" >
												<label>Commune</label>
												<input type="text" name='POS_VAL_RUB_CNE'value="{POS_VAL_RUB_CNE}" placeholder="Commune" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$" style="width: 100%">
											</div>
											<div class="col-sm-4" >
												<label>Quartier</label>
												<input type="text" name='POS_VAL_RUB_QUA'value="{POS_VAL_RUB_QUA}" placeholder="Quartier" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$" style="width: 100%">
											</div>
										</div>
										<!-- E-mail & Contact1 & Contact2 -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>E-mail</label>
												  <input type="text" placeholder="E-mail" class="form-control" name='POS_VAL_RUB_MEL' data-parsley-required="true" value="{POS_VAL_RUB_MEL}" data-parsley-pattern="/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/" style="width: 100%" />
											</div>
											<div class="col-sm-4" >
												<label>Contact 1</label>
							  					<input type="text" name='POS_VAL_RUB_TPH' value="{POS_VAL_RUB_TPH}" placeholder="Contact 1" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" style="width: 100%" />
											</div>
											<div class="col-sm-4" >
												<label>Contact 2</label>
												<input type="text" name='POS_VAL_RUB_TPM' value="{POS_VAL_RUB_TPM}" placeholder="Contact 2" class="form-control" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" style="width: 100%" />
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Situation Matrimoniale</label>
												<select id='id_rub_SIF' name='POS_VAL_RUB_SIF' class="form-control" rows="1" data-parsley-required="true">
													<option value="0" disabled="disabled">Veuillez selectionner</option>
													<option value=""></option>
													<option value="MARIE(E)">MARI&Eacute;(E)</option>
													<option value="CELIBATAIRE" selected>C&Eacute;LIBATAIRE</option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_SIF' id='POS_VAL_CTRL_SIF' value='{POS_VAL_RUB_SIF}'>
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label>Nombre d&#146;enfant</label>
												<input type="text" name='POS_VAL_RUB_NEF' value="{POS_VAL_RUB_NEF}" placeholder="Nombre d&#146;enfant" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?"  style="width: 100%"/>
											</div>
										</div>
										<label for="bio" style="margin: -1.5% 0%;">En cas d&#146;urgence</label>
										<div class="form-group row">
											<div class="col-sm-4" style="margin: 0% 0%">
												<input type="text" name='POS_VAL_RUB_PAC' value="{POS_VAL_RUB_PAC}" placeholder="Nom &amp; Pr&eacute;noms" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup"style="width: 100%" />
											</div>
											<div class="col-sm-4" style="margin: 0% 0%">
												<input type="text" name='POS_VAL_RUB_NTC' value="{POS_VAL_RUB_NTC}" placeholder="Contact" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup"  data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" style="width: 100%">
											</div>
											<div class="col-sm-4" style="margin: 0% 0%">
												<input type="text" name='POS_VAL_RUB_FLN' value="{POS_VAL_RUB_FLN}" placeholder="Filiation" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z]*$" data-parsley-trigger="keyup" class="form-control" style="width: 100%">
											</div>
										</div>
									</div>
								</div>
								<!-- 12_ 2 infos -->
								<div class="col-sm-6" style="margin-top: 21px">
									<div class="col1_partie text-center">
										<span class="title text-while">INFORMATIONS NGSER</span>
									</div>
									<div class="col2_partie" style="padding-top: 1%;">
										<!-- Type de contrat & durée contrat -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: 0%">
												<label>Type de contrat</label>
												<select id='id_rub_TYE' name='POS_VAL_RUB_TYE' class="form-control" rows="1"  data-parsley-required="true">
														<option value="0" disabled="disabled">Veuillez selectionner</option>
														<option value=""></option>
														<option value="CONSULTANT">CONSULTANT</option>
														<option value="CONTRAT A DUREE DETERMINEE">CONTRAT A DUR&Eacute;E D&Eacute;TERMIN&Eacute;</option>
														<option value="CONTRAT A DUREE INDETERMINEE">CONTRAT A DUR&Eacute;E IND&Eacute;TERMIN&Eacute;</option>
														<option value="STAGIAIRE">STAGIAIRE</option>
													</select>
												<input type="hidden" name='POS_VAL_CTRL_TYE' id='POS_VAL_CTRL_TYE' value='{POS_VAL_RUB_TYE}'>
											</div>
											<div class="col-sm-6" style="margin-left: -2.5%">
												<label>Dur&eacute;e de contrat</label>
												<input type="text" name='POS_VAL_RUB_DUR' value="{POS_VAL_RUB_DUR}" placeholder="Dur&eacute;e de contrat" class="form-control" data-parsley-trigger="keyup"  data-parsley-pattern="[0-9][0-9]?" style="width: 100%" />
											</div>
										</div>
										<!-- departement & service -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: 0%">
												<label>D&eacute;partement</label>
												 	<select id="depart" name='POS_VAL_RUB_DPT' class="form-control" rows="1" data-parsley-required="true" >
														<option value="" >Selectionner</option>
													</select>
												<input type="hidden" class="departement" name='POS_VAL_CTRL_DPT' id='POS_VAL_CTRL_DPT' value='{POS_VAL_RUB_DPT}'>
											</div>
											<div class="col-sm-6" style="margin-left: -2.5%">
												<label>Service</label>
												<select id="service" name='POS_VAL_RUB_SER' class="form-control" rows="1" data-parsley-required="true" >
													<option value="" >Selectionner</option>
												</select>
												<input type="hidden"  name='POS_VAL_CTRL_SER' id='POS_VAL_CTRL_SER' value='{POS_VAL_RUB_SER}'>
											</div>
										</div>
										<!-- manager -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: 0%">
												<label>Nom manager</label>
							  					 <input type="text"  name='POS_VAL_RUB_NMG'value="{POS_VAL_RUB_NMG}" placeholder="Nom Manager" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
											<div class="col-sm-6" style="margin-left: -2.5%">
												<label>Pr&eacute;noms  manager</label>
							 					  <input type="text" name='POS_VAL_RUB_PMG' value="{POS_VAL_RUB_PMG}" placeholder="Prenom Manager" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%"/>
											</div>
										</div>
										<!-- Poste & matricule -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: 0%">
												<label>Poste</label>
												<input type="text" name='POS_VAL_RUB_FON' value="{POS_VAL_RUB_FON}" placeholder="Poste" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
											<div class="col-sm-6" style="margin-left: -2.5%">
												<label>Matricule</label>
												<input type="text" name='POS_VAL_RUB_MAT' value="{POS_VAL_RUB_MAT}" placeholder="Matricule" class="form-control" data-parsley-pattern="^[A-Z0-9]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
										</div>
										<!-- Cartegorie & Avantage -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: 0%">
												<label>Cat&eacute;gorie</label>
												<input type="text" name='POS_VAL_RUB_CAT'value="{POS_VAL_RUB_CAT}" placeholder="Cat&eacute;gorie" class="form-control" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
											<div class="col-sm-6" style="margin-left: -2.5%">
												<label>Avantage</label>
												<input type="text" name='POS_VAL_RUB_AVT' value="{POS_VAL_RUB_AVT}" placeholder="Avantage" class="form-control" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
										</div>
									</div>
								</div>
										<!--  -->
								<div class="col-sm-6" style="margin-top: 21px">
									<div class="col1_partie text-center">
										<span class="title text-while">INFORMATIONS BANQUE</span>
									</div>
									<div class="col2_partie" style="padding-top: 13%;padding-bottom: 13%;">
										<!-- Salaire Net -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%">
												<label>Salaire Net</label>
												<input type="text" name='POS_VAL_RUB_SLT'value="{POS_VAL_RUB_SLT}" placeholder="Salaire Net" class="form-control" data-parsley-required="true" data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
										</div>
										<!-- Banque -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%">
												<label>Banque</label>
												<input type="text" name='POS_VAL_RUB_BQE' value="{POS_VAL_RUB_BQE}" placeholder="Banque" class="form-control"  data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
										</div>
										<!-- RIB -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%">
												<label>RIB</label>
												<input type="text" name='POS_VAL_RUB_RIB' value="{POS_VAL_RUB_RIB}" placeholder="RIB" class="form-control" data-parsley-pattern="^[A-Z0-9]*$" data-parsley-trigger="keyup" style="width: 100%" />
											</div>
										</div>
										<!-- N&ordm; CNPS -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%">
												<label>N&ordm; CNPS</label>
												<input type="text" name='POS_VAL_RUB_CNP' value="{POS_VAL_RUB_CNP}" placeholder="N&ordm; CNPS" class="form-control" data-parsley-pattern="^[0-9]*$" data-parsley-maxlength="12" data-parsley-trigger="keyup" style="width: 100%"  />
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
			   tabs2
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
									<input type="text" name='POS_VAL_RUB_NUD' id="numposeidon" value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">

								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
							
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" id="bio" rows="5" name='POS_VAL_RUB_HIS' style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
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
								  <textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_AVU' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
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
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
    
             <!-- requete de la mise en oeuvre d'une requete ajax-->
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/departement/phppromise.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/prspdf/pdfdemo.js"></script>
	<!-- endjquery  -->
	
	 <script>

			if($('.get_mode').val()=='CONSULTATION'){
					$('.btn').hide();
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

            var selectCivilite=$.trim($('.selectCivilite').val());
		
		   if(selectCivilite=="MME"){
				$(".epoux").show();
		   }else{
				$(".epoux").hide();
		   }
		 
		   $(".civilite" ).on( "change", function() {
			   var civilite=$(this).val();
			   if(civilite=="MME"){
					$(".epoux").show();
				}else{
					$(".epoux").hide();
				}
			});
		 	if($('.civilite option').filter(function(){ return $(this).val()==selectCivilite; }).length){
				// found value
			  	var theValue = $('.civilite').val();
        	  	$('option[value='+selectCivilite+']').attr('selected',true);
		    }

         

		});


			
		    
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
			$('#formperso').parsley();
		 		 //affichage en fonction du MODE sur le Formulaire 

				  
		 
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
    
    
  $('.datedeb, .timedeb').on('blur change input',function(){
  
        var date1=$('.datedeb').val();
        var time1=$('.timedeb').val();
        timestpdeb=new Date(date1+' '+time1);
        
        tamp1=timestpdeb.getTime()/1000;
        
        //convert date time into  timestamp
        // $('.res0').text("Adding hours : "+date1 +"<br/>") ;
		 $('.datedeblettre').val(timeConverter(tamp1)) ;
         
  });
	
   $('.dureedebselect').on('change blur',function(){
	   $('.dureedeb').val( $(this).val());
	});

  $('.dureedebselect,.duree , .datedeb, .timedeb').on('change blur',function(){
        
          dureeheure=$('.dureedeb').val() ;
          dureesec=$('.duree').val();
        
        var caldureesec= (dureesec*1)*24*60*60;
        
        
        var caldureeheure=(dureeheure*1)*60*60 ;
        
        
        var sommesec=(caldureesec*1)+(caldureeheure*1)
        
        var Tsommesec=new Date(sommesec);
        
        tamp2=Tsommesec.getTime();
	  
         
        
        
        
       console.log('tamp2 '+ dureeheure );
        
        
        //Calcul le nombre de weekend
			 var formattedDateStart = new Date( $('.datedeb').val()); //date de debut
			 var d = formattedDateStart.getDate();
			 var m =  formattedDateStart.getMonth();
			 m += 1;  // JavaScript months are 0-11
			 var y = formattedDateStart.getFullYear();
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
      
      
       var TweeksCntsec=new Date(weeksCnt*48*60*60);
        
        tamp3=TweeksCntsec.getTime();
     
      
		 
		 //Fin Calcul le nombre de weekend
        
         
        //date de retour final
        //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
		$('.res6').val(timeConverter(tamp1+tamp2) ) ;
	  
	  //console.log(tamp1+'- '+tamp2+' - '+tamp3 );
        
        
   });
		
		 $('.dureedebselect').on('change blur',function(){
				 //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
				 $('.res6').val(timeConverter(tamp1+tamp2) ) ;
	          }); 
	</script>
	
</html>


