<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formation</title>
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
			padding: 9px;
			padding-top: 5px;
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
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
<body  class='tpl_creation tpl_creation_fmt' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal'  id="formation" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='FMT'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

				 
        </div>
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_FMT_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		<nav class="container-fluid">
			<div class="col-sm-12 mt-5" style="margin-top: -7%;">
				<div class="col1_partie text-center">
					<span class="title text-while">DESCRIPTIF</span>
				</div>
				<div class="col2_partie" style="padding-top: 3%;">
					<!-- Intitul&#233; de la formation & Intervenant & Lieu de formation -->
					<div class="row">
						<div class="col-sm-3 form-group">
							<label for="bio">Intitul&#233; de la formation</label>
							<input type="text" name='POS_VAL_RUB_INT'  value="{POS_VAL_RUB_INT}" placeholder="Intitul&#233; de la formation" class="form-control" style="width: 100%;"  data-parsley-required="true" >
						</div>
						<div class="col-sm-3 form-group">
							<label for="bio">Intervenant</label>
							<input type="text" name='POS_VAL_RUB_NOC'  value="{POS_VAL_RUB_NOC}" placeholder="Intervenant" class="form-control" style="width: 100%;"  data-parsley-required="true" >
						</div>
						<div class="col-sm-6 form-group">
							<label for="bio">Lieu de formation</label>
							<input type="text" name='POS_VAL_RUB_ADR'  value="{POS_VAL_RUB_ADR}" placeholder="Lieu de formation" class="form-control" style="width: 100%;">
						</div>
					</div>
					
					<!-- Date de d&#233;but & Date de fin & Heure d&#233;but & Heure fin -->
					<div class="row">
						<div class="col-sm-3 form-group">
							<label for="bio">Date de d&#233;but</label>
							<input type="text" id="date1" name="POS_VAL_RUB_DAA" value="{POS_VAL_RUB_DAA}"    class="form-control datepicker" style="width: 100%">
						</div>
						<div class="col-sm-3">
							<label for="bio">Date de fin</label>
							<input type="text" id="date2"  name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}"  class="form-control datepicker" style="width: 100%">
						</div>
						<div class="col-sm-3 form-group">
							<label for="bio">Heure d&#233;but de formation</label>
							<input type="time" name='POS_VAL_RUB_HRD'  value="{POS_VAL_RUB_HRD}" class="form-control" style="width: 100%;">
						</div>
						<div class="col-sm-3">
							<label for="bio">Heure fin de formation</label>
							<input type="time" name='POS_VAL_RUB_HRA'  value="{POS_VAL_RUB_HRA}" class="form-control" style="width: 100%;">
						</div>
					</div>
					<!-- Prix de la formation & Modalit&#233; de paiement & Moyen de paiement -->
					<div class="row">
						<div class="col-sm-4 form-group">
							<label for="bio">Prix de la formation  </label>
							<input type="text"  name='POS_VAL_RUB_MHT' data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup"  value="{POS_VAL_RUB_MHT}" class="form-control" placeholder="Prix de la formation & Modalit&#233;" style="width: 100%;">
						</div>
						<div class="col-sm-4">
							<label for="bio">Modalit&#233; de paiement</label>
							<input type="text" name='POS_VAL_RUB_MDR'  value="{POS_VAL_RUB_MDR}" class="form-control" placeholder="Modalit&#233; de paiement" style="width: 100%;">
						</div>
						<div class="col-sm-4 form-group">
							<label for="bio">Moyen de paiement</label>
							<input type="text" name='POS_VAL_RUB_MDT'  value="{POS_VAL_RUB_MDT}" class="form-control" placeholder="Moyen de paiement" style="width: 100%;">
						</div>
					</div>
					<!-- Objectif de la formation -->
					<div class="row">
						<div class="col-sm-6 form-group">
							<label for="bio">Objectif de la formation</label>
							<textarea type="text" class="form-control" name='POS_VAL_RUB_DEP' rows="2" style="width: 100%;resize:none">{POS_VAL_RUB_DEP}</textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<!-- <div type="submit" class="btn col-sm-2" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">FERMER</div> -->
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%;background:transparent">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;background:transparent" />
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

		 $('#formation').parsley();

		 $(document).ready(function () {
			 $('#date1 , #date2').datepicker({
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