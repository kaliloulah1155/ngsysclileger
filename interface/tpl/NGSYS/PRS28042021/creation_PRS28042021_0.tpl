<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche d&#146;identification</title>
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
			font-size: 15px;
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

		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
		
		
	</style>
</head>
<body  class='tpl_creation tpl_creation_prs' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formperso" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>	
	     		<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='PRS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">

		
		       <!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

		<nav class="container-fluid">
			<div class="row" >
				<div class="col-sm-3 col_list">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
					<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_PRS_Encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
						 <span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
				</div>
			</div>

			<!--<div class="row mydmdprs" style= "display:none">
				<div class="col-sm-3 col_list">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
					<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_PRS_Own&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
						 <span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
				</div>
			</div> -->
			<div class="row" style="margin-top: 7%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-12 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFORMATIONS PERSONNELLES</span>
					</div>
					<div class="col12_partie" style="padding-top: 3%;">
						<!-- civilite -->
						<div class="form-group row">  
							<div class="col-sm-4" style="margin: -1% 0%;">
								<label>Civilit&eacute;</label>
								<select id="selection" name='POS_VAL_RUB_CIV' class="form-control civilite" rows="1" data-parsley-required="true" >
									<option value="0" disabled="disabled" selected>Veuillez selectionner</option>
										<option value="M">Monsieur</option>
										<option value="MME">Madame</option>
										<option value="MLLE">Mademoiselle</option>
								</select>
								<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV' value='{POS_VAL_RUB_CIV}'>
							</div>
							<div class="col-sm-4 epoux" style="margin: -1% 0%;display: none">
								<label>Nom &amp; Pr&eacute;noms de l&#146;epoux</label>
								<input type="text" name='POS_VAL_RUB_NEP' value="{POS_VAL_RUB_NEP}" placeholder="Nom &amp; Pr&eacute;noms" class="form-control" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" >
							</div>
						</div>
						<!-- login & nom & prenom -->
						<div class="form-group row">
							<div class="col-sm-4" >
								<label>Login</label>
							  <input type="text" name='POS_VAL_RUB_LOG'  value="{POS_VAL_RUB_LOG}" placeholder="exemple: AZERTY" class="form-control" data-parsley-required="true" data-parsley-pattern="^[A-Z0-9_]*$" data-parsley-trigger="keyup"  />
							</div>
							<div class="col-sm-4">
								<label>Nom</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" placeholder="Nom"  data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup"  />
							</div>
							<div class="col-sm-4">
								<label>Pr&eacute;noms</label>
								<input type="text" class="form-control" name='POS_VAL_RUB_PRE'  value="{POS_VAL_RUB_PRE}" placeholder="Pr&eacute;noms"  data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup"  />
							</div>
						</div>
						<!-- date naiss & lieu naiss & pay naiss -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Date de naissance</label>
								<input type="text" id="date1" name="POS_VAL_RUB_DNS" value="{POS_VAL_RUB_DNS}" class="form-control text-center" data-parsley-required="true">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Lieu de naissance</label>
								<input type="text" name='POS_VAL_RUB_LNS' value="{POS_VAL_RUB_LNS}" placeholder="Lieu de naissance" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" />
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Pays de naissance</label>
							  <input type="text" placeholder="Pays de naissance" name='POS_VAL_RUB_PNS'  value="{POS_VAL_RUB_PNS}" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" />
							</div>
						</div>
						<!-- nationnalit & nature pièce & numero pièce -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Nationalit&eacute;</label>
							  <input type="text" placeholder="Nationalit&eacute;" class="form-control">
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Nature de pi&egrave;ce</label>
								<select id="selection" name='POS_VAL_RUB_NTP' class="form-control" rows="1" data-parsley-required="true" >
									<option value="0" disabled="disabled" selected>Veuillez selectionner</option>
										 <option value="ATTESTATION">Atttestation d'identit&eacute; </option>
									     <option value="CARTE CONSULAIRE">Carte consulaire </option>
										 <option value="CNI">Carte nationale d'identit&eacute; </option>
										 <option value="PASSEPORT">Passeport </option>
										 <option value="PERMIS DE CONDUIRE">Permis de conduire </option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_NTP' id='POS_VAL_CTRL_NTP' value='{POS_VAL_RUB_NTP}'>
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Num&eacute;ro de pi&egrave;ce</label>
							  <input type="text" name='POS_VAL_RUB_NPI' value="{POS_VAL_RUB_NPI}" placeholder="Num&eacute;ro de pi&egrave;ce" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[A-Z0-9 ]*$" />
							</div>
						</div>
						<!-- ville & commune & quartier -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Ville</label>
								<input type="text" name='POS_VAL_RUB_VLE' value="{POS_VAL_RUB_VLE}" placeholder="Ville" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$">
							</div>
							<div class="col-sm-4" >
								<label>Commune</label>
								<input type="text" name='POS_VAL_RUB_CNE'value="{POS_VAL_RUB_CNE}" placeholder="Commune" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$">
							</div>
							<div class="col-sm-4" >
								<label>Quartier</label>
								<input type="text" name='POS_VAL_RUB_QUA'value="{POS_VAL_RUB_QUA}" placeholder="Quartier" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$">
							</div>
						</div>
						<!-- E-mail & Contact1 & Contact2 -->
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>E-mail</label>
							  <input type="text" placeholder="E-mail" class="form-control" name='POS_VAL_RUB_MEL' data-parsley-required="true" value="{POS_VAL_RUB_MEL}" data-parsley-pattern="/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/" />
							</div>
							<div class="col-sm-4" >
								<label>Contact 1</label>
							  <input type="text" name='POS_VAL_RUB_TPH' value="{POS_VAL_RUB_TPH}" placeholder="Contact 1" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" />
							</div>
							<div class="col-sm-4" >
								<label>Contact 2</label>
							  <input type="text" name='POS_VAL_RUB_TPM' value="{POS_VAL_RUB_TPM}" placeholder="Contact 2" class="form-control" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" />
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-4" style="margin: -0.5% 0%">
								<label>Situation Matrimoniale</label>
								<select id="selection" name='POS_VAL_RUB_SIF' class="form-control" rows="1" data-parsley-required="true">
									<option value="0" disabled="disabled">Veuillez selectionner</option>
									<option value=""></option>
									<option value="MARIE(E)">MARI&Eacute;(E)</option>
									<option value="CELIBATAIRE" selected>C&Eacute;LIBATAIRE</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_SIF' id='POS_VAL_CTRL_SIF' value='{POS_VAL_RUB_SIF}'>
							</div>
							<div class="col-sm-4" style="margin: -0.5% 0%">
									<label>Nbre d&#146;enfant</label>
								<input type="text" name='POS_VAL_RUB_NEF' value="{POS_VAL_RUB_NEF}" placeholder="Nombre d&#146;enfant" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?" />
							</div>
						</div>
						<label for="bio" style="margin: -1.5% 0%;">En cas d&#146;urgence</label>
						<div class="form-group row">
							<div class="col-sm-4" style="margin: 0% 0%">
								<input type="text" name='POS_VAL_RUB_PAC' value="{POS_VAL_RUB_PAC}" placeholder="Nom &amp; Pr&eacute;noms" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" />
							</div>
							<div class="col-sm-4" style="margin: 0% 0%">
								<input type="text" name='POS_VAL_RUB_NTC' value="{POS_VAL_RUB_NTC}" placeholder="Contact" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup"  data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15">
							</div>
							<div class="col-sm-4" style="margin: 0% 0%">    
								<input type="text" name='POS_VAL_RUB_FLN' value="{POS_VAL_RUB_FLN}" placeholder="Filiation" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z]*$" data-parsley-trigger="keyup" class="form-control">
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
					<div class="col2_partie" style="padding-top: 3%;">
						<!-- Type de contrat & durée contrat -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Type de contrat</label>
									<select id="selection" name='POS_VAL_RUB_TYE' class="form-control" rows="1" data-parsley-required="true" >
										<option value="0" disabled="disabled">Veuillez selectionner</option>
										<option value=""></option>
										<option value="CONSULTANT">CONSULTANT</option>
										<option value="CONTRAT A DUREE DETERMINEE">CONTRAT A DUR&Eacute;E D&Eacute;TERMIN&Eacute;</option>
										<option value="CONTRAT A DUREE INDETERMINEE">CONTRAT A DUR&Eacute;E IND&Eacute;TERMIN&Eacute;</option>
										<option value="STAGIAIRE">STAGIAIRE</option>
									</select>
								<input type="hidden" name='POS_VAL_CTRL_TYE' id='POS_VAL_CTRL_TYE' value='{POS_VAL_RUB_TYE}'>
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Dur&eacute;e de contrat</label>
								<input type="text" name='POS_VAL_RUB_DUR' value="{POS_VAL_RUB_DUR}" placeholder="Dur&eacute;e de contrat" class="form-control" data-parsley-trigger="keyup"  data-parsley-pattern="[0-9][0-9]?" />
							</div>
						</div>
						<!-- departement & service -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>D&eacute;partement</label>
									<select id="depart" name='POS_VAL_RUB_DPT' class="form-control" rows="1" data-parsley-required="true" >
									    <option value="" >Selectionner</option>
									</select>
								<input type="hidden" name='POS_VAL_CTRL_DPT' id='POS_VAL_CTRL_DPT' value='{POS_VAL_RUB_DPT}'>

							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Service</label>
 								<select id="service" name='POS_VAL_RUB_SER' class="form-control" rows="1" data-parsley-required="true" >
								     <option value="" >Selectionner</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_SER' id='POS_VAL_CTRL_SER' value='{POS_VAL_RUB_SER}'>
							</div>
						</div>
						<!-- manager -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Nom manager</label>
							   <input type="text"  name='POS_VAL_RUB_NMG'value="{POS_VAL_RUB_NMG}" placeholder="Nom Manager" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" />
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Pr&eacute;noms manager</label>
							   <input type="text" name='POS_VAL_RUB_PMG' value="{POS_VAL_RUB_PMG}" placeholder="Prenom Manager" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup"/>
							</div>
						</div>
						<!-- Poste & matricule -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Poste</label>
								<input type="text" name='POS_VAL_RUB_FON' value="{POS_VAL_RUB_FON}" placeholder="Poste" class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" />
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Matricule</label>
								<input type="text" name='POS_VAL_RUB_MAT' value="{POS_VAL_RUB_MAT}" placeholder="Matricule" class="form-control" data-parsley-pattern="^[A-Z0-9]*$" data-parsley-trigger="keyup" />
							</div>
						</div>
						<!-- Cartegorie & Avantage -->
						<div class="form-group row">
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Cat&eacute;gorie</label>
								<input type="text" name='POS_VAL_RUB_CAT'value="{POS_VAL_RUB_CAT}" placeholder="Cat&eacute;gorie" class="form-control" data-parsley-pattern="^[a-zA-Z0-9'_ ]*$" data-parsley-trigger="keyup" />
							</div>
							<div class="col-sm-6" style="margin: -0.5% 0%">
								<label>Avantage</label>
								<input type="text" name='POS_VAL_RUB_AVT' value="{POS_VAL_RUB_AVT}" placeholder="Avantage" class="form-control" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup"/>
							</div>
						</div>
					</div>
				</div>
						<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">INFORMATIONS BANQUE</span>
					</div>
					<div class="col2_partie" style="padding-top: 11%;padding-bottom: 11%;">
						<!-- Salaire Net -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label>Salaire Net</label>
								<input type="text" name='POS_VAL_RUB_SLT'value="{POS_VAL_RUB_SLT}" placeholder="Salaire Net" class="form-control" data-parsley-required="true" data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup" />
							</div>
						</div>
						<!-- Banque -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label>Banque</label>
								<input type="text" name='POS_VAL_RUB_BQE' value="{POS_VAL_RUB_BQE}" placeholder="Banque" class="form-control"  data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup"/>
							</div>
						</div>
						<!-- RIB -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label>RIB</label>
								<input type="text" name='POS_VAL_RUB_RIB' value="{POS_VAL_RUB_RIB}" placeholder="RIB" class="form-control" data-parsley-pattern="^[A-Z0-9]*$" data-parsley-trigger="keyup" />
							</div>
						</div>
						<!-- N&ordm; CNPS -->
						<div class="form-group row">
							<div class="col-sm-10" style="margin: -0.5% 7%">
								<label>N&ordm; CNPS</label>
								<input type="text" name='POS_VAL_RUB_CNP' value="{POS_VAL_RUB_CNP}" placeholder="N&ordm; CNPS" class="form-control" data-parsley-pattern="^[0-9]*$" data-parsley-maxlength="12" data-parsley-trigger="keyup"  />
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

		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/departement/phppromise.js"></script>
	<!-- END JQUERY  -->
	 <script>
	  $('#formperso').parsley();
      
	//    $('.departement').on('input',function(e){
               
	// 			$.ajax({
	// 				type: 'POST',
	// 				url: '/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/departement/departement.php',
	// 				success: function(data){
	// 					$('.resdepartement').html(data);
	// 				},
	// 				error: function() {
	// 					alert('erreur ajax');
	// 				}
	// 			});
 
	//    });


	     var prof_util = "{PROFIL_UTILISATEUR}";	 
	 
			switch (prof_util) {
			 case "ADMIN" :
				   $('.rhdmdprs').show();
		           $('.mydmdprs').hide();
					
					break;
			 case "RH":
				   $('.rhdmdprs').show();
		           $('.mydmdprs').hide();
					
					break;
			default:
			 $('.mydmdprs').show();
			
		}
		$(document).ready(function () {
			 $('#date1').datepicker({
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
		
		  $(document).ready(function() {
		
		var selectCivilite=$.trim($('.selectCivilite').val());
		
		   if(selectCivilite=="MME"){
				$(".epoux").show();
		   }else{
				$(".epoux").hide();
		   }
		 
		   $(".civilite" ).on( "change", function() {
			   var civilite=$(this).val();
			   if(civilite=="MME"){
					$(".epoux").show();
				}else{
					$(".epoux").hide();
				}
			});
		 	if($('.civilite option').filter(function(){ return $(this).val()==selectCivilite; }).length){
				// found value
			  	var theValue = $('.civilite').val();
        	  	$('option[value='+selectCivilite+']').attr('selected',true);
		    }
		 
	});
	</script>
	
</html>
