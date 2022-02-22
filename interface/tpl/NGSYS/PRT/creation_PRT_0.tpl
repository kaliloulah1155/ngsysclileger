<!DOCTYPE html>
<html lang="fr">
<head>    
    <meta charset="UTF-8">   
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pr&#234;t d&#146;entreprise</title>
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="/{NOM_APPLICATION}/include/alert/sweetalert.css" rel="stylesheet"> -->
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET'/>
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
	<style>
		body{
			font-weight: lighter;
		}

		.col_list{
			width: 23%;
			float: right;
			margin-right: 5%;
		}

		.hearder_card{
			width: 100%;
			border: 1px solid #4a67b3; 
			padding: 1px;
		}
		
		.col1_partie{
			width: 100%;
			height: 7vh; 
			font-size: 16px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			margin: -1% 0%; 
			padding-top: 9px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -3% 0%; 
			padding-top: 3%;
			padding-left: 5%;
			padding-right: 5%;
			height: 30rem;
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

		label{
			font-size: 15px;
			font-weight: 100;
		}
		
	</style>
</head>
<body class='tpl_creation tpl_creation_prt' onLoad='initTplCreation();'style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formpret" class="cform" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='PRT'>
				<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
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

			 		 <!-- données de l'utilisateur connecté -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					 <!--fin données de l'utilisateur connecté -->

					 <input type='hidden' class='appName' value="{NOM_APPLICATION}">

		<!-- <div class= "row">
			<div class="col_list_01 text-center jumbotron">
				<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
				<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_PRT_Encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
					<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
				</a>
			</div>
		</div> -->

		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_PRT_lnv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>



		
		<nav class="container-fluid">
			<div class="col-sm-12 mt-5" style="margin-top: 1%;">
				<!-- 12_ 1 infos -->
				<div class="hearder_card jumbotron">
					<div class="h-5 text-primary" style="font-weight: bold">ETAT DE CREANCES</div>
				
				<!-- etat creance -->
				    <!-- nombre d'emprunt en cours -->
					<input type="hidden"  name='POS_VAL_RUB_A2A' value="{POS_VAL_RUB_A2A}" class="vnbreemprunt"  />
					 <!-- prelevement mensuel -->
					<input type="hidden"  name='POS_VAL_RUB_ADR' value="{POS_VAL_RUB_ADR}" class="vprelevmens"  />
					<input type="hidden"  name='POS_VAL_RUB_DC1' value="{POS_VAL_RUB_DC1}" class="vprelevmens_actuel"  />
					<input type="hidden" class="prelev_mens_lettre" name="POS_VAL_RUB_A1" value="{POS_VAL_RUB_A1}">

					 <!-- Quotité cessible-->
					<input type="hidden"  name='POS_VAL_RUB_QUO' value="{POS_VAL_RUB_QUO}" class="vqutotite"  />

					 <!-- montant d'emprunt en cours -->
					<input type="hidden"  name='POS_VAL_RUB_DDN' value="{POS_VAL_RUB_DDN}" class="vmtnemprunt"  />
					 <!-- date de fin prelevement -->
					<input type="hidden"  name='POS_VAL_RUB_DGR' value="{POS_VAL_RUB_DGR}" class="vdatefinprelev"  />
					 <!-- Quotité prelevable-->
					<input type="hidden"  name='POS_VAL_RUB_RDT' value="{POS_VAL_RUB_RDT}" class="vqutotiteprelev"  />

					<input type="hidden" class="L7" name='POS_VAL_RUB_L7'>
				<!--fin etat creance -->

					<div class="row" style="margin: 2%">
					    
					    <div class="col-sm-6 form-group">
					    	<label for="bio" style="width:200px">Nombre d'emprunt</label>:
							<span class="viewnombreEmp" style="margin-left: 2%">0</span>
					    </div>
					    <div class="col-sm-6 form-group">
					    	<label for="bio" style="width:200px">Montant emprunt</label>:
						    <span class="viewmontantEmp" style="margin-left: 2%">0</span>
						    <label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
					    </div>

					    <div class="col-sm-6 form-group">
					    	<label for="bio" style="width:200px">Pr&eacute;l&egrave;vement mensuel</label>:
						    <span class="viewmtnpreleve" style="margin-left: 2%">0</span>
						    <label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
					    </div>
					    <div class="col-sm-6 form-group">
					    	<label for="bio" style="width:200px">Date fin des pr&eacute;l&egrave;vements</label>:
						    <span class="viewdatefin" style="margin-left: 2%">12/06/2021</span>
					    </div>

					    <div class="col-sm-6 form-group">
					    	<label for="bio" style="width:200px">Quotit&eacute; cessible</label>:
							    <span class="viewquotite" style="margin-left: 2%">0</span>
						    <label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
					    </div>
					    <div class="col-sm-6 form-group">
					    	<label for="bio" style="width:200px">Quotit&eacute; pr&eacute;l&egrave;vable</label>:
							    <span class="viewquotiteprelev" style="margin-left: 2%">0</span>
					    	<label for="bio" style="margin-left: 2%;font-size: 10px">XOF</label>
					    </div>
					</div>

				</div>

				<!-- 12_ 2 infos -->
				<div class="col1_partie text-center">
					<span class="title text-while"> 
						    DEMANDE DE PRET N&deg; <span class="tnum"></span> 
					</span>  
					<input type="hidden" name='POS_VAL_RUB_COD' style="color:black;" class="numero" >
				</div>
				
				<div class="col2_partie">
					<div class="alert alert-danger flashalert" role="alert" style="display:none">
				       Votre montant prelevable est sup&eacute;rieur &agrave; votre quotit&eacute; cessible!! Veuillez changer le nombre de mois(Dur&eacute;e) et le Montante emprunt&acute;
					</div>
					
					<div class="col-sm-12 text-center" style="margin-bottom: 13px">
						<label>Les champs avec (<span class='text'></span>) sont obligatoires</label>
					</div>
					<div class="row" style="padding-top: 1%">
						<div class="col-sm-6 form-group">
						   <label for="bio">Montant emprunt&eacute;<span class='text'></span> :</label>
						   <input type="number"  name='POS_VAL_RUB_VEM' min="0" value="{POS_VAL_RUB_VEM}" class="form-control sommeEmprunt" id="bio" style="width: 100%;" required="true" data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup" required="true">

					<input type="hidden" name="POS_VAL_RUB_MDT" value="{POS_VAL_RUB_MDT}" class="emprunt_lettre" />
						
						</div>

						<div class="col-sm-6 form-group">
							<label for="bio">Date d&eacute;but de pr&eacute;l&egrave;vement<span class='text'></span> :</label>
							<input type="text" name='POS_VAL_RUB_DIN' value="{POS_VAL_RUB_DIN}" class="form-control datedebut" placeholder="jj/mm/aaaa" id="date1" style="width: 100%;" required="true">
						 </div>
						
						<div class="col-sm-6 form-group">
						   <label for="bio">Dur&eacute;e (en mois)<span class='text'></span> :</label>
						   <input type="number" name='POS_VAL_RUB_DUM' min="0" value="{POS_VAL_RUB_DUM}" class="form-control mois" id="bio" style="width: 100%;" required="true" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?">
							<input type="hidden" name="POS_VAL_RUB_DLA" value="{POS_VAL_RUB_DLA}" class="mois_lettre" />

						</div>
						
						<div class="col-sm-6 form-group">
						   <label for="bio">Date fin de pr&eacute;l&egrave;vement :</label>
						   <input type="text" name='POS_VAL_RUB_DFI' readonly= "true" value="{POS_VAL_RUB_DFI}" placeholder="jj/mm/aaaa" class="form-control dateFin " style="width: 100%;" required="true">
						</div>
					</div>
					<div class="col-sm-12 form-group" >
						<label for="bio">Motif<span class='text'></span></label>
						<input type="text" name='POS_VAL_RUB_COM' value="{POS_VAL_RUB_COM}" placeholder="Motif du pret" class="form-control" style="width: 100%;" required="true">
					</div>
					       <input type="hidden"  name='POS_VAL_RUB_CRE'  value="{POS_VAL_RUB_CRE}" class="createur"   />
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
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/calcpret/calc_prt.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRT/code/code.js"></script>  
	<!-- END JQUERY  -->

	<script>

		//Le nombre d'emprunt ne doit pas depasser 2
		$('form').submit(function () {

			var nbreEmprunt=$('.vnbreemprunt').val();
			if (nbreEmprunt==2) {
				alert("Le nombre d'emprunt est atteint.");
				return false;
			}

		});

 
		//Fin Traitement des creances 

	 	//données de l'utilisateur connecté


		var prof_util = "{PROFIL_UTILISATEUR}";	 
	 
			switch (prof_util) {
			 case "ADMIN" :
				   $('.rhdmdprt').show();
		           $('.mydmdprt').hide();
					
					break;
			 case "RH":
				   $('.rhdmdprt').show();
		           $('.mydmdprt').hide();
					
					break;
			default:
			 $('.mydmdprt').show();
			
		}

		var nom=$('.nom').val();
		var prenom=$('.prenom').val();
		var fonction=$('.fonction').val();
		var departement=$('.departement').val();

		// alert(nom);

		$('.viewnom').val(nom);
		$('.viewprenom').val(prenom);
		$('.viewfonction').val(fonction);
		$('.viewdepartement').val(departement);
		//fin données de l'utilisateur connecté

		$(document).ready(function () {

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			//script du bouton enregistrer 
	       /* $('#formpret').submit(function(event){
				event.preventDefault();

				if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
			        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			          	event.currentTarget.submit();
			        }else{
			    	return false;
			    }
	        });*/
	        

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
				dateFormat: 'dd/mm/yy',
			});
			$('#formpret').parsley();
		});
		 

		function addMonths(date, months) {
			var d = date.getDate();
			date.setMonth(date.getMonth() + +months);

			if (date.getDate() != d) {
			date.setDate(0);
			}
			return date;
		}

		$(document).on('change keyup','.mois, .datedebut',function(){
		    var dureemois=parseInt($('.mois').val());
			var datedepo_sp=($('.datedebut').val()).split('/');
			var datedepo_sp_str=datedepo_sp[2]+'-'+datedepo_sp[1]+'-'+datedepo_sp[0];
			var formattedDatedepo = new Date( datedepo_sp_str); //date de debut

         	var result_date_mois = addMonths(formattedDatedepo,parseInt(dureemois)+0); 
         	  //calcul des durees en mois
         	  		//console.log(result_date_mois);


			var d = result_date_mois.getDate();
			var m =  result_date_mois.getMonth();
			m += 1;  // JavaScript months are 0-11
			var y = result_date_mois.getFullYear();
			
			d1 = d > 9 ? d : '0'+d;
			m1 = m > 9 ? m : '0'+m;

			formatDeb= d1 + "/" + m1 + "/" + y;

			d1 = d > 9 ? d : '0'+d;
			m1 = m > 9 ? m : '0'+m;

			date1= d1 + "/" + m1 + "/" + y;
            //date1=y+"-" +m1+"-"+ d1;  

			//timestpdeb=new Date(date1);
			//tamp1=parseInt( parseInt(timestpdeb.getTime())/1000 );

			var tab_date = ($('.dateFin').val()).split('/');
			var mois = tab_date[1];  // mois
			var year = tab_date[2]; // année 

			// console.log("fdf ",tab_date);
			
			var map_date = new Map();
			map_date.set('01', 'Janvier');
			map_date.set('02', 'Fevrier');
			map_date.set('03', 'Mars');
			map_date.set('04', 'Avril');
			map_date.set('05', 'Mai');
			map_date.set('06', 'Juin');
			map_date.set('07', 'Juillet');
			map_date.set('08', 'Ao\u00fbt');
			map_date.set('09', 'Septembre');
			map_date.set('10', 'Octobre');
			map_date.set('11', 'Novembre');
			map_date.set('12', 'D\u00e9cembre');
			
			var dt_edit=`${map_date.get(mois)}/${year}`;
			// alert(dt_edit);
            //   console.log(dt_edit);

			  var end = dt_edit.replace('/', ' ');
			  $('.L7').val(end);
			// if($('.datedebut').val() && $('.mois').val()){
			// 	$('.L7').val(end);
				
			// }else{
				
			// }
			
			if (!isNaN( y)) {
			   $('.dateFin').val(date1);
			}

			
			//	console.log(date1); //Date de fin contrat format: 2019-10-02
		});

	 </script>

</body>
</html>