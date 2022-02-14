<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adherent</title>
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
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_abs' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_ABS_MyDMD&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<!-- 12_ 1 infos -->
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">SOUSCRIPTEUR</span>
					</div>
					<div class="col2_partie" style="padding: 2% 10%;">
						<!-- Dénomination client -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">D&#233;nomination client</label>
								<input type="text" class="form-control" placeholder="D&#233;nomination client" style="width: 100%">
							</div>
						</div>
						<!-- Adresse -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">Adresse</label>
								<input type="text" class="form-control" placeholder="Adresse" style="width: 100%">
							</div>
						</div>
						<!-- E-mail -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">E-mail</label>
								<input type="text" class="form-control" placeholder="E-mail" style="width: 100%">
							</div>
						</div>
						<!-- T&#233;l&#233;phone -->
						<div class="row">
							<div class="col-sm-12 form-group">
								<label for="bio">T&#233;l&#233;phone</label>
								<input type="text" class="form-control" placeholder="T&#233;l&#233;phone" style="width: 100%">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">IDENTIFICATION ASSURE PRINCIPAL</span>
					</div>
					<div class="col2_partie" style="padding: 10px;">
						<!-- Nom & Prénom -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Nom</label>
								<input type="text" class="form-control" placeholder="T&#233;l&#233;phone" style="width: 100%">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Pr&#233;nom</label>
								<input type="text" class="form-control" placeholder="Pr&#233;nom" style="width: 100%">
							</div>
						</div>
						<!-- E-mail & Téléphone -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">E-mail</label>
								<input type="text" class="form-control" placeholder="E-mail" style="width: 100%">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">T&#233;l&#233;phone</label>
								<input type="text" class="form-control" placeholder="T&#233;l&#233;phone" style="width: 100%">
							</div>
						</div>
						<!-- N° assuré ou Matricule & Option -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">N&#146;assur&#233; ou Matricule</label>
								<input type="text" class="form-control" placeholder="N&#146;assur&#233; ou Matricule" style="width: 100%">
							</div>
							<div class="col-sm-6 form-group">
								<label for="bio">Option</label>
								<input type="text" class="form-control" placeholder="Option" style="width: 100%">
							</div>
						</div>
						<!-- Date d'adhésion -->
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="bio">Date d&#146;adh&#233;sion</label>
								<input type="text" class="form-control" style="width: 100%">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 3%">
				<div class="col-sm-12 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">COMPOSOTION DE LA FAMILLE</span>
					</div>
					<div class="col2_partie" style="padding-top: 10px;">
						<table class="table">
							<thead>
								<tr style="padding-top:7%; text-align: center">
									<th class="table-primary">PARTENAIRES</th>
									<th>NOM ET PRENOM</th>
									<th>DATE NAISSANCE</th>
									<th>SEXE</th>
									<th>DATE D&#146;INCORPORATION</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td style="padding-left: 5%">Assur&#233;</td>
									<td>
										<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Assur&#233;" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
								</tr>
								<tr>
									<td style="padding-left: 5%">Conjoint</td>
									<td>
										<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Conjoint" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
								</tr>
								<!-- Enfant 1 -->
								<tr>
									<td style="padding-left: 5%">Enfant 1</td>
									<td>
										<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 1" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
								</tr>
								<!-- Enfant 2 -->
								<tr>
									<td style="padding-left: 5%">Enfant 2</td>
									<td>
										<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 2" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
								</tr>
								<!-- Enfant 3 -->
								<tr>
									<td style="padding-left: 5%">Enfant 3</td>
									<td>
										<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 3" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
								</tr>
								<!-- Enfant 4 -->
								<tr>
									<td style="padding-left: 5%">Enfant 4</td>
									<td>
										<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
									<td>
										<input type="text" placeholder="Enfant 4" class="form-control" style="width: 100%;margin: -9px 0px;">
									</td>
								</tr>
							</tbody>
						</table>
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
	<!-- END JQUERY  -->
	
</html>