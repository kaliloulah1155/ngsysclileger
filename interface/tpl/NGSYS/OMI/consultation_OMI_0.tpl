<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation ordre de mission</title>
	
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

		<!--<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>-->
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
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

		
	</style>

	 
</head>
<body  class='tpl_consultation tpl_consultation_omi' onLoad='initTplConsultation();{GRISE_CHAMP};'  onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formordre_de_mission" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='OMI'/>
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
										<span class="title text-while">LOCALITE</span>
									</div>
									<div class="col2_partie" style="padding: 5%;">
											<!-- destination & projet-->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Destination</label>
												<input type="text" id="bio" class="form-control" name='POS_VAL_RUB_DTN' value="{POS_VAL_RUB_DTN}" data-parsley-trigger="keyup" >
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Projet</label>
												<input id="bio" type="text" class="form-control" data-parsley-trigger="keyup" value="{POS_VAL_RUB_LPR}" >
											</div>
										</div>
										<!-- Motif du projet -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">Motif du projet</label>
												<textarea type="type" name="POS_VAL_RUB_MTF" class="form-control" id="bio" rows="2" style="width: 100%;resize: none" name="POS_VAL_RUB_MTF" data-parsley-trigger="keyup">{POS_VAL_RUB_MTF}</textarea>
											</div>
										</div>
										<!-- date début & fin -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Date d&#233;but</label>
												<input type="text" id="date1" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_DAA" value="{POS_VAL_RUB_DAA}">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Date fin</label>
												<input type="text" id="#date2" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}">
											</div>
										</div>
										<!-- heure départ & d'arrivée & durée -->
										<div class="row">
											<div class="col-sm-4 form-group">
												<label for="bio">Heure d&#233;part</label>
												<input type="time" id="bio" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_HRD" value="{POS_VAL_RUB_HRD}">
											</div>
											<div class="col-sm-4 form-group">
												<label for="bio">Heure d&#146;arriv&#233;e</label>
												<input type="time" id="bio" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_HRA" value="{POS_VAL_RUB_HRA}">

											</div>
											<div class="col-sm-4 form-group">
												<label for="bio">Dur&#233;e</label>
												<input type="text" id="bio" class="form-control" style="width: 100%;" data-parsley-trigger="keyup" name="POS_VAL_RUB_DUR" value="{POS_VAL_RUB_DUR}">
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">VOYAGEUR</span>
									</div>
									<div class="col2_partie" style="padding: 7%;">
										<div class="form-group row">
											<div class="col-sm-6">
												<!-- civilité -->
												<label for="bio">Civilit&eacute;</label>
												<select class="form-control">
													<option value="0">Civilit&eacute;</option>
													<option value="1">Monsieur</option>
													<option value="2">Madame</option>
													<option value="3">Mademoiselle</option>
												</select>
												<!--input  class="form-control" name='POS_VAL_RUB_CVL' id ='POS_VAL_RUB_CVL' value='{POS_VAL_RUB_CVL}'-->
											</div>
										</div>
										<!-- nom  & prenom-->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Nom</label>
												<input type="text" class="form-control" id="bio" value="{POS_VAL_RUB_NOM}" name='POS_VAL_RUB_NOM'  data-parsley-pattern="^[a-zA-Z'_ ]*$"  data-parsley-required="true">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Pr&eacute;nom</label>
												<input type="text" class="form-control" id="bio" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" data-parsley-required="true">

											</div>
										</div>
										<!-- departement & service & fonction -->
										<div class="row">
											<div class="col-sm-4 form-group">
												<label for="bio">D&eacute;partement</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_DPT' size='15' value="{POS_VAL_RUB_DPT}" data-parsley-trigger="keyup">
											</div>
											<div class="col-sm-4 form-group">
												<label for="bio">Service</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_SER' size='15' value="{POS_VAL_RUB_SER}" data-parsley-trigger="keyup" >
											</div>
											<div class="col-sm-4 form-group">
												<label for="bio">Fonction</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_FON' size='15' value="{POS_VAL_RUB_FON}" data-parsley-trigger="keyup" >
											</div>
										</div>
										<!-- moyen de transport -->
										<div class="row">
											<div class="col-sm-8 form-group">
												<label for="bio">Moyen de transport</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_MOT' size='20' value="{POS_VAL_RUB_MOT}" data-parsley-trigger="keyup" >
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
							<div class="col3_partie" style="padding: 5%;">
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


		<!-- jquery  -->
		 
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>

		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
		<script src="../dist/jquery-steps.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
	<!-- endjquery  -->
	
	
	 <script>
	 //affichage en fonction du MODE sur le Formulaire  

	 alert('ok');
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

	   $('#formordre_de_mission').parsley();
	
	$(document).ready(function () {
			 $('#date1, date2).datepicker({
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
		 
  //fonctionnement du Bouton Annuler
		 
		
   
	</script>
	</body>
</html>


