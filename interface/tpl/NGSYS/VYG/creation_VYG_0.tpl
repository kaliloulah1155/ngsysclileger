<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demande de voyage</title>
	<link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
	<link href="/{NOM_APPLICATION}/include/alert/sweetalert.css" rel="stylesheet">
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
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
			background:transparent
		}

		label{
			font-size: 15px;
			font-weight: 100;
		}

		span.text:after {
		content: "*";
		color: red;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_vyg' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formabsence" ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; padding-top: 1%;">
			    
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='VYG'>
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
			       
					 <!-- donn??es de l'utilisateur connect?? -->
					<input type="hidden" name='POS_VAL_RUB_LIB' class="viewlib"  value="POS_VAL_RUB_LIB"> 
					<input type="hidden" name='POS_VAL_RUB_SEX' class="viewsex"  value="POS_VAL_RUB_SEX">
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonct"  value="POS_VAL_RUB_FON">
					<!-- <input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" > -->
					<!--fin donn??es de l'utilisateur connect?? -->
        </div>
		
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_VYG_np&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
			<!-- <a href="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/liste/liste_ABS_1.php?APPLI={NOM_APPLICATION}&USER={NOM_UTILISATEUR}&PROFIL={PROFIL_UTILISATEUR}">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a> -->
		</div>
		<!-- <input type="hidden" class="loadcode" name="POS_VAL_RUB_COD" value='{POS_VAL_RUB_COD}'> -->



			<!-- <input type="hidden" class="date_creation" name="POS_VAL_RUB_DCR" value='{POS_VAL_RUB_DCR}'> -->
			<input type="hidden" class="createur" name="POS_VAL_RUB_CRE" value='{POS_VAL_RUB_CRE}'>
		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 2%">
				<div class="col-sm-12 mt-5" style="margin-top: 1%;">
					<div class="col1_partie text-center">
						<span class="title text-while">OBJET DE VOYAGE</span>
					</div>
					<div class="col2_partie container-fluid" style="padding-top: 1%; padding-bottom: 1%">
						<div class="row">

							<div class="col-sm-12 text-center" style="margin-bottom: 10px">
								<label>Les champs avec (<span class='text'></span>) sont obligatoires</label>
							</div>

							<div class="col-sm-6">
								<label for="selection">Pays de destination<span class='text'></span></label>
								<select name="POS_VAL_RUB_PAY"  class="form-control selectPas pays" style="width: 100%;" required="true">
								</select>
							   <input type="hidden" class="init_pays" name='POS_VAL_CTRL_PAY' id='POS_VAL_CTRL_PAY' required="true">
							</div>
							<div class="col-sm-6">
								<label for="bio">Photo <span class='text' ></span> :</label>
						   		<input type="text"  name='POS_VAL_RUB_PHT' class="form-control"   id="bio" placeholder="photo" style="width: 100%;" required="true" data-parsley-trigger="keyup">
							</div>
							
						</div>

						<div class="row" style="margin-top: 2%">
							<div class="col-sm-6">
								<label for="bio">Date de d&eacute;part <span class='text' ></span> :</label>
								<input type="text" class="form-control date" name="POS_VAL_RUB_DIN"   required="true" style="width: 100%; text-transform: uppercase;"  value="{POS_VAL_RUB_DIN}">
							</div>
							<div class="col-sm-6">
								<label for="bio"> Date d'arriv?? <span class='text' ></span> :</label>
								<input type="text" class="form-control date" name="POS_VAL_RUB_DF1"  required="true" style="width: 100%; text-transform: uppercase;" data-parsley-trigger="keyup" value="{POS_VAL_RUB_DF1}">
							</div>
						</div>

			

						

						<!-- Debut traitement annee-increment absence -->
			<!-- <input type="hidden"  name='POS_VAL_RUB_ANN' value="{POS_VAL_RUB_ANN}" class="annee" placeholder="annee"  /> -->
			<!-- <input type="hidden" name='POS_VAL_RUB_J1' value="{POS_VAL_RUB_J1}" class="increment" placeholder="increment"  /> -->

		<!-- <textarea   class="form-control avu_text" name='POS_VAL_RUB_AVU'  rows="2" style="width: 90%;resize: none;margin-top: -1%; display:none"></textarea> -->

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
		<!-- <input type="hidden" placeholder="Etat type" name='POS_VAL_RUB_ETD' value="{POS_VAL_RUB_ETD}"   class="form-control etat_type" style="width: 100%"> -->

		
		<!-- Fin traitement annee-increment absence type="submit" id="app" value="ENREGISTRER" -->

			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg " type="submit" id="app" value="ENREGISTRER"  style="font-size: 12px;margin-left: 5%;" />
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
		<script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script>
	<!-- END JQUERY  -->
	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/select2/select2tr.js"></script>

	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/compteur/compt.js"></script>
	  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ABS/absreg/absreg_init.js"></script>
	  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/VYG/packs/packages.js"></script>
	  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/VYG/valideurs/validateur.js"></script>
<script>
	//UUID CODE   ::creation d'un code unique pour chaque document :poste idem ?? ID
     function generateUUID() { // Public Domain/MIT
		    var d = new Date().getTime();//Timestamp
		    var d2 = (performance && performance.now && (performance.now()*1000)) || 0;//Time in microseconds since page-load or 0 if unsupported
		    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		        var r = Math.random() * 16;//random number between 0 and 16
		        if(d > 0){//Use timestamp until depleted
		            r = (d + r)%16 | 0;
		            d = Math.floor(d/16);
		        } else {//Use microseconds since page-load if supported
		            r = (d2 + r)%16 | 0;
		            d2 = Math.floor(d2/16);
		        }
		        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
		    });
		}

	$('.loadcode').val(generateUUID());
 </script>



	 <script>

