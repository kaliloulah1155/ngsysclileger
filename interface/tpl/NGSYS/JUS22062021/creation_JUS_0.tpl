<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Enregistrement justificatif</title>
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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script language='javascript' src='/NGSYS/include/script/action_accueil.js'></script>
	<style>
		body{
			font-weight: lighter;
		}
		
		.col1_partie{
			width: 100%;
			font-family: 'Times New Roman';
			font-size: 14px;
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
			padding-left: 27px;
			padding-top: 5px;
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
			margin: 2.5%;
		}
		
		.col_list{
			width: 50%;
			margin-top: 3%;
			margin-bottom: 3%;
			margin-right: 5%;
			font-family: 'Times New Roman';
			font-size: 17px;
			background-color: transparent;
			font-weight: lighter; 
			float: right;
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
	</style>
</head>
<body class='tpl_creation tpl_creation_prt' onLoad='initTplCreation();'style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formJUS" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
	
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC'  value='JUS'>
				<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
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
			
		<div class="col_list text-center px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_JUS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');"   >
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<!-- 12_ 1 infos -->
				<div class="col-sm-6" style="margin-top: 0%;">
					<div class="col1_partie text-center">
						<span class="title text-while">JUSTIFICATIF</span>
					</div>
					<div class="col2_partie" style="padding: 15px;">
						<!-- date début  & date fin -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Date d&#233;but</label>
								<input type="text" class="form-control datedeb datepicker" id="d1" data-parsley-required="true" data-parsley-trigger="keyup" name="POS_VAL_RUB_DIN"  value="{POS_VAL_RUB_DIN}">

							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Date fin</label>
								<input type="text" class="form-control datefin datepicker" id="d2" data-parsley-required="true" data-parsley-trigger="keyup" name="POS_VAL_RUB_DFI"  value="{POS_VAL_RUB_DFI}">
							</div>
						</div>
						<!-- Durée & Commentaire -->
						<div class="row">
							<div class="col-sm-4 form-group">
								<label for="bio">Dur&#233;e</label>
							  <input type="type" class="form-control duree" id="duree"  name='POS_VAL_RUB_DRU'  data-parsley-required="true"  data-parsley-trigger="keyup" value="{POS_VAL_RUB_DRU}"  >
							</div>
							<div class="col-sm-8 form-group">
								<label for="bio">Commentaire</label>
								<textarea  class="form-control" id="bio" name='POS_VAL_RUB_COM' rows="2" style="resize: none"  data-parsley-trigger="keyup">{POS_VAL_RUB_COM}</textarea>
							</div>
						</div>	
					</div>
				</div>
				<!-- 12_ 2 infos -->
				<div class="col-sm-6" style="margin-top: 0%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DOCUMENTS</span>
					</div>
					<div class="col2_partie" style="padding: 20px;">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  scrolling='auto' frameborder='0' style="width: 100%; margin: 0%;"></iframe>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
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
	<!-- END JQUERY  -->
	<script>
		$('#formJUS').parsley();

		 var nom=$('.nom').val();
	var prenom=$('.prenom').val();
	var fonction=$('.fonction').val();
	var departement=$('.departement').val();

	  $('.viewnom').val(nom);
	  $('.viewprenom').val(prenom);
	  $('.viewfonction').val(fonction);
	  $('.viewdepartement').val(departement);
	 //fin données de l'utilisateur connecté

			if($('.get_mode').val()=='CONSULTATION'){
				$('.btn').hide();
			}

			$(".duree").prop("readonly", true);
			
			$('#d1').datepicker({
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
			onSelect: function (dateStr) {
					var min = $(this).datepicker('getDate'); // Get selected date
					$("#d2").datepicker('option', 'minDate', min || '0'); // Set other min, default to today
				}
		});


            
			$('#d2').datepicker({
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
				onSelect: function (dateStr) {
						var max = $(this).datepicker('getDate'); // Get selected date
						$('#datepicker').datepicker('option', 'maxDate', max || '+1Y+6M'); // Set other max, default to +18 months
						var start = $("#d1").datepicker("getDate");
						var end = $("#d2").datepicker("getDate");
						var days = (end - start) / (1000 * 60 * 60 * 24);
						$(".duree").val(days);
					}
		});

	</script>
</html>