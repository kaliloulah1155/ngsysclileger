<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Type de mission</title>
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
<body  class='tpl_creation tpl_creation_tym' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formtypmission" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'  data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='TYM'>
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
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_TYM_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		<nav class="container-fluid">
			<div class="col-sm-12 mt-5" style="margin-top: -7%;">
				<div class="col1_partie text-center">
					<span class="title text-while">DESCRIPTIF</span>
				</div>
				<div class="col2_partie" style="padding-top: 3%;">
					<!-- Désignation 1 & Désignation 2 & Désignation 3 -->
					<div class="row">
						<div class="col-sm-4 form-group">
							<label for="bio">D&#233;signation 1</label>
							<input type="text" placeholder="D&#233;signation 1" name='POS_VAL_RUB_HTE'  value="{POS_VAL_RUB_HTE}"  class="form-control" style="width: 100%;">
						</div>
						<div class="col-sm-4 form-group">
							<label for="bio">D&#233;signation 2</label>
							<input type="text" placeholder="D&#233;signation 2" name='POS_VAL_RUB_NRR'  value="{POS_VAL_RUB_NRR}" class="form-control" style="width: 100%;">
						</div>
						<div class="col-sm-4 form-group">
							<label for="bio">D&#233;signation 3</label>
							<input type="text" placeholder="D&#233;signation 3" name='POS_VAL_RUB_FTR'  value="{POS_VAL_RUB_FTR}" class="form-control" style="width: 100%;">
						</div>
					</div>
					<!-- Désignation 4 & Désignation 5 & Désignation 6 -->
					<div class="row">

						<div class="col-sm-4 form-group">
							<label for="bio">D&#233;signation 4</label>
							<input type="text" placeholder="D&#233;signation 4"  name='POS_VAL_RUB_CDP'  value="{POS_VAL_RUB_CDP}" class="form-control" style="width: 100%;">
						</div>
						<div class="col-sm-4 form-group">
							<label for="bio">D&#233;signation 5</label>
							<input type="text" placeholder="D&#233;signation 5" name='POS_VAL_RUB_FCM'  value="{POS_VAL_RUB_FCM}" class="form-control" style="width: 100%;">
						</div>
						<div class="col-sm-4 form-group">
							<label for="bio">D&#233;signation 6</label>
							<input type="text" placeholder="D&#233;signation 6" name='POS_VAL_RUB_AVG'  value="{POS_VAL_RUB_AVG}" class="form-control" style="width: 100%;">
						</div>
					</div>
					<!-- Commentaire -->
					<div class="row">
						<div class="col-sm-6 form-group">
							<label for="bio">Commentaire</label>
							<textarea type="text" rows="2" name='POS_VAL_RUB_HIS'  class="form-control" style="width: 100%;resize:none">{POS_VAL_RUB_HIS}</textarea>
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

	 $('#formtypmission').parsley();
		 
	</script>
	
</html>