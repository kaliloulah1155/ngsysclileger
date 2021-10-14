<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bulletin de paie</title>
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
			font-size: 14px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			padding: 5px; 
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
			background: transparent;
			color: #4a67b3;
			margin: 2.5%;
		}

	</style>
</head>
<body  class='tpl_creation tpl_creation_bup' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>	
		<nav class="container-fluid">
			<div class="row">
				<div class="col-sm-3 col_list">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
					<a href="#">
						<span <span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
				</div>
			</div>
			<div class="row" style="margin-top: 7%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-12 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTION</span>
					</div>
					<div class="col12_partie" style="padding-top: 3%;">
						<!-- civilite & matricule -->
						<div class="form-group row">
							<div class="col-sm-4" style="">
								<label for="bio">Civilit&eacute;</label>
								<select id="selection" class="form-control" rows="1">
									<option value="0">Civilit&eacute;</option>
									<option value="1">Monsieur</option>
									<option value="2">Madame</option>
									<option value="3">Mademoiselle</option>
								</select>
							</div>
							<div class="col-sm-4">
								<label for="bio">Matricule</label>
								<input type="text" placeholder="Matricule" class="form-control">
							</div>
						</div>
						<!-- nom & prenom -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Nom</label>
								<input class="form-control" id="bio" placeholder="Nom">
							</div>
							<div class="col-sm-5" style="margin: -0.5% 0%">
								<label for="bio">Pr&eacute;nom</label>
								<input class="form-control" id="bio" placeholder="Pr&eacute;nom">
							</div>
						</div>
						<!-- Fonction & Catégorie & d&partement -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Fonction</label>
								<input type="text" class="form-control" placeholder="Fonction">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Cat&#233;gorie</label>
								<input type="text" placeholder="Cat&#233;gorie" class="form-control">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">D&#233;partement</label>
								<input type="text" placeholder="D&#233;partement" class="form-control">
							</div>
						</div>
						<!-- Nationalité & Ancienneté & mois -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Nationalit&eacute;</label>
								<input type="text" placeholder="Nationalit&eacute;" class="form-control">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">nature de pi&egrave;ce</label>
								<input type="text" placeholder="nature de pi&egrave;ce" class="form-control">
							</div>
							<div class="col-sm-4" style="Mois">
								<label for="bio">nature de pi&egrave;ce</label>
								<input type="text" placeholder="Mois" class="form-control">
							</div>
						</div>
						<!-- Date d'embauche & N° de sécurité social & modalité de paiement -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Date d'embauche</label>
								<input type="date" class="form-control">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">N&#186; de s&#233;curit&#233; sociale</label>
								<input type="text" placeholder="N&#186; de s&#233;curit&#233; sociale" class="form-control">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Modalit&#233; de paiement</label>
								<input type="text" placeholder="Modalit&#233; de paiement" class="form-control">
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 5%">
				<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">INFORMATIONS NGSER</span>
					</div>
					<div class="col2_partie" style="padding-top: 7%;">
						<!-- Type de contrat & durée contrat -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Type de contrat</label>
							  <select id="selection" class="form-control" rows="1">
									<option value="0">Type de contrat</option>
									<option value="1">Contrat stage</option>
									<option value="2">Contrat CDD</option>
									<option value="3">Contrat CDI</option>
								</select>
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Dur&eacute;e de contrat</label>
								<input type="text" placeholder="Dur&eacute;e de contrat" class="form-control">
							</div>
						</div>
						<!-- departement & service -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">D&#233;partement</label>
								<input type="text" placeholder="D&#233;partement" class="form-control">
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Service</label>
								<input type="text" placeholder="Service" class="form-control">
							</div>
						</div>
						<!-- manager -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Manager</label>
								<input type="text" placeholder="Manager" class="form-control">
							</div>
						</div>
						<!-- Poste & matricule -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Poste</label>
								<input type="text" placeholder="Poste" class="form-control">
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Matricule</label>
								<input type="text" placeholder="Matricule" class="form-control">
							</div>
						</div>
						<!-- Cartegorie & Avantage -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Cart&eacute;gorie</label>
								<input type="text" placeholder="Cart&eacute;gorie" class="form-control">
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label for="bio">Avantage</label>
								<input type="text" placeholder="Avantage" class="form-control">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">INFORMATIONS BANQUE</span>
					</div>
					<div class="col2_partie" style="padding-top: 60px; padding-bottom: 55px">
						<!-- Salaire Net -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label for="bio">Salaire Net</label>
								<input type="text" placeholder="Salaire Net" class="form-control">
							</div>
						</div>
						<!-- Banque -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label for="bio">Banque</label>
								<input type="text" placeholder="Banque" class="form-control">
							</div>
						</div>
						<!-- RIB -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label for="bio">RIB</label>
								<input type="text" placeholder="RIB" class="form-control">
							</div>
						</div>
						<!-- N° CNPS -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label for="bio">N&ordm; CNPS</label>
								<input type="text" placeholder="N&ordm; CNPS" class="form-control">
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
	<!-- END JQUERY  -->
	 <script>
		  
	</script>
	
</html>