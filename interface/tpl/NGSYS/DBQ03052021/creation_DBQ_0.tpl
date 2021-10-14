<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Domiciliation bancaire</title>
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
			padding-left: 27px;
			padding-top: 5px;
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
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
			margin: 2.5%;
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

	</style>
</head>
<body  class='tpl_creation tpl_creation_dbq' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formDBQ" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC'  value='DBQ'>
				<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				<input type='hidden' class='userinfo' value="{NOM_UTILISATEUR}">    
				
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


					 <!-- données de l'utilisateur connecté -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					 <!--fin données de l'utilisateur connecté -->
				
			</div>
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_DBQ_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');"   >
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFORMATIONS BANCAIRES</span>
					</div>

					 <!-- Civilité de l'utilisateur connecté -->
					 <input type="hidden" class="form-control" id='input_civ' name='POS_VAL_RUB_CVL'   />
					<div class="col2_partie" style="padding-top: 8%;">
						<div class="form-group">
						   <label for="bio">Banque :</label>
						   <input type="text" class="form-control" id='input_bqe' name='POS_VAL_RUB_BQE'  data-parsley-required="true" data-parsley-trigger="keyup" />
						</div>
						<div class="form-group">
						   	<label for="bio">RIB :</label>
						   	<input type="text" class="form-control" id="input_rib"  name='POS_VAL_RUB_RIB'  data-parsley-required="true" data-parsley-trigger="keyup" />
						</div>
						<div class="form-group" style="padding-top: 5%;">
						   <label for="bio">Voulez-vous domicilier votre compte &agrave; votre banque ?</label>
						   <input type="radio" id="male" name="gender" value="male" style="margin: 0 9px;">Non
						   <input type="radio" id="male" name="gender" value="male" style="margin: 0 10px;">Oui
						</div>						
						<div class="form-group" style="padding-top: 5%;">						
							<a href="../../../../images/menu/doc.pdf" style="color:#4a67b3;">
								<span style="color:#4a67b3;">Cliquez ici pour consulter la domiciliation</span>
							</a>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">CHANGEMENT DE BANQUE</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
						<div class="form-group">
						   <label for="bio">Ancienne Banque :</label>

						    <input type="text" class="form-control" id='input_anbqe' name='POS_VAL_RUB_ABQ'  data-parsley-required="true" data-parsley-trigger="keyup" />
						</div>
						<div class="form-group">
						   <label for="bio">Ancien RIB :</label>
 						   <input type="text" class="form-control" id='input_anrib' name='POS_VAL_RUB_ARI'  data-parsley-required="true" data-parsley-trigger="keyup" />

						</div>
						<div class="form-group" style="display:none">
						   <label for="bio">Certificat de redevance  :</label>
						   <input type="file" class="text-center file" style="margin-top: 0%;">
						</div>
						<div class="form-group">
						   <label for="bio">Nouvelle Banque :</label>
						   <textarea class="form-control" id="bio" name='POS_VAL_RUB_NBQ' rows="1" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 90%;resize: none">{POS_VAL_RUB_NBQ}</textarea>
						</div>
						<div class="form-group">
						   <label for="bio">Nouveau RIB :</label>
						   <textarea class="form-control" id="bio" name='POS_VAL_RUB_NRI' rows="1" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 90%;resize: none">{POS_VAL_RUB_NRI}</textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
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

		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DBQ/infos_user/infos_user.js"></script>
	<!-- END JQUERY  -->
	 <script>
		$('#formDBQ').parsley();

			if($('.get_mode').val()=='CONSULTATION'){
				$('.btn').hide();
			}

			var nom=$('.nom').val();
			var prenom=$('.prenom').val();
			var fonction=$('.fonction').val();
			var departement=$('.departement').val();

			$('.viewnom').val(nom);
			$('.viewprenom').val(prenom);
			$('.viewfonction').val(fonction);
			$('.viewdepartement').val(departement);
			//fin données de l'utilisateur connecté
 
	</script>
	
</html>