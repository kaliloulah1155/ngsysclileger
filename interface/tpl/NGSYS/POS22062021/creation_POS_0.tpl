
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creation de poste</title>
	<link href="/NGSYS/include/style_nouveau/style_accueil.css" rel="stylesheet">
    <link href="/NGSYS/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET' />
	<script type='text/javascript' src='/NGSYS/include/script/association.js'></script> 
	<script type='text/javascript' src='/NGSYS/include/script/vocabulaire.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/fermeture.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/saisie.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/calendrier.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/attente_fichier.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/recupcontrolsaisie.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/navigation.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/action_tableau.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/ajax_search.js'></script>
	<script language='javascript' src='/NGSYS/include/script/ajax_recup_listhier.js'></script>
	<script language='javascript' src='/NGSYS/include/script/ajax_recup_arbo_dossier.js'></script>
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
		}
		
		.col12_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 17px;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 13px;
			padding-top: 5px;
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
	</style>
</head>   
<body  class='tpl_creation tpl_creation_pos' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal'  id="formposte" ACTION='/NGSYS/interface/session/principal/attente/attente.php' method='POST' onSubmit='return validerCreation();'  data-parsley-validate>	
			    <input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='POS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

		<nav class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col_list">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            		<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_POS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
						<span <span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
				</div>
			</div>
			<div class="row" style="margin-top: 5%">
				<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>
					<div class="col2_partie" style="padding-top: 7%;">
						<!-- Intitulé du poste & Mission du poste -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Intitul&#233; du poste</label>
								<input type="text" name='POS_VAL_RUB_IPO'  value="{POS_VAL_RUB_IPO}" placeholder="Intitul&#233; du poste" class="form-control" data-parsley-required="true">
							</div>
							<div class="col-sm-6">
								<label>Mission du poste</label>
								<textarea rows="2" name='POS_VAL_RUB_MPO'  class="form-control" style="resize: none">{POS_VAL_RUB_MPO}</textarea>
							</div>
						</div>
						<!-- Hiérarchie opérationnelle & Hiérarchie Fonctionnelle -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Hi&#233;rarchie op&#233;rationnelle</label>
								<input type="text" name='POS_VAL_RUB_HIO'  value="{POS_VAL_RUB_HIO}" placeholder="Hi&#233;rarchie op&#233;rationnelle" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Hi&#233;rarchie fonctionnelle</label>
								<input type="text" name='POS_VAL_RUB_HIF'  value="{POS_VAL_RUB_HIF}" placeholder="Hi&#233;rarchie op&#233;rationnelle" class="form-control">
							</div>
						</div>
						<!-- Activit&#233; principale & Indicateur de performance -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Activit&#233; principale</label>
								<textarea rows="2" name='POS_VAL_RUB_ACP'  class="form-control" style="resize: none">{POS_VAL_RUB_ACP}</textarea>
							</div>
							<div class="col-sm-6">
								<label>Indicateur de performance</label>
								<textarea rows="2" name='POS_VAL_RUB_IPE' class="form-control" style="resize: none"> {POS_VAL_RUB_IPE}</textarea>
							</div>
						</div>
						<!-- Relation intérieurs & Relation extérieurs -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Relation int&eacute;rieurs</label>
								<input type="text" name='POS_VAL_RUB_RIN' value="{POS_VAL_RUB_RIN}" placeholder="Relation int&eacute;rieurs" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Relation ext&eacute;rieurs</label>
								<input type="text" name='POS_VAL_RUB_REX' value="{POS_VAL_RUB_REX}" placeholder="Relation ext&eacute;rieurs" class="form-control">
							</div>
						</div>
						<!-- Moyens humains & Moyens materiels -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Moyens humains</label>
								<input type="text" name='POS_VAL_RUB_HUM' value="{POS_VAL_RUB_HUM}" placeholder="Moyens humains" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Moyens materiels</label>
								<textarea rows="2" name='POS_VAL_RUB_MAL' class="form-control" style="resize: none"> {POS_VAL_RUB_MAL}</textarea>
							</div>
						</div>
						<!-- Capacité technique & Capacité d'encadrement -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Capacit&eacute; technique</label>
								<input type="text" name='POS_VAL_RUB_CTA' value="{POS_VAL_RUB_CTA}" placeholder="Capacit&eacute; technique" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Capacit&eacute; d&apos;encadrement</label>
								<input type="text" name='POS_VAL_RUB_CEN' value="{POS_VAL_RUB_CEN}" placeholder="d&apos;encadrement" class="form-control">
							</div>
						</div>
						<!-- Capacité d'organisation & Capacité donimantes -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Capacit&eacute; d'organisation</label>
								<input type="text" name='POS_VAL_RUB_CO1' value="{POS_VAL_RUB_CO1}" placeholder="Capacit&eacute; d'organisation" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Capacit&eacute; donimantes</label>
								<input type="text" name='POS_VAL_RUB_QDO' value="{POS_VAL_RUB_QDO}" placeholder="Capacit&eacute; donimantes" class="form-control">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">PROFIL</span>
					</div>
					<div class="col2_partie" style="padding-top: 38px;padding-bottom: 32px;">
						<!-- Age -->
						<div class="form-group row">
							<div class="col-sm-5">
								<label>Age</label>
								<input type="text" name='POS_VAL_RUB_AGE' value="{POS_VAL_RUB_AGE}" placeholder="Age" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?"  >
							</div>
						</div>
						<!-- Formation initiale & Autre comp&eacute;tenc exig&eacute;e -->
						<div class="form-group row" style="margin-top: 7%">
							<div class="col-sm-6">
								<label>Formation initiale</label>
								<input type="text" name='POS_VAL_RUB_FOI' value="{POS_VAL_RUB_FOI}" placeholder="Formation initiale" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Autres comp&eacute;tences exig&eacute;es</label>
								<input type="text" name='POS_VAL_RUB_AUT' value="{POS_VAL_RUB_AUT}" placeholder="Autres comp&eacute;tences exig&eacute;es" class="form-control">
							</div>
						</div>
						<!-- exp&eacute;rience professionnelle & exp&eacute;rience dans la fonction -->
						<div class="form-group row" style="margin-top: 7%">
							<div class="col-sm-6">
								<label>Exp&eacute;rience dans la fonction</label>
								<input type="text" name='POS_VAL_RUB_EXF' value="{POS_VAL_RUB_EXF}" placeholder="exp&eacute;rience dans la fonction" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Exp&eacute;rience professionnelle</label>
								<input type="text" name='POS_VAL_RUB_EXP' value="{POS_VAL_RUB_EXP}" placeholder="exp&eacute;rience professionnelle" class="form-control">
							</div>
						</div>
						<!-- Niveau de formation & Diplome & Sp&eacute;cialit&eacute; -->
						<div class="form-group row" style="margin-top: 7%">
							<div class="col-sm-6">
								<label>Niveau de formation & Dipl&#244;me</label>
								<input type="text" name='POS_VAL_RUB_NFD' value="{POS_VAL_RUB_NFD}" placeholder="Niveau de formation & Dipl&#244;me" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Sp&eacute;cialit&eacute;</label>
								<input type="text" name='POS_VAL_RUB_SPE' value="{POS_VAL_RUB_SPE}" placeholder="Sp&eacute;cialit&eacute;" class="form-control">
							</div>
						</div>
						<!-- exp&eacute;rience professionnelle & Exigences particuli&#232;res -->
						<div class="form-group row" style="margin-top: 7%">
							<div class="col-sm-6">
								<label>Exp&eacute;rience professionnelle</label>
								<input type="text" name='POS_VAL_RUB_EX1'  value="{POS_VAL_RUB_EX1}" placeholder="exp&eacute;rience dans la fonction" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Exigences particuli&#232;res</label>
								<input type="text" name='POS_VAL_RUB_EXG' value="{POS_VAL_RUB_EXG}" placeholder="Exigences particuli&#232;res" class="form-control">
							</div>
						</div>
						<!-- Horaires de travail & Evolution de poste -->
						<div class="form-group row" style="margin-top: 7%">
							<div class="col-sm-6">
								<label>Horaires de travail</label>
								<input type="text" name='POS_VAL_RUB_HRT'  value="{POS_VAL_RUB_HRT}" placeholder="Horaires de travail" class="form-control">
							</div>
							<div class="col-sm-6">
								<label>Evolution de poste</label>
								<input type="text" name='POS_VAL_RUB_EVP' value="{POS_VAL_RUB_EVP}" placeholder="Evolution de poste" class="form-control">
							</div>
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
		  
		$('#formposte').parsley();

	 
	
	</script>
	
</html>