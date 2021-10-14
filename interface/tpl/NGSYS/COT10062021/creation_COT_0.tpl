<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&eacute;ation de contrat</title>
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
	<link href="https://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />

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
		
		/* media query 
		@media (min-width: 576px) { 
			.col2_partie{
				height: 60vh; 
			}
			
			.btn{
				font-size: 12px;
			}
		}

		@media (min-width: 992px) { 
			.col2_partie{
				height: 62vh; 
			}
		}

		@media (min-width: 1200px) {  
			.col2_partie{
				height: 63vh; 
			}
		}*/
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_cot' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formcontrat" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='COT'>
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


		 <!-- données de l'utilisateur connecté :recuperation du matricule-->
			<input type="hidden" name='POS_VAL_RUB_A2' class="viewmatricule" value="{POS_VAL_RUB_A2}" >
		<!--fin données de l'utilisateur connecté -->

		<div class= "row ">
			<div class="col_list text-center jumbotron px-3">
				<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
				<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_COT_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
					<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
				</a>
			</div>
		</div>
		
		<div class="row " style="display:none" >
			<div class="col_list text-center jumbotron px-3 ">
				<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
				<!--<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_COT_Own&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
					<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
				</a>-->
				<a onClick="lancer_question('Bal_COT_Own', 'A2', 0,'A2')"  >
					<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
				</a>
			</div>
		</div>
		
		
		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>
					<div class="col2_partie" style="padding-top: 7%;">
						<!-- civilite -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -1% 0%;">
								<label>Civilit&eacute;</label>
								<select id="selection" class="form-control" name='POS_VAL_RUB_CVL' id='id_rub_CVL' rows="1">
									<option value="0">Veuillez s&eacute;lectionner</option>
									<option value="M">Monsieur</option>
									<option value="MME">Madame</option>
									<option value="MLLE">Mademoiselle</option>
								</select>
								<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CVL' id='POS_VAL_CTRL_CVL' value='{POS_VAL_RUB_CVL}'>
							</div>
							<div class="col-sm-6" style="margin: -1% 0%;">
								<label>Matricule</label>
									<input  class="form-control" name='POS_VAL_RUB_MAT' oninput="this.value = this.value.toUpperCase()"   value="{POS_VAL_RUB_MAT}" id='input_mat' onBlur="javascript:maximum(this,'119');" autocomplete="on" onClick="closeSearch('search_suggest_mat')" data-parsley-pattern="^[A-Z0-9]*$" data-parsley-trigger="keyup">
							</div>
						</div>
						<!-- Nom & prénoms -->
						<div class="form-group row">
							<div class="col-sm-6">
								<label>Nom</label>
								<input  class="form-control" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" id='input_nom' onBlur="javascript:maximum(this,'119');" onkeyup="searchSuggest(this,'PRS', 'TPL', 'input_tpl', 'search_suggest_tpl');" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
							</div>
							<div class="col-sm-6">
								<label>Pr&eacute;noms</label>
								<input class="form-control" id="bio" rows="1" placeholder="Pr&eacute;noms" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" id='input_pre' onBlur="javascript:maximum(this,'119');" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
							</div>
						</div>
						<!-- Date de naissance & Lieu de naissance -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Date de naissance</label>
								<input type="text" id="date1" class="form-control datepicker" name="POS_VAL_RUB_DNS" value="{POS_VAL_RUB_DNS}" size="60" data-parsley-required="true">
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Lieu de naissance</label>
								<input  class="form-control" name='POS_VAL_RUB_LNS'  value="{POS_VAL_RUB_LNS}" id='input_lns' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_lns')" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
							</div>
						</div>
						<!-- fonction -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 0%">
								<label>Fonction</label>
							  	<input  class="form-control" name='POS_VAL_RUB_FON'  value="{POS_VAL_RUB_FON}" id='input_fon' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_fon')" data-parsley-required="true">
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFOS COMPLEMENTAIRES</span>
					</div>
					<div class="col2_partie" style="padding-top: 3%;">
						<!-- nature pièce & numero pièce -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Nature de la pi&egrave;ce</label>
									<select class=" form-control achievement" name='POS_VAL_RUB_NTP' id='id_rub_NTP'   >
										<option selected="selected" disabled="true">Selectionner la nature</option>
										<option value="ATTESTATION">Atttestation d'identit&eacute; </option>
										<option value="CARTE CONSULAIRE">Carte consulaire </option>
										<option value="CNI">Carte nationale d'identit&eacute; </option>
										<option value="PASSEPORT">Passeport </option>
										<option value="PERMIS DE CONDUIRE">Permis de conduire </option>
									</select> 
									<input type="hidden" name='POS_VAL_CTRL_NTP' id='POS_VAL_CTRL_NTP' value='{POS_VAL_RUB_NTP}' data-parsley-required="true">
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Num&eacute;ro du pi&egrave;ce</label>
							  	<input  class="form-control" name='POS_VAL_RUB_NPI'  value="{POS_VAL_RUB_NPI}" id='input_npi' onBlur="javascript:maximum(this,'119');" autocomplete="on" onClick="closeSearch('search_suggest_ntp')" data-parsley-required="true">
							</div>
						</div>
						<!-- Entrée en vigueur & Modalité de paiement  -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Entr&eacute;e en vigueur</label>
								<input type="text" id="date2" class="form-control datepicker" class="form-control datepicker" name='POS_VAL_RUB_MOI'  value="{POS_VAL_RUB_MOI}" id='input_moi' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_moi')" data-parsley-required="true">
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Modalit&eacute; de paiement</label>
								<input  class="form-control" name='POS_VAL_RUB_MDR'  value="{POS_VAL_RUB_MDR}" id='input_mdr' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_mdr')" data-parsley-required="true">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 0%">
								<label for="bio">P&eacute;riodicit&eacute; de paiement</label>
								<input  class="form-control" name='POS_VAL_RUB_PEI'  value="{POS_VAL_RUB_PEI}" id='input_pei' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_pei')" data-parsley-required="true">
							</div>
						</div>
						
						<!-- Date fin d&#146;&eacute;dition &  Droits et avantages -->
						<div class="form-group row">
							<div class="col-sm-7" style="margin: -0.5% 0%">
								<label for="bio">Droits et avantages</label>
								<textarea style="resize:none;"  class='form-control  ' wrap='SOFT' name='POS_VAL_RUB_DEP' cols='100' rows='3'>{POS_VAL_RUB_DEP}</textarea>
							</div>
						</div>
					</div>
				</div>
				<!-- phase relative -->
				<div class="col-sm-12 mt-5"style="margin-top: 5%;">
					<div class="col1_partie text-center">
						<span class="title text-while">REFERENCES TYPE CONTRAT</span>
					</div>
					<div class="col2_partie" style="padding-top: 3%;">
						<!-- Choix type de contrat & Abréviation & Date d'entrée  -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Choix type de contrat</label>
								<select id="selection" class="form-control contratentier" rows="1" name='POS_VAL_RUB_TYE' id='id_rub_TYE'>
									<option value="0">Veuillez s&eacute;lectionner</option>
									<option value="CONTRAT A DUREE DETERMINEE PROJET">Contrat &agrave; dur&eacute;e determin&eacute;e projet</option>
									<option value="CONTRAT A DUREE DETERMINEE SIMPLE">Contrat &agrave; dur&eacute;e determin&eacute;e simple</option>
									<option value="CONTRAT A DUREE INDETERMINEE ESSAI">Contrat &agrave; dur&eacute;e indetermin&eacute;e essai</option>
									<option value="CONTRAT A DUREE INDETERMINEE SIMPLE">Contrat &agrave; dur&eacute;e indetermin&eacute;e simple</option>
									<option value="CONSULTANT">Contrat consultant</option>
									<option value="STAGE ECOLE">Contrat stage &eacute;cole</option>
									<option value="STAGE QUALIFICATION">Contrat stage qualification</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_TYE' id='POS_VAL_CTRL_TYE' value='{POS_VAL_RUB_TYE}' data-parsley-required="true">

							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Abr&eacute;viation</label>
								<select id="selection" class="form-control contratabrege" rows="1" name='POS_VAL_RUB_ABR' id='id_rub_ABR'>
									<option value="0">Veuillez s&eacute;lectionner</option>
									<option value="CDD PROJET">CDD PROJET</option>
									<option value="CDD SIMPLE">CDD SIMPLE</option>
									<option value="CDI ESSAI">CDI ESSAI</option>
									<option value="CDI SIMPLE">CDI SIMPLE</option>
									<option value="CONSULTANT">CONSULTANT</option>
									<option value="STAGE ECOLE">STAGE ECOLE</option>
									<option value="STAGE QUALIFICATION">STAGE QUALIFICATION</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_ABR' id='POS_VAL_CTRL_ABR' value='{POS_VAL_RUB_ABR}' data-parsley-required="true">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Date d&#146;entr&eacute;e</label>
								<input class="form-control datepicker " id="date4" name="POS_VAL_RUB_DEI" value="{POS_VAL_RUB_DEI}" size="60" data-parsley-required="true">
							</div>
						</div>
						<!-- Date de fin de la période d'essai & Date de notification & Salaire -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Date de fin de la p&eacute;riode d&#146;essai</label>
								<input type="text" id="date5" class="form-control datepicker" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" size="60" >
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Date de notification</label>
								<input type="text" id="date6" class="form-control datepicker" name="POS_VAL_RUB_DNO" value="{POS_VAL_RUB_DNO}" size="60">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Date fin contrat</label>
								<input type="text" id="date7" name="POS_VAL_RUB_DFE" value="{POS_VAL_RUB_DFE}" size="60" class="form-control datepicker">
							</div>
						</div>
						<!-- Nombre de mois & Entreprise d'accueil & Salaire -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Nombre de mois</label>
								<select id="selection" class="form-control" rows="1" name='POS_VAL_RUB_MOI' id='id_rub_MOI'>
									<option value="0">mois</option>
									<option value="1">01</option>
									<option value="2">02</option>
									<option value="3">03</option>
									<option value="4">04</option>
									<option value="5">05</option>
									<option value="6">06</option>
									<option value="7">07</option>
									<option value="8">08</option>
									<option value="9">09</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">12</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_MOI' id='POS_VAL_CTRL_MOI' value='{POS_VAL_RUB_MOI}' data-parsley-required="true">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Entreprise d&#146;accueil</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_ENT'  value="{POS_VAL_RUB_ENT}" id='input_ent' onBlur="javascript:maximum(this,'119');" data-parsley-required="true"  />
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label for="bio">Salaire</label>
								<input type="number" id="salaire" class="form-control" name='POS_VAL_RUB_SLF'  value="{POS_VAL_RUB_SLF}" id='input_slf' onBlur="javascript:maximum(this,'119');" data-parsley-required="true" />
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<div type="submit" class="btn col-sm-2" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">FERMER</div>
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

	 //données de l'utilisateur connecté
	 var matricule=$('.matricule').val();
	  $('.viewmatricule').val(matricule);
	 //fin données de l'utilisateur connecté

	    $('.contratentier').on('change',function(){
			     var  contratentier=$(this).val();
				 switch(contratentier){
					  case "CONTRAT A DUREE DETERMINEE PROJET": $('.contratabrege').val("CDD PROJET");break;
					  case "CONTRAT A DUREE DETERMINEE SIMPLE":  $('.contratabrege').val("CDD SIMPLE");break;
					  case "CONTRAT A DUREE INDETERMINEE ESSAI":  $('.contratabrege').val("CDI ESSAI");break;
					  case "CONTRAT A DUREE INDETERMINEE SIMPLE":  $('.contratabrege').val("CDI SIMPLE");break;
					  case "CONSULTANT":  $('.contratabrege').val("CONSULTANT");break;
					  case "STAGE ECOLE":  $('.contratabrege').val("STAGE ECOLE");break;
					  case "STAGE QUALIFICATION":  $('.contratabrege').val("STAGE QUALIFICATION");break;
				 }
				//alert($(this).val());
		});

		 $('.contratabrege').on('change',function(){
			  var  contratabrege=$(this).val();
			   switch(contratabrege){
				     case "CDD PROJET": $('.contratentier').val("CONTRAT A DUREE DETERMINEE PROJET");break;
					 case "CDD SIMPLE":  $('.contratentier').val("CONTRAT A DUREE DETERMINEE SIMPLE");break;
					 case "CDI ESSAI":  $('.contratentier').val("CONTRAT A DUREE INDETERMINEE ESSAI");break;
					 case "CDI SIMPLE":  $('.contratentier').val("CONTRAT A DUREE INDETERMINEE SIMPLE");break;
					  case "CONSULTANT":  $('.contratentier').val("CONSULTANT");break;
					 case "STAGE ECOLE":  $('.contratentier').val("STAGE ECOLE");break;
					 case "STAGE QUALIFICATION":  $('.contratentier').val("STAGE QUALIFICATION");break;

			   }

		});

	 var prof_util = "{PROFIL_UTILISATEUR}";	 
	 
			switch (prof_util) {
			 case "ADMIN" :
				   $('.rhdmdcot').show();
		           $('.mydmdcot').hide();
					
					break;
			 case "RH":
				   $('.rhdmdcot').show();
		           $('.mydmdcot').hide();
					
					break;
			default:
			 $('.mydmdcot').show();
			
		}
	 	$(document).ready(function () {
			 $('#date1 , #date2, #date3, #date4, #date5, #date6, #date7').datepicker({
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

	 $('#formcontrat').parsley();
		var prof_util = "{PROFIL_UTILISATEUR}";	 
	
		switch (prof_util) {
			case "ADMIN" :
				$('.rhdmdabs').show();
				$('.mydmdabs').hide();
				
				break;
			case "RH":
				$('.rhdmdabs').show();
				$('.mydmdabs').hide();
				
				break;
		default:
			$('.mydmdabs').show();
		
		}

		$('.dureedebselect').on('change',function(){
			console.log($(this).val());
		});
		
		 
	</script>
	
</html>