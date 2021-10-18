<!DOCTYPE html>
<html lang="fr">
<head>   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation de mission</title>
	<link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
	<!-- <link href="/{NOM_APPLICATION}/include/alert/sweetalert.css" rel="stylesheet"> -->
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

	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>

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
			margin: -1% 0%; 
			padding: 17px;
		}
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
			background:transparent
		}
		
		.parsley-error{
			border-style: solid;
  			border-color: red;
		}
		span.text:after {
		content: "*";
		color: red;
		}

	</style>
</head>
<body  class='tpl_creation tpl_creation_mis' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formission" ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		<div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='MIS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				
				
        </div>

		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_MIS_lnv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>


		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<div class="col-sm-12 mt-5" style="margin-top: 1%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>
					<div class="col2_partie" style="padding-top: 2%;">
						<div class="row">
						
						<!-- données de l'utilisateur connecté -->
					<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
					<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
					<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
					<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					
					 <!--fin données de l'utilisateur connecté -->
        
					<div class="col-sm-12 text-center" style="margin-bottom: 13px">
						<label>Les champs avec (<span class='text'></span>) sont obligatoires</label>
					</div>

		<!--<input type="hidden" name="POS_VAL_RUB_COD" value="{POS_VAL_RUB_COD}" class="numero" />-->
		<!--<input type="hidden" name="POS_VAL_RUB_NOM" value="{POS_VAL_RUB_NOM}" class="nom_pers" />-->
		<!--<input type="hidden" name="POS_VAL_RUB_PRE" value="{POS_VAL_RUB_PRE}" class="prenoms_pers" />-->



						<!--<div class="col-sm-4">
							<label for="bio">Voyageur <span class='text'></span> :</label>
							<select name="POS_VAL_RUB_MEL" class="form-control selectVos personnel" style="width: 100%;" required="true">
							    <option value="">Veuillez s&#233;lectionner</option>
							</select>
							<input type="hidden" class="init_personnel" name='POS_VAL_CTRL_MEL' id='POS_VAL_CTRL_MEL' value='{POS_VAL_RUB_MEL}' required="true">
						</div>-->
						<div class="col-sm-4">
							<label for="bio">Pays de destination  <span class='text'></span> :</label>
							<select name="POS_VAL_RUB_PAY"  class="form-control selectPas pays" style="width: 100%;" required="true">
 							</select>
							<input type="hidden" class="init_pays" name='POS_VAL_CTRL_PAY' id='POS_VAL_CTRL_PAY' value='{POS_VAL_RUB_PAY}' required="true">
						</div>
						<div class="col-sm-4">
							<label for="bio">Ville de destination <span class='text'></span> :</label>
							<select name="POS_VAL_RUB_VLE" class="form-control selectVis ville" style="width: 100%;">
 							</select>
							<input type="hidden" class="init_ville" name='POS_VAL_CTRL_VLE' id='POS_VAL_CTRL_VLE' value='{POS_VAL_RUB_VLE}' required="true">
						</div>
					

						
							<div class="col-sm-4">
								<label for="bio">Date de d&#233;part <span class='text'></span> :</label>
								<input type="text" name="POS_VAL_RUB_DAA" value="{POS_VAL_RUB_DAA}" placeholder="jj/mm/aaaa" class="form-control datepicker dateDepart" id="date1" style="width: 100%;" required="true">
							</div>
							<div class="col-sm-4">
								<label for="bio">Dur&#233;e <span class='text'></span> :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);"  name="POS_VAL_RUB_DUR" value="{POS_VAL_RUB_DUR}"  min="0" class="form-control duree" style="width: 100%;" required="true">
							</div>
							<div class="col-sm-4">
								<label for="bio">Date de retour :</label>
								<input type="text" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" placeholder="jj/mm/aaaa" class="form-control datefin" readonly='true' style="width: 100%;" required="true">
							</div>
						

							<div class="col-sm-4">
								<label for="bio">Moyen de transport <span class='text'></span> :</label>
								<select name="POS_VAL_RUB_MOT" class="form-control selectMoys" style="width: 100%;">
								    <option value="">Veuillez s&#233;lectionner</option>
								     <option value="AVION">Avion</option>
								     <option value="BATEAUX">Bateaux</option>
								     <option value="TRAIN">Train</option>
								     <option value="VOITURE">Voiture</option>
								</select>
								<input type="hidden" class="init_transport" name='POS_VAL_CTRL_MOT' id='POS_VAL_CTRL_MOT' value='{POS_VAL_RUB_MOT}'>
							</div>
							<div class="col-sm-4">
								<label for="bio">Compagnie :</label>
								<select name="POS_VAL_RUB_COP" class="form-control selectCops compagnie" style="width: 100%;">
 								</select>
								<input type="hidden" class="init_compagnie" name='POS_VAL_CTRL_COP' id='POS_VAL_CTRL_COP' value='{POS_VAL_RUB_COP}'>
							</div>
							<div class="col-sm-4">
								<label for="bio">Classe :</label>
								<select name="POS_VAL_RUB_CLA" class="form-control" style="width: 100%;">
								    <option value="">Veuillez s&#233;lectionner</option>
								     <option value="PREMIUM">Premium</option>
								    <option value="ECONOMIQUE">Economique</option>
								    <option value="AFFAIRE">Affaire</option>
								</select>
								<input type="hidden" class="init_classe" name='POS_VAL_CTRL_CLA' id='POS_VAL_CTRL_CLA' value='{POS_VAL_RUB_CLA}'>
							</div>

							<div class="col-sm-4">
								<label for="bio">Immatricul&eacute; :</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_IMM' value="{POS_VAL_RUB_IMM}" onBlur="javascript:maximum(this,'119');" style="width: 100%;">
							</div>
							<div class="col-sm-4">
								<label for="bio">Nom du chauffeur :</label>
								<input type="text" class="form-control"  name='POS_VAL_RUB_NCH' value="{POS_VAL_RUB_NCH}" onBlur="javascript:maximum(this,'119');" style="width: 100%;">
							</div>
							<div class="col-sm-4">
								<label for="bio">Client <span class='text'></span> :</label>
								<select name="POS_VAL_RUB_SOC" class="form-control selectClts client" style="width: 100%;">
 								</select>
 								<input type="hidden" class="init_client" name='POS_VAL_CTRL_SOC' id='POS_VAL_CTRL_SOC' value='{POS_VAL_RUB_SOC}'>
							</div>
						

							<div class="col-sm-4">
								<label for="bio">Projet :</label>
								<select name="POS_VAL_RUB_LPR" class="form-control selectProjs projet" style="width: 100%;">
 								</select>
								<input type="hidden" class="init_projet" name='POS_VAL_CTRL_LPR' id='POS_VAL_CTRL_LPR' value='{POS_VAL_RUB_LPR}' required="true">
							</div>
						</div>

						<div class="row" style="margin-top: 13px">
							<div class="col-sm-12">
								<label for="bio">Motif de la mission <span class='text'></span> :</label>
								<textarea type="text" rows="3" class="form-control motif_mis" name='POS_VAL_RUB_COM' style="width: 100%; resize: none">{POS_VAL_RUB_COM}</textarea>
							</div>
						</div>

						<div class="row" style="margin-top: 13px">
							<div class="col-sm-12">
								<label for="bio">Estimation frais de mission :</label>
								<table class="table" id="table_tache" style="width: 100%;margin: auto;">
									<tbody class="table_mis">
										<tr>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;">
												<label for="bio">DESIGNATION</label>
											</td>
											<td style="width: 45px; border: 1px solid;font-weight: bold;text-align: center;">
												<label for="bio">PRIX UNITAIRES</label>
											</td>
											<td style="width: 45px; border: 1px solid;font-weight: bold;text-align: center;">
												<label for="bio">QUANTITES</label>
											</td>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;">
												<span>TOTAL XOF</span>	
											</td>
										</tr>
										<tr>
											<td style="width: 30px; border: 1px solid">
												<span>Hotel</span>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_PU1" value="{POS_VAL_RUB_PU1}"   onkeypress="return testNum(event, this, 2);"  min="0" class="form-control pu1" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_QT1" value="{POS_VAL_RUB_QT1}"   onkeypress="return testNum(event, this, 2);"  min="0" class="form-control qte1" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_TO1" value="{POS_VAL_RUB_TO1}"   onkeypress="return testNum(event, this, 2);"  min="0" class="form-control tot1" style="width: 100%;background: transparent;">
											</td>
										</tr>
										<tr>
											<td style="width: 30px; border: 1px solid">
												<span>Nouriture</span>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_PU2" value="{POS_VAL_RUB_PU2}" onkeypress="return testNum(event, this, 2);"  min="0" class="form-control pu1" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_QT2" value="{POS_VAL_RUB_QT2}" onkeypress="return testNum(event, this, 2);"  min="0" class="form-control qte1" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_TO2" value="{POS_VAL_RUB_TO2}" onkeypress="return testNum(event, this, 2);" readonly="true"  min="0" class="form-control tot1" style="width: 100%;background: transparent;">
											</td>
										</tr>
										<tr>
											<td style="width: 30px; border: 1px solid;font-weight: 500;">
												<span>SOUS-TOTAL 1</span>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" disabled="true" class="form-control" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" disabled="true" class="form-control" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text"  class="form-control stotal1" name="POS_VAL_RUB_E1" value="{POS_VAL_RUB_E1}" readonly="true" style="width: 100%;background: transparent;">
											</td>
										</tr>
										<tr>
											<td style="width: 30px; border: 1px solid">
												<span>Co&#251;t moyen de transport</span>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" onkeypress="return testNum(event, this, 2);"name="POS_VAL_RUB_PU3" value="{POS_VAL_RUB_PU3}"  min="0" class="form-control pu2" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_QT3" value="{POS_VAL_RUB_QT3}" onkeypress="return testNum(event, this, 2);"  min="0" class="form-control qte2" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_TO3" value="{POS_VAL_RUB_TO3}" onkeypress="return testNum(event, this, 2);"  min="0" class="form-control tot2" style="width: 100%;background: transparent;">
											</td>
										</tr>
										<tr>
											<td style="width: 30px; border: 1px solid">
												<span>Frais d&#145;assurance de voyage</span>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" onkeypress="return testNum(event, this, 2);" name="POS_VAL_RUB_PU4" value="{POS_VAL_RUB_PU4}"  min="0" class="form-control pu2" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" onkeypress="return testNum(event, this, 2);"name="POS_VAL_RUB_QT4" value="{POS_VAL_RUB_QT4}"  min="0" class="form-control qte2" style="width: 100%;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_TO4" value="{POS_VAL_RUB_TO4}" onkeypress="return testNum(event, this, 2);" readonly="true"  min="0" class="form-control tot2" style="width: 100%;background: transparent;">
											</td>
										</tr>
										<tr>
											<td style="width: 30px; border: 1px solid;font-weight: 500;">
												<span>SOUS-TOTAL 2</span>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" disabled="true" class="form-control" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" disabled="true" class="form-control" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_E2" value="{POS_VAL_RUB_E2}" value="0" readonly="true" class="form-control stotal2" style="width: 100%;background: transparent;">
											</td>
										</tr>
										<tr>
											<td style="width: 30px; border: 1px solid;font-weight: bold;">
												<span>TOTAL FRAIS DE PERS</span>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" disabled="true" class="form-control" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" disabled="true" class="form-control" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input type="text" name="POS_VAL_RUB_E3" value="{POS_VAL_RUB_E3}" readonly="true" class="form-control sum_total" style="width: 100%;background: transparent;">
											</td>
										</tr>

									</tbody>
								</table>
							</div>
						</div>

					</div>	
				</div>	
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg" type="submit" id="app" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
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
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
	<!-- END JQUERY  -->
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/personnel/personnel.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/packs/packages.js"></script>
	<script language='javascript' src="../../../../include/script/testNum.js"></script>
	<!-- <script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script> -->

	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/MIS/code/code.js"></script>
		<script>



		$(document).ready(function () {

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			//script du bouton enregistrer 
	        $('#formission').submit(function(event){
				event.preventDefault();

				if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
			        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			          	event.currentTarget.submit();
			        }else{
			    	return false;
			    }
	        });
			
			var nom=$('.nom').val();
			var prenom=$('.prenom').val();
			var fonction=$('.fonction').val();
			var departement=$('.departement').val();

			$('.viewnom').val(nom);
			$('.viewprenom').val(prenom);
			$('.viewfonction').val(fonction);
			$('.viewdepartement').val(departement);
			//fin données de l'utilisateur connecté


			// select2 
            $('.selectVos,.selectPas,.selectVis,.selectCops,.selectClts,.selectProjs').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });


			$('#date1, #date2').datepicker({
				altField: "#datepicker",
				closeText: 'Fermer',
				prevText: 'Précédent',
				nextText: 'Suivant',
				currentText: 'Aujourd\'hui',
				monthNames: ['Janvier', 'F&#233;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'D&#233;cembre'],
				monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
				dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
				dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
				dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
				weekHeader: 'Sem.',
				dateFormat: 'dd/mm/yy'
			});
		});
			
		$('#formission').parsley();


			function timeConverter(UNIX_timestamp){
		var a = new Date(UNIX_timestamp * 1000);
		var months = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','A\u00f4ut','Septembre','Octobre','Novembre','D\u00e9cembre'];
		var year = a.getFullYear();
		//var month = months[a.getMonth()];
		var month = a.getMonth();
		var date = a.getDate();     
		var hour = a.getHours();
		var min = a.getMinutes();
		var sec = a.getSeconds();
		var weekday = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
		//var dayGetName=weekday[a.getDay()];
		var dayGetName=a.getDay();
		hour1 = hour > 9 ? hour : '0' + hour;
		min1 = min > 9 ? min : '0' + min;
		sec1 = sec > 9 ? sec : '0' + sec;
		//var time = dayGetName + ' ' +date + ' ' + month + ' ' + year + ' \u00E0 ' + hour1 + ':' + min1 + ':' + sec1 ;

		
		d1 = date > 9 ? date : '0'+date;
		m1 = month > 9 ? month : '0'+month;



		var time =d1 +'/'+ m1+'/'+year ;
		return time;    
	}

 
	$(document).on('change keyup','.duree, .dateDepart',function(){



		    var dureemois=parseInt($('.duree').val());
			var datedepo_sp=($('.dateDepart').val()).split('/');
			var datedepo_sp_str=datedepo_sp[2]+'-'+(parseInt(datedepo_sp[1])+1)+'-'+datedepo_sp[0];
			var formattedDatedepo =  new Date(datedepo_sp_str); //date de debut

         	 
            var result_date_jrs = formattedDatedepo.setDate(formattedDatedepo.getDate() +dureemois)  ;	    //cacul le nombre de jours  en timestamps

            var y =formattedDatedepo.getFullYear();
            if (!isNaN( y)) {
            	$('.datefin').val('');
          		$('.datefin').val(timeConverter(parseInt(result_date_jrs/1000) ));
          	}
        

 	});


		</script>
	
</html>