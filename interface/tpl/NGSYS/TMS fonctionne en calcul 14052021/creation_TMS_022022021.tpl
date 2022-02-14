<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Timesheet</title>
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET'/>
	<!-- -->
	<link href="/{NOM_APPLICATION}/include/Jquery/jquery-3.5.1.js" rel="stylesheet">
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
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/ui/1.10.4/jquery-ui.js"></script>
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/action_accueil.js'></script>
	<style>
		body{
			font-weight: lighter;
		}
				
		.col_list_01{
			width: 50%;
			margin-top: -4%;
			margin-right: 5%;
			font-size: 17px;
			background-color: transparent;
			font-weight: lighter; 
			float: right;
		}
		
		.col_list_02{
			position: absolute;
			width: 12%;
			margin: 4% -46.5%;
			font-size: 17px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			z-index: 999;
		}
		
		.Affi_calendor{
			position: absolute;
			margin: 9% 0%;
			width: 250px;
			height: 250px;
			list-style: none;
			background: #101D2C;
			border-radius: 3px;
			index: 999;
			opacity: 0;
			transform-origin: top left;
			transform: scale(0);
			transition: all 650ms;
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
			margin: 3%;
		}
		
		td,input{
			 height: 7vh;
			 text-align: center;
			 border-top: 2px solid;
			 border-left: 2px solid; 
			 font-size: 12px; 
			 font-weight: lighter; 
			 border-bottom-right-radius: 4px;
		}
	</style>
