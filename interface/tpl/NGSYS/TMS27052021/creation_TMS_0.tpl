<!DOCTYPE html>
<html lang="fr">
<head>   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timesheet</title>
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET'/>
	<!-- -->
	 <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
 	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/action_accueil.js'></script>
	<style>

		.col_list{
			width: 22%;
			float: right;
		}
		
		.col_list_02{
			position: absolute;
			font-size: 11px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			z-index: 999;
		}
		
		.Affi_calendor{
			position: absolute;
			margin-top: 4%;
			margin-left: 33%;
			list-style: none;
			z-index: 1;
			opacity: 0;
			transform-origin: top left;
			transform: scale(0);
			transition: all 750ms;
		}
		.Affi_calendor.open{
			opacity: 1;
			transform: scale(1);
		}
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
		}
		
		td,input{
			 text-align: center;
			 border-top: 2px solid;
			 border-left: 2px solid; 
			 font-size: 12px; 
			 font-weight: lighter; 
		}

		/*td:first-child{
			 border-top-left-radius: 3px;
			 border-bottom-left-radius: 3px;
			 border-top-right-radius: 3px;
			 border-bottom-right-radius: 3px;
		}*/
		.button_plus{
			font-size: 11px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			margin-top: 3px;
		}

		.res { display:none; background-color:#000; color:white}
	</style>
</head>
<body class='tpl_creation tpl_creation_tms' onLoad='initTplCreation(); 'style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();'>
	
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='TMS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
     
				<input type='hidden' class='userinfo' value="{NOM_UTILISATEUR}">    
				<input type='hidden' class='user_profil' value="{PROFIL_UTILISATEUR}">

				
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
		<!--<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_TMS_MyDMD&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>-->

		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/liste/liste_TMS_0.tpl">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		<div class="text-center" style="font-weight: 1;color: #023b7c;font-size: 19px;margin-top: 5%">
			<div class="h4" style="text-transform: uppercase;">
				<span>TIMESHEET</span>
			</div>
			<div class="h6" style="text-transform: uppercase;">
				<span>SEMAINE: <span class="tacheweek"> 00</span>, 
				<span class="datecheck">Jeudi 26 Novembre 2020</span>
				<input class="form-control datechck" type="hidden"/>
			</div>
			<div class="contenu_calendor" style="margin-top: 1.5%;margin-left: -9%">
				<span class="col_list_02 btn">Changer la date</span>
			</div>
			<div class="Affi_calendor text-center"></div>
		</div>

		<nav class="container-fluid">
			<div class="col-sm-12" style="margin-top: 5%;">
				<!--debut table  -->
				<table class="test" id="table_tache" style="width: 100%;text-align: center; margin-top: 2%;">
					 <thead>
						<tr>
							<td style="width: 20px;border:1px solid transparent;">
								<span style="width: 100%;"></span>
							</td>
							<td style="width: 150px;height: 7vh;border:none;background: #4a67b3;border-top-left-radius: 5px; border-bottom-left-radius: 5px;">
								<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Activit&#233;s</span>
							</td>
							<td style="width: 300px;height: 7vh;border:none;background: #4a67b3">
								<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Taches</span>
							</td>
							<td style="width: 80px;height: 7vh;border:none;background: #4a67b3">
								<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Heure d&#233but</span>
							</td>
							<td style="width: 80px;height: 7vh;border:none;background: #4a67b3">
								<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Heure fin</span>
							</td>
							<td style="width: 80px;height: 7vh;border:none;background: #4a67b3">
								<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Dur&#233;e</span>
							</td>
							<td style="width: 80px;height: 7vh;border:none;background: #4a67b3">
								<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">Taux en %</span>
							</td>
							<td style="width: 80px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px; border-bottom-right-radius: 5px;">
								<span style="width: 105%;font-size: 12px; color: #fff;font-weight: 1;padding: 5px">R&#233;sultat</span>
							</td>
						</tr>
					 </thead>

					<tbody class="tableL">
						<tr>
						    <!--bouton plus-->
							<td style="width: 20px;border:none;">
								<!-- <span class="button_plus addRow" style="width: 100%;"><i class="fa fa-plus"></i></span> -->
							</td>
							 <!--fin bouton plus-->
							<td style="width: 150px;border:none;">
 								  <textarea type="text" name="activite[]" style="width: 100%;resize: none" class="form-control activite" rows="1"></textarea>
							</td>
							<td style="width: 300px;border:none;">
								<textarea type="text" name="tache[]" style="width: 100%; resize: none" rows="1" class="form-control tache"></textarea>
							</td>
							<td style="width: 80px;border:none;">
								<input type="time" name="heurein[]" style="width: 100%;" class="form-control heurein">
							</td>
							<td style="width: 80px;border:none;">
								<input type="time"  name="heureout[]" style="width: 100%;" class="form-control heureout">
							</td>
							<td style="width: 80px;border:none;">
								<input type="text" name="duree[]" style="width: 100%;" class="form-control duree">
							</td>
							<td style="width: 80px;border:none;">
								<input type="number" style="width: 100%;" class="form-control resultat"  id="resultat">
							</td>
							<td style="width: 80px;border:none;">
								<input type="text" name="resultat[]" style="width: 100%;" class="form-control resultat"  id="resultat">
							</td>
						</tr>
					</tbody>
				</table>
			<!--fin table  -->

				<!--resultat apres retour des données  -->
				<span class="res"></span>
				<div class="col-sm">
					<span class="button_plus addRow btn" style="float: right;font-size: 11px">Ajouter une ligne</i></span>
				</div>
				 
				<div class="form-group row" style="margin-top: 6%">
					<div class="col-sm-8">
						<label></label>
					</div>
					<div class="col-sm-2" style="font-size: 12px">
						<label>Dur&#233;e totale</label>
						<input class="form-control dureetotale"  name="POS_VAL_RUB_DJ1" value="{POS_VAL_RUB_DJ1}"  id="dureetotale" placeholder="Dur&#233;e totale">
					</div>
					<div class="col-sm-2" style="font-size: 12px">
						<label>Taux journalier (%)</label>
						<input class="form-control tauxjournaliere"  name="POS_VAL_RUB_TAC" value="{POS_VAL_RUB_TAC}" id="bio" placeholder="Taux journalier">
					</div>
				</div>
			</div>

			
			<!-- button -->
			<div class="col_btn w-100 text-white" style="padding-left: 6%">
				<input type="button" class="btn col-sm-2 delete btn_delete" value="SUPRIMER" style="font-size: 12px;margin-left: 30%">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 6%">
				<input class="btn col-sm-2 btn_reg" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div> 
		</nav>	
	</form>
	
	<script type="text/javascript">

 
	/*Debut Timesheet*/

	 

	       //Debut ajouter de ligne a la table
			 $(".addRow").click(function() {
				    
				 var $dataRows =$('.tableL');
				 var tr=$dataRows.parent().parent();
				  if(tr.find('.duree').val()==""){
					  alert("Veuillez bien renseigner les informations") ;
				  }else{
					 addRow();
				  }
					   
							
            });

			 function  addRow(){ 
				  var ligne ='<tr>'+
							 '<td style="width: 20px;border:none;">'+
							      '<input name="select" type="checkbox" style="width: 80%;font-size: 12px;margin-left: -1%;">'+
							'</td>'+
							'<td style="width: 150px;border:none;">'+
 								'<input type="text" name="activite[]" style="width: 100%;" class="form-control activite">'+
							'</td>'+
							'<td style="width: 300px;border:none;">'+
								'<textarea type="text" name="tache[]" style="width: 100%; resize: none" rows="1" class="form-control tache"></textarea>'+
							'</td>'+
							'<td style="width: 80px;border:none;">'+
								'<input type="time" name="heurein[]" style="width: 100%;" rows="1" class="form-control heurein">'+
							'</td>'+
							'<td style="width: 80px;border:none;">'+
								'<input type="time"  name="heureout[]" style="width: 100%;" rows="1" class="form-control heureout">'+
							'</td>'+
							'<td style="width: 80px;border:none;">'+
								'<input type="text" name="duree[]" style="width: 100%;" class="form-control duree">'+
							'</td>'+
							'<td style="width: 80px;border:none;">'+
								'<input type="text" style="width: 100%;" class="form-control resultat"  id="resultat">'+
							'</td>'+
							'<td style="width: 80px;border:none;">'+
								'<input type="text" name="resultat[]" style="width: 100%;" class="form-control resultat"  id="resultat">'+
							'</td>'+
						'</tr>';
                  $('.tableL').append(ligne);
				 
			 }
			//Fin ajouter de ligne a la table

			//Debut supprimer de ligne a la table
            $(".delete").click(function() {
				
                $("table.test").find('input[name="select"]').each(function() {
                    if ($(this).is(":checked")) {
						
					 

                        $(this).parents("table.test tr").remove();
                    }
                });

				findTotalDuree();
				findTotalDay();
            });
			//Fin supprimer de ligne a la table


			 function findTotalDuree(){

				 var tot=0;
				 var $dataRows =$('.tableL');
				 var tr=$dataRows.parent().parent();
				 tr.find('.duree').each(function (i) {
						time = $(this).val().split(":");
						if(time.length !==1){
							var minutes =  parseInt((time[0])*60,10) + parseInt((time[1]),10) ;
						tot += parseInt(minutes);
						}
				} );

				var hours = Math.floor(tot / 60);          
				var minutes = tot % 60;
					 
				heures1 = hours > 9 ? hours : '0'+hours;
				minutes1 = minutes > 9 ? minutes : '0' + minutes;

				document.getElementById('dureetotale').value = heures1+':'+minutes1  ;

			 }

			 function findTotalDay(){
				  var tot=0;
				   var $dataRows =$('.tableL');
				   var tr=$dataRows.parent().parent();

				   tr.find('.taux').each(function (i) {
					    Tjours = $(this).val().split(":") ;
						var jrs =parseInt( Tjours[0],10 ) ;
						tot +=isNaN(jrs) ? 0 : jrs;
					});

					var table = document.getElementById('table_tache');
					var rowCount = ((table.rows.length)*1)-1;
					var count=0;

					tr.find('.resultat').each(function (i,e) {
						if($.trim($(this).val())==""){
						}else{
							++count;
						};
					});

					//console.log(count+' -- '+tot +' -- '+ tot/count );

					 var totj= tot/count;
					$('.tauxjournaliere').val(isNaN(totj) ? "0" : totj.toFixed(0) );


			 }



			$('.tableL').delegate('.heurein,.heureout','change',function(){

				var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();

				var timeStart = new Date("01/01/2010 " + inphdeb);
				var timeEnd = new Date("01/01/2010 " + inphfin);
                 
				if(timeStart <= timeEnd){
					 
				

						var difference = timeEnd - timeStart;
						var diff_result = new Date(difference);

						var hourDiff = diff_result.getHours();
						var minuteDiff = diff_result.getMinutes();

						hourDiff1 = hourDiff > 9 ? hourDiff : '0'+hourDiff;
						minuteDiff1 = minuteDiff > 9 ? minuteDiff : '0' + minuteDiff;

						var countDuree=(isNaN(hourDiff1) ? '00' : hourDiff1)+':'+(isNaN(minuteDiff1) ? '00' : minuteDiff1) ;

						tr.find('.duree').val(countDuree);

						findTotalDuree();
				} 
				
						 
     		});

			 //total accomplishment

			 $('.tableL').delegate('.taux','change',function(){

				 var tr=$(this).parent().parent();
          		 var choice=tr.find('.taux').val()*1;


                  tr.find('.resultat').val(" ");
				  
				 
				 if(choice==0){
							  tr.find('.resultat').val(" ");
				 }else{
						switch(true) {
						case choice <= 20: 
								//0-20
								tr.find('.resultat').val("INSUFFISANT");
							break;
						case choice >20 && choice <= 50: 
								//21-50
							tr.find('.resultat').val("MOYEN");
							break;
						case choice >50 && choice <= 70: 
								//51-70
							tr.find('.resultat').val("ASSEZ-BON");
							break;
						case choice >70 && choice <= 100: 
								//71-100
							tr.find('.resultat').val("EXCELLENT");
							break;

						}			 	 
				};
				  

				  findTotalDay();

			 });



			 //Fin total accomplishment




	/*Fin Timesheet*/

		//initialisation du calendrier datepicker
		$.datepicker.regional['fr'] = {
			closeText: 'Fermer',
			prevText: 'Précédent',
			nextText: 'Suivant',
			currentText: 'Aujourd\'hui',
			monthNames: ['Janvier', 'F&eacute;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao&ucirc;t', 'Septembre', 'Octobre', 'Novembre', 'D&eacute;cembre'],
			monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
			dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
			dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
			dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
			weekHeader: 'Sem.',
			dateFormat: 'yy-mm-dd'
		};
		
		$.datepicker.setDefaults($.datepicker.regional['fr']);
		const event = new Date();
		const options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
		$('.datecheck').text(event.toLocaleDateString('fr-FR', options));
		$('.tacheweek').text(getWeek(event.toLocaleDateString('fr-FR', options))); 

		$('.datechck').val(event.toLocaleDateString('fr-FR', options));
		
		//fin initialisation du calendrier datepicker
		
		
		$(document).ready(function() {
			// Affi_calendor
			$('.contenu_calendor').on('click', function(){
				$('.toggle').toggleClass('open');
				$('.Affi_calendor').toggleClass('open');
				//$('.contenu_calendor').toggleClass('open');
			});
			///calcul date et semaine
			var userLang = navigator.language || navigator.userLanguage;
			   var options = $.extend({

					onSelect: function() {
					var selected = $(this).val();
					//debut traitement lecture date timesheet
					datepickdeb = new Date(selected.slice(0,10));

					
					
					let dateLocale = datepickdeb.toLocaleString('fr-FR', {
					   weekday: 'long',
					   year: 'numeric',
					   month: 'long',
					   day: 'numeric',
					   hour: 'numeric',
					   minute: 'numeric',
					   second: 'numeric',
					});
					 

					var dateform= (dateLocale.split(' ')[0] + ' ' + dateLocale.split(' ')[1] + ' ' + dateLocale.split(' ')[2] + ' ' + dateLocale.split(' ')[3]).replace(',','');
					$('.datecheck').text(dateform);
					$('.datechck').val(dateform);
					$('.tacheweek').text(getWeek(datepickdeb)); 
					//fin traitement 

						testdatecheck();

						//pour la recherche 
						$(".getmydate").val(dateform);
					 
						 

					} 
					
				});
			   $(".Affi_calendor").datepicker(options);
			
		});  
		
		function getWeek(date) {
		  if (!(date instanceof Date)) date = new Date();

			// ISO week date weeks start on Monday, so correct the day number
			var nDay = (date.getDay() + 6) % 7;
			// ISO 8601 states that week 1 is the week with the first Thursday of that year
			// Set the target date to the Thursday in the target week
			date.setDate(date.getDate() - nDay + 3);
			// Store the millisecond value of the target date
			var n1stThursday = date.valueOf();
			// Set the target to the first Thursday of the year
			// First, set the target to January 1st
			date.setMonth(0, 1);
			// Not a Thursday? Correct the date to the next Thursday
			if (date.getDay() !== 4) {
				date.setMonth(0, 1 + ((4 - date.getDay()) + 7) % 7);
			}
			// The week number is the number of weeks between the first Thursday of the year
			// and the Thursday in the target week (604800000 = 7 * 24 * 3600 * 1000)
			return 1 + Math.ceil((n1stThursday - date) / 604800000);
		}
	</script>

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/requestAjax/tmsjs.js"></script>
<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TMS/mysearch/controlprsdpt.js"></script>

</body>
</html>