<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&eacute;ation client</title>
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
			height: 7vh; 
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
			height: 67vh; 
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding-left: 27px;
			padding-top: 5px;
		}
		
		.btn{
			width: 12%;
			height: 6vh;
			border: 1px solid #4a67b3;
			color: #4a67b3;
			text-align: center;
			margin: 2.5%;
		}
		
		/* media query 
		@media (min-width: 768px) { 
			body{
				background: blue;
			}
			.col2_partie{
				height: 100vh; 
			}
			
			.btn{
				font-size: 12px;
			}
		}

		@media (min-width: 992px) {  
		}*/

		@media (min-width: 1200px) {  
			.col2_partie{
				height: 70vh; 
			}
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_clt' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
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
				<div class="col-sm-4 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">IDENTIFICATION CLIENT</span>
					</div>
					<div class="col2_partie" style="padding-top: 7%;">
						<div class="form-group">
						   <!-- <label for="bio">Raison sociale :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Raison sociale" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Sigle :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Sigle" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">N&ring;CC :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="N&ring;CC" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">RCCM :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="RCCM" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Compte tiers :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Compte tiers" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Regime d&apos;imposition :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Regime d&apos;imposition" style="width: 90%;resize: none"></textarea>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-4 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">LOCALISATION</span>
					</div>
					<div class="col2_partie" style="padding-top: 7%;">
						<div class="form-group">
						   <!-- <label for="bio">Adresse :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Adresse" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Bo&Icirc;te postale :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Bo&icirc;te postale" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Ville :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Ville" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">E-mail :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="E-mail" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Site web :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Site web" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group" style="display: flex; flex-direction: row;">
						   <!-- <label for="bio">Contacts :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Contact 1" style="width: 40%;resize: none"></textarea>
						   <textarea class="form-control" id="bio" rows="1" placeholder="Contact 2" style="width: 40%;margin: 0 10%;resize: none"></textarea>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-4 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">COORDONNEES BANQUE</span>
					</div>
					<div class="col2_partie" style="padding-top: 7%;">
						<div class="form-group">
						   <!-- <label for="bio">Devise :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Devise" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Banque :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Banque" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">N&ring; compte :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="N&ring; compte" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">N&ring; contrat :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="N&ring; contrat" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Condition de r&egrave;glement :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Condition de r&egrave;glement" style="width: 90%;resize: none"></textarea>
						</div>
						<div class="form-group">
						   <!-- <label for="bio">Date d&apos;agrement :</label> -->
						   <textarea class="form-control" id="bio" rows="1" placeholder="Date d&apos;agrement" style="width: 90%;resize: none"></textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<div type="submit" class="btn col-sm-2" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">FERMER</div>
				<div type="resset" class="btn col-sm-2" style="font-size: 12px;" style="margin-left: 5%;">ENREGISTRER</div>
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