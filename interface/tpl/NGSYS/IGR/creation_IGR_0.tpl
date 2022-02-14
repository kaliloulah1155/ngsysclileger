<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation IGR</title>
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
			padding: 7px;
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
<body  class='tpl_creation tpl_creation_igr' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formigr" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'  data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='IGR'>
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
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_IGR_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
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
						<!-- Nom & Prénom -->
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
						<!-- brute & Base impossible -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Brute</label>
								<input type="text" name='POS_VAL_RUB_BRT'  value="{POS_VAL_RUB_BRT}" placeholder="Brute" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">Base impossible</label>
								<input type="text" name='POS_VAL_RUB_BSE'  value="{POS_VAL_RUB_BSE}" placeholder="Base impossible" class="form-control">
							</div>
						</div>
						<!-- Enfis & part(N) -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Enfts</label>
								<input type="text" name='POS_VAL_RUB_NEF'   value="{POS_VAL_RUB_NEF}" placeholder="Enfts" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">part(N)</label>
								<input type="text" name='POS_VAL_RUB_PRT'  value="{POS_VAL_RUB_PRT}" placeholder="part(N)" class="form-control">
							</div>
						</div>
						<!-- Coefficient(Q) & Base IGR(R) -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Coefficient(Q)</label>
								<input type="text"  name='POS_VAL_RUB_COE'  value="{POS_VAL_RUB_COE}"  placeholder="Coefficient(Q)" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">Base IGR(R)</label>
								<input type="text " name='POS_VAL_RUB_BGR'  value="{POS_VAL_RUB_BGR}"  placeholder="Base IGR(R)" class="form-control">
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
						<!-- Q1 & Q2 -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Q1</label>
								<input type="text" name='POS_VAL_RUB_K1'   value="{POS_VAL_RUB_K1}" placeholder="Q1" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">Q2</label>
								<input type="text" name='POS_VAL_RUB_K2' size='15' value="{POS_VAL_RUB_K2}" placeholder="Q2" class="form-control">
							</div>
						</div>
						<!-- Q3 & Q4 -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Q3</label>
								<input type="text" name='POS_VAL_RUB_K3' value="{POS_VAL_RUB_K3}"  placeholder="Q3" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">Q4</label>
								<input type="text" name='POS_VAL_RUB_K4'   value="{POS_VAL_RUB_K4}" placeholder="Q4" class="form-control">
							</div>
						</div>
						<!-- Q5 & Q6 -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label for="bio">Q5</label>
								<input type="text" name='POS_VAL_RUB_K5'   value="{POS_VAL_RUB_K5}" placeholder="Q5" class="form-control">
							</div>
							<div class="col-sm-6">
								<label for="bio">Q6</label>
								<input type="text" ame='POS_VAL_RUB_K6'  value="{POS_VAL_RUB_K6}" placeholder="Q6" class="form-control">
							</div>
						</div>
						<!-- IGR -->
						<div class="form-group row">
							<div class="col-sm-10">
								<label for="bio">IGR</label>
								<input type="text" name='POS_VAL_RUB_IGR'  value="{POS_VAL_RUB_IGR}" placeholder="IGR" class="form-control">
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

		 <script>
	  	$('#formigr').parsley();
	  </script>
	<!-- END JQUERY  -->
</html>