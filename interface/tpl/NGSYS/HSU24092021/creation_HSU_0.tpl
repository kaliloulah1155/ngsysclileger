<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Heures supplementaires</title>
	<link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
	<!-- <link href="/{NOM_APPLICATION}/include/alert/sweetalert.css" rel="stylesheet"> -->
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

					<input type='hidden' class='appName' value="{NOM_APPLICATION}">

				
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					<input type="hidden" name='POS_VAL_RUB_MAT' class="viewmatricule" value="{POS_VAL_RUB_MAT}" >

 
					<!-- Identifiant de la fiche poste (générer dans le code javascript) -->
				<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD"  style="width: 100%;">

				<input type="hidden" class="vsalaire_base" name="POS_VAL_RUB_SAB"  style="width: 100%;">

				<!--<div style="z-index:0;">
						{TITRE_BOUTONS} 
					</div> -->
			
					  <!-- nom de l'utilisateur-->
        </div>
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_HSU_lnv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
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
							<input type="text"  name="date[]"  id="date1"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" placeholder="jj / mm / aaaa" class="form-control date" required="true">
						</td>
						<td style="width: 100px;border:none;">
							<input type="time" name="heurein[]"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heurein" required="true">
						</td>
						<td style="width: 100px;border:none;">
							<input type="time"  name="heureout[]"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" class="form-control heureout" required="true">
						</td>
						<td style="width: 100px;border:none;">
							<input type="text" readonly="true" name="duree[]"  style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;" rows="2" placeholder="" class="form-control duree" required="true">
						</td>
						<td style="width: 300px;border:none;">
							<textarea type="text" name='tache[]' style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px;resize: none;" rows="2" class="form-control tache" required="true">{POS_VAL_RUB_MOF}</textarea>
						</td>
						<td style="width: 100px;border:none;">
							<input type="text" disabled  name="montant[]"  style="width: 100%; height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" min='0'  class="form-control montant">
						</td>
						<td style="width: 50px;border:none;">
							<input name="select[]" type="checkbox"  class="cbk"  style="width: 80%;font-size: 12px;margin-left: -37%;" >
						</td>
					</tr>
				</tbody>
			</table>
			
			<div class="col-sm">
				<span class="button_plus addRow btn" style="float: right;font-size: 11px">Ajouter une ligne</i></span>
			</div>
			<div class="form-group row" style="margin-top: 6%">
					<div class="col-sm-3" style="font-size: 12px">
						<label>Total heures suppl&#233;mentaires :</label>
						<input class="form-control dureetotale"  name="POS_VAL_RUB_DJ1" value="{POS_VAL_RUB_DJ1}"  id="dureetotale" placeholder="Dur&#233;e">
					</div>
			</div>

			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg" type="submit" id="app" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div>   
		</nav>
	</form>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>

		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/HSU/register/register.js"></script>
 		
		<!-- <script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script> -->
	<!-- END JQUERY  -->
	<script>	

	  //UUID CODE   ::creation d'un code unique pour chaque document :poste idem à ID
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

		//donnee de l'utilisateur connecté
	    var nom=$('.nom').val();
		var prenom=$('.prenom').val();
		var fonction=$('.fonction').val();
		var departement=$('.departement').val();
		var matricule=$('.matricule').val();

		$('.viewnom').val(nom);
		$('.viewprenom').val(prenom);
		$('.viewfonction').val(fonction);
		$('.viewdepartement').val(departement);
		$('.viewmatricule').val(matricule);
