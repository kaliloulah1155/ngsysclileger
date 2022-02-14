<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation salaire mensuel</title>
     <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET' />
	<link rel="stylesheet" type="text/css" href="../../../../include/data_tableau/styles/jquery.dataTables.min.css">

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

		.jumbotron{
			font-size: 15px;
			width: 30%;
			border: 1px solid #4a67b3;
			padding: 10px;
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
			.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

		.ui-datepicker-calendar {
	        display: none;
	  }
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_tai' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formtypmission" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='TAI'/>
		<input type='hidden' name='MODE' value='{MODE}'>
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

							<div class="card mb-1" >
					        <div class="card-header">
					            <div class="row">
									<div class="col-sm-4">
										<label></label>
									</div>
									<div class="col-sm-6 jumbotron text-center">
										<span>Salaire du mois de  <br> <strong class="lib_mois">mars 2018</strong></span>
									</div>
								</div>
					        </div>
   
					        <div class="card-body">
					        	<div class="row" style="margin-bottom: 3%">
					        		<div class="col-sm-3" style="margin-top: 13px;">
										<label>Type de contrat :</label>
										<select class="form-control select contrat" name='POS_VAL_RUB_C2' style="width: 100%;">
											<option>Veuillez s&#233;lectionner</option>
											<option value="Stage-ecole">Stage-&#233;cole</option>
											<option value="Stage professionnel">Stage professionnel</option>
											<option value="CDD avec essai">CDD avec essai</option>
											<option value="CDD lie au projet">CDD li&#233; au projet</option>
											<option value="CDD standard">CDD standard</option>
											<option value="CDI avec essai">CDI avec essai</option>
											<option value="CDI standard">CDI standard</option>
											<option value="Consultant interne">Consultant interne</option>
											<option value="Consultant externe">Consultant externe</option>
										</select>
									<input type="hidden"  class="interselectcontrat" name='POS_VAL_CTRL_C2' id='POS_VAL_CTRL_C2' value='{POS_VAL_RUB_C2}' required="true">

									</div>
									<div class="col-sm-3" style="margin-top: 13px;">
										<label for="bio">Mois & Ann&#233;e :</label>
										<input type="text" name='POS_VAL_RUB_A1' value="{POS_VAL_RUB_A1}" placeholder="MM/AAAA" class="form-control datefin1" style="width: 100%;" required="true">
										<input type="hidden"  name='POS_VAL_RUB_DAE' value="{POS_VAL_RUB_DAE}" class="date_edit" />
									</div>

									<div class="col-sm-1" style="margin-top: 17px;">
										<label for="bio" style="visibility: hidden;">Recherche</label>
										<button class="btn bg-primary edit_btn" title="Faire des recherches sur le champ date"><i class="fa fa-search"></i></button>
									</div>


									<div class="col-sm-3" style="margin-top: 13px;">
										<label for="bio" style="visibility: hidden;">Type d'impression:</label>
							            <select class="form-control choice">
							            	<option value="">Veuillez s&#233;lectionner</option>
							                <option value="Xls">Xls</option>
							                <option value="Xlsx">Xlsx</option>
							                <option value="Csv">Csv</option>
											<option value="Pdf">Pdf</option>
							            </select>
							        </div>
							        <div class="col-sm-1" style="margin-top: 13px;">
							        	<label for="bio"></label>
							            <button class="btn btn_format" title="cliquez pour exporter vos documents en format s&#233;lectionner" >Exporter</button>
							        </div>
								</div>
					        </div>
					    </div>

					    <!-- table -->
						<div class="row">
								<!-- SALARIE -->
								<div class="col-sm-12" id="salarie" style="display:none">
									<div class="Salaire">
										<table id="min-data" class="table table_1">

											<thead class="table-sm text-white" style="background: #4a67b3;">
												<tr>
													<th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">MATRICULE</th>
													<th>ENTREPRISE</th>
													<th>NOM & PR&#201;NOMS</th>
													<th>SALARIE NET</th>
													<th>ASSURANCE</th>
													<th>SALARIE NET PAY&#201;</th>
													<th>RIB</th>
													<th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">BANQUE</th>
												</tr>
											</thead>
											<tbody class="tr_salarie">
												
											</tbody>
										</table>
									</div>
								</div>

								<!-- CONSULTANT -->
								<div class="col-sm-12" id="consultant" style="display:none">
									<!--  -->
									<div class="consultant">
										<table id="min-data2" class="table_2">
											<thead class="table-sm text-white" style="background: #4a67b3;">
												<tr>
													<th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">MATRICULE</th>
													<th>ENTREPRISE</th>
													<th>NOM & PR&#201;NOMS</th>
													<th>HONORAIRE NET</th>
													<th>ASSURANCE</th>
													<th>HONORAIRE NET PAY&#201;</th>
													<th>RIB</th>
													<th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">BANQUE</th>
												</tr>
											</thead>
											<tbody  class="tr_consultant">
												
											</tbody>
										</table>
									</div>
								</div>

								<!-- STAGIAIRE -->
								<div class="col-sm-12" id="stagiaire" style="display:none">
									<!--  -->
									<div class="consultant">
										<table id="min-data3" class="table_3">
											<thead class="table-sm text-white" style="background: #4a67b3;">
											<tr>
													<th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">MATRICULE</th>
													<th>ENTREPRISE</th>
													<th>NOM & PR&#201;NOMS</th>
													<th>SALARIE NET</th>
													<th>ASSURANCE</th>
													<th>SALARIE NET PAY&#201;</th>
													<th>RIB</th>
													<th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">BANQUE</th>
												</tr>
											</thead>
											<tbody  class="tr_stagiaire">
											
											</tbody>
										</table>
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
									<input type="text"  name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}"  placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" name='POS_VAL_RUB_HIS'  id="bio" rows="5" style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
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
								  <textarea  class="form-control" name='POS_VAL_RUB_AVU' id="bio"  rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
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
			<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
			<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
			<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
	 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
		    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
			<script type='text/javascript' src='../../../../include/data_tableau/scripts/jquery.dataTables.min.js'></script>
    			<script type='text/javascript' src='../../../../include/script/data_tables/datatable_language.js'></script>
	<!-- endjquery  -->


	<script type="text/javascript">

	var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
		$('.bouton_sub').hide();	
			}

			  //-------number format 
    Number.prototype.formatMoney=function(decPlaces,thouSeparator,decSeparator){
      var n=this,
        decPlaces=isNaN(decPlaces=Math.abs(decPlaces))?2 : decPlaces,
        decSeparator=decSeparator ==undefined ? ".":decSeparator,
        thouSeparator=thouSeparator ==undefined ? ".":thouSeparator,
        sign=n<0 ? "_":"",
        i=parseInt(n=Math.abs(+n ||0).toFixed(decPlaces))+"",
        j=(j=i.length)>3 ? j%3 :0;

        return sign+(j ? i.substr(0,j)+thouSeparator : "")
        +i.substr(j).replace(/(\d{3})(?=\d)/g,"$1"+thouSeparator)
        +(decPlaces ? decSeparator+Math.abs(n-i).toFixed(decPlaces).slice(2):"");
    };
    //------ fin number format


		// alert('Ok');
			$(document).ready(function(){

					//initialisation du calendrier datepicker
							$.datepicker.regional['fr'] = {
			
				},
				
			$('.datefin1').datepicker({
				changeMonth: true,
				changeYear: true,
			 	showButtonPanel: true,
				monthNames: ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao\u00fbt', 'Septembre', 'Octobre', 'Novembre', 'D\u00e9cembre'],
				monthNamesShort: ['Janv.', 'F&#233;vr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'D&#233;c.'],
				dateFormat: 'MM yy',
				closeText: "OK",
				currentText: "Aujourd'hui",
				onClose: function(dateText, inst) { 
					var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
					var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();

					//console.log(` in : mois : ${mois} , year : ${year}`);
					$(this).datepicker('setDate', new Date(year, month, 1));
				},
				onSelect: function() {
				 
					var tab_date= ($(this).val()).split(' ');
				    var mois= tab_date[0];  // mois
				    var year= tab_date[1]; // année 

					var map_date = new Map();
					map_date.set('Janvier', '01'); 
					map_date.set('Fevrier', '02');
					map_date.set('Mars', '03'); 
					map_date.set('Avril', '04');
					map_date.set('Mai', '05');
					map_date.set('Juin', '06'); 
					map_date.set('Juillet', '07'); 
					map_date.set('Ao\u00fbt', '08'); 
					map_date.set('Septembre', '09');
					map_date.set('Octobre', '10'); 
					map_date.set('Novembre', '11');
					map_date.set('D\u00e9cembre', '12'); 
					
					//var dt_edit=`01/${map_date.get(mois)}/${year}`;
					//console.log(`01/${map_date.get(mois)}/${year}`);
					
				}
			});
			$.datepicker.setDefaults($.datepicker.regional['fr']);
				    // Fin calendrier


					// Affichage de tableau selon le type choisit !!!!!!!!!!!!!
					$('#salarie,#consultant,#stagiaire').hide();
	       		    $('.btn_entgs').prop("readonly",true);

	         

				// Le bouton de formatage de d'impresion
        	//$('.btn_format').prop("disabled",true);
        	$("select.format").change(function(){
				   		var frms = $(this).children("option:selected").val();

				 		if (frms == "Xls") {$('.btn_format').prop("disabled",false);}
				 		if (frms == "Xlsx") {$('.btn_format').prop("disabled",false);}
				 		if (frms == "Csv") {$('.btn_format').prop("disabled",false);}
				 	});

			});

	</script>

	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TAI/traitement/edit_tai.js"></script>
	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TAI/print/pdf.js"></script>
	
</html>


