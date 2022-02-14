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
		.col_list{
			width: 23%;
			float: right;
			/*margin-right: 3%;*/
		}

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
			padding-left: 30px;
			padding-right: 30px;
		}
		
		
		.btn{
			font-size: 12px;
			border: 1px solid #4a67b3;
			background: transparent;
			color: #4a67b3;
			margin-top: 3%;
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
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_DBQ_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		<div class="row" style="margin-top: 5%">
			<div class="col-sm-6 text-center">
				<input type="radio" class="val_choix"  name="POS_VAL_RUB_E2" value="OUI" checked >
				<label for="bio">Je fais une domiciliation bancaire.</label>
			</div>      
			<div class="col-sm-6 text-center">
				<input type="radio" class="val_choix controlrad"  name="POS_VAL_RUB_E2" value="NON" >
				<label for="bio">Je fais un changement de banque.</label>
			</div>

			<input type="hidden" name='POS_VAL_CTRL_E2' id='POS_VAL_CTRL_E2' value='{POS_VAL_RUB_E2}'>
		</div>

		<nav class="container-fluid" style="margin-top: 3%">
			<div class="row" style="margin-top: 1%">
				<div class="col-sm-6 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">DOMICILIATION BANCAIRE</span>
					</div>
					<input type="hidden" class="form-control" id='input_civ' name='POS_VAL_RUB_CVL'/>
					<div class="col2_partie" style="padding-top: 3%;">
						<div class="form-group">
						   <label for="bio">Banque :</label>
						   <input type="text" class="form-control" id='input_bqe' name='POS_VAL_RUB_BQE'  data-parsley-required="true" data-parsley-trigger="keyup" readonly='true' style="width: 100%;"/>

						</div>
						<div class="form-group">
						   	<label for="bio">RIB :</label>
						   	<input type="text" class="form-control" id="input_rib"  name='POS_VAL_RUB_RIB'  data-parsley-required="true"  data-parsley-trigger="keyup" readonly='true' style="width: 100%;"/>
						</div>
						<div class="form-group">
							<input class="form-check-input cbk1" type="checkbox" id="input_radio" name="POS_VAL_RUB_E1" value="NON"  required>
                    		<span class="form-check-label" for="cgu" style="opacity: 0px">Je certifie les informations bancaires conforme !</span>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">CHANGEMENT DE BANQUE</span>
					</div>
					<div class="col2_partie" style="padding-top: 3%;">
						<div class="form-group">
						   <label for="bio">Nouvelle Banque :</label>
						   <select    name='POS_VAL_RUB_NBQ' id="nvlle_bnq" class="form-control" rows="1" style="margin: 0% 0%" rows="1" style="width: 100%;" >
									<option value="" selected>Veuillez s&#233;lectionner</option>
									<option value="Afrilan First Bank">Afrilan First Bank</option>
									<option value="Bank Of Africa">Bank Of Africa</option>
									<option value="Banque Atlantique">Banque Atlantique</option>
									<option value="BDA">BDA</option>
									<option value="Banque Populaire">Banque Populaire</option>
									<option value="BSIC">BSIC</option>
									<option value="BDU-CI">BDU-CI</option>
									<option value="BGFIBank">BGFIBank</option>
									<option value="BHCI">BHCI</option>
									<option value="BICICI">BICICI</option>
									<option value="BMS-CI">BMS-CI</option>
									<option value="BNI">BNI</option>
									<option value="Bridge Bank Group">Bridge Bank Group</option>
									<option value="CITI">CITI</option>
									<option value="Coris Bank">Coris Bank</option>
									<option value="Diamond">Diamond</option>
									<option value="Ecobank">Ecobank</option>
									<option value="GTBank">GTBank</option>
									<option value="NSIA">NSIA</option>
									<option value="Orabank">Orabank</option>
									<option value="Orange Banque">Orange Banque</option>
									<option value="Société Ivoirienne de Banque">Soci&#233;t&#233; Ivoirienne de Banque</option>
									<option value="SGBCI">SGBCI</option>
									<option value="Stanbic Bank">Stanbic Bank</option>
									<option value="Standard Chartered">Standard Chartered</option>
									<option value="UBA">UBA</option>
									<option value="Versus Bank">Versus Bank</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_NBQ' id='POS_VAL_CTRL_NBQ' value="{POS_VAL_RUB_NBQ}" placeholder="Banque" />
						</div>
						<div class="form-group">
						   <label for="bio">Nouveau RIB :</label>
						   <input type="text"class="form-control" id="nveau_rib" name='POS_VAL_RUB_NRI' data-parsley-trigger="keyup" readonly='true' style="width: 100%;">
						</div>
						<!-- unitile de le toucher  -->
						<div class="form-group" style="color: transparent;">
							<!-- <input class="form-check-input" type="checkbox" id="input_radio" required> -->
                    		<span class="form-check-label" for="cgu">Je certifie les informations bancaires conforme !</span>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row">
				<div class="col-sm-12" style="padding-left: 35%">
					<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="width: 19%;margin-left: 1%"/>
					<!--<input class="btn col-sm-2 suivant" type="submit" value="SUIVANT" style="width: 19%;margin-left: 7%;display: none" /> -->
					<input class="btn col-sm-2 enregiste" type="submit" id="input_btn" value="ENREGISTRER" disabled='true' style="width: 19%;margin-left: 7%;" />
				</div>
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
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DBQ/changebq/register_changebq.js"></script>
	<!-- END JQUERY  -->
	 <script>
	 	// griser degriser les cololnnes 

	 	$('.val_choix').on('click',function(){
				let val_choix = $(this).val();

				if(val_choix=="OUI"){
					$('#input_rib,#input_bqe').prop("readonly",true);   //degrise
					//alert('ok');
					$('#nvlle_bnq,#nveau_rib').prop("readonly",true);
 					$(".enregiste").val("ENREGISTER"); 
					 
				}
				if(val_choix=="NON"){
					//alert('nok');
					$('#input_rib,#input_bqe').prop("readonly",true);   //griser
					$('#nvlle_bnq,#nveau_rib').prop("readonly",false);
 					$(".enregiste").val("SUIVANT"); 
				}


		});

		$('.cbk1').on('click',function(){
				let cbk1 = $(this).val();
				if(cbk1=="OUI"){
					$('.enregiste').prop("disabled",true);
				}
				if(cbk1=="NON"){
					$('.enregiste').prop("disabled",false);
				}
		});

			// script de bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?. Vos donn\u00e9es seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});
	 


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