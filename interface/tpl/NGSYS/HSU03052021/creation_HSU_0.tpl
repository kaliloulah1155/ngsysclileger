<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Heures supplementaires</title>
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

			.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_hsu' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formheuresupplementaire" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='HSU'>
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
			
					  <!-- nom de l'utilisateur-->
        </div>
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_HSU_Encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
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
					<div class="col2_partie" style="padding: 10px;">
						<!-- Matricule & Nom -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Matricule</label>
								<input  class="form-control" id="bio" name='POS_VAL_RUB_MAT'  value="{POS_VAL_RUB_MAT}" id='input_mat' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_mat')">

							</div>
							<div class="col-sm-6">
								<label for="bio">Nom</label>
								<input class="form-control" type="text" id="bio" name='POS_VAL_RUB_NMG' size='15' value="{POS_VAL_RUB_NMG}" onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">

							</div>
						</div>
						<!-- Prénom & Service -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Pr&#233;nom</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_PRE'  value="{POS_VAL_RUB_PRE}" id='input_pre' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">


							</div>
							<div class="col-sm-6">
								<label for="bio">Service</label>
								<input  type="text"  class="form-control" name='POS_VAL_RUB_SER'  value="{POS_VAL_RUB_SER}" id='input_ser' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_ser')">

							</div>
						</div>
						<!-- Jour(7h à 21h)HSJ & Nuit(21h à 7h)HSN -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Jour(7h &agrave; 21h)HSJ</label>
								<input type="number"  class="form-control" name='POS_VAL_RUB_HSJ'  value="{POS_VAL_RUB_HSJ}" id='input_hsj' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_hsj')">

							</div>
							<div class="col-sm-6">
								<label for="bio">Nuit(21h &agrave; 7h)HSN</label>
								<input type="number" class="form-control" name='POS_VAL_RUB_HSN'  value="{POS_VAL_RUB_HSN}" id='input_hsn' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_hsn')">

							</div>
						</div>
						<!-- Dimanche et de jour férié(7h à 21h)HSD -->
						<div class="form-group row">
							<div class="col-sm-8">
								<label for="bio">Dimanche et de jour f&#233;ri&#233;(7h &agrave; 21h)HSD</label>
								<input type="number"  class="form-control" name='POS_VAL_RUB_HSD'  value="{POS_VAL_RUB_HSD}" id='input_hsd' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_hsd')">

							</div>
						</div>
						<!-- Commentaires -->
						<div class="form-group row">
							<div class="col-sm-12">
								<label for="bio">Commentaires :</label>
								<textarea class="form-control" id="bio" style="resize: none;margin-top: -1%;" name='POS_VAL_RUB_COM'  rows='2'>{POS_VAL_RUB_COM}</textarea>

							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFOS SUPPLEMENTAIRES</span>
					</div>
					<div class="col2_partie" style="padding: 30px;">
						<label for="bio">Validation Manager</label>
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Nom</label>
								<input type="text"  class="form-control" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" id='input_nom' onBlur="javascript:maximum(this,'119');" onkeyup="searchSuggest(this,'PRS', 'TPL', 'input_tpl', 'search_suggest_tpl');" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
							</div>
							<div class="col-sm-6">
								<label for="bio">Pr&#233;nom</label>
								<input type="text" class="form-control " name='POS_VAL_RUB_PMG' size='15' value="{POS_VAL_RUB_PMG}" onBlur="javascript:maximum(this,'119');" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Date</label>
								<input type="text" class="form-control datepicker" id="date2" name='POS_VAL_RUB_DAA' size='15' value="{POS_VAL_RUB_DAA}" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<label style="padding-top= 15%"></label>
						<label for="bio">Accord Direction</label>
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Nom</label>
								<input type="text" class="form-control " name='POS_VAL_RUB_NDG' size='15' value="{POS_VAL_RUB_NDG}" onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">

							</div>
							<div class="col-sm-6">
								<label for="bio">Pr&#233;nom</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_PDG' size='15' value="{POS_VAL_RUB_PDG}" onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">

							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Date</label>
								<input class="form-control datepicker " name='POS_VAL_RUB_DAV' id="date3"  value="{POS_VAL_RUB_DAV}" onBlur="javascript:maximum(this,'119');" data-parsley-trigger="keyup">

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
				   $('.rhdmdhsu').show();
		           $('.mydmdhsu').hide();
					
					break;
			 case "RH":
				   $('.rhdmdhsu').show();
		           $('.mydmdhsu').hide();
					
					break;
			default:
			 $('.mydmdhsu').show();

			 $(document).ready(function () {
			 $('#date1, #date2, #date3').datepicker({
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
			
		}
		 $('#formheuresupplementaire').parsley();
	 
	</script>
	
</html>