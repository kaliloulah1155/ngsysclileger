<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation fiche de paye</title>
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
	<!--ABASS INCLUDE-->
	
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
			padding-left: 27px;
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
		
		.jumbotron{
			font-size: 15px;
			width: 30%;
			border: 1px solid #4a67b3;
			padding: 10px;
		}

		.ui-datepicker-calendar {
	        display: none;
	    }
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_pay' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='PAY'/>
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
							
							<div class="row">
								<div class="col-sm-12">
									<div class="col1_partie text-center">
										<span class="title text-while">GENERALITE</span>
									</div>
									<div class="col2_partie">
										<div class="row">
											<div class="col-sm-6" style="margin-top: 13px">
												<label>Nom & pr&#233;mons :</label>
												<select name="category" class="form-control selectNom" style="width: 100%;">
												    <option value="0">Veuillez s&#233;lectionner</option>
												</select>
											</div>
											<div class="col-sm-6" style="margin-top: 13px">
												<label for="bio">Mois & Ann&#233;e :</label>
													<input type="text" placeholder="MM/AAAA" class="form-control datefin" style="width: 100%;" required="true">
										</div>
									</div>
								</div>
							</div>

							<div class="row" style="margin-top: 1%">
								<div class="col-sm-12 deuxieme_col" style="margin-top: 2%;">
									<div class="col1_partie text-center">
										<span class="title text-while">SPECIFIQUE</span>
									</div>
									<div class="col2_partie">
										<div class="row">

											<div class="col-sm-4 sursalaire" style="margin-top: 13px;display: none;">
												<label>Sursalaire :</label>
												<input type="number" min="0" class="form-control" placeholder="0" style="width: 100%">
											</div> 

											<div class="col-sm-4 transportImpos" style="margin-top: 13px;display: none;">
												<label>Transport imposable :</label>
												<input type="number" min="0" class="form-control" placeholder="0" style="width: 100%">
											</div>

											<div class="col-sm-4 rendement" style="margin-top: 13px;display: none;">
												<label>Rendement :</label>
												<input type="number" min="0" class="form-control" placeholder="0" style="width: 100%">
											</div>

											<div class="col-sm-4 representation" style="margin-top: 13px;display: none;">
												<label>Representation :</label>
												<input type="number" min="0" class="form-control" placeholder="0" style="width: 100%">
											</div>

											<div class="col-sm-4 assurances" style="margin-top: 13px;display: none;">
												<label>Assurance :</label>
												<input type="number" min="0" class="form-control" placeholder="0" style="width: 100%">
											</div>

											<div class="col-sm-4 avances" style="margin-top: 13px;display: none;">
												<label>Avance :</label>
												<input type="number" min="0" class="form-control" placeholder="0" style="width: 100%">
											</div>


											<div class="col-sm-4 autres" style="margin-top: 13px;display: none;">
												<label>Autres :</label>
												<input type="number" min="0" class="form-control" placeholder="0" style="width: 100%">
											</div>

											<!-- Les champs soit grisé ou masqué -->
											<div class="col-sm-4 pret" style="margin-top: 13px;display: none;">
												<label>Pr&#234;t :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 level" style="margin-top: 13px;display: none;">
												<label>Level :</label>
												<input type="text" class="form-control" placeholder="Level" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 entreprise" style="margin-top: 13px;display: none;">
												<label>Entreprise :</label>
												<input type="text" class="form-control" placeholder="Entreprise" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 is" style="margin-top: 13px;display: none;">
												<label>IS :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 cn" style="margin-top: 13px;display: none;">
												<label>CN :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 igr" style="margin-top: 13px;display: none;">
												<label>IGR :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 cnps" style="margin-top: 13px">
												<label>CNPS :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 ancinnete" style="margin-top: 13px;display: none;">
												<label>Ancinnet&#233; :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 astreinte" style="margin-top: 13px;display: none;">
												<label>Astreinte :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 heureSup" style="margin-top: 13px;display: none;">
												<label>Heure suplementaire :</label> 
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 transport" style="margin-top: 13px;display: none;">
												<label>Transport :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 salaireBase" style="margin-top: 13px;display: none;">
												<label>Salaire de base :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 salaireBrute" style="margin-top: 13px;display: none;">
												<label>Salaire brute imposable :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 salaireNet" style="margin-top: 13px;display: none;">
												<label>Salaire net :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 salaireNetPaye" style="margin-top: 13px;display: none;">
												<label>Salaire net pay&#233; :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 honoraireNet" style="margin-top: 13px;display: none;">
												<label>Honoraire net :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
											</div>

											<div class="col-sm-4 honoraireNetPaye" style="margin-top: 13px;display: none;">
												<label>Honoraire net pay&#233; :</label>
												<input type="number" min="0" class="form-control" placeholder="0" disabled="true" style="width: 100%">
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
					<div class="col-sm-12" style="margin-bottom: 2%;">
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
						<div class="col2_partie text-center" style="padding-top: 1%">
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
								  <textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%"></textarea>
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

	$(document).ready(function(){

		// select2 
        $('.selectNom').select2({
            theme:'bootstrap4',
            tags:true,
            allowClear: true
        });

        //initialisation du calendrier datepicker
				$.datepicker.regional['fr'] = {
			
					

		          $('.datefin').datepicker({
					changeMonth: true,
		            changeYear: true,
		            showButtonPanel: true,
					monthNames: ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'D&#233;cembre'],
					monthNamesShort: ['Janv.', 'F&#233;vr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'D&#233;c.'],
					dateFormat: 'MM yy',
					onClose: function(dateText, inst) { 
			            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
			            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
			            $(this).datepicker('setDate', new Date(year, month, 1));
			        },

			      
				});

            $.datepicker.setDefaults($.datepicker.regional['fr']);

        $('.deuxieme_col,.sursalaire,.transportImpos,.rendement,.representation,.assurances,.avances,.autres,.pret,.level,.entreprise,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye,.honoraireNet,.honoraireNetPaye').css('display','none');
        $("select#selectStatus").change(function(){
	        var status = $(this).children("option:selected").val();

	        if(status == "SALAIRE STAGIAIRE"){
	        	$('.deuxieme_col,.avances,.level,.salaireNet,.salaireNetPaye').css('display', 'block');
	        	$('.sursalaire,.transportImpos,.rendement,.representation,.assurances,.autres,.pret,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.entreprise,.honoraireNet,.honoraireNetPaye').css('display', 'none');
	        }

	        if(status == "SALAIRE CONSULTANT"){
	        	$('.deuxieme_col,.assurances,.avances,.autres,.pret,.entreprise,.honoraireNet,.honoraireNetPaye').css('display', 'block');
	        	$('.sursalaire,.transportImpos,.rendement,.representation,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye').css('display', 'none');
	        }

	        if(status == "SALAIRE EMPLOYE"){
	        	$('.deuxieme_col,.sursalaire,.transportImpos,.rendement,.representation,.assurances,.avances,.autres,.pret,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye').css('display', 'block');
	        	$('.avances,.level,.entreprise,.honoraireNet,.honoraireNetPaye').css('display', 'none');
	        }

	    });

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
   
	</script>
	
</html>


