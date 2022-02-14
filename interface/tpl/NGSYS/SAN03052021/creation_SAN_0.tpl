<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sanction</title>
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
	<link href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
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
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
	</style>
</head>   
<body  class='tpl_creation tpl_creation_san' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formsanct" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='SAN'>
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
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_SAN_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
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
					<div class="col2_partie" style="padding: 25px;">
						<!-- Matricule & Civilité -->
						<div class="form-group row">
							<div class="col-sm-5">
								<label>Matricule</label>
								<input type="text" name='POS_VAL_RUB_MAT'  value="{POS_VAL_RUB_MAT}" placeholder="Matricule" class="form-control"  data-parsley-pattern="^[A-Z0-9 ]*$" data-parsley-trigger="keyup" data-parsley-required="true">
							</div>
							<div class="col-sm-5">
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
						<!-- Nom & prénom -->
						<div class="form-group row">
							<div class="col-sm-5">
								<label>Nom</label>
								<input type="text" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" placeholder="Nom" class="form-control">
							</div>
							<div class="col-sm-7">
								<label>Pr&#233;noms</label>
								<input type="text" name='POS_VAL_RUB_PRE'  value="{POS_VAL_RUB_PRE}" placeholder="Pr&#233;noms" class="form-control">
							</div>
						</div>
						<!-- Departement & Servive -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>D&#233;partement</label>
								<input type="text"  name='POS_VAL_RUB_DPT' value="{POS_VAL_RUB_DPT}" placeholder="D&#233;partement" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Service</label>
								<input type="text" name='POS_VAL_RUB_SER' value="{POS_VAL_RUB_SER}"  placeholder="Service" class="form-control">
							</div>
						</div>
						<!-- Fonction -->
						<div class="form-group row">
							<div class="col-sm-8">
								<label>Fonction</label>
								<input type="text" name='POS_VAL_RUB_FON'  value="{POS_VAL_RUB_FON}" placeholder="Fonction" class="form-control">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFOS COMPLEMENTAIRES</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
						<!-- Date de faute & Date de demande d'explication -->
						<div class="form-group row">
							<div class="col-sm-5">
								<label>Date de faute</label>
								<input type="text" id="date1" name='POS_VAL_RUB_DAE'value="{POS_VAL_RUB_DAE}" class="form-control datepicker">
							</div>
							<div class="col-sm-7">
								<label>Date de demande d'explication</label>
								<input type="text" id="date2" name='POS_VAL_RUB_DAD' value="{POS_VAL_RUB_DAD}" class="form-control datepicker">
							</div>
						</div>
						<!-- Date de reception de dmde explication & Date de notification -->
						<div class="form-group row">
							<div class="col-sm-7">
								<label>Date de reception d'explication</label>
								<input type="text" id="date3" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" class="form-control datepicker">
							</div>
							<div class="col-sm-5">
								<label>Date de notification</label>
								<input type="text" id="date4" name="POS_VAL_RUB_DFE" value="{POS_VAL_RUB_DFE}" class="form-control datepicker">
							</div>
						</div>
						<!-- Nature du sanction & Commentaire -->
						<div class="form-group row">
							<div class="col-sm-10">
								<label>Nature du sanction</label>
								<input type="text" name='POS_VAL_RUB_NAT'  value="{POS_VAL_RUB_NAT}" placeholder="Nature du sanction" class="form-control">
							</div>
						</div>
						<!-- Nature du sanction & Commentaire -->
						<div class="form-group row">
							<div class="col-sm-10">
								<label>Commentaire</label>
								<textarea type="text"  rows="2" name='POS_VAL_RUB_COM' class="form-control" style="border: none; resize: none">{POS_VAL_RUB_COM}</textarea>
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

		$('#formsanct').parsley();

		$(document).ready(function () {
			 $('#date1,#date2,#date3,#date4').datepicker({
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