//permet de faire une action au click du bouton avant l'envoir en base 
/*$('.btn_record').on('click',function(){
	 alert('ok cool');
});*/


//var increment=$('.increment').val();

//alert(increment);
//  Bind the event handler to the "submit" JavaScript event
$('form').submit(function () {


     var increment=$('.increment').val();
    if (increment==10 && $('.typeDemande').val()=='ABSENCE') {
        alert("Le nombre total de vos demandes de type <<Absence>> a atteint 10 pour cette ann\u00e9e. Vous devrez prendre vos absences dans votre <<Cong\u00e9 annuel >>.");
        return false;
    }
});


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
	 //fin donn??es de l'utilisateur connect??

      $(document).ready(function(){

      		//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});


			//script du bouton enregistrer 
	        $('#formabsence').submit(function(event){
				event.preventDefault();

				if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
			        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			          	event.currentTarget.submit();
			        }else{
			    	return false;
			    }
	        });
			
			// Date de teste de la classe voyage
			$('.date').datepicker({
				language: "fr",
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
				dateFormat: 'dd-mm-yy',
				minDate: 0,
			});
		

			$('#d1').datepicker({
				language: "fr",
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
  var months = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','Aout','Septembre','Octobre','Novembre','D\u00e9cembre'];
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

  $('.dureedebselect,.duree , .timedeb').on('change',function(){

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
    	
    	$('.dureedebselect').prop('readonly',true); 
    	$('.timedeb').prop('readonly',true); 
    	$('.datedeb').prop('readonly',true); //date de depart
    	$('.duree').prop('readonly',true);

    }



		$('.typeDemande').on('change',function(){
            $('#motif').val('');
			var selectDemande=$.trim($(this).val());
			 


	//Debut Dur??e en fonction du choix
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
				$('.duree').val(1);
				//$('#motif').prop("readonly",false);
				break;
			case "MARIAGE DU TRAVAILLEUR" :
			    $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(4);
				$('#motif').val("MARIAGE DU TRAVAILLEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "MARIAGE DUN DE SES ENFANTS, DUN FRERE, DUNE SOEUR":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("MARIAGE D'UN DE SES ENFANTS, D'UN FRERE, D'UNE SOEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DU CONJOINT":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(5);
				$('#motif').val("DECES DU CONJOINT");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(5);
				$('#motif').val("DECES D'UN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN FRERE OU DUNE SOEUR":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("DECES D'UN FRERE OU D'UNE SOEUR");
				//$('#motif').prop("readonly",true);
				break;
			case "DECES DUN BEAU-PERE OU DUNE BELLE-MERE":
			 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("DECES D'UN BEAU-PERE OU D'UNE BELLE-MERE");
				//$('#motif').prop("readonly",true);
				break;
			case "NAISSANCE DUN ENFANT":
				 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(2);
				$('#motif').val("NAISSANCE D'UN ENFANT");
				//$('#motif').prop("readonly",true);
				break;
			case "BAPTEME DUN ENFANT":
				 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(1);
				$('#motif').val("BAPTEME D'UN ENFANT");
				//$('#motif').prop("readonly",true);
				break;
			case "PREMIERE COMMUNION":
			     $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart
				 $('.duree').prop('readonly',true);
				$('.duree').val(1);
				$('#motif').val("PREMIERE COMMUNION");
				//$('#motif').prop("readonly",true);
				break;
			case "DEMENAGEMENT":
				 $('.dureedebselect').prop('readonly',true);  //heure pour les 1/2 jours
    	 		$('.timedeb').prop('readonly',false); //heure depart
    	 		$('.datedeb').prop('readonly',false); //date de depart

				 $('.duree').prop('readonly',true);
				$('.duree').val(1);
				$('#motif').val("DEMENAGEMENT");
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
				//$('#motif').prop("readonly",true);
		}
});

//Fin Dur??e en fonction du choix 
 
 // fonctionnement de la selection du nombre de jour du type ABSENCE
	$('.duree').on('keyup',function(){

		var selectDuree=$.trim($(this).val());
		var selectAbsence=$.trim($('.typeDemande').val());
		var selectDemande=$.trim($('#motif').val());
	//console.log(selectDuree);
			if(selectDuree>1){

				if(selectAbsence=='ABSENCE'){


					//$('#motif').val($('.typeDemande').val()).prop('disabled',true);
					if ( confirm( "La duree de votre demande est superieur \u00e0 1 jour. Nous allons ajouter sur votre cong\u00e9  annuel." ) ) {
						$('.typeDemande').val('CONGE ANNUEL');
						$('#motif').val($('.typeDemande').val()).prop('readonly',true);
					}
					else {
		    				$('.duree').val(1);
					}	

			}


			}
		


	});

	$("select.personnel").change(function(){
        typ_dmds = $(this).children("option:selected").val();
		// alert(typ_dmds);
	});
     

     //Recuperation du mail de l'interimaire
	$('.personnel').change(function() {
     		p_interimaire = $(this).find(':selected').data('interim');
            $('.interim').val(p_interimaire);

     
	});


	// $("select.typeDemande").change(function(){
    //         var typ_dmds = $(this).children("option:selected").val();
    //         var Global_dmd;
    //         // alert("Vous avez s??lectionn?? le langage : " + langage);
    //         switch (typ_dmds) {
	// 			case 'ABSENCE':
	// 				Global_dmd = "d'absence.";
	// 				break;
	// 			case 'BAPTEME DUN ENFANT':
	// 				Global_dmd = " de bapt??me d'un enfant.";
	// 				break;
	// 			case 'CONGE ANNUEL':
	// 				Global_dmd = ' de cong?? annuel.';
	// 				break;
	// 			case 'CONGE DE MATERNITE':
	// 				Global_dmd = 'de cong?? de maternit??.';
	// 				break;
	// 			case 'CONGE DE PATERNITE':
	// 				Global_dmd = 'de cong?? de paternit??.';
	// 				break;
	// 			case 'CONGE DE PATERNITE':
	// 				Global_dmd = 'de cong?? de paternit??.';
	// 				break;
	// 			case 'DECES DUN BEAU-PERE OU DUNE BELLE-MERE':
	// 				Global_dmd = "de dec??s d'un beau-p??re ou d'une belle-m??re";
	// 				break;
	// 			case 'DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR':
	// 				Global_dmd = "de dec??s d'un enfant, du p??re, de la m??re du travailleur.";
	// 				break;
	// 			case 'DECES DUN ENFANT, DU PERE, DE LA MERE DU TRAVAILLEUR':
	// 				Global_dmd = "de dec??s d'un enfant, du p??re, de la m??re du travailleur.";
	// 				break;
	// 			case 'DECES DUN FRERE OU DUNE SOEUR':
	// 				Global_dmd = "de dec??s d'un fr??re ou d'une soeur.";
	// 				break;
	// 			case 'DECES DU CONJOINT':
	// 				Global_dmd = "de dec??s du conjoint.";
	// 				break;
	// 			case 'DEMENAGEMENT':
	// 				Global_dmd = "de d??m??nagement.";
	// 				break;
	// 			case 'MARIAGE DU TRAVAILLEUR':
	// 				Global_dmd = "de mariage du travalleur.";
	// 				break;
	// 			case 'MARIAGE DUN DE SES ENFANTS, DUN FRERE, DUNE SOEUR':
	// 				Global_dmd = "de mariage d'un de ses enfants, d'un fr??rave;re, d'une soeur.";
	// 				break;
	// 			case 'NAISSANCE DUN ENFANT':
	// 				Global_dmd = "de naissance d'enfant.";
	// 				break;
	// 			case 'PREMIERE COMMUNION':
	// 				Global_dmd = "de pr??mi??re communion.";
	// 				break;
	// 			case 'PERMISSION EXCEPTIONNELLE':
	// 				Global_dmd = "de permission exceptionnelle.";
	// 				break;
	// 			case 'REPOS MALADIE':
	// 				Global_dmd = "de repos maladie.";
	// 				break;

	// 			default:
	// 			Global_dmd = 'D??soler ...';
    //         }
    //         // alert(Global_dmd);
    //     });
  
	</script>
	
</html>