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
	<style>
		.col1_partie{
			width: 100%;
			height: 7vh; 
			font-family: 'Times New Roman';
			font-size: 16px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			padding-top: 9px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col2_partie{
			width:100%;
			height: 95vh; 
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding-left: 27px;
			padding-top: 5px;
		}
		
		.btn{
			width: 12%;
			height: 6vh;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
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
		
		/* media query */
		@media (min-width: 576px) { 
			.col2_partie{
				height: 112vh; 
			}
			
			.btn{
				font-size: 12px;
			}
		}

		@media (min-width: 992px) { 
			.col2_partie{
				height: 113vh; 
			}
		}

		@media (min-width: 1200px) {  
			.col2_partie{
				height: 117vh; 
			}
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_abs' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
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

				<!--<div style="z-index:0;">
						{TITRE_BOUTONS} 
					</div> -->
        </div>
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_ABS_MyDMD&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">OBJECT DE LA DEMANDE</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
						<div class="form-group">
						   <label for="selection">Type de demande</label>
						    <select id="selection" class="form-control" style="width: 90%">
								<option value="">Veillez s&eacute;lectiooner le type</option>
								<option value="">Bapt&egrave;me enfant</option>
							    <option value="">Cong&eacute;s annuel</option>
							    <option value="">Cong&eacute;s de maternit&eacute;</option>
							    <option value="">Cong&eacute;s de paternit&eacute;</option>
							    <option value="">D&eacute;c&egrave;s d'un beau parent du travailleur</option>
							    <option value="">D&eacute;c&egrave;s Enfants/P&egrave;re/M&egrave;re du travailleur</option>
							    <option value="">D&eacute;c&egrave;s Fr&egrave;re/Soeur du travailleur</option>
							    <option value="">D&eacute;c&egrave;s conjoint(e) du travailleur</option>
							    <option value="">D&eacute;menagement</option>
							    <option value="">Mariage du travailleur</option>
							    <option value="">Mariage enfant du travailleur</option>
							    <option value="">Repos exceptionnel</option>
							    <option value="">Repos maladie</option>


						    </select>
						</div>
						<div class="form-group">
						   <label for="bio">Motif :</label>
						   <textarea class="form-control" id="bio" rows="1" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <label for="bio">Interimaire :</label>
						   <textarea class="form-control" id="bio" rows="1" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <label for="bio">Dossier en cours :</label>
						   <textarea class="form-control" id="bio" rows="2" style="width: 90%;resize: none"></textarea>
						</div>
						<label for="bio">Date de d&eacute;part :</label>
						<div class="row">
							<div class="col-sm-5">
							  <input type="date" class="form-control">
							</div>
							<div class="col-sm-4" style="margin-left: -7.3%;">
							  <input type="time" class="form-control">
							</div>
						</div>
						<label for="bio">Dur&eacute;e :</label>
						<div class="row">
							<div class="col-sm-5">
							  <input type="type" class="form-control" placeholder="Nombre de jours">
							</div>
							<div class="col-sm-4" style="margin-left: -5.5%;">
							  <select id="selection" class="form-control" style="width: 90%">
								<option value="1">Heure</option>
								<option value="2">0</option>
								<option value="2">1</option>
							    <option value="3">2</option>
							    <option value="4">3</option>
							    <option value="1">4</option>
								<option value="2">5</option>
							    <option value="3">6</option>
							    <option value="4">7</option>
							 </select>
							</div>
						</div>
						<label for="bio">Date de retour :</label>
						<div class="row">
							<div class="col-sm-8">
							  <input type="type" class="form-control">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">APPROBATION HIERARCHIE</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
						<div class="form-group">
						   <label for="selection">Avis Manager</label>
						    <select id="selection" class="form-control" style="width: 90%">
								<option value="">Statut de la demande</option>
								<option value="">Demande accept&eacute;e</option>
							    <option value="">Demande refus&eacute;e</option>
						    </select>
						</div>
						<div class="form-group">
						   <label for="bio">Commentaires :</label>
						   <textarea class="form-control" id="bio" rows="2" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <label for="selection">Avis RH</label>
						    <select id="selection" class="form-control" style="width: 90%">
								<option value="">Statut de la demande</option>
								<option value="">Demande accept&eacute;e</option>
							    <option value="">Demande refus&eacute;e</option>
						    </select>
						</div>
						<div class="form-group">
						   <label for="bio">Commentaires :</label>
						   <textarea class="form-control" id="bio" rows="2" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <label for="selection">Avis Direction</label>
						    <select id="selection" class="form-control" style="width: 90%">
								<option value="">Statut de la demande</option>
								<option value="">Demande accept&eacute;e</option>
							    <option value="">Demande refus&eacute;e</option>
						    </select>
						</div>
						<div class="form-group">
						   <label for="bio">Commentaires :</label>
						   <textarea class="form-control" id="bio" rows="2" style="width: 90%;resize: none"></textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<div type="submit" class="btn col-sm-2" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">FERMER</div>
				<div type="resset" class="btn col-sm-2" style="font-size: 12px;" style="margin-left: 5%;">ENREGISTRER</div>
			</div>  
		</nav>
			
	</form>
</body>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<!-- END JQUERY  -->
	 <script>
		 
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
  hour1 = hour > 9 ? hour : '0' + hour;
  min1 = min > 9 ? min : '0' + min;
  sec1 = sec > 9 ? sec : '0' + sec;
  var time = date + ' ' + month + ' ' + year + ' \u00E0 ' + hour1 + ':' + min1 + ':' + sec1 ;
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