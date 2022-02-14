    <!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Enregistrement justificatif</title>
  <link rel="stylesheet" type="text/css" href="../../../../include/Step/bootstrap-4.0.0/css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="../../../../include/Step/dist/jquery-steps.css">
  <link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script language='javascript' src='/NGSYS/include/script/action_accueil.js'></script>

</head>

<style type="text/css">
	.col_list{
		width: 27%;
		margin-left: 68%;
	}

	.step-app > .step-content { 
	  border: 2px solid #4a67b3;
	  padding: 10px; 
	  height: 100%;
	 }

	.btn{
		width: 12%;
		border: 1px solid #4a67b3;
		text-align: center;
		background: transparent;
		color: #4a67b3;
		margin: 2.5%;
		/*padding: 0.7%;*/
		border-radius: 5px;
	}
	.parsley-error{
		 border-style: solid;
			border-color: red;
	}




</style>

<body class='tpl_creation tpl_creation_prt' onLoad='initTplCreation();'style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formJUS" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
	
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC'  value='JUS'>
				<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->



					 <!-- données de l'utilisateur connecté -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					 <!--fin données de l'utilisateur connecté -->

				<!--<div style="z-index:0;">
						{TITRE_BOUTONS} 
					</div> -->
			</div>
			
		<div class="col_list text-center px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_JUS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');"   >
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>

			<nav class="container-fluid" style="margin-top: 3%">

				<div class="row">
					<div class="col-sm-12 text-center p-1" style="background: #4a67b3;color: #FFF;border-top-right-radius: 6px;border-top-left-radius: 6px;">
						<span class="title text-while">ENREGISTREMENT JUSTIFICATIF</span>
					</div>

					<div class="col-sm-12 pt-2" style="border: 1px solid #4a67b3">
						<div class="row">
							<div class="col-sm-6">
							<label for="selection">Type de demande</label>
							<select class="form-control typeDemande" style="width: 100%" name='POS_VAL_RUB_AUN' id='id_rub_AUN' >
								<option value="" selected>S&eacute;lectionner votre demande</option>
								<option value="ABSENCE">Absence</option>
								<option value="CONGE DE PARTENITE">Cong&eacute; de paternit&eacute;</option>
								<option value="DECES DUN BEAU PERE DU TRAVAILLEUR">D&eacute;c&egrave;s d'un beau p&egrave;re du travailleur</option>
								<option value="DECES DUN ENFANT/ DU PERE/ DE LA MERE DU TRAVAILLEUR">D&eacute;c&egrave;s d'un enfant/p&egrave;re/m&egrave;re du travailleur</option>
								<option value="DECES DUN FRERE OU DUNE SOEUR">D&eacute;c&egrave;s d'un fr&egrave;re/soeur du travailleur</option>
								<option value="DECES DU CONJOINT">D&eacute;c&egrave;s du conjoint</option>
								<option value="REPOS MALADIE">Repos maladie</option>
							</select>
							<input type="hidden" name='POS_VAL_CTRL_AUN' id='POS_VAL_CTRL_AUN' data-parsley-required="true" data-parsley-trigger="keyup" value='{POS_VAL_RUB_AUN}'>
							</div>
							<div class="col-sm-6">
									<label for="bio">Date de d&eacute;part :</label>
								<input type="text" class="form-control datedeb" placeholder="jj/mm/aaaa" name="POS_VAL_RUB_DT4"  id="d1" data-parsley-required="true" style="width: 100%;" data-parsley-trigger="keyup" value="{POS_VAL_RUB_DT4}">
							</div>
						</div>

						<div class="row" style="margin-top: 2%">
							<div class="col-sm-6">
								<label for="bio">Motif :</label>
								<textarea  name='POS_VAL_RUB_COM'class="form-control" id="motif"  readonly="true" style="width: 100%;resize: none" rows="2" data-parsley-required="true" data-parsley-trigger="keyup"> {POS_VAL_RUB_COM}</textarea>
							</div>
							<div class="col-sm-6">
								<label for="bio">Heure de d&eacute;part :</label>
								<input type="time" class="form-control timedeb" placeholder="Heure de d&eacute;part" name="POS_VAL_RUB_HRD" data-theme="a" data-clear-btn="true" id="t1" data-parsley-required="true" data-parsley-trigger="keyup" value="{POS_VAL_RUB_HRD}" style="width: 100%">
							</div>
						</div>
						<div class="row mt-2 mb-3">
							<div class="col-sm-6">
								<div class="row">
									<div class="col-sm-6">
										<label for="bio">Dur&eacute;e (en jour)</label>
										<input type="number" class="form-control duree" min="0" placeholder="Nombre de jours" name='POS_VAL_RUB_NBR'  data-parsley-required="true" data-parsley-pattern="[0-9][0-9]?" data-parsley-trigger="keyup" value="{POS_VAL_RUB_NBR}"  id="d1" style="width: 100%">
									</div>
									<div class="col-sm-6">
										<label for="bio">Dur&eacute;e (en heure)</label>
										<label for="bio" style="visibility: hidden;"> heure</label>
										<input type="number" class="form-control dureedebselect" readonly=true  min="0" max="7" placeholder="Nombre d'heure"    >
										<input type="hidden" class="dureedeb" name='POS_VAL_RUB_HRA' value='{POS_VAL_RUB_HRA}' style="width: 100%">
									</div>
								</div>
							</div>
							<div class="col-sm-6">
								<label for="bio">Date de retour :</label>
								<input type="type" class="form-control res6" readonly="true"  name='POS_VAL_RUB_DRU' value="{POS_VAL_RUB_DRU}" style="width: 100%">
								<input type="hidden" class="datefin" name='POS_VAL_RUB_DFI'  value='{POS_VAL_RUB_DFI}'>
							</div>
						</div>
					</div>
				</div>
				<div class="step-footer text-center">

					<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 6%">
					<input class="btn col-sm-2" type="submit" value="SUIVANT" style="font-size: 12px;">
					<!-- <button class="step-btn btn" type="submit">SUIVANT</button> -->
				</div>
			</nav>
		</form>

  	<script type="text/javascript" src="../../../../include/Step/dist/jquery-latest.js"></script>
	<script type="text/javascript" src="../../../../include/Step/dist/jquery.validate.js"></script>
	<script type="text/javascript" src="../../../../include/Step/dist/jquery-steps.js"></script>
	<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
  <script>
    var frmInfo = $('#frmInfo');
    var frmInfoValidator = frmInfo.validate();

    var frmLogin = $('#frmLogin');
    var frmLoginValidator = frmLogin.validate();

    var frmMobile = $('#frmMobile');
    var frmMobileValidator = frmMobile.validate();

    $('#demo').steps({
      onChange: function (currentIndex, newIndex, stepDirection) {
        return true;
      },
      onFinish: function () {
        alert('Wizard Completed');
      }
    });


	$(document).ready(function () {

			$('.btn_ferme').on('click',function(){
				if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			 $('#d1').datepicker({
				language: "fr",
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
		
		$('.dureedebselect').on('change',function(){
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
				$('#motif').prop("readonly",false);
				break;
			
			
			case "DECES DU CONJOINT":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES DU CONJOINT");
				$('#motif').prop("readonly",true);
				break;
			case "DECES DUN ENFANT/ DU PERE/ DE LA MERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR");
				$('#motif').prop("readonly",true);
				break;
			case "DECES DUN FRERE OU DUNE SOEUR":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES D'UN FRERE OU D'UNE SOEUR");
				$('#motif').prop("readonly",true);
				break;
			case "DECES DUN BEAU PERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('readonly',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				$('#motif').val("DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE");
				$('#motif').prop("readonly",true);
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
</body>
</html>





   
	
		