//Fin desdonnées de l'utilisateur connecté
	  
	 		// script de bouton fermer
		$('.btn_ferme').on('click',function(){
				if (confirm("Voulez-vous fermer le formulaire ?. Vos donn\u00e9s seront annul\u00e9es .")){
						{CODE_ACTION_FERMER}
			}
		});

			//script du bouton enregistrer 
		$('#formheuresupplementaire').submit(function(event){
			event.preventDefault();

			if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
					alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
					event.currentTarget.submit();
				}else{
				return false;
			}
		});
        
		var $dataRows =$('.tableL');
		var tr=$dataRows.parent().parent();
		// Ajouter de ligne a la table
		$(document).on('click',".addRow",function(){
				
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
								'<input id="date1" type="text" name="date[]"   style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" placeholder="jj / mm / aaaa"  class="form-control date">'+
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
							'<textarea type="text" name="tache[]" style="width: 100%; resize: none;background: transparent;border: 1px solid;margin-top: 2px;resize: none;" rows="2" class="form-control tache"></textarea>'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="text" name="montant[]" style="width: 100%;height: 11vh;background: transparent;border: 1px solid;margin-top: 2px" rows="2" class="form-control montant">'+
						'</td>'+
						'<td style="width: 50px;border:none;">'+
							'<input name="select[]" class="cbk" type="checkbox" style="width: 80%;font-size: 12px;margin-left: -20%;" >'+
						'</td>'+
					'</tr>';
              	$('.tableL').append(ligne);
			}


			//Supprimer de ligne a la table
			$(document).on('click','#Suprim',function(){
                $(this).parents("table.test tr").remove();
				findTotalDuree();
			});

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

             

			   var cpt_hsj=0;
			   var cpt_hsn=0;
			   var cpt_hsd=0;
	 
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


				 

				

			let me_choice=false;
			// $('.tableL').delegate('.cbk','click',function(){
			// 	   $("table.test ").find('input[name="select[]"]').each(function() {
			// 		//    var chk = $(this).closest('tr').find('input:checkbox'); 
			// 		// var fileid=$(this).closest('tr').find('.cbk').val();
			// 		// alert("checkstate : " +fileid);
			// 		//alert("read :" +chk[0].checked);
			// 		//alert("Write: " +chk[1].checked);
			// 		//alert("Download: "+ chk[2].checked);
	        //             if ($(this).is(":checked")) {
	        //             	//si cochez
	        //                  //console.log('ok');
			// 				 me_choice=true;
	        //             }else{
	        //             	  //si non cochez
	        //             	//console.log('nok');
			// 				  me_choice=false;
 	        //             }

	        //         });
		    // });

           //ce checkbox recalcul les données de la ligne courante
			$(document).on('click',".cbk",function() {
					var $row = $(this).closest("tr");    // Find the row
					//var $text = $row.find(".cbk").val(); // Find the text
					// Let's test it out
					   var $val = $row.find(".cbk").map(function() {
							return this.checked;
						}).toArray();

						me_choice=$val[0];

						//console.log(me_choice);
			});

			



		    
			$('.vsalaire_base').val(parseInt($('.salaire_base').text()));

		$('.tableL').delegate('.heurein,.heureout,.date,.cbk','change',function(){

				var tr=$(this).parent().parent();
          		var inphdeb=tr.find('.heurein').val();
				var inphfin=tr.find('.heureout').val();
				var inphdate=tr.find('.date').val();
                var elem = inphdate.split('-');
               
                var date = elem[2] +'-'+elem[1]+'-'+elem[0];
                var weekday1 = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];

                var day = new Date(date);
                var getNumber= day.getDay(date);
                var getJour = weekday1[getNumber];

                const heureConstMat='07:00';
                const heureConstSoir='21:00';

				var tr_duree='00:00';

				//console.log(me_choice);

                var hourDiff='';

                var init_dateHeureMatin= new Date(date +' '+ heureConstMat); //heure debut 07:00 en date   timeMat (matin)
                var init_dateHeureSoir= new Date(date +' '+ heureConstSoir);  //heure debut 21:00 en date timeSoir (soir)
                var dateHeureStart = new Date(date +' '+ inphdeb);  //heure debut choisie en date timeStart
				var dateHeureEnd = new Date(date +' '+ inphfin);  //heure fin choisie en date timeEnd
                var salaireBrut =parseInt($('.salaire_base').text()); //recuperation du salaire de base dans afficher_creation.php
				var paieQuod = salaireBrut/173.33;   //2884.67085905
                var montantSunday= paieQuod + (0.75*paieQuod);
                var montantSunday2= paieQuod + (1*paieQuod);
                var montantJour= paieQuod + (0.15*paieQuod);  //3317.37
                var montantJour2= paieQuod + (0.5*paieQuod);  //4327

                
			    function jourferier(choice){
					var mtn=0; 
					if(choice==true){
						//tr.find('.cbk').val(true);
						mtn=parseInt(montantJour2);
					}else{
						mtn=parseInt(montantJour);
 					}
					return mtn;
				}

				function jourweekferier(choice){
					    var w_mtn=0; 
					 if(choice==true){
 						w_mtn=parseInt(montantSunday2);
						
					}else{
						w_mtn=parseInt(montantSunday);
						 
					}
					return w_mtn;
				}

				function cal_tmontant(tduree, tmontant) {
					let hduree = tduree;
					let hmontant = parseInt(tmontant);
					let delta = 0;
					let montant_totale = 0;

					htime = hduree.split(":");
					delta = parseInt(htime[0]) + parseInt(htime[1]) / 60;
					montant_totale = delta * hmontant;

					return montant_totale;
				}


				


                   //si l'heure de fin est inf ou egale à 21h
                if(dateHeureEnd<= init_dateHeureSoir){
                        // console.log('Hfin <=21h ')  ;
					    var differenteTime= init_dateHeureSoir-dateHeureEnd;
                        var newdiff= new Date(differenteTime);
                        var hourTime= newdiff.getHours();
                        var minuteTime = newdiff.getMinutes();

                        hourTimeDiff1 = hourTime > 9 ? hourTime : '0'+hourTime;
                        minuteTimeDiff1 = minuteTime > 9 ? minuteTime : '0' + minuteTime;
                        var countDureeTime=(isNaN(hourTimeDiff1) ? '00' : hourTimeDiff1)+':'+(isNaN(minuteTimeDiff1) ? '00' : minuteTimeDiff1) ;
						 
                }else{
				   //	console.log('Hfin >=21h ')  ;
				}

				if(dateHeureStart <= dateHeureEnd){
					 var difference = dateHeureEnd - dateHeureStart;
                            var diff_result = new Date(difference);


                            var hourDiff = diff_result.getHours();
                            var minuteDiff = diff_result.getMinutes();

                            hourDiff1 = hourDiff > 9 ? hourDiff : '0'+hourDiff;

                            minuteDiff1 = minuteDiff > 9 ? minuteDiff : '0' + minuteDiff;
                            var countDuree=(isNaN(hourDiff1) ? '00' : hourDiff1)+':'+(isNaN(minuteDiff1) ? '00' : minuteDiff1) ;
                            tr.find('.duree').val(countDuree);

							//duree_montant
							tr_duree=countDuree;

							findTotalDuree();
				}else{
					//console.log('Hdeb >=21h ')  ;
				}

				 if(dateHeureStart>=init_dateHeureMatin && dateHeureEnd<=init_dateHeureSoir){
                             
							var montant=0;
 							if(getJour==weekday1[getNumber]){

							switch (getJour) {
								case 'Lundi':
								     
									 montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Mardi':
								    montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Mercredi':
								    montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Jeudi':
								    montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Vendredi':
									montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
								break;
								case 'Dimanche':
								   montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
 							    break;
								case 'Samedi':
									montant= cal_tmontant(tr.find('.duree').val(), jourferier(me_choice));
 									break;
								default:
									
								}
								 tr.find('.montant').val( parseInt(montant));
							}else{
							}
				 }else{
					 // console.log('pas coucou');
				 }
			});
			 

 
	</script>
</body>
</html>




