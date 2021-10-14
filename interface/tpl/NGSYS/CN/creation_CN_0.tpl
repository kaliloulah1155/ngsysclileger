<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation CN</title>
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
			margin: 3% 0%;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -3% 0%; 
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
			margin: 5%;
		}
		
		.col_list{
			height: 7vh;
			margin: 0 70%;
			padding: 1%;
			font-family: 'Times New Roman';
			font-size: 14px;
			background-color: transparent;
			font-weight: lighter; 
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

	</style>
</head>
<body  class='tpl_creation tpl_creation_cn' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formCN" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>	
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='CN'>
				<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

			
        </div>
		
		<nav class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col_list">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
					<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_CN_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
						<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            		</a>
				</div>
			</div>
			<div class="row" style="margin-top: 7%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-12 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTION</span>
					</div>
					<div class="col2_partie" style="padding: 15px;">
						<!-- nom & prenom  -->
						<div class="row">
							<div class="col-sm-5">
								<label for="bio">Nom</label>
								<input type="text" id='input_nom' class="form-control" name='POS_VAL_RUB_NOM' value="{POS_VAL_RUB_NOM}" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" onBlur="javascript:maximum(this,'119');">
							</div>
							<div class="col-sm-7">
								<label for="bio">Pr&eacute;nom</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" id='input_pre' data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<!-- Brute & 80% brute -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Brute</label>
								<input type="number" placeholder="00" name='POS_VAL_RUB_BRT' value="{POS_VAL_RUB_BRT}" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup">
							</div>
							<div class="col-sm-6">
								<label for="bio">80% brute</label>
								<input type="number" placeholder="00" class="form-control" name='POS_VAL_RUB_BRP' value="{POS_VAL_RUB_BRP}" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<!-- 1,5% & 5% -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">1,5%</label>
								<input type="number" placeholder="00" name='POS_VAL_RUB_VA1' value="{POS_VAL_RUB_VA1}" class="form-control" onBlur="javascript:maximum(this,'119');">
							</div>
							<div class="col-sm-6">
								<label for="bio">5%</label>
								<input type="number" placeholder="00" class="form-control" name='POS_VAL_RUB_VA2' value="{POS_VAL_RUB_VA2}" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
						<!-- 10% & N° CN -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">10%</label>
								<input type="number" placeholder="00" name='POS_VAL_RUB_VA3' value="{POS_VAL_RUB_VA3}" onBlur="javascript:maximum(this,'119');" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">CN</label>
								<input type="text" placeholder="00" name='POS_VAL_RUB_CNV' value="{POS_VAL_RUB_CNV}" class="form-control" onBlur="javascript:maximum(this,'119');">
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%;background:transparent">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;background:transparent"" />
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

		 	$('#formCN').parsley();

				if($('.get_mode').val()=='CONSULTATION'){
					$('.btn').hide();
				}
 
	</script>
	
</html>