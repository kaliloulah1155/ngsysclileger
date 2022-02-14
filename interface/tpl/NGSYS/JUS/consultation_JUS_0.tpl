<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation justificative</title>

	<link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET' />
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/association.js'></script> 
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/vocabulaire.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/fermeture.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/saisie.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/calendrier.js'></script>
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/attente_fichier.js'></script>
	<!-- Masqueur des readonly-->
	  <script type='text/javascript' src='/{NOM_APPLICATION}/include/script/recupcontrolsaisie.js'></script> 
	<!-- Masqueur des readonly-->
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
			padding: 10px;
		}
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
			padding-left: 27px;
			padding-top: 5px;
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
<body  class='tpl_consultation tpl_consultation_jus' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formJUS" ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='JUS'/>
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
						<li class="active b1" ><a role="button" class=" btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						 
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
									<span class="title"  style="color: #fff" >PIECES JOINTES</span>
								</div>
								<div class="col2_partie text-center" style="padding-top: 5%. padding-bottom: 0;">
									<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
									name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
								</div>

							</div>
						</div>

						<div class="col1_partie text-center" style="margin-top: 2%">
							<span class="title" style="color: #fff">RECAPITULATIF</span>
						</div>
						<div class="col2_partie">
							<div class="row">
							<div class="col-sm-6">
								<label for="selection">Type de demande</label>
							   	<select class="form-control typeDemande" style="width: 100%" name='POS_VAL_RUB_AUN' id='id_rub_AUN'>
									<option disabled='true' selected='true'>S&eacute;lectionner votre demande</option>
									<option value="ABSENCE">Absence</option>
									<option value="CONGE DE MATERNITE">Cong&eacute; de maternit&eacute;</option>
									<option value="CONGE DE PARTENITE">Cong&eacute; de paternit&eacute;</option>
									<option value="DECES DUN BEAU-PERE OU DUNE BELLE-MERE">D&eacute;c&egrave;s d'un beau-p&egrave;re ou d'une belle-m&egrave;re</option>
									<option value="DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR">D&eacute;c&egrave;s d'un enfant, du p&egrave;re, de la m&egrave;re du travailleur</option>
									<option value="DECES DUN FRERE OU DUNE SOEUR">D&eacute;c&egrave;s d'un fr&egrave;re ou d'une soeur</option>
									<option value="DECES DU CONJOINT">D&eacute;c&egrave;s du conjoint</option>
									<option value="DEMENAGEMENT">D&eacute;m&eacute;nagement</option>
									<option value="MARIAGE DU TRAVAILLEUR">Mariage du travailleur</option>
									<option value="MARIAGE DUN DE SES ENFANTS, DUN FRERE, DUNE SOEUR">Mariage d'un de ses enfants, d'un fr&egrave;re, d'une s&oelig;ur</option>
									<option value="NAISSANCE DUN ENFANT">Naissance d'un enfant</option>
									<option value="PERMISSION EXCEPTIONNELLE">Permission exceptionnelle</option>
									<option value="REPOS MALADIE">Repos maladie</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_AUN' id='POS_VAL_CTRL_AUN' value='{POS_VAL_RUB_AUN}'>

							</div>
							<div class="col-sm-6">
								<label for="bio">Date de d&eacute;part :</label>
								<input type="text" class="form-control datedeb" name="POS_VAL_RUB_DT4"  id="d1" required="true"  value="{POS_VAL_RUB_DT4}" style="width: 100%">
							</div>
						</div>
						<div class="row" style="margin-top: 2%">
							<div class="col-sm-6">
								<label for="bio">Motif :</label>
								<textarea  name='POS_VAL_RUB_COM'class="form-control" id="motif"  data-parsley-required="true" data-parsley-trigger="keyup" rows="2"  style="width: 100%;resize: none">{POS_VAL_RUB_COM} </textarea>
							</div>
							<div class="col-sm-6">
								<label for="bio">Heure de d&eacute;part :</label>
								<input type="time" class="form-control timedeb" name="POS_VAL_RUB_HRD" data-theme="a" data-clear-btn="true"  id="t1" value="{POS_VAL_RUB_HRD}" style="width: 100%">
							</div>
						</div>
						<div class="row" style="margin-top: 2%">
							<div class="col-sm-3">
								<label for="bio">Dur&eacute;e (en jour)</label>
								<input type="number" class="form-control duree" placeholder="Nombre de jours" min="0" name='POS_VAL_RUB_NBR' data-parsley-required="true" data-parsley-trigger="keyup"  value="{POS_VAL_RUB_NBR}"  id="d1" style="width: 100%">
							</div>
							<div class="col-sm-3">
								<label for="bio">Dur&eacute;e (en heure)</label>

								<label for="bio" style="visibility: hidden;">Heures</label>
								<input type="number" class="form-control dureedebselect"   min="0" max="7" placeholder="Nombre d'heure" style="width: 100%" >
								<input type="hidden" class="dureedeb" name='POS_VAL_RUB_HRA' value='{POS_VAL_RUB_HRA}'>							
							</div>
							<div class="col-sm-6">
								<label for="bio">Date de retour :</label>
								<input type="type" class="form-control res6" readonly="true"  name='POS_VAL_RUB_DRU'  value="{POS_VAL_RUB_DRU}" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 100%">
								<input type="hidden" class="datefin" name='POS_VAL_RUB_DFI'  value='{POS_VAL_RUB_DFI}'>
							</div>
						</div>
						
					</nav>
				</div>
		   </div>
		   <!-- traitement -->
			 
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
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
	  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/compteur/compt.js"></script>
	<!-- imporation du fichier de desactivation des champs -->
		<script src="../../../../disable_fields.js"></script>
	 <script>

	var prof_util = "{PROFIL_UTILISATEUR}";	
			if (prof_util=="RH") {

				if($('.get_mode').val()=='CONSULTATION' || $('.bouton_sub').val()=="{LIBELLE_ACTION_HERMES}" ){

					$('.btn').hide();
					
					jQuery("input[type='text']").prop("disabled", true);
									jQuery("input[type='number']").prop("disabled", true);
									jQuery("input[type='time']").prop("disabled", true);
									jQuery("select").prop("disabled", true);
									jQuery("input[type='email']").prop("disabled", true);
									jQuery("textarea").prop("disabled", true);


				}

			} else{
				if($('.get_mode').val()=='CONSULTATION'){

					$('.btn').hide();
					
					jQuery("input[type='text']").prop("disabled", true);
									jQuery("input[type='number']").prop("disabled", true);
									jQuery("input[type='time']").prop("disabled", true);
									jQuery("select").prop("disabled", true);
									jQuery("input[type='email']").prop("disabled", true);
									jQuery("textarea").prop("disabled", true);


				}


			}


	  	$(document).ready(function () {
		   $('.typeDemande').val($('#POS_VAL_CTRL_AUN').val());

			 $('#d1').datepicker({
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
				dateFormat: 'yy-mm-dd',
				maxDate: 0,
			});
		});

	   
		 //affichage en fonction du MODE sur le Formulaire 
		 
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
	

