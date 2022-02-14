<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mission</title>
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
<body  class='tpl_creation tpl_creation_mis' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formission" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='MIS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				
				
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">

				
        </div>
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_MIS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
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
					<div class="col2_partie" style="padding-top: 5%;">
						<!-- Date de signature & Date de validation -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Date de signature</label>
								<input type="text" id="date1" class="form-control datepicker" name="POS_VAL_RUB_DSA" value="{POS_VAL_RUB_DSA}">

							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Date de validation</label>
								<input type="text" id="date2" class="form-control datepicker" name="POS_VAL_RUB_DAV" value="{POS_VAL_RUB_DAV}">
							</div>
						</div>
						<!-- Date de reception & Destination -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Date de reception</label>
								<input type="text" id="date3" class="form-control datepicker" name="POS_VAL_RUB_DAR" value="{POS_VAL_RUB_DAR}">

							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Destination</label>
								<input type="test" class="form-control" name='POS_VAL_RUB_DTN' value="{POS_VAL_RUB_DTN}" style="width: 100%;" onBlur="javascript:maximum(this,'119');" data-parsley-required="true" data-parsley-trigger="keyup">
							</div>
						</div>
						<!-- Pays & Société; -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Pays</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_PAY' value="{POS_VAL_RUB_PAY}" style="width: 100%;" onBlur="javascript:maximum(this,'119');" data-parsley-required="true" data-parsley-trigger="keyup">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Soci&#233;t&#233;</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_SOC' value="{POS_VAL_RUB_SOC}" style="width: 100%;" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<!-- Motif & Projet -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Motif</label>
								<textarea type="text" rows="2" class="form-control" name='POS_VAL_RUB_MTF' style="width: 100%; resize: none">{POS_VAL_RUB_MTF}</textarea>
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Projet</label>
								<textarea type="text" rows="2" class="form-control" name='POS_VAL_RUB_LPR' style="width: 100%; resize: none">{POS_VAL_RUB_LPR}</textarea>
							</div>
						</div>
						<!-- date début & date de fin -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Date d&#233;but</label>
								<input type="text" id="date4" class="form-control datepicker" name="POS_VAL_RUB_DAA" value="{POS_VAL_RUB_DAA}" data-parsley-required="true">

							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Date fin</label>
								<input type="text" id="date5" class="form-control datepicker" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" >

							</div>
						</div>
						<!-- heure départ & d'arrivée & durée -->
						<div class="row">
							<div class="col-sm-4 form-group">
								<label for="bio">Heure d&#233;part</label>
								<input type="time" class="form-control" name="POS_VAL_RUB_HRD" value="{POS_VAL_RUB_HRD}" style="width: 100%;">
							</div>
							<div class="col-sm-4 form-group">
								<label for="bio">Heure d&#146;arriv&#233;e</label>
								<input type="time" class="form-control" name="POS_VAL_RUB_HRA" value="{POS_VAL_RUB_HRA}" style="width: 100%;">
							</div>
							<div class="col-sm-4 form-group">
								<label for="bio">Dur&#233;e</label>
								<input type="number" class="form-control" name="POS_VAL_RUB_DUR" value="{POS_VAL_RUB_DUR}" style="width: 100%;">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFOS C0MPLEMENTAIRES</span>
					</div>
					<div class="col2_partie" style="padding-top: 9%;">
						<!-- Matricule & civilité -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label>Matricule</label>
								<input type="text" name='POS_VAL_RUB_MAT' class="form-control" data-parsley-pattern="^[A-Z0-9]*$" data-parsley-trigger="keyup" />
							</div>
							<div class="col-sm-4" style="margin: -1% 0%;">
								<label>Civilit&eacute;</label>
								<select id="selection" name='POS_VAL_RUB_CIV' class="form-control civilite" rows="1" data-parsley-required="true" >
									<option value="0" disabled="disabled" selected>Veuillez selectionner</option>
										<option value="M">Monsieur</option>
										<option value="MME">Madame</option>
										<option value="MLLE">Mademoiselle</option>
								</select>
								<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV' value='{POS_VAL_RUB_CIV}'>
							</div>
						</div>
						<!-- nom  & prenom-->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Nom</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_NOM' value="{POS_VAL_RUB_NOM}" id='input_nom' onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Pr&eacute;nom</label>
								<input type="text" class="form-control"  name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" id='input_prenom' onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">

							</div>
						</div>
						<!-- departement & service -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">D&eacute;partement</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_DPT' value="{POS_VAL_RUB_DPT}" onBlur="javascript:maximum(this,'119');">

							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Service</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_SER' value="{POS_VAL_RUB_SER}" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<!-- Fonction & moyen de transport -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Fonction</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_FON' value="{POS_VAL_RUB_FON}" onBlur="javascript:maximum(this,'119');">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Moyen de transport</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_MOT' value="{POS_VAL_RUB_MOT}" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<!-- Compagnie & Classe -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Compagnie</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_COP' value="{POS_VAL_RUB_COP}" onBlur="javascript:maximum(this,'119');">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Classe</label>
								<input type="text" class="form-control"  name='POS_VAL_RUB_CLA' value="{POS_VAL_RUB_CLA}" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<!-- Immatriculé & Nom du chauffeur -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Immatricul&eacute;</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_IMM' value="{POS_VAL_RUB_IMM}" onBlur="javascript:maximum(this,'119');">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Nom du chauffeur</label>
								<input type="text" class="form-control"  name='POS_VAL_RUB_NCH' value="{POS_VAL_RUB_NCH}" onBlur="javascript:maximum(this,'119');">
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

		$(document).ready(function () {
			$('#date1, #date2, #date3, #date4, #date5').datepicker({
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

		</script>
	
</html>