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

	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>

	<style>
		.col_list{
			width: 23%;
			float: right;
			margin-right: 2%;
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
			padding: 9px;
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
		
		.button_plus{
			font-size: 11px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter;
			float: right;
			border-radius: 2px;
			cursor: pointer;
			margin-top: -1%;
			margin-right: 4%;
			margin-bottom: 0%;
			padding: 5px;
		}
		
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

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				
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

		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			
		 


			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_COT_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		
		<nav class="container-fluid">
			<div class="row" style="margin-top: 3%">
				<div class="col-sm-12">
					<div class="col1_partie text-center">
						<span class="title text-while">GENERALITE</span>
					</div>
					<div class="col2_partie" style="padding-top: 3%;">
						<div class="container-fluid">
							<div class="row">
								 <input type="hidden" name="POS_VAL_RUB_CIV" value="{POS_VAL_RUB_CIV}" class="civilite_pers" />
								 <input type="hidden" name="POS_VAL_RUB_NOM" value="{POS_VAL_RUB_NOM}" class="nom_pers" />
								 <input type="hidden" name="POS_VAL_RUB_PRE" value="{POS_VAL_RUB_PRE}" class="prenoms_pers" />
								 <input type="hidden" name="POS_VAL_RUB_MAT" value="{POS_VAL_RUB_MAT}" class="matricule_pers" />
								  <input type="hidden" name="POS_VAL_RUB_DSV" value="{POS_VAL_RUB_DSV}" class="dateEnreg_pers" />

								  <input  class="form-control fonct" placeholder="fonction" type="hidden"  >

								<div class="col-sm-6">
									<label for="bio">Nom & Pr&#233;noms :</label>
									<select id="interimaire" style="width: 100%;" name='POS_VAL_RUB_MEL' class="form-control selectPers personnel"  >
									    <option value="">Veuillez s&#233;lectionner</option>
									</select>
									<input type="hidden"  class="interselectperso" name='POS_VAL_CTRL_MEL' id='POS_VAL_CTRL_MEL' value='{POS_VAL_RUB_MEL}'>
								</div>
								<div class="col-sm-6">
									<label for="bio">Type de contrat :</label>
									<select id="select_contrat" name='POS_VAL_RUB_TYE' class="form-control type_contrat" style="width: 100%;">
										<option value="" selected>Veuillez s&eacute;lectionner</option>
										<option value="Stage-ecole">Stage-&#233;cole</option>
										<option value="Stage professionnel">Stage professionnel</option>
										<option value="CDD avec essai">CDD avec essai</option>
										<option value="CDD lie au projet">CDD li&#233; au projet</option>
										<option value="CDD standard">CDD standard</option>
										<option value="CDI avec essai">CDI avec essai</option>
										<option value="CDI standard">CDI standard</option>
										<option value="Consultant interne">Consultant interne</option>
										<option value="Consultant externe">Consultant externe</option>
									</select>
									<input type="hidden"  class="interselectcontrat" name='POS_VAL_CTRL_TYE' id='POS_VAL_CTRL_TYE' value='{POS_VAL_RUB_TYE}'>
										<!-- existance d'un contrat -->
									  <input type="hidden" name="POS_VAL_RUB_EXT" value="{POS_VAL_RUB_EXT}" class="exist_contrat"   />

									  <!--activé ou desactivé un contrat prime -->
									  <input type="hidden" name="POS_VAL_RUB_ACT" value="{POS_VAL_RUB_ACT}" class="status_activ_cot"  />
								</div>
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Salaire :</label>
									<input type="text"  onkeypress="return testNum(event, this, 2);" name="POS_VAL_RUB_SAL" value="{POS_VAL_RUB_SAL}" class="form-control montant_net" maxlength="9" placeholder="Salaire" style="width: 100%;">
								</div>
								<!-- montant en lettre -->
								<input type="hidden" name="POS_VAL_RUB_MDT"  class="form-control montant_letter" />

								<div class="col-sm-6" style="margin-top: 13px">
									<label>Date de signature :</label>
									<input type="text" name="POS_VAL_RUB_DSG" value="{POS_VAL_RUB_DSG}" id="dateSig" placeholder="jj/mm/aaaa" class="form-control" style="width: 100%;">
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-sm-12" id="col_partie_2" style="margin-top: 3%;display: none;">
					<div class="col1_partie text-center">
						<span class="title text-while">SPECIFIQUE</span>
					</div>
					<div class="col2_partie">
						<div class="container-fluid">
							<div class="row">

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="diplomes">
									<label for="bio">Dipl&#244;me :</label>
									<select   name='POS_VAL_RUB_DIP' class="form-control selectDip diplome" style="width: 100%;">
									</select>
									<input type="hidden"  class="interselectdiplome" name='POS_VAL_CTRL_DIP' id='POS_VAL_CTRL_DIP' value='{POS_VAL_RUB_DIP}'>
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="filieres">
									<label for="bio">Fili&#232;re :</label>
									<select   name='POS_VAL_RUB_FLR' class="form-control selectFil filiere" style="width: 100%;">
									</select>
									<input type="hidden"  class="interselectfiliere" name='POS_VAL_CTRL_FLR' id='POS_VAL_CTRL_FLR' value='{POS_VAL_RUB_FLR}'>
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="domaines">
									<label for="bio">Domaine :</label>
									<select name='POS_VAL_RUB_DME' class="form-control selectDom category domaine" style="width: 100%;">
									</select>
									<input type="hidden"  class="interselectdomaine" name='POS_VAL_CTRL_DME' id='POS_VAL_CTRL_DME' value='{POS_VAL_RUB_DME}'>
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="entreprises">
									<label for="bio">Entreprise :</label>
									<select name='POS_VAL_RUB_ENT' class="form-control selectEnp entreprise" style="width: 100%;">
									</select>
									<input type="hidden"  class="interselectentreprise" name='POS_VAL_CTRL_ENT' id='POS_VAL_CTRL_ENT' value='{POS_VAL_RUB_ENT}'>
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="fonctions">
									<label for="bio">Fonction :</label>
									<select  name='POS_VAL_RUB_FON'  class="form-control selectFont fonction" style="width: 100%;">
 									</select>
									<input type="hidden"  class="interselect fonction" name='POS_VAL_CTRL_FON' id='POS_VAL_CTRL_FON' value='{POS_VAL_RUB_FON}'>
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="categories">
									<label for="bio">Cat&#233;gorie :</label>
									<select name='POS_VAL_RUB_CAE' class="form-control selectCat categorie" style="width: 100%;">
									    
									</select>
									<input type="hidden"  class="interselectcategorie" name='POS_VAL_CTRL_CAE' id='POS_VAL_CTRL_CAE' value='{POS_VAL_RUB_CAE}'>
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="cnps">
									<label>CNPS :</label>
									<input type="text" name="POS_VAL_RUB_CNP" value="{POS_VAL_RUB_CNP}"  class="form-control" placeholder="CNPS" style="width: 100%;">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="assurances">
									<label>Assurance :</label>
									<input type="text" name="POS_VAL_RUB_ASN" value="{POS_VAL_RUB_ASN}"  class="form-control" placeholder="Assurance" style="width: 100%;">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="Levels">
									<label>Level :</label>
									<select  name='POS_VAL_RUB_LVL' class="form-control selectLevs level" style="width: 100%;">
									</select>
									<input type="hidden"  class="interselectlevel" name='POS_VAL_CTRL_LVL' id='POS_VAL_CTRL_LVL' value='{POS_VAL_RUB_LVL}'>
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="projets">
									<label>Projet :</label>
									<input type="text" name="POS_VAL_RUB_LPR" value="{POS_VAL_RUB_LPR}" class="form-control" placeholder="Projet" style="width: 100%;">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="volumeHoraiares">
									<label>Volume horaire</label>
									<input type="text" name="POS_VAL_RUB_VHE" value="{POS_VAL_RUB_VHE}"  class="form-control horaire" min="1" placeholder="Volume horaire" style="width: 100%;">
									<input type="hidden" class="horaire_lettre" name="POS_VAL_RUB_A1" value="{POS_VAL_RUB_A1}">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="nombreJours">
									<label>Nombre de jours</label>
									<input type="text" name="POS_VAL_RUB_NBR" value="{POS_VAL_RUB_NBR}"  class="form-control nbrejrs"  placeholder="Nombre de jours" style="width: 100%;">
									<input type="hidden" class="nbrejrs_lettre" name="POS_VAL_RUB_A2" value="{POS_VAL_RUB_A2}">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="periodeEssai">
									<label>Dur&#233;e d&#146;essai (en mois) :</label>
									<input type="text"  name="POS_VAL_RUB_DRU" value="{POS_VAL_RUB_DRU}"   class="form-control duree_essai"  placeholder="Dur&#233;e d&#146;essai (en mois)" style="width: 100%;">

									
									<input type="hidden" name="POS_VAL_RUB_DLA" value="{POS_VAL_RUB_DLA}" class="mois_lettre_essai" />
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dateDebutEssai">
									<label>Date d&#233;but d&#146;essai :</label>
									<input type="text" name="POS_VAL_RUB_DEI" value="{POS_VAL_RUB_DEI}" id="dateDebutEs" class="form-control datedeb_essai" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dateFinEssai">
									<label>Date fin d&#146;essai :</label>
									<input type="text" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" readonly="true" class="form-control datefin_essai"   style="width: 100%;">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dureeContrats">
									<label>Dur&#233;e du contrat (en mois)</label>
									<input type="text" name="POS_VAL_RUB_MOI" value="{POS_VAL_RUB_MOI}"  class="form-control ecole_duree" min="1" placeholder="Dur&#233;e du contrat (en mois)" style="width: 100%;">

									<!-- Mois en lettre -->
									<input type="hidden"  name="POS_VAL_RUB_M1" value="{POS_VAL_RUB_M1}"     class="mois_lettre" />
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dateDebutContrats">
									<label>Date d&#233;but du contrat :</label>
									<input type="text"  name="POS_VAL_RUB_DDT" value="{POS_VAL_RUB_DDT}"   id="dateDebutConts" class="form-control ecole_datedeb" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>

								<div class="col-sm-4" style="margin-top: 13px;display: none;display: none;" id="dateFinContrats">
									<label>Date fin du contrat :</label>
									<input type="text"  name="POS_VAL_RUB_DEC" value="{POS_VAL_RUB_DEC}"   readonly="true" class="form-control ecole_datefin"  style="width: 100%;">
								</div>

							</div>

							<div class="col-sm-4" style="margin-top: 13px;">
									<label style="font-size: 19px">Cong&eacute; :</label> <br/>
									<input type="radio" id="OuiboxEX" name="POS_VAL_RUB_E1" value="OUI">
									<span style="font-size: 14px;margin-left: 1%">Oui</span>
									<input type="radio" id="NonboxEX" name="POS_VAL_RUB_E1" value="NON" style="margin-left: 9%">
									   <span style="font-size: 14px;margin-left: 2%">Non</span>
									   	<input type="hidden" name="POS_VAL_CTRL_E1" value="{POS_VAL_RUB_E1}">

							</div>


							<!-- PRIME  -->
							<div class="row" id="Avantages_prime" style="display: none;">
								<!--  -->
								<div class="col-sm-12" style="margin-top: 13px;">
									<label>Avantages :</label>
									<div style="color:red">
										<i>Veuillez ajouter les charact&egrave;res -* avant l'ajout du texte au d&eacute;but d'une nouvelle ligne </i>
									</div>
									<textarea type="text" name="POS_VAL_RUB_COM" class="form-control" rows="3" style="width: 100%;resize: none;">{POS_VAL_RUB_COM}</textarea>
								</div>
								<div class="col-sm-4" style="margin-top: 13px;">
									<label style="font-size: 19px">Prime :</label> <br/>
									<input type="radio" id="OuiboxEX" name="POS_VAL_RUB_PRM" value="OUI">
									<span style="font-size: 14px;margin-left: 1%">Oui</span>
									<input type="radio" id="NonboxEX" name="POS_VAL_RUB_PRM" value="NON" style="margin-left: 9%">
									   <span style="font-size: 14px;margin-left: 2%">Non</span>

									   	<input type="hidden" name="POS_VAL_CTRL_PRM" value="{POS_VAL_RUB_PRM}">

								</div>
								<div class="col-sm-8 prime_tabEX" style="margin-left: 15%;margin-top: -4%; display: none;">
										<table class="test tableTaches" style="width: 100%;margin: 2% auto;">
											<tbody class="tableL">
												<tr>
													<td style="width: 100px;border:none;">
													 
														<select name="lib_prime[]" class="form-control selectPrims lib_prime" style="width: 100%;border: none;margin: 2px auto">
													     	 
														</select>
														  
													</td>
													<td style="width: 5px;border:none;">
													</td>
													<td style="width: 100px;border:none;">
														<input name="montant_prime[]"  onkeypress="return testNum(event, this, 2);" type="text" min="0" placeholder="Montant de la prime" style="width: 100%;border: none;margin: 2px auto" class="form-control montant_prime">
													</td>
													<td style="width: 20px;border:none;text-align: left;visibility: hidden">
														<i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="col-sm-12">
											<i class="fa fa-archive btn" id="SuprimeLigs" title="Suprimer la derni&#232;re ligne" style="margin-left: 67%;margin-top: -0.9%;position: absolute;background: #4a67b3;color: #FFF;font-size: 11px;display: none;"></i>
											<span class="button_plus" id="addRowEX">Ajouter une ligne</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div>    
		</nav>
			
	</form>
</body>
	<!-- JQUERY  -->
		
    	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
	    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

    	<script language='javascript' src="../../../../include/script/testNum.js"></script>

	<!-- END JQUERY  -->


<!--Traitement des fonctions et variables globales js (en premier) -->
     <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/package_function.js"></script>





   <!--Traitement stage-pro 
  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/specifique/stage_pro/stage_pro.js"></script>-->

   <!--Traitement categorie 
  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/specifique/cdd_essai/cdd_essai.js"></script>
-->

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
	 	$(document).ready(function (){ 

	 		//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});


	 		$( "#dateSig,#dateDebutEs,#dateDebutConts").datepicker({
	            altField: "#datepicker",
	            closeText: 'Fermer',
	            prevText: 'Précédent',
	            nextText: 'Suivant',
	            currentText: 'Aujourd\'hui',
	            monthNames: ['Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'Décembre'],
	            monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Août', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
	            dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
	            dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
	            dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
	            weekHeader: 'Sem.',
	            dateFormat: 'dd/mm/yy'
	        });
                  

	 		// SCRIPTS DE BOUTON RADIO DU CONTRAT CONSULTANT EXTERNE
	 		$("#NonboxEX").attr('checked', 'checked');
	    	$("#NonboxEX").click(function(){
	    		$("#NonboxEX").attr('checked', 'checked');
	    		$('.prime_tabEX').css('display','none');
	    	});
	    	$("#OuiboxEX").click(function(){
	    		if ($("#OuiboxEX").attr('checked', 'checked')){
	    			$('.prime_tabEX').css('display','block');
	    		}
	    		else{
	    			$('.prime_tabEX').css('display','none');
	    		}
	    	});

	 		// Affichage des different type de contrat 
			$("select#select_contrat").change(function(){
		        var contrat = $(this).children("option:selected").val();
		        
		        $('#col_partie_2,#diplomes,#filieres,#domaines,#entreprises,#Levels,#assurances,#fonctions,#categories,#projets,#cnps,#volumeHoraiares,#nombreJours,#periodeEssai,#dateDebutEssai,#dateFinEssai,#dureeContrats,#dateDebutContrats,#dateFinContrats,#Avantages_prime').css('display', 'none');

		        if(contrat == "Stage-ecole"){
		        	$('#col_partie_2,#diplomes,#filieres,#entreprises,#Levels,#assurances,#dureeContrats,#dateDebutContrats,#dateFinContrats').css('display', 'block');
		        }

		        if(contrat == "Stage professionnel"){
		        	$('#col_partie_2,#domaines,#entreprises,#Levels,#assurances,#dureeContrats,#dateDebutContrats,#dateFinContrats').css('display', 'block');
		        }

		        if(contrat == "CDD avec essai"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#periodeEssai,#dateDebutEssai,#dateFinEssai,#dureeContrats,#dateDebutContrats,#dateFinContrats,#Avantages_prime,#assurances').css('display', 'block');
		        }

		         if(contrat == "CDD lie au projet"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#Levels,#entreprises,#dateDebutContrats,#Avantages_prime,#assurances').css('display', 'block');
		        }

		        if(contrat == "CDD standard"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#entreprises,#dureeContrats,#dateDebutContrats,#dateFinContrats,#Avantages_prime,#assurances').css('display', 'block');
		        }

		        if(contrat == "CDI avec essai"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#periodeEssai,#dateDebutEssai,#dateFinEssai,#Avantages_prime,#assurances').css('display', 'block');
		        }

		        if(contrat == "CDI standard"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#entreprises,#Avantages_prime,#assurances').css('display', 'block');
		        }

		        if(contrat == "Consultant interne"){
		        	$('#col_partie_2,#fonctions,#assurances,#volumeHoraiares,#nombreJours,#dureeContrats').css('display', 'block');
		        }

		        if(contrat == "Consultant externe"){
		        	$('#col_partie_2,#fonctions,#assurances,#entreprises,#projets,#dateDebutContrats,#Avantages_prime,#Levels').css('display', 'block');
		        }
		    });


	 		// Ajouter de ligne a la table  traitement effectue dans mon js


			//Supprimer de ligne a la table
			$(document).on('click','#SuprimeLigs',function(){
				let rowcount=$('.tableTaches > .tableL').children().length;
				if(rowcount==2){
				  	$(this).hide();
				}else{$(this).show();}
                $('.tableL tr:gt(0):last').remove();
			});


			// select2 
            $('.selectPers,.selectDip,.selectFil,.selectDom,.selectEnp,.selectFont,.selectCat,.selectPrims,.selectLevs').select2({
                placeholder:'Veuillez s\u00e9lectionner',
                theme:'bootstrap4',
                tags:true,
                allowClear: true
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

<!--Traitement du flag sur l'existance d'un contrat du personnel selectionne -->
<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/existing/existanceflag.js"></script>
	
</html>
