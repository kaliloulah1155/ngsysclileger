<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consommation asur&#233;e</title>
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
<body class='tpl_creation tpl_creation_cas' onLoad='initTplCreation();' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formconso" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>

				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='CAS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_CAS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
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
					<div class="col2_partie" style="padding: 19px;">
						<!-- designation -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">D&#233;signation</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_DES'  value="{POS_VAL_RUB_DES}" placeholder="D&#233;signation" style="width: 100%;" data-parsley-required="true">
							</div>
						</div>
						<!-- Matricule & -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Matricule Ascoma</label>
								<input type="text" name='POS_VAL_RUB_MAT'  value="{POS_VAL_RUB_MAT}" class="form-control"placeholder="Matricule Ascoma" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Nom de l&#146;assur&#233;</label>
								<input type="text" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" class="form-control" placeholder="Nom de l&#146;assur&#233;" style="width: 100%;">
							</div>
						</div>
						<!-- Structure de soin & nature de soin -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Structure du soin</label>
								<input type="text" name='POS_VAL_RUB_MDR'  value="{POS_VAL_RUB_MDR}" class="form-control" placeholder="Structure du soin" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Nature du soin</label>
								<input type="text" name='POS_VAL_RUB_ADR'  value="{POS_VAL_RUB_ADR}" class="form-control" placeholder="Nature du soin" style="width: 100%;">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFO COMPLEMENTAIRE</span>
					</div>
					<div class="col2_partie" style="padding: 10px;">
						<!-- montant remboursés & non remboursés -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Montant rembours&eacute;s</label>
								<input type="text" name='POS_VAL_RUB_TXM'  value="{POS_VAL_RUB_TXM}" class="form-control" data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup"  placeholder="Montant rembours&eacute;s" style="width: 100%;">
							</div>
							<div class="col-sm-6">
								<label for="bio">Montant non rembours&eacute;s</label>
								<input type="text" name='POS_VAL_RUB_TVA'  value="{POS_VAL_RUB_TVA}" class="form-control" data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup"  placeholder="Montant non rembours&eacute;s" style="width: 100%;">
							</div>
						</div>
						<!-- date de la prestation & montant reclamés -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Date de la prestation</label>
								<input type="text" id="date1" name="POS_VAL_RUB_DAA" value="{POS_VAL_RUB_DAA}" class="form-control datepicker" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Montant r&eacute;clam&eacute;</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_MTT' value="{POS_VAL_RUB_MTT}" data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup"  placeholder="Montant r&eacute;clam&eacute;" style="width: 100%;">
							</div>
						</div>
						<!-- commentaires -->
						<div class="form-group">
						   <label for="bio">Commentaires :</label>
						  <textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_COM'  style="width: 80%;resize: none;"> {POS_VAL_RUB_COM}</textarea>
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

		$('#formconso').parsley();

		$(document).ready(function () {
			 $('#date1').datepicker({
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