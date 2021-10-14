<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registre employeur</title>
	<!-- -->
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
	
	<!--ABASS INCLUDE-->
	<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" />
	<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/bootstrap.css" rel="stylesheet" type="text/css" />
	<link type="text/css"  href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.css"></link>
	<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
	<link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>

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

	</style>
</head>
<body class='tpl_creation tpl_creation_reg' onLoad='initTplCreation();'style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formpret" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
			<input type='hidden' name='URL' value='{CODE_ACTION}'>
			<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
			<input type='hidden' name='POS_TYPEDOC' value='REG'>
			<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
			<input type='hidden' name='NB_ONGLETS' value='2'>

			<input type='hidden' class='appName' value="{NOM_APPLICATION}">
			
			<!-- important pour lancer la boite aux lettres  -->
			<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
			<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
			<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
			<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
			<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
			<!-- end important pour lancer la boite aux lettres  -->

		</div>

		 
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_REG_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		
		<nav class="container-fluid">
			<div class="col-sm-12 mt-5" style="margin-top: 3%;">
				<div class="col1_partie text-center">
					<span class="title text-while">DESCRIPTIF</span>
				</div>

				<div class="col2_partie">
					<span class="res" style="text-align: center; display: none"> result</span>
					<div class="row" style="padding-top: 1%;padding-bottom: 2%">
						<div class="col-sm-12 text-center" style="margin-bottom: 13px">
							<label>Les champs avec (<span class='text'></span>) sont obligatoires</label>
						</div>
						
						<div class="col-sm-6" style="margin-top: 13px">
							<label>Nom & pr&#233;noms<span class='text'></span> :</label>
							<select id="selection" name='POS_VAL_RUB_CIV' data-parsley-required="true" class="form-control selectNom personnel" style="width: 100%;" required="true">
								<option value="" selected>Veuillez s&#233;lectionner</option>
							</select>
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Classement dans la hièrarchie professionnelle :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Date du classement :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Salaire de base :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Date de fixation :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Prime d&#145;anciennet&#233; :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Prime de rendement :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Indemnit&eacute; de transport :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="margin-top: 13px">
							<label>Autres indemnit&eacute;s :</label>
							<input type="text" class="form-control autreindemn" placeholder="Autres indemnit&eacute;s" style="width: 100%">
						</div>

						<div class="col-sm-6" style="margin-top: 13px">
							<label>Horaire du travail :</label>
							<input type="text" class="form-control horaire" placeholder="Horaire du travail" value="40" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Date affectation :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Date de depart en cong&#233; :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Nombre de jours :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="margin-top: 13px">
							<label>Renum&#233;ration de cong&#233; :</label>
							<input type="text" class="form-control remun_cg" placeholder="Renum&#233;ration de cong&#233;" style="width: 100%">
						</div>

						<div class="col-sm-6" style="display: none;margin-top: 13px">
							<label>Date de la reprise de travail :</label>
							<input type="text" class="form-control" style="width: 100%">
						</div>

						<div class="col-sm-6" style="margin-top: 13px">
							<label>Cautionnement :</label><br>
							<input type="radio" name="caution" class="caution" value="OUI" style="margin-right: 0.2%;margin-left: 0.3%">

							<span style="font-size: 12px;margin-right: 3%">Oui</span>

							<input type="radio" name="caution" checked="checked" class="caution" value="NON" style="margin-right: 0.2%">

							<span style="font-size: 12px;">Non</span>
						</div>
					</div>
					<div class="row" style="margin-top: 13px">
						<label style="font-size: 19px;font-weight: 500;margin-left: 10px">EN NATURE</label>
						<br>
						<div class="col-sm-3" style="padding-left: 2%; padding-bottom: 2%">
							<label>Nourriture :</label><br>
							<input type="radio" name="nourriture" class="nourriture" value="OUI" style="margin-right: 0.2%;margin-left: 1%">
							<span style="font-size: 12px;margin-right: 3%">Oui</span>
							<input type="radio" name="nourriture" class="nourriture" value="NON" checked style="margin-right: 0.2%">
							<span style="font-size: 12px;">Non</span>
						</div>

						<div class="col-sm-3" style="padding-bottom: 2%">
							<label>Logement :</label><br>
							<input type="radio" name="logement" class="logement" name="POS_VAL_RUB_BUF" value="OUI" style="margin-left: 1%">
							<span style="font-size: 12px;margin-right: 3%">Oui</span>
							<input type="radio" name="logement" class="logement" value="NON" checked style="margin-right: 0.2%">
							<span style="font-size: 12px;">Non</span>
						</div>
					</div>
				</div>
			</div>


			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input  class="btn col-sm-2 btn_enreg1" value="ENREGISTRER" id="bouton" style="font-size: 12px;margin-left: 5%;">
			</div> 
		</nav>	
	</form>

	 <!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
	<!-- END JQUERY  -->

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/REG/personnel/personnel.js"></script>

	 <script>

		$(document).ready(function () {

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});


			//script du bouton enregistrer 
	        $('#formpret').submit(function(event){
				event.preventDefault();

				if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
			        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			          	event.currentTarget.submit();
			        }else{
			    	return false;
			    }
	        });
		     

			// select2 
	        $('.selectNom').select2({
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
			$('#formpret').parsley();
		});
		 
	</script>

</body>
</html>