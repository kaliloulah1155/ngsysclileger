<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salaire brute</title>
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
	<style>
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
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 17px;
			padding-top: 5px;
		}
		
		.flex-justify{
			display: flex;
			flex-direction: row;
			justify-content: space-between;
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
<body  class='tpl_creation tpl_creation_sbt' onLoad='initTplCreation();'  style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formsalairebrute" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>

				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='SBT'>
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
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_SBT_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
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
							<!-- Code & Civilité -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Code</label>
								<input type="text" name='POS_VAL_RUB_CDC'  value="{POS_VAL_RUB_CDC}" class="form-control" placeholder="Code" style="width: 100%">
							</div>
							<div class="col-sm-5">
								<label for="bio">Civilit&eacute;</label>
									<select id="selection" name='POS_VAL_RUB_CIV' class="form-control civilite" rows="1" data-parsley-required="true" >
									<option value="0" disabled="disabled" selected>Veuillez selectionner</option>
										<option value="M">Monsieur</option>
										<option value="MME">Madame</option>
										<option value="MLLE">Mademoiselle</option>
								</select>
								<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV' value='{POS_VAL_RUB_CIV}'>
							</div>
						</div>
						<!-- Nom & Prénom -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Nom</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}"  placeholder="Nom" style="width: 100%">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Pr&#233;noms</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_PRE'  value="{POS_VAL_RUB_PRE}"  placeholder="Pr&#233;noms" style="width: 100%">
							</div>
						</div>
						<!-- Service & Catégorie -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Service</label>
								<input type="text" name='POS_VAL_RUB_SER'  value="{POS_VAL_RUB_SER}" class="form-control" placeholder="Service" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Cat&#233;gorie</label>
								<input type="text" name='POS_VAL_RUB_CAE'  value="{POS_VAL_RUB_CAE}" class="form-control" placeholder="Cat&#233;gorie" style="width: 100%;">
							</div>
						</div>
						<!-- durée & Salaire de base -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Dur&#233;e</label>
								<input type="text" name='POS_VAL_RUB_DUR'  value="{POS_VAL_RUB_DUR}" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?" class="form-control" placeholder="Dur&#233;e" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Salaire de base</label>
								<input type="text" name='POS_VAL_RUB_BSE'  data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup" value="{POS_VAL_RUB_BSE}" class="form-control" placeholder="Salaire de base" style="width: 100%;">
							</div>
						</div>
						<!-- Sursalaire & Ancienneté -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Sursalaire</label>
								<input type="text" name='POS_VAL_RUB_SRA'   value="{POS_VAL_RUB_SRA}" class="form-control" placeholder="Sursalaire" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Anciennet&#233;</label>
								<input type="text" name='POS_VAL_RUB_ACI'  value="{POS_VAL_RUB_ACI}" class="form-control" placeholder="Anciennet&#233;" style="width: 100%;">
							</div>
						</div>
						<!-- Astreinte & Heure supplementaire -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Astreinte</label>
								<input type="text" name='POS_VAL_RUB_ATR'  value="{POS_VAL_RUB_ATR}" class="form-control" placeholder="Astreinte" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Heure supplementaire</label>
								<input type="time" name='POS_VAL_RUB_HSU'  value="{POS_VAL_RUB_HSU}" class="form-control" style="width: 100%;">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFOS COMPPLEMENTAIRES</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
						<!-- Transp imp  -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">Transp imp</label>
								<input type="text" name='POS_VAL_RUB_TRA' value="{POS_VAL_RUB_TRA}" class="form-control" id="bio" placeholder="Transp imp" style="width: 100%;">
							</div>
						</div>
						<!-- Salaire brute imp -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">Salaire brute imp</label>
								<input type="text" name='POS_VAL_RUB_SLI' size='15' value="{POS_VAL_RUB_SLI}" class="form-control" id="bio" placeholder="Salaire brute imp" style="width: 100%;">
							</div>
						</div>
						<!-- Representation -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">Representation</label>
								<input type="text" name='POS_VAL_RUB_RTN'  value="{POS_VAL_RUB_RTN}" class="form-control" placeholder="Representation" style="width: 100%;">
							</div>
						</div>
						<!-- Transport -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">Transport</label>
								<input type="text" name='POS_VAL_RUB_TRS'   value="{POS_VAL_RUB_TRS}" class="form-control" placeholder="Transport" style="width: 100%;">
							</div>
						</div>
						<!-- Salaire brute -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">Salaire brute</label>
								<input type="text" name='POS_VAL_RUB_SLB' value="{POS_VAL_RUB_SLB}" class="form-control"  data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup"  placeholder="Salaire brute" style="width: 100%;">
							</div>
						</div>
						<!-- Assurance & Net calculé  -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Assurance</label>
								<input type="text" name='POS_VAL_RUB_ASN'  value="{POS_VAL_RUB_ASN}" class="form-control" placeholder="Assurance" style="width: 100%;">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Net calcul&#233;</label>
								<input type="text" name='POS_VAL_RUB_NET'   value="{POS_VAL_RUB_NET}"  class="form-control" placeholder="Net calcul&#233;" style="width: 100%;">
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
		$('#formsalairebrute').parsley();
	</script>
	 
	
</html>