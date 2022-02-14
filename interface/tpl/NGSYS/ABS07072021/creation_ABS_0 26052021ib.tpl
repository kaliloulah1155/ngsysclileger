<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demande d'absence</title>
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
	<link href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	
	 <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" />
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet" />
	<style>

		.col_list{
			width: 22%;
			float: right;
			/*margin-right: 3%;*/
		}

		.col1_partie{
			width: 100%;
			/*height: 7vh; */
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
	</style>
</head>
<body  class='tpl_creation tpl_creation_abs' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formabsence" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; padding-top: 1%;">
			    
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='ABS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

					<input type='hidden' class='appName' value="{NOM_APPLICATION}">
			       
				<!--<div style="z-index:0;">
						{TITRE_BOUTONS} 
					</div> -->
			       
					 <!-- données de l'utilisateur connecté -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					 <!--fin données de l'utilisateur connecté -->
        </div>
		
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_ABS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>
		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 2%">
				<div class="col-sm-12 mt-5" style="margin-top: 1%;">
					<div class="col1_partie text-center">
						<span class="title text-while">OBJET DE LA DEMANDE</span>
					</div>
					<div class="col2_partie container-fluid" style="padding-top: 2%; padding-bottom: 1%">
						<div class="row">
							<div class="col-sm-6">
								<label for="selection">Type de demande</label>
							   	<select class="form-control typeDemande" style="width: 100%" name='POS_VAL_RUB_AUN' id='id_rub_AUN' >
										<option value="" disabled selected>S&eacute;lectionner votre demande</option>
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
									<input type="hidden" name='POS_VAL_CTRL_AUN' id='POS_VAL_CTRL_AUN' data-parsley-required="true" data-parsley-trigger="keyup" value='{POS_VAL_RUB_AUN}'>
							</div>
							<div class="col-sm-6">
								<label for="bio">Date de d&eacute;part :</label>
								<input type="text" class="form-control datedeb" name="POS_VAL_RUB_DT4"  id="d1" data-parsley-required="true" style="width: 100%; text-transform: uppercase;" data-parsley-trigger="keyup" value="{POS_VAL_RUB_DT4}">
							</div>
						</div>

						<div class="row" style="margin-top: 2%">
							<div class="col-sm-6">
								<label for="bio">Motif :</label>
								<textarea  name='POS_VAL_RUB_COM'class="form-control" id="motif"  style="width: 100%;resize: none"  rows="2" data-parsley-required="true" data-parsley-trigger="keyup">{POS_VAL_RUB_COM}</textarea>
							</div>
							<div class="col-sm-6">
								<label for="bio">Heure de d&eacute;part :</label>
								<input type="time" class="form-control timedeb" placeholder="Heure de d&eacute;part" name="POS_VAL_RUB_HRD" data-theme="a" data-clear-btn="true" id="t1" data-parsley-required="true" data-parsley-trigger="keyup" value="{POS_VAL_RUB_HRD}">
							</div>
						</div>

						<div class="row" style="margin-top: 2%">
							<div class="col-sm-6">
								<label for="bio">Interimaire :</label>
								 <select id="interimaire" style="width: 90%" name='POS_VAL_RUB_INT' class="form-control select2 personnel" rows="1" data-parsley-required="true" >
								     <option value="" >Selectionner</option>
								</select>      
								<input type="hidden" name='POS_VAL_CTRL_INT' id='POS_VAL_CTRL_INT' value='{POS_VAL_RUB_INT}'>
							</div>
							<div class="col-sm-3">
								<label for="bio">Dur&eacute;e :</label>
								<input type="number" class="form-control duree" min="0" placeholder="Nombre de jours" name='POS_VAL_RUB_NBR'  data-parsley-required="true" data-parsley-pattern="[0-9][0-9]?" data-parsley-trigger="keyup" value="{POS_VAL_RUB_NBR}"  id="d1">
							</div>
							<div class="col-sm-3" style="margin-top: 2.5%">
								<label for="bio"></label>
								<input type="number" class="form-control dureedebselect"   min="0" max="7" placeholder="Nombre d'heure"    >
								<input type="hidden" class="dureedeb" name='POS_VAL_RUB_HRA' value='{POS_VAL_RUB_HRA}'>
							</div>
						</div>

						<div class="row" style="margin-top: 2%">
							<div class="col-sm-6">
								<label for="bio">Dossier en cours :</label>
						   		<input type="text"  name='POS_VAL_RUB_DOS' class="form-control" value="{POS_VAL_RUB_DOS}" id="bio" placeholder="Dossier en cours" style="width: 100%;" data-parsley-required="true" data-parsley-trigger="keyup">
							</div>
							<div class="col-sm-6">
								<label for="bio">Date de retour :</label>
								<input type="type" class="form-control res6" readonly="true"  name='POS_VAL_RUB_DRU' value="{POS_VAL_RUB_DRU}">

							   <input type="hidden" class="datefin" name='POS_VAL_RUB_DFI'  value='{POS_VAL_RUB_DFI}'>
							</div>
						</div>

						<!-- Debut traitement annee-increment absence -->
		<input type="text"  name='POS_VAL_RUB_ANN' value="{POS_VAL_RUB_ANN}" class="annee" placeholder="annee"  />
		<input type="text" name='POS_VAL_RUB_J1' value="{POS_VAL_RUB_J1}" class="increment" placeholder="increment"  />

		<input type="text" name='POS_VAL_RUB_CRE' value="{POS_VAL_RUB_CRE}" class="createur" placeholder="createur"  />
		<script>
				//return  year 
			 var d = new Date();
 			 var n = d.getFullYear();
 			 document.getElementsByClassName('annee')[0].value=n;
		</script>



					</div>
				</div>
			</div>  


			<!-- ETD etat type -->
		<input type="hidden" placeholder="Etat type" name='POS_VAL_RUB_ETD' value="{POS_VAL_RUB_ETD}"   class="form-control etat_type" style="width: 100%">

		
		<!-- Fin traitement annee-increment absence -->

			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div>  
		</nav>
	</form>
</body>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
		
	<!-- END JQUERY  -->
	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/select2/select2tr.js"></script>

	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/compteur/compt.js"></script>



	 <script>

//var increment=$('.increment').val();

//alert(increment);
//  Bind the event handler to the "submit" JavaScript event
/*$('form').submit(function () {

     
    // Check if empty of not
    if (name === '') {
        alert('Text-field is empty.');
        return false;
    }
});
*/

//ETD etat type 
var prof_util = "{PROFIL_UTILISATEUR}";
var str = prof_util;
var profil_util = str.substring(0, 7);

if( profil_util=="MANAGER"){
    $(".etat_type").val("MANAGER");
}else{
    $(".etat_type").val("EMPLOYE");
}

//  FIN ETD etat type 

	 var nom=$('.nom').val();
	var prenom=$('.prenom').val();
	var fonction=$('.fonction').val();
	var departement=$('.departement').val();

	  $('.viewnom').val(nom);
	  $('.viewprenom').val(prenom);
	  $('.viewfonction').val(fonction);
	  $('.viewdepartement').val(departement);
	 //fin données de l'utilisateur connecté

      $(document).ready(function () {
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
				minDate: 0,
			});
		});
	 

	$('#formabsence').parsley();
		var prof_util = "{PROFIL_UTILISATEUR}";	 
	
		/*switch (prof_util) {
			case "ADMIN" :
				 
				$('.mydmdabs').hide();
				
				break;
			case "RH":
				
				$('.mydmdabs').hide();
				
				break;
		default:
			$('.mydmdabs').show();
		
		}*/
		
		
		$('.dureedebselect').on('change',function(){
			//console.log($(this).val());
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
		
		$('.dureedebselect').on('change',function(){
				 //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
				 $('.res6').val(timeConverter(tamp1+tamp2) ) ;
	          }); 




 
if( $('.typeDemande').val() !=null ){

    }else{ 
    	
    	$('.dureedebselect').prop('disabled',true); 
    	$('.timedeb').prop('disabled',true); 
    	$('.datedeb').prop('disabled',true); //date de depart
    	$('.duree').prop('disabled',true);

    }



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
				$('.dureedebselect').prop('disabled',false);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',false);
				$('.duree').val(1);
				$('#motif').prop("readonly",false);
				break;
			case "MARIAGE DU TRAVAILLEUR" :
			    $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(4);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "MARIAGE D'UN DE SES ENFANTS, D'UN FRERE, D'UNE SOEUR":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "DECES DU CONJOINT":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(5);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(5);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "DECES D'UN FRERE OU D'UNE SOEUR":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE":
			 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "NAISSANCE D'UN ENFANT":
				 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(2);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "BAPTEME D'UN ENFANT":
				 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(1);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "PREMIERE COMMUNION":
			     $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart
				 $('.duree').prop('disabled',true);
				$('.duree').val(1);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
			case "DEMENAGEMENT":
				 $('.dureedebselect').prop('disabled',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('disabled',false); //heure depart
    	 		$('.datedeb').prop('disabled',false); //date de depart

				 $('.duree').prop('disabled',true);
				$('.duree').val(1);
				$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
				break;
		default:

		 $('.dureedebselect').prop('disabled',false); 
    	 $('.timedeb').prop('disabled',false); 
    	 $('.datedeb').prop('disabled',false); //date de depart
    	 $('.duree').prop('disabled',false);
			// $('.duree').prop('disabled',false);
			$('.duree').val('');
			$('#motif').val(selectDemande);
				$('#motif').prop("readonly",true);
		}
});

//Fin Durée en fonction du choix 
 
 // fonctionnement de la selection du nombre de jour du type ABSENCE
 $('.duree').on('keyup',function(){

	var selectDuree=$.trim($(this).val());
	var selectAbsence=$.trim($('.typeDemande').val());
	var selectDemande=$.trim($('#motif').val());
//console.log(selectDuree);
		if(selectDuree>1){
			if(selectAbsence=='ABSENCE'){
				if ( confirm( "La duree de votre demande est superieur \u00e0 1 jour. Nous allons ajouter sur votre cong\u00e9  annuel." ) ) {
					$('.typeDemande').val('CONGE ANNUEL');
					$('#motif').val($('.typeDemande').val()).prop('readonly',true);
					//$('#motif').val($('.typeDemande').val());
				}
				 else {
	    				$('.duree').val(1);
				}	

		  }


		}
	


});
	//fin du traitement		 
	</script>
	
</html>