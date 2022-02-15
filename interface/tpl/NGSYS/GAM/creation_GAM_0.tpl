<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation de gamme</title>
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
			width: 22%;
			float: right;
			/*margin-right: 3%;*/
		}

		.col1_partie{
			width: 100%;
			/*height: 7vh; */
			font-family: 'Times New Roman';
			font-size: 15px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			padding: 5px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding-top: 5px;
		}
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
			background:transparent
		}
		span.text:after {
			content: "*";
			color: red;
			font-weight: 100;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_gam' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formGamme" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'  data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='GAM'>
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
		<div class="col_list">

			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/GAM/liste/liste_GAM_1.php?APPLI={NOM_APPLICATION}">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>

		</div>
		
		
		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">

				<div class="col-sm-12" style="margin-top: 20px">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>

					<div class="col2_partie" style="padding-top: 10px;">

						<div class="form-group row container-fluid">

							<div class="col-sm-12 text-center" style="margin-bottom: 30px;">
								<label style="font-weight: lighter;">
									Les champs avec (<span class='text'></span>) sont obligatoires.
								</label>
							</div>

							<div class="col-sm-6">
								<label for="bio" style="font-weight: lighter;">Famille <span class="text"></span>:</label>
								<select class="form-control typeDemande" style="width: 100%" required="true">
									<option value="" disabled selected>S&eacute;lectionner votre demande</option>
									<option value="1">Famille1</option>
									<option value="2">Famille2</option>
								</select>
							</div>

							<div class="col-sm-6">
								<label for="bio" style="font-weight: lighter;">Lib&#233;lle <span class="text"></span>:</label>
								<input type="text" placeholder="Base impossible" class="form-control" required="true">
							</div>

							<div class="col-sm-6" style="margin-top: 30px">
								<label for="bio" style="font-weight: lighter;">Code <span class="text"></span>:</label>
								<input type="text" placeholder="Brute" class="form-control" required="true">
							</div>

							<div class="col-sm-6" style="margin-top: 30px">
								<label for="bio" style="font-weight: lighter;">Contrat <span class="text"></span>:</label>
								<select class="form-control typeDemande" style="width: 100%" required="true">
									<option value="" disabled selected>S&eacute;lectionner votre demande</option>
									<option value="1">Contrat1</option>
									<option value="2">Contrat2</option>
								</select>
							</div>
							
						</div>
					</div>
				</div>

			</div>


			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg " type="submit" id="app" value="ENREGISTRER"  style="font-size: 12px;margin-left: 5%;" />
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

      		//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
					{CODE_ACTION_FERMER}
				}
			});

	        $('#formGamme').submit(function(event){
				event.preventDefault();
				
				if(confirm(" Confirmez-vous le traitement de cette action?" )){
		        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			        event.currentTarget.submit();
			    }else{
			    	return false;
			    }
	        });

	  	</script>
	<!-- END JQUERY  -->
</html>