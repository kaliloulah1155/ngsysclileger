<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Assur&eacute;e</title>
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
			padding: 7px;
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
			margin-top: -3%;
			margin-right: 5%;
			font-family: 'Times New Roman';
			font-size: 17px;
			background-color: transparent;
			font-weight: lighter; 
			float: right;
		}
		
		.form-control3::before{
			position: absolute;
			content: 'Nom';
			display: none
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
<body  class='tpl_creation tpl_creation_ass' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formassure" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='ASS'>
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
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_ASS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		
		
		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<!-- 12_ 1 infos -->
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>
					<div class="col2_partie" style="padding: 5%;">
						<!-- Matricule & Civilité -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Matricule</label>
								<input type="text" name='POS_VAL_RUB_MAT'  value="{POS_VAL_RUB_MAT}"  placeholder="Matricule" class="form-control">
							</div>
							<div class="col-sm-5">
								<label for="bio">Civilit&eacute;</label>
								<select class="form-control civilite" name='POS_VAL_RUB_CIV' id='id_rub_CIV' rows="1"   >
										<option  disabled="true">Veuillez selectionner</option>
										<option value=""></option>
										<option value="M" >Monsieur</option>
										<option value="MME" >Madame</option>
										<option value="MLLE">Mademoiselle</option>
									</select>    
								<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV' value='{POS_VAL_RUB_CIV}'>
							</div>
						</div>
						<!-- Nom & prénom -->
						<div class="form-group row">
							<div class="col-sm-4">
								<label for="bio">Nom</label>
								<input type="text" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" placeholder="Nom" class="form-control">
							</div>
							<div class="col-sm-8">
								<label for="bio">Pr&#233;noms</label>
								<input type="text" name='POS_VAL_RUB_PRE'  value="{POS_VAL_RUB_PRE}" placeholder="Pr&#233;noms" class="form-control">
							</div>
						</div>
						<!-- Fonction & Anciennete -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Fonction</label>
								<input type="text" name='POS_VAL_RUB_FON'  value="{POS_VAL_RUB_FON}" placeholder="Fonction" class="form-control">
							</div>
							<div class="col-sm-6" style="float: right">
								<label for="bio">Sexe</label></br>
								<input type="radio" id="male" name="POS_VAL_RUB_SEX" value="F"><span style="font-size: 10px; margin-left: 2%">F</span>
								<input type="radio" id="male" name="POS_VAL_RUB_SEX" value="M" ><span style="font-size: 10px; margin-left: 2%">M</span>
								 <input type="hidden" name="POS_VAL_CTRL_SEX" value="{POS_VAL_RUB_SEX}">
							</div>
						</div>
						<!-- Motif & Dommages et interets -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Date de naissance</label>
								<input type="text" id="date1"  name='POS_VAL_RUB_DNS'  value="{POS_VAL_RUB_DNS}" class="form-control datepicker">
							</div>
							<div class="col-sm-6">
								<label>Status</label>
								<input type="text" name='POS_VAL_RUB_STT'  value="{POS_VAL_RUB_STT}" placeholder="Status"  class="form-control">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFOS COMPLEMENTAIRES</span>
					</div>
					<div class="col2_partie" style="padding: 39px;">
						<!-- Collège & total -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Coll&#232;ge</label>
								<input type="text" name='POS_VAL_RUB_CGL'  value="{POS_VAL_RUB_CGL}" placeholder="Coll&#232;ge" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Total</label>
								<input type="text" name="POS_VAL_RUB_TOT" value="{POS_VAL_RUB_TOT}" placeholder="Total" class="form-control">
							</div>
						</div>
						<!-- Date d'entrée & conjoint  -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Date d&#146;entr&#233;e</label>
								<input type="text" id="date2"  name='POS_VAL_RUB_DEI' value="{POS_VAL_RUB_DEI}"  class="form-control datepicker">
							</div>
						</div>
						<!-- ENfant & conjoint  -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Conjoint(e)</label>
								<textarea class="form-control" name='POS_VAL_RUB_CNJ' rows="3" style="width: 100%;resize: none" >{POS_VAL_RUB_CNJ}</textarea>
							</div>
							<div class="col-sm-6">
								<label>Enfant(s)</label>
								<textarea class="form-control" name='POS_VAL_RUB_EF1' rows="3" style="width: 100%;resize: none" >{POS_VAL_RUB_EF1}</textarea>
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
	  $('#formassure').parsley();
		$(document).ready(function () {
				$('#date1,#date2').datepicker({
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
		
		 
	</script>
</html>