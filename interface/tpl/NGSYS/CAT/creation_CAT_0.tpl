<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cat&#233;gorie de salaire</title>
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
		.col_list{
			height: 7vh;
			margin: 0 70%;
			padding: 1%;
			font-family: 'Times New Roman';
			font-size: 14px;
			background-color: transparent;
			font-weight: lighter; 
		}
		
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
			margin: 3% 0%;
		}
		
		.col12_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -3% 0%; 
			padding: 7px;
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
			margin: 3%;
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_cat' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formCAT" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>

	<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='CAT'>
				<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

					  <!-- nom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_NOM'  value="{USER_PRS_NOM}" id='input_nom' >
				<!--prénom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_PRE'  value="{USER_PRS_PRE}" id='input_pre'>
				<!--fonction de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_FON'  value="{USER_PRS_FON}" id='input_fon' >
				<!--departement de l'utilisateur-->
				<input class="form-control" type="hidden" name='POS_VAL_RUB_DPT' size='15' value="{USER_PRS_DPT}" >
        </div>

		<div class="row">
				<div class="col-sm-3 col_list">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            		<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_CAT_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
						<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
				</div>
			</div>
		<nav class="container-fluid">
			
			<div class="row" style="margin-top: 7%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-12 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTION</span>
					</div>
					<div class="col12_partie" style="padding-top: 3%;">
						<!-- Type de catégorie -->
						<div class="form-group">
							<label for="bio">Type de cat&eacute;gorie</label>
						   	<select class="form-control" id='id_rub_TCT'  name='POS_VAL_RUB_TCT' style="width: 40%" data-parsley-required="true">
								<option value="0">Veuillez s&eacute;lectionner</option>
								<option value="AGENT DE MAITRISE">AGENT DE MAITRISE</option>
								<option value="CADRE">CADRE</option>
								<option value="EMPLOYE">EMPLOYE</option>
							</select>
							<input type="hidden" class="form-control" name='POS_VAL_RUB_TCT'  value="{POS_VAL_RUB_TCT}" >
						</div>
						<!-- Cat&eacute;gorie & Coefficient -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Cat&eacute;gorie</label>
								<select class="form-control" id='id_rub_CAE' name='POS_VAL_RUB_CAE' style="width: 40%" data-parsley-required="true">
									<option value="0">Veuillez s&eacute;lectionner</option>
									<option value="10A">10A</option>
									<option value="10B">10B</option>
									<option value="10C">10C</option>
									<option value="11">11</option>
									<option value="1A">1A</option>
									<option value="1B">1B</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7A">7A</option>
									<option value="7B">7B</option>
									<option value="8A">8A</option>
									<option value="8B">8B</option>
									<option value="8C">8C</option>
									<option value="9A">9A</option>
									<option value="9B">9B</option>
								</select>
								<input type="hidden" name='POS_VAL_RUB_CAE' value="{POS_VAL_RUB_CAE}" class="form-control"  style="width: 100%">
							</div>
							<div class="col-sm-6">
								<label for="bio">Coefficient</label>
								<input type="number" name='POS_VAL_RUB_COE' value="{POS_VAL_RUB_COE}" class="form-control">
							</div>
						</div>
						<!-- Valeur initiale & Base -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Valeur initiale</label>
								<input type="number" name='POS_VAL_RUB_VAE' value="{POS_VAL_RUB_VAE}" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 100%">
							</div>
							<div class="col-sm-6">
								<label for="bio">Base</label>
								<input type="text" name='POS_VAL_RUB_BSE' value="{POS_VAL_RUB_BSE}" class="form-control">
							</div>
						</div>
						<!-- Sursalaire & Rendement -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Sursalaire</label>
								<input type="text" name='POS_VAL_RUB_SRA' value="{POS_VAL_RUB_SRA}" class="form-control" onBlur="javascript:maximum(this,'119');">
							</div>
							<div class="col-sm-6">
								<label for="bio">Rendement</label>
								<input type="text" name='POS_VAL_RUB_RDT' value="{POS_VAL_RUB_RDT}" onBlur="javascript:maximum(this,'119');" class="form-control">
							</div>
						</div>
						<!-- Indem rendement & Net -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Indem rendement</label>
								<input type="text" name='POS_VAL_RUB_IPS' value="{POS_VAL_RUB_IPS}" onBlur="javascript:maximum(this,'119');" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">Net</label>
								<input type="text" name='POS_VAL_RUB_NE1' value="{POS_VAL_RUB_NE1}" class="form-control" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%;background:transparent">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;;background:transparent"/>
			</div>  
		</nav>
			
	</form>
</body>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
 		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- END JQUERY  -->
	 <script>
		$('#formCAT').parsley();

		if($('.get_mode').val()=='CONSULTATION'){
				$('.btn').hide();
			}

	</script>
	
</html>