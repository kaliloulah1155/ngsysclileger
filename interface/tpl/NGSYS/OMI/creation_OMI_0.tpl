<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ordre de mission</title>
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

	<style>
		.col1_partie{
			width: 100%;
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
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 17px;
			padding-top: 5px;
		}
		
		.flex-justify{
			display: flex;
			flex-direction: row;
			justify-content: space-between;
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
			margin-top: -3%;
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
<body  class='tpl_consultation tpl_consultation_omi' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formordre_de_mission" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">


			<input type='hidden' name='URL' value='{CODE_ACTION}'>
						<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
						<input type='hidden' name='POS_TYPEDOC' value='OMI'>
						<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
						<input type='hidden' name='NB_ONGLETS' value='2'>
						
						<!-- important pour lancer la boite aux lettres  -->
						<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
						<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
						<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
						<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
						<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
		</div>

		<div class= "row rhdmdomi" style="display:none">
			<div class="col_list text-center jumbotron px-3">
				<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
				<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_ABS_MyDMD&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
					<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
				</a>
			</div>
		</div>

		</div>
			<div class= "row rhdmdomi" style="display:none">
				<div class="col_list text-center jumbotron px-3">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
					<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_OMI_Encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
						<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
				</div>
			</div>
		</div>
		

		<div class= "row mydmdomi" >
			<div class="col_list text-center jumbotron px-3">
				<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
				<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_OMI_Encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
					<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
				</a>
			</div>
		</div>
		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">LOCALITE</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
							<!-- destination & projet-->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Destination</label>
								<input type="text" id="bio" class="form-control" name='POS_VAL_RUB_DTN' value="{POS_VAL_RUB_DTN}" data-parsley-trigger="keyup" >
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Projet</label>
								<input id="bio" type="text" class="form-control" data-parsley-trigger="keyup" value="{POS_VAL_RUB_LPR}" >
							</div>
						</div>
						<!-- Motif du projet -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">Motif du projet</label>
								<textarea type="type" name="POS_VAL_RUB_MTF" class="form-control" id="bio" rows="2" style="width: 100%;resize: none" name="POS_VAL_RUB_MTF" data-parsley-trigger="keyup">{POS_VAL_RUB_MTF}</textarea>
							</div>
						</div>
						<!-- date début & fin -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Date d&#233;but</label>
								<input type="text" id="date1" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_DAA" value="{POS_VAL_RUB_DAA}">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Date fin</label>
								<input type="text" id="date2" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}">
							</div>
						</div>
						<!-- heure départ & d'arrivée & durée -->
						<div class="row">
							<div class="col-sm-4 form-group">
								<label for="bio">Heure d&#233;part</label>
								<input type="time" id="bio" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_HRD" value="{POS_VAL_RUB_HRD}">
							</div>
							<div class="col-sm-4 form-group">
								<label for="bio">Heure d&#146;arriv&#233;e</label>
								<input type="time" id="bio" class="form-control" style="width: 100%;"data-parsley-trigger="keyup" name="POS_VAL_RUB_HRA" value="{POS_VAL_RUB_HRA}">
							</div>
							<div class="col-sm-4 form-group">
								<label for="bio">Dur&#233;e</label>
								<input type="text" id="bio" class="form-control" style="width: 100%;" data-parsley-trigger="keyup" name="POS_VAL_RUB_DUR" value="{POS_VAL_RUB_DUR}">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">VOYAGEUR</span>
					</div>
					<div class="col2_partie" style="padding-top: 10%;">
						<div class="form-group row">
							<div class="col-sm-6">
								<!-- civilité -->
								<label for="selection">Civilit&eacute;</label>
								<select class="form-control" name='POS_VAL_RUB_CVL' id=id_rub_CVL>
									<option value="0">Civilit&eacute;</option>
									<option value="1">Monsieur</option>
									<option value="2">Madame</option>
									<option value="3">Mademoiselle</option>
								</select>
								<!--input  class="form-control" name='POS_VAL_RUB_CVL' id ='POS_VAL_RUB_CVL' value='{POS_VAL_RUB_CVL}'-->

							</div>
						</div>
						<!-- nom  & prenom-->
						<div class="row">
							<div class="col-sm-5 form-group">
								<label for="bio">Nom</label>
								<input type="text" class="form-control" id="bio" value="{POS_VAL_RUB_NOM}" name='POS_VAL_RUB_NOM'  data-parsley-pattern="^[a-zA-Z'_ ]*$"  data-parsley-required="true">
							</div>
							<div class="col-sm-7 form-group">
								<label for="bio">Pr&eacute;nom</label>
								<input type="text" class="form-control" id="bio" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" data-parsley-required="true">
							</div>
						</div>
						<!-- departement & service & fonction -->
						<div class="row">
							<div class="col-sm-4">
								<label for="bio">D&eacute;partement</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_DPT' size='15' value="{POS_VAL_RUB_DPT}" data-parsley-trigger="keyup">
							</div>
							<div class="col-sm-4">
								<label for="bio">Service</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_SER' size='15' value="{POS_VAL_RUB_SER}" data-parsley-trigger="keyup" >
							</div>
							<div class="col-sm-4 form-group">
							<label for="bio">Fonction</label>
							<input type="text" class="form-control" name='POS_VAL_RUB_FON' size='15' value="{POS_VAL_RUB_FON}" data-parsley-trigger="keyup" >
						</div>
						</div>
						<!-- moyen de transport -->
						<div class="row">
							<div class="col-sm-8 form-group">
								<label for="bio">Moyen de transport</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_MOT' size='20' value="{POS_VAL_RUB_MOT}" data-parsley-trigger="keyup" >
							</div>
						</div>
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
		var prof_util = "{PROFIL_UTILISATEUR}";	 
		
				switch (prof_util) {
				case "ADMIN" :
					$('.rhdmdomi').show();
					$('.mydmdomi').hide();
						
						break;
				case "RH":
					$('.rhdmdomi').show();
					$('.mydmdomi').hide();
						
						break;
				default:
				$('.mydmdomi').show();
				
		}

			$(document).ready(function () {
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

			$('#formordre_de_mission').parsley();
			 
			 

			

</script>
	
</html>