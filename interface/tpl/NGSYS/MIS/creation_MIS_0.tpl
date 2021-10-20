<!DOCTYPE html>
<html lang="fr">
<head>   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation de mission</title>
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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script language='javascript' src='/NGSYS/include/script/action_accueil.js'></script>

	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>

	<style>

		.col_list{
			width: 23%;
			float: right;
			/*margin-right: 3%;*/
		}

		.col1_partie{
			width: 100%;
			font-family: 'Times New Roman';
			font-size: 14px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			padding-top: 9px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 17px;
		}
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
			background:transparent
		}
		
		.parsley-error{
			border-style: solid;
  			border-color: red;
		}
		span.text:after {
		content: "*";
		color: red;
		}

.select2-selection{
	height: 200px;
	background: red;
}

	</style>
</head>
<body  class='tpl_creation tpl_creation_mis' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formission" ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='MIS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				
				
        </div>

		<!--<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/liste/liste_MIS_1.php?APPLI={NOM_APPLICATION}&USER={NOM_UTILISATEUR}&PROFIL={PROFIL_UTILISATEUR}">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div> -->

		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_MIS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>


		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<div class="col-sm-12 mt-5" style="margin-top: 1%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>
					<div class="col2_partie" style="padding-top: 2%;">
						<div class="row">
						
							<!-- données de l'utilisateur connecté -->
							<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
							<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
							<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
							<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
							
							 <!--fin données de l'utilisateur connecté -->
		        
							<div class="col-sm-12 text-center" style="margin-bottom: 13px">
								<label>Les champs avec (<span class='text'></span>) sont obligatoires</label>
							</div>

							<div class="col-sm-4">
								<label for="bio">Pays de destination  <span class='text'></span> :</label>
								<select name="POS_VAL_RUB_PAY"  class="form-control selectPas pays" style="width: 100%;" required="true">
	 							</select>
								<input type="hidden" class="init_pays" name='POS_VAL_CTRL_PAY' id='POS_VAL_CTRL_PAY' value='{POS_VAL_RUB_PAY}' required="true">
							</div>

							<div class="col-sm-4">
								<label for="bio">Ville de destination <span class='text'></span> :</label>
								<select name="POS_VAL_RUB_VLE" class="form-control selectVis ville" style="width: 100%;">
	 							</select>
								<input type="hidden" class="init_ville" name='POS_VAL_CTRL_VLE' id='POS_VAL_CTRL_VLE' value='{POS_VAL_RUB_VLE}' required="true">
							</div>
					
							<div class="col-sm-4">
								<label for="bio">Date de d&#233;part <span class='text'></span> :</label>
								<input type="text" name="POS_VAL_RUB_DAA" value="{POS_VAL_RUB_DAA}" placeholder="jj/mm/aaaa" class="form-control datepicker dateDepart" id="date1" style="width: 100%;" required="true">
							</div>

							<div class="col-sm-4" style="margin-top: 13px">
								<label for="bio">Dur&#233;e <span class='text'></span> :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);"  name="POS_VAL_RUB_DUR" value="{POS_VAL_RUB_DUR}"  min="0" class="form-control duree" style="width: 100%;" required="true">
							</div>

							<div class="col-sm-4" style="margin-top: 13px">
								<label for="bio">Date de retour :</label>
								<input type="text" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" placeholder="jj/mm/aaaa" class="form-control datefin" readonly='true' style="width: 100%;" required="true">
							</div>
						
							<div class="col-sm-4" style="margin-top: 13px">
								<label for="bio">Moyen de transport <span class='text'></span> :</label>
								<select name="POS_VAL_RUB_MOT" class="form-control selectMoys" style="width: 100%;">
								    <option value="">Veuillez s&#233;lectionner</option>
								     <option value="AVION">Avion</option>
								     <option value="TRANSPORT EN COMMUN">Transport en commun</option>
								     <option value="TRAIN">Train</option>
								     <option value="VEHICULE DE LOCATION">V&#233;hicule de location</option>
								</select>
								<input type="hidden" class="init_transport" name='POS_VAL_CTRL_MOT' id='POS_VAL_CTRL_MOT' value='{POS_VAL_RUB_MOT}'>
							</div>

							<div class="col-sm-4" id="Compagnies" style="margin-top: 13px;">
								<label for="bio">Compagnie :</label>
								<select name="POS_VAL_RUB_COP" class="form-control selectCops compagnie" style="width: 100%;">
 								</select>
								<input type="hidden" class="init_compagnie" name='POS_VAL_CTRL_COP' id='POS_VAL_CTRL_COP' value='{POS_VAL_RUB_COP}'>
							</div>

							<div class="col-sm-4" id="Num_vol" style="margin-top: 13px">
								<label for="bio">N&#176; de vol :</label>
								<input type="text" placeholder="N&#176; de vol" name='POS_VAL_RUB_N2' value="{POS_VAL_RUB_N2}" class="form-control" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="classe_autres" style="margin-top: 13px;">
								<label for="bio">Classe :</label>
								<select name="POS_VAL_RUB_CLA" class="form-control" style="width: 100%;">
								    <option value="">Veuillez s&#233;lectionner</option>
								    <option value="1ERE CLASSE" id="1_clas">1&#232;re classe</option>
								    <option value="2EME CLASSE" id="2_clas">2eme classe</option>
								    <option value="AFFAIRE" id="3_clas">Affaire</option>
								    <option value="ECONOMIQUE" id="4_clas">Economique</option>
								    <option value="PREMIUM" id="5_clas">Premium</option>
								</select>
								<input type="hidden" class="init_classe" name='POS_VAL_CTRL_CLA' id='POS_VAL_CTRL_CLA' value='{POS_VAL_RUB_CLA}'>
							</div>

							<div class="col-sm-4" id="classe_trps" style="margin-top: 13px;">
								<label for="bio">Classe :</label>
								<select class="form-control classe_trps" style="width: 100%;">
									<option value="ECONOMIQUE">Economique</option>
								    <option value="PREMIUM">Premium</option>
 								</select>
							</div>

							<div class="col-sm-4" id="Num_depart" style="margin-top: 13px;">
								<label for="bio">N&#176; de depart :</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_N2A' value="{POS_VAL_RUB_N2A}" placeholder="N&#176; de depart" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="Heure_depart" style="margin-top: 13px;">
								<label for="bio">Heure de depart :</label>
								<input type="time" name='POS_VAL_RUB_N2B' value="{POS_VAL_RUB_N2B}" class="form-control" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="Heure_arrive" style="margin-top: 13px;">
								<label for="bio">Heure d&#146;arriv&#233;e :</label>
								<input type="time" name='POS_VAL_RUB_N2C' value="{POS_VAL_RUB_N2C}" class="form-control" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="Duree_vol" style="margin-top: 13px;">
								<label for="bio">Dur&#233;e de voyage :</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_N2D' value="{POS_VAL_RUB_N2D}" placeholder="Dur&#233;e de voyage" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="Immatriculation" style="margin-top: 13px;">
								<label for="bio">Immatriculation :</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_IMM' placeholder="Immatriculation" value="{POS_VAL_RUB_IMM}" onBlur="javascript:maximum(this,'119');" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="Typ_vehicul" style="margin-top: 13px;">
								<label for="bio">Type de v&#233;hicule :</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_N3' value="{POS_VAL_RUB_N3}" placeholder="Type de v&#233;hicule" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="Nm_chauffeur" style="margin-top: 13px;">
								<label for="bio">Nom du chauffeur :</label>
								<input type="text" class="form-control" placeholder="Nom du chauffeur"  name='POS_VAL_RUB_NCH' value="{POS_VAL_RUB_NCH}" onBlur="javascript:maximum(this,'119');" style="width: 100%;">
							</div>

							<div class="col-sm-4" id="Nu_permis" style="margin-top: 13px;">
								<label for="bio">N&#176; de permis :</label>
								<input type="text" class="form-control" placeholder="N&#176; de permis" style="width: 100%;">
							</div>

							<div class="col-sm-4" style="margin-top: 13px">
								<label for="bio">Client :</label>
								<select name="POS_VAL_RUB_SOC" class="form-control selectClts client" style="width: 100%;">
 								</select>
 								<input type="hidden" class="init_client" name='POS_VAL_CTRL_SOC' id='POS_VAL_CTRL_SOC' value='{POS_VAL_RUB_SOC}'>
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display:none">
								<label for="bio">Autre raison :</label>
								<input type="text" placeholder="Autre raison" class="form-control" style="width: 100%;">
							</div>

							<div class="col-sm-4" style="margin-top: 13px">
								<label for="bio">Objet de la mission :</label>
								<select name="POS_VAL_RUB_LPR" class="form-control selectProjs projet" style="width: 100%;">
 								</select>
								<input type="hidden" class="init_projet" name='POS_VAL_CTRL_LPR' id='POS_VAL_CTRL_LPR' value='{POS_VAL_RUB_LPR}' required="true">
							</div>
					
							<div class="col-sm-12" style="margin-top: 13px">
								<label for="bio">Motif de la mission <span class='text'></span> :</label>
								<textarea type="text" rows="3" class="form-control motif_mis" name='POS_VAL_RUB_COM' style="width: 100%; resize: none">{POS_VAL_RUB_COM}</textarea>
							</div>
						</div>

						<div class="form-group row">

							<div class="col-sm-4">
								<label for="bio">Destination<span class='text'></span> :</label>
								<select class="form-control destination"   name="POS_VAL_RUB_E1">
								</select>
								<input type="hidden"  class="interdestination" name='POS_VAL_CTRL_E1' id='POS_VAL_CTRL_E1' value='{POS_VAL_RUB_E1}'>
 							</div>

							<div class="col-sm-4">
								<label for="bio">Profil<span class='text'></span> :</label>
								<select class="form-control profil"   name="POS_VAL_RUB_LOG">
								</select>
								<input type="hidden"   class="interprofil" name='POS_VAL_CTRL_LOG' id='POS_VAL_CTRL_LOG' value='{POS_VAL_RUB_LOG}'>
 							</div>
						</div>
						<br/> 
							<hr>
						<div class="row" style="margin-top: 13px">
							<div class="col-sm-12">
								<label for="bio">Estimation frais de mission :</label>
								<table class="table table-bordered " id="table_tache" style="width: 100%;margin: auto;">
									<thead>
										<tr>
											<td style="width: 50px; font-weight: bold;text-align: center;">
												<label for="bio" style="font-size: 11px">DESIGNATION</label>
											</td>
											<td style="width: 35px; font-weight: bold;text-align: center;">
												<label for="bio" style="font-size: 11px">PRIX UNITAIRES</label>
											</td>
											<td style="width: 35px; font-weight: bold;text-align: center;">
												<label for="bio" style="font-size: 11px">QUANTITES</label>
											</td>
											<td style="width: 35px; font-weight: bold;text-align: center;">
												<span style="font-size: 11px">TOTAL XOF</span>	
											</td>
										</tr>
									</thead>
								  
								  <tbody class="table_mis">

									</tbody>
								</table>
							</div>
						</div>

					</div>	
				</div>	
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg" type="submit" id="app" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div> 
		</nav>
			
	</form>