$('.dureedebselect').val( $('.dureedeb').val()); //vue de modification 
 $('.dureedebselect').on('change keyup ',function(){
	   $('.dureedeb').val( $(this).val());
});

  	$('.dureedebselect,.duree , .timedeb').on('change keyup ',function(){

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
		 
	  
	   
	});
	  //console.log(tamp1+'- '+tamp2+' - '+tamp3 );

	  
        
        
   
		
		 $('.dureedebselect').on('change blur',function(){
				 //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
				 $('.res6').val(timeConverter(tamp1+tamp2) ) ;
	          }); 


	$('.typeDemande').on('change',function(){
            $('#motif').val('');
			var selectDemande=$.trim($(this).val());
			 


	//Debut Durée en fonction du choix
			$('.duree').val('');
			$('.timedeb').val(':');
			$('.res6').val('');
			$('.datedeb').val('JJ/MM/AA');
		switch (selectDemande) {
			case "ABSENCE" : 
				$('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('.duree').prop('readonly',false);
				//$('#motif').prop("readonly",false);
				break;
			
			
			case "DECES DU CONJOINT":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES DU CONJOINT");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN FRERE OU DUNE SOEUR":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES D'UN FRERE OU D'UNE SOEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN BEAU PERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE");
				//$('#motif').prop("readonly",true);
				break;
		default:

		 $('.dureedebselect').prop('readonly',false); 
    	 $('.timedeb').prop('readonly',false); 
    	 $('.datedeb').prop('readonly',false); //date de depart
    	 $('.duree').prop('readonly',false);
			// $('.duree').prop('disabled',false);
			$('.duree').val('');
			$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
		}
	});
	// fonctionnement de la selection du nombre de jour du type ABSENCE
	

	</script>

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/JUS/notification.js"></script>
	
</html>


