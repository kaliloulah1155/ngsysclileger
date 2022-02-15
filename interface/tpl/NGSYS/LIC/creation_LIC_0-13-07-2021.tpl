<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation licenciement</title>
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
			padding: 20px;
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
	</style>
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
</head>
<body  class='tpl_creation tpl_creation_lic' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formlicenc" ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='LIC'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				<!-- end important pour lancer la boite aux lettres  -->

				<!--<div style="z-index:0;">
						{TITRE_BOUTONS} 
					</div> -->
			 
        </div>
		
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_LIC_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>
		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 4%">
				<div class="col-sm-12 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIFS</span>
					</div>
					<div class="col2_partie" style="padding-top: 2%;">
						<div class="row">
							<div class="col-sm-4">
								<label for="bio">Nom & pr&#233;noms :</label>
								<select id="interimaire" class="form-control select2 personnel" name='POS_VAL_RUB_INT' style="width: 100%;">
									<option value="{POS_VAL_RUB_INT}" selected>{POS_VAL_RUB_INT}</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_INT' id='POS_VAL_CTRL_INT' value='{POS_VAL_RUB_INT}'>
							</div>
							<div class="col-sm-4" style="display: none;">
								<label>Fonction :</label>
								<input type="text" name='POS_VAL_RUB_FON' required="true" class="form-control" value="{POS_VAL_RUB_FON}" placeholder="Fonction" style="width: 100%;">
							</div>
							<div class="col-sm-4" style="display: none;">
								<label>Anciennet&eacute; :</label>
								<input type="number" name='POS_VAL_RUB_AVA' value="{POS_VAL_RUB_AVA}" placeholder="Ancienn&eacute;t&eacute;" class="form-control" style="width: 100%;">
							</div>
						
							<div class="col-sm-4">
								<label>Date prise de decision :</label>
								<input type="text" name='POS_VAL_RUB_DEI' required="true" value="{POS_VAL_RUB_DEI}" placeholder="jj/mm/aaaa" class="form-control dateDepot"  id="date1" style="width: 100%;">
							</div>
							<div class="col-sm-4">
								<label>Dur&#233;e pr&eacute;avis</label>
								<input type="text" name='POS_VAL_RUB_CAT' required="true" value="{POS_VAL_RUB_CAT}"  placeholder="Dur&#233;e pr&eacute;avis" class="form-control dureePreavis" style="width: 100%;">
							</div>
							<div class="col-sm-4" style="margin-top: 13px">
								<label>Date de fin :</label>
								<input type="text" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" placeholder="jj/mm/aaaa" class="form-control dateFin"  readonly='true' style="width: 100%;">
							</div>
							<div class="col-sm-4 paieDroits" style="margin-top: 13px">
								<label>Date de paiement des droits :</label>
								<input type="text" name="POS_VAL_RUB_DIN" placeholder="jj/mm/aaaa" value="{POS_VAL_RUB_DIN}" class="form-control datepicker" id="date3" style="width: 100%;">
							</div>
						</div>

						<div class="row" style="margin-top: 13px">
							<div class="col-sm-4">
								<label>Dommage et interet :</label>
								<br>
								<input type="radio" class="val_1" name="POS_VAL_RUB_AUS" value="OUI" onclick="griser();">
								<label for="bio" style="margin-right: 3%">Oui</label>
								<input type="radio" class="val_1" name="POS_VAL_RUB_AUS" value="NON" checked onclick="griser();">
								<label for="bio">Non</label>
								<input type="hidden" name='POS_VAL_CTRL_AUS' id='POS_VAL_CTRL_AUS' value='{POS_VAL_RUB_AUS}'>								
							</div>
						</div>

						<div class="row" style="margin-top: 13px">
							<div class="col-sm-12">
								<label>Motif de licenciement :</label>
								<textarea type="text" name='POS_VAL_RUB_MPO' required="true"  rows="3" class="form-control" style="width: 100%; resize: none">{POS_VAL_RUB_MPO}</textarea>
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
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/LIC/select2/select2tr.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script>

	<!-- END JQUERY  -->
	<script>
	 	$('#formlicenc').parsley();
		$(document).ready(function (){

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			$('#app').click(function(){
				if($.trim($('.form-control').val())==""){
					swal("ATTENTION", "Un probl\u00e8me est survenu, veuillez r\u00e9essayez plus tard ou v\u00e9rifier les valeurs renseign\u00e9es dans les champs du formulaire", "error");
				}

				else{

		          swal({
						title: 'success',
						text: "VOTRE OPERATION S'EST DEROULEE AVEC SUCCES",
					},
					function(){

						setTimeout(function(){
						   $(".cform").submit();
						  }, 500000);
					      
					});
		        }
	        });


			// select2 
            $('.selectNon').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });


			// bouton radio
			$(".paieDroits").css("display", "none");
			$('.val_1').on('click',function(){
				let val_1 = $(this).val();
				if(val_1 == "OUI"){   
					//degrise
					$(".paieDroits").css("display", "block"); 
				}
				else{
				  	//griser
					$(".paieDroits").css("display", "none");
				}
			});


			$('#date1,#date2,#date3').datepicker({
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

	function addMonths(date, months) {
		var d = date.getDate();
		date.setMonth(date.getMonth() + +months);
		if (date.getDate() != d) {
		date.setDate(0);
		}
		return date;
	}

	$(document).on('change keyup','.dureePreavis, .dateDepot',function(){
		    var dureemois=parseInt($('.dureePreavis').val());
			var datedepo_sp=($('.dateDepot').val()).split('/');
			var datedepo_sp_str=datedepo_sp[2]+'-'+datedepo_sp[1]+'-'+datedepo_sp[0];
			var formattedDatedepo = new Date( datedepo_sp_str); //date de debut
         	var result_date_mois = addMonths(formattedDatedepo,parseInt(dureemois)+1);   //calcul des durees en mois

			var d = result_date_mois.getDate();
			var m =  result_date_mois.getMonth();
			m += 1;  // JavaScript months are 0-11
			var y = result_date_mois.getFullYear();

			d1 = d > 9 ? d : '0'+d;
			m1 = m > 9 ? m : '0'+m;

			formatDeb= d1 + "/" + m1 + "/" + y;

			d1 = d > 9 ? d : '0'+d;
			m1 = m > 9 ? m : '0'+m;

			formatDeb= d1 + "/" + m1 + "/" + y;

            date1=y+"-" +m1+"-"+ d1;  

			timestpdeb=new Date(date1);
			tamp1=parseInt( parseInt(timestpdeb.getTime())/1000 );

			if (!isNaN( y)) {
			$('.dateFin').val(timeConverter(tamp1) ) ;
		}

			console.log(tamp1); //Date de fin contrat format: 2019-10-02




	});

	</script>
</html>