</body>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
	<!-- END JQUERY  -->
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/personnel/personnel.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/packs/packages.js"></script>
	<script language='javascript' src="../../../../include/script/testNum.js"></script>
	<!-- <script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script> -->

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/code/code.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/manipule_champs/container.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/api/tbl_estimation.js"></script>


		<script>
		$(document).ready(function (){

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			//script du bouton enregistrer 
	        $('#formission').submit(function(event){
				event.preventDefault();

				if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
			        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			          	event.currentTarget.submit();
			        }else{
			    	return false;
			    }
	        });
			
			var nom=$('.nom').val();
			var prenom=$('.prenom').val();
			var fonction=$('.fonction').val();
			var departement=$('.departement').val();

			$('.viewnom').val(nom);
			$('.viewprenom').val(prenom);
			$('.viewfonction').val(fonction);
			$('.viewdepartement').val(departement);
			//fin données de l'utilisateur connecté


			// select2 
            $('.selectVos,.selectPas,.selectVis,.selectCops,.selectClts,.selectProjs,.classe_trps').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });


			$('#date1, #date2').datepicker({
				altField: "#datepicker",
				closeText: 'Fermer',
				prevText: 'Précédent',
				nextText: 'Suivant',
				currentText: 'Aujourd\'hui',
				monthNames: ['Janvier', 'F&#233;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'D&#233;cembre'],
				monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
				dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
				dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
				dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
				weekHeader: 'Sem.',
				dateFormat: 'dd/mm/yy'
			});
		});
			
		$('#formission').parsley();


			function timeConverter(UNIX_timestamp){
		var a = new Date(UNIX_timestamp * 1000);
		var months = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','A\u00f4ut','Septembre','Octobre','Novembre','D\u00e9cembre'];
		var year = a.getFullYear();
		//var month = months[a.getMonth()];
		var month = a.getMonth();
		var date = a.getDate();     
		var hour = a.getHours();
		var min = a.getMinutes();
		var sec = a.getSeconds();
		var weekday = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
		//var dayGetName=weekday[a.getDay()];
		var dayGetName=a.getDay();
		hour1 = hour > 9 ? hour : '0' + hour;
		min1 = min > 9 ? min : '0' + min;
		sec1 = sec > 9 ? sec : '0' + sec;
		//var time = dayGetName + ' ' +date + ' ' + month + ' ' + year + ' \u00E0 ' + hour1 + ':' + min1 + ':' + sec1 ;

		
		d1 = date > 9 ? date : '0'+date;
		m1 = month > 9 ? month : '0'+month;



		var time =d1 +'/'+ m1+'/'+year ;
		return time;    
	}

 
	$(document).on('change keyup','.duree, .dateDepart',function(){



		    var dureemois=parseInt($('.duree').val());
			var datedepo_sp=($('.dateDepart').val()).split('/');
			var datedepo_sp_str=datedepo_sp[2]+'-'+(parseInt(datedepo_sp[1])+1)+'-'+datedepo_sp[0];
			var formattedDatedepo =  new Date(datedepo_sp_str); //date de debut

         	 
            var result_date_jrs = formattedDatedepo.setDate(formattedDatedepo.getDate() +dureemois)  ;	    //cacul le nombre de jours  en timestamps

            var y =formattedDatedepo.getFullYear();
            if (!isNaN( y)) {
            	$('.datefin').val('');
          		$('.datefin').val(timeConverter(parseInt(result_date_jrs/1000) ));
          	}
        

 	});


		</script>
	
</html>