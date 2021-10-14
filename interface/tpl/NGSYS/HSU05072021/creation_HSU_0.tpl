<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Heures supplementaires</title>
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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css"/>
	<script language='javascript' src='/NGSYS/include/script/action_accueil.js'></script>
	<style>
		.col_list{
			width: 23%;
			float: right;
			margin-right: 2%;
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
			margin: 2.5%;
		}

		.button_plus{
			font-size: 11px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			margin-top: 3px;
			margin-right: 6%;
		}

		.fa-archive{
			color: #fff;
			font-size: 10px;
			cursor: pointer;
			width: 20px;
			height: 20px;
			border-radius: 25px;
			background: #4a67b3;
			margin-right: 3px;
			padding-top: 4px;
		}
		
		.parsley-error{
		 	border-style: solid;
			border-color: red;
		}

	</style>
</head>
<body  class='tpl_creation tpl_creation_hsu' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formheuresupplementaire" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='HSU'>
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
			
					  <!-- nom de l'utilisateur-->
        </div>
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_HSU_Encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		<nav class="container-fluid" style="margin-top: 3%">
			<table class="test" id="table_tache" style="width: 100%;text-align: center; margin-top: 2%;">
				<thead>
					<tr>
						<td style="width: 20px;border:1px solid transparent;">
							<span style="width: 100%;"></span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;border-top-left-radius: 5px;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Date</span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Heure d&#233;but</span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Heure fin</span>
						</td>
						<td style="width: 100px;height: 7vh;border:none;background: #4a67b3;padding-top: 7px">
							<span  style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Nombre heure r&#233;alis&#233;e</span>
						</td>
						<td style="width: 300px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Motifs</span>
						</td>
						<td style="width: 300px;height: 7vh;border:none;background: #4a67b3;border-top-right-radius: 5px;padding-top: 7px">
							<span style="width: 100%;font-size: 13px; color: #fff;font-weight: 1;">Montant</span>
						</td>
						<td style="width: 50px;height: 7vh;border:none;padding-top: 7px">
							<span style="width: 100%;font-size: 13px;font-weight: 1;">Jour f&#233;ri&#233;</span>
						</td>
					</tr>
				</thead>

				<tbody class="tableL">
					<tr>
						<td style="width: 20px;border:none;">
							<!-- <i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i> -->
						</td>
						<td style="width: 100px;border:none;">
							<input type="text"  id="date1" name="POS_VAL_RUB_DAJ" value="{POS_VAL_RUB_DAJ}" name="date[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" placeholder="jj / mm / aaaa" class="form-control date">
						</td>
						<td style="width: 100px;border:none;">
							<input type="time" name="POS_VAL_RUB_HIN" value="{POS_VAL_RUB_HIN}" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heurein">
						</td>
						<td style="width: 100px;border:none;">
							<input type="time"  name="POS_VAL_RUB_HRF" value="{POS_VAL_RUB_HRF}" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heureout">
						</td>
						<td style="width: 100px;border:none;">
							<input type="text" readonly="true" name="POS_VAL_RUB_DJ1" value="{POS_VAL_RUB_DJ1}" style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" placeholder="" class="form-control duree">
						</td>
						<td style="width: 300px;border:none;">
							<textarea type="text" name='POS_VAL_RUB_MOF' style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" class="form-control tache">{POS_VAL_RUB_MOF}</textarea>
						</td>
						<td style="width: 100px;border:none;">
							<input type="text" disabled  name="POS_VAL_RUB_MHT" value="{POS_VAL_RUB_MHT}" style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" min='0'  class="form-control montant">
						</td>
						<td style="width: 50px;border:none;">
							<input name="select" type="checkbox" name="POS_VAL_RUB_CHK" value="{POS_VAL_RUB_CHK}" style="width: 80%;font-size: 12px;margin-left: -37%;">
						</td>
					</tr>
				</tbody>
			</table>
			<div class="col-sm">
				<span class="button_plus addRow btn" style="float: right;font-size: 11px">Ajouter une ligne</i></span>
			</div>

			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div>   
		</nav>
	</form>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
	<!-- END JQUERY  -->
	<script>	 
	 	$(document).ready(function(){
	 		// script de bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?. Vos donn\u00e9s seront annul\u00e9es .")){
							{CODE_ACTION_FERMER}
				}
			});

			// Ajouter de ligne a la table
			$(".addRow").click(function(){
				    
				var $dataRows =$('.tableL');
				var tr=$dataRows.parent().parent();
				if(tr.find('.duree').val()==""){
					  alert("Veuillez bien renseigner les informations");
				}else{
					addRow();
				}	   			
            });

			function  addRow(){ 
			  	var ligne ='<tr>'+
						 '<td style="width: 20px;border:none;">'+
						      '<i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i>'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
								'<input type="text" name="date[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" placeholder="jj / mm / aaaa"  class="form-control date">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="time" name="heurein[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heurein">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="time"  name="heureout[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heureout">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="text" name="duree[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" class="form-control duree">'+
						'</td>'+
						'<td style="width: 300px;border:none;">'+
							'<textarea type="text" name="tache[]" style="width: 100%; resize: none;background: transparent;border: 1px solid;margin-top: 2px" rows="2" class="form-control tache"></textarea>'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="text" name="montant[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" class="form-control montant">'+
						'</td>'+
						'<td style="width: 50px;border:none;">'+
							'<input name="select" type="checkbox" style="width: 80%;font-size: 12px;margin-left: -20%;">'+
						'</td>'+
					'</tr>';
              	$('.tableL').append(ligne);
			}

			//Supprimer de ligne a la table
			$(document).on('click','#Suprim',function(){
                $(this).parents("table.test tr").remove();
			});
	 	});

		 $(document).ready(function () {

			 $('#date1').datepicker({
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
				dateFormat: 'dd-mm-yy',
			});
		});

			
			  //heure deb sup heure fin
			$('.tableL').delegate('.heurein','change',function(){
			 	var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();

				if(inphfin<inphdeb){
					   
					if(inphfin !=''){
						alert('Heure de debut  sup\u00e9rieure \u00e0 heure de fin');
						$('.duree').prop('readonly',true);
						//$('.duree').val('00:00');
				 	}else{
				 		$('.duree').prop('readonly',true);
						//$('.duree').val('00:00');
				 	}
					
				}else{
					alert('');
					$('.duree').prop('readonly',true);
				}
			});

               //heure fin inf heure deb
			$('.tableL').delegate('.heureout','change',function(){
			 	var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();
				


				
				
					if(inphfin<inphdeb){
							alert('Heure de fin  inf\u00e9rieure \u00e0 heure de debut');
							$('.duree').prop('readonly',true);
							//$('.duree').val('00:00');
					}else{
						$('.duree').prop('readonly',true);
					}
			});


			$('.tableL').delegate('.heurein,.heureout,.date','change',function(){

				var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();
				var inphdate=tr.find('.date').val();
				var weekday = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
				var a= new Date();
				var b= inphdate.getDay();
				alert(b);

				var c=weekday[a];


				const heureConst='21:00';

				var time= new Date("01/01/2010 " + heureConst);
				var salaireBrut=500000;
				var paieQuod= salaireBrut/173.33;
				alert(paieQuod);


				var timeStart = new Date("01/01/2010 " + inphdeb);
				var timeEnd = new Date("01/01/2010 " + inphfin);

				if(timeEnd<= time){
					var differenteTime= time-timeEnd;

					var newdiff= new Date(differenteTime);
					var hourTime= newdiff.getHours();
					var minuteTime = newdiff.getMinutes();

					

					hourTimeDiff1 = hourTime > 9 ? hourTime : '0'+hourTime;


					minuteTimeDiff1 = minuteTime > 9 ? minuteTime : '0' + minuteTime;

					var countDureeTime=(isNaN(hourTimeDiff1) ? '00' : hourTimeDiff1)+':'+(isNaN(minuteTimeDiff1) ? '00' : minuteTimeDiff1) ;

					if(hourTime<=3){
						$('.montant').val(paieQuod);
					}

							
								




					
				}


				//console.log(timeStart,' ',timeEnd);
				 

                 
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

		//fin initialisation du calendrier datepicker
		
	</script>
</body>
</html>