</head>
<body class='tpl_creation tpl_creation_tim' onLoad='initTplCreation();'style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
	
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='TMS'>
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
		<div class="col_list" style="float:right">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_TMS_MyDMD&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>
		<nav class="container-fluid">
			<div class="col-sm-12 mt-5" style="margin-top: 5%">
					<!-- -->
				<div class="col_list_0 text-center"style="font-weight: 1;color: #023b7c;font-size: 12px;text-transform: uppercase;margin: -5% 9%;">
					<span style="">SEMAINE <span class="tacheweek">00</span>  TIMESHEET <span class="datecheck">JEUDI 26 NOVEMBRE 2020</span></span>
					<!-- <script type="text/javascript">
						var dAujourdhui = new Date();
						var options = { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' };
						document.write(dAujourdhui.toLocaleDateString('fr-CA', options));
					</script> -->
				</div>
				<!-- calendor -->
				<div class="contenu_calendor text-center">
					<span class="col_list_02 btn">Calendrier</span>
				</div>
				
				<!-- -->
				<div class="Affi_calendor text-center">
				</div>
				<!-- table  -->
				<table class="test" style="width: 100%;text-align: center; margin-top: 9%;">
					<tr>
						<td style="width: 20px;border:1px solid transparent;">
							<span style="width: 100%;"></span>
						</td>
						<td style="width: 150px;border:none;background: #4a67b3">
							<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;">ACTIVITES</span>
						</td>
						<td style="width: 300px;border:none;background: #4a67b3">
							<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;">TACHES</span>
						</td>
						<td style="width: 80px;border:none;background: #4a67b3">
							<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;">HEURE DEBUT</span>
						</td>
						<td style="width: 80px;border:none;background: #4a67b3">
							<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;">HEURE FIN</span>
						</td>
						<td style="width: 80px;border:none;background: #4a67b3">
							<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;">DUREE</span>
						</td>
						<td style="width: 80px;border:none;background: #4a67b3">
							<span style="width: 100%;font-size: 12px; color: #fff;font-weight: 1;">TAUX</span>
						</td>
						<td style="width: 80px;border:none;background: #4a67b3">
							<span style="width: 105%;font-size: 12px; color: #fff;font-weight: 1;">RESULTAT</span>
						</td>
					</tr>
					<tr>
						<td style="width: 20px;border:none;">
							<span class="button_plus add" style="width: 100%;"><i class="fa fa-plus"></i></span>
						</td>
						<td style="width: 150px;border:none;">
							<textarea type="text" style="width: 100%; height: 100%;resize: none" class="form-control"></textarea>
						</td>
						<td style="width: 300px;border:none;">
							<textarea type="text" style="width: 100%; height: 100%;resize: none" class="form-control"></textarea>
						</td>
						<td style="width: 80px;border:none;">
							<input type="time" style="width: 100%; height: 100%" class="form-control">
						</td>
						<td style="width: 80px;border:none;">
							<input type="time" style="width: 100%; height: 100%" class="form-control">
						</td>
						<td style="width: 80px;border:none;">
							<input type="text" style="width: 100%; height: 100%" class="form-control">
						</td>
						<td style="width: 80px;border:none;">
							<select id="selection" class="form-control" id='accompli' onchange="accomprow" style="width: 100%; height: 100%">
								<option value="0">0</option>
								<option value="1">10</option>
							    <option value="2">20</option>
							    <option value="3">30</option>
								<option value="4">40</option>
								<option value="5">50</option>
								<option value="6">60</option>
								<option value="7">70</option>
								<option value="8">80</option>
								<option value="9">90</option>
								<option value="10">100</option>
						    </select>
						</td>
						<td style="width: 80px;border:none;">
							<input type="text" style="width: 105%; height: 100%" class="form-control" id="resultat">
						</td>
					</tr>
				</table> 
			</div>
			<!-- button -->
			<div class="col_btn w-100 text-white" style="padding-left: 10%">
				<input type="text/javascript" class="btn col-sm-2 delete" value="SUPRIMER" style="font-size: 12px;margin-left: 30%">
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 6%">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div> 
		</nav>	
	</form>
	
	<script type="text/javascript">
		
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
		
	   //fin initialisation du calendrier datepicker
		
		
		$(document).ready(function() {
			// Affi_calendor
			$('.contenu_calendor').on('click', function(){
				$('.toggle').toggleClass('open');
				$('.Affi_calendor').toggleClass('open');
				//$('.contenu_calendor').toggleClass('open');
			});
			// Ajoute de ligne a la table
			 $(".add").click(function() {
                var ligne = "<tr><td style='width: 20px;border:none;'><input name='select' type='checkbox' style='width: 80%; height: 100%;font-size: 12px;margin-left: -1%;'></td><td style='width: 150px;border:none;'><input type='text' style='width: 100%; height: 100%;' class='form-control'></td><td style='width: 300px;border:none;'><input type='text' style='width: 100%; height: 100%' class='form-control'></td><td style='width: 80px;border:none;'><input type='time' style='width: 100%; height: 100%' class='form-control'></td><td style='width: 80px;border:none;'><input type='time' style='width: 100%; height: 100%' class='form-control'></td><td style='width: 80px;border:none;'><input type='text' style='width: 100%; height: 100%' class='form-control'></td><td style='width: 80px;border:none;'><select id='selection' class='form-control' style='width: 100%; height: 100%'><option value='0'>0</option><option value='1'>10</option><option value='2'>20</option><option value='3'>30</option><option value='4'>40</option><option value='5'>50</option><option value='7'>70</option><option value='8'>80</option><option value='9'>90</option><option value='10'>100</option></select></td><td style='width: 80px;border:none;'><input type='text' style='width: 105%; height: 100%' class='form-control'></td></tr>";
                $("table.test").append(ligne);
            });
            $(".delete").click(function() {
                $("table.test").find('input[name="select"]').each(function() {
                    if ($(this).is(":checked")) {
                        $(this).parents("table.test tr").remove();
                    }
                });
            });
			//appreciation de la colonne resultat
			function  accomplishment(){
					 var choice =$('#accompli').val()*1 ;
					//console.log(choice);
					
					   if(choice==0){
						      $('#resultat').val(" ") ;
					         
					    }else{
						  switch(true) {
							case choice <= 20: 
								  //0-20
								  $('#resultat').val("INSUFFISANT");
								break;
							case choice >20 && choice <= 50: 
								 //21-50
								$('#resultat').val("MOYEN");
								break;
							case choice >50 && choice <= 70: 
								 //51-70
								$('#resultat').val("ASSEZ-BON");
								break;
							case choice >70 && choice <= 100: 
								 //71-100
								$('#resultat').val("EXCELLENT");
								break;

							}			 	 
						};
					 
					 
					findTotalDay();
				}
			
			
			///calcul date et semaine
			
			 var userLang = navigator.language || navigator.userLanguage;
			   var options = $.extend({
				   onSelect: function() {
					 var selected = $(this).val();
					 //debut traitement lecture date timesheet
					 datepickdeb = new Date(selected.slice(0, 10));
					 let dateLocale = datepickdeb.toLocaleString('fr-FR', {
					   weekday: 'long',
					   year: 'numeric',
					   month: 'long',
					   day: 'numeric',
					   hour: 'numeric',
					   minute: 'numeric',
					   second: 'numeric'
					 });
					 $('.datecheck').text(dateLocale.split(' ')[0] + ' ' + dateLocale.split(' ')[1] + ' ' + dateLocale.split(' ')[2] + ' ' + dateLocale.split(' ')[3]);
					 $('.tacheweek').text(getWeek(datepickdeb)); 
					 //fin traitement 
				   },
				 },
			   );
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
</body>
</html>