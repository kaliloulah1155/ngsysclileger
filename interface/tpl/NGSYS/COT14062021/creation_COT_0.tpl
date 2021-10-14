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

		.fa-archive{
			color: #fff;
			font-size: 10px;
			cursor: pointer;
			width: 20px;
			height: 20px;
			border-radius: 25px;
			background: #4a67b3;
			margin-left: 7px;
			padding: 5px;
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
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
			margin-right: 6%;
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
								 <input type="hidden" class="nom_pers" />
								 <input type="hidden" class="prenoms_pers" />
								 <input type="hidden" class="matricule_pers" />
								  <input type="hidden" class="dateEnreg_pers" />
								<div class="col-sm-6">
									<label for="bio">Nom & Pr&#233;noms :</label>
									<select id="personnel" style="width: 100%;" name='POS_VAL_RUB_MEL' class="form-control select1 personnel" rows="1" data-parsley-required="true" >
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
									<input type="hidden"  class="interselectperso" name='POS_VAL_CTRL_MEL' id='POS_VAL_CTRL_MEL' value='{POS_VAL_RUB_MEL}'>
								</div>
								<div class="col-sm-6">
									<label for="bio">Type de contrat :</label>
									<select id="select_contrat" class="form-control" style="width: 100%;">
										<option value="non">Veuillez s&eacute;lectionner</option>
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
								</div>
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Salaire :</label>
									<input type="number" class="form-control montant_net"  placeholder="Salaire" maxlength="9" style="width: 100%;">
								</div>
								<!-- montant en lettre -->
								<input type="hidden" class="form-control montant_letter" />


								<div class="col-sm-6" style="margin-top: 13px">
									<label>Date de signature :</label>
									<input type="text" id="date_sig" placeholder="jj/mm/aaaa" class="form-control" style="width: 100%;">
								</div>
							</div>
						</div>
					</div>
				</div>


				<div class="col-sm-12" id="col_partie_2" style="margin-top: 3%;display: none;">
					<div class="col1_partie text-center">
						<span class="title text-while">SPECIFIQUE</span>
					</div>
					<div class="col2_partie" style="padding-top: 3%;">
						<div class="container-fluid">

							<!-- CONTRAT STAGE ECOLE 00000-1 -->
							<div class="form-group row" id="stage_ecole" style="display: none;">
								<div class="col-sm-4">
									<label for="bio">Dipl&#244;me :</label>
									<select name="category" class="form-control select2 diplome" style="width: 100%;">
									    
									</select>
								</div>
								<div class="col-sm-4">
									<label for="bio">Fili&#232;re :</label>
									<select name="category" class="form-control select3 filiere" style="width: 100%;">
									    
									</select>
								</div>
								<div class="col-sm-4">
									<label>Dur&#233;e du contrat (en mois)</label>
									<input type="number" class="form-control ecole_duree" min="1" placeholder="Dur&#233;e du contrat (en mois)" style="width: 100%;">
									<!-- Mois en lettre -->
									<input type="hidden"   class="mois_lettre" />
								</div>
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date d&#233;but :</label>
									<input type="text" id="dateD_01" class="form-control ecole_datedeb" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date fin :</label>
									<input type="text" readonly="true" class="form-control ecole_datefin" style="width: 100%;">
								</div>
							</div>


							<!-- CONTRAT STAGE PROFESSIONNEL 00000-2 -->
							<div class="form-group row" id="stage_prof" style="display: none;">
								<div class="col-sm-6">
									<label for="bio">Domaine :</label>
									<select name="category" class="form-control select4 category domaine" style="width: 100%;">
									   
									</select>
								</div>
								<div class="col-sm-6">
									<label>Dur&#233;e du contrat (en mois)</label>
									<input type="number" class="form-control pro_duree" min="1" placeholder="Dur&#233;e du contrat (en mois)" style="width: 100%;">
									<!-- Mois en lettre -->
									<input type="hidden"   class="pro_mois_lettre" />
								</div>
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Date d&#233;but :</label>
									<input type="text" id="dateD_02" class="form-control pro_datedeb" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Date fin :</label>
									<input type="text"  class="form-control pro_datefin" readonly="true" style="width: 100%;">
								</div>
							</div>

							<!-- CONTRAT CDD AVEC ESSAI 00000-3 -->
							<div class="form-group row" id="cdd_avec_essai" style="display: none;">
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Fonction :</label>
									<select class="form-control select5 fonction" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Cat&#233;gorie :</label>
									<select class="form-control select6 categorie" style="width: 100%;">
									    
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label>CNPS :</label>
									<input type="number" class="form-control" min="0" placeholder="CNPS" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Dur&#233;e du contrat (en mois) :</label>
									<input type="number" class="form-control" min="1" placeholder="Dur&#233;e du contrat (en mois)" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date d&#233;but du contrat :</label>
									<input type="text" id="dateD_03" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date fin du contrat :</label>
									<input type="text" id="dateF_03" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>P&#233;riode d&#146;essai (en mois) :</label>
									<input type="number" class="form-control" min="1" placeholder="P&#233;riode d&#146;essai (en mois)" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date d&#233;but d&#146;essai :</label>
									<input type="text" id="dateDE_03" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date fin d&#146;essai :</label>
									<input type="text" id="dateFE_03" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
							</div>

							<!-- CONTRAT CDD LIE AU PROJET 00000-4 -->
							<div class="form-group row" id="cdd_lie_projet" style="display: none;">
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Fonction :</label>
									<select class="form-control select7" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Cat&#233;gorie :</label>
									<select class="form-control select8 categorie" style="width: 100%;">
									     
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label>CNPS :</label>
									<input type="number" class="form-control" min="0" placeholder="CNPS" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label for="bio">Entreprise :</label>
									<select class="form-control select9" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date d&#233;but du contrat :</label>
									<input type="text" id="dateD_04" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
							</div>

							<!-- CONTRAT CDD STANDARD 00000-5 -->
							<div class="form-group row" id="cdd_standart" style="display: none;">
								<div class="col-sm-4">
									<label for="bio">Fonction :</label>
									<select class="form-control select10" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Cat&#233;gorie :</label>
									<select class="form-control select11" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<div class="col-sm-4">
									<label>CNPS :</label>
									<input type="number" class="form-control" min="0" placeholder="CNPS" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Dur&#233;e du contrat (en mois) :</label>
									<input type="number" class="form-control" min="1" placeholder="Dur&#233;e du contrat (en mois)" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date d&#233;but du contrat :</label>
									<input type="text" id="dateD_05" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date fin du contrat :</label>
									<input type="text" id="dateF_O5" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
							</div>

							<!-- CONTRAT CDI AVEC ESSAI 00000-6 -->
							<div class="form-group row" id="cdi_avec_essai" style="display: none;">
								<div class="col-sm-4">
									<label for="bio">Fonction :</label>
									<select class="form-control select12" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Cat&#233;gorie :</label>
									<select class="form-control select13" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label>CNPS :</label>
									<input type="number" class="form-control" min="0" placeholder="CNPS" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>P&#233;riode d&#146;essai (en mois) :</label>
									<input type="number" class="form-control" min="1" placeholder="P&#233;riode d&#146;essai (en mois)" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date d&#233;but d&#146;essai :</label>
									<input type="text" id="dateDE_06" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-4" style="margin-top: 13px">
									<label>Date fin d&#146;essai :</label>
									<input type="text" id="dateFE_06" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;">
								</div>
							</div>

							<!-- CONTRAT CDI STANDARD 00000-7 -->
							<div class="form-group row" id="cdi_standard" style="display: none;">
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Fonction :</label>
									<select class="form-control select14" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label for="bio">Cat&#233;gorie :</label>
									<select class="form-control select15" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-4">
									<label>CNPS :</label>
									<input type="number" class="form-control" min="0" placeholder="CNPS" style="width: 100%;">
								</div>
							</div>

							<!-- CONTRAT CONSULTANT INTERNE 00000-8 -->
							<div class="form-group row" id="consultant_interne" style="display: none;">
								<div class="col-sm-6">
									<label for="bio">Fonction :</label>
									<select class="form-control select16" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<div class="col-sm-6">
									<label>Dur&#233;e du contrat (en mois)</label>
									<input type="number" class="form-control" min="1" placeholder="Dur&#233;e du contrat (en mois)" style="width: 100%;">
								</div>
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Volume horaire</label>
									<input type="number" class="form-control" min="1" placeholder="Volume horaire" style="width: 100%;">
								</div>
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Nombre de jours</label>
									<input type="number" class="form-control" min="1" placeholder="Nombre de jours" style="width: 100%;">
								</div>
							</div>

							<!-- CONTRAT CONSULTANT EXTERNE 00000-9 -->
							<div class="form-group row" id="consultant_externe" style="display: none;">
								<div class="col-sm-6">
									<label for="bio">Fonction :</label>
									<select class="form-control select17" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-6">
									<label for="bio">Entreprise :</label>
									<select class="form-control select18" style="width: 100%;">
									    <option value="0">Veuillez s&#233;lectionner</option>
									</select>
								</div>
								<!--  -->
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Projet</label>
									<input type="text" class="form-control" min="0" placeholder="Projet" style="width: 100%;">
								</div>
								<!--  -->
								<div class="col-sm-6" style="margin-top: 13px">
									<label>Date d&#233;but du contrat :</label>
									<input type="text" id="dateD_09" class="form-control" placeholder="jj/mm/aaaa" style="width: 100%;height: 6vh;">
								</div>
							</div>



							<!-- PRIME  -->
							<div class="row" id="Avantages_prime" style="display: none;">
								<!--  -->
								<div class="col-sm-12" style="margin-top: -3px;">
									<label>Avantages :</label>
									<textarea type="text" class="form-control" rows="3" style="width: 100%;resize: none;"></textarea>
								</div>
								<div class="col-sm-4" style="margin-top: 13px;">
									<label style="font-size: 19px">Prime :</label> <br/>
									<input type="radio" id="OuiboxEX" name="gender" value="oui"><span style="font-size: 14px;margin-left: 1%">Oui</span>
									<input type="radio" id="NonboxEX" checked name="gender" value="non" style="margin-left: 9%"><span style="font-size: 14px;margin-left: 2%">Non</span>
								</div>
								<div class="col-sm-8 prime_tabEX" style="margin-left: 15%;margin-top: -4%; display: none;">
										<table class="test" id="table_tache" style="width: 100%;margin: 2% auto;">
											<tbody class="tableLEX">
												<tr>
													<td style="width: 100px;border:none;">
														<select class="form-control select19" style="width: 100%;border: none;margin: 2px auto">
													     	<option value="0" selected>S&#233;lectionner le libell&#233; de la prime</option>
														</select>
													</td>
													<td style="width: 5px;border:none;">
													</td>
													<td style="width: 100px;border:none;">
														<input type="number" min="0" placeholder="Montant de la prime" style="width: 100%;border: none;margin: 2px auto" class="form-control montant">
													</td>
													<td style="width: 20px;border:none;text-align: left;visibility: hidden">
														<i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i>
													</td>
												</tr>
											</tbody>
										</table>
										<div class="col-sm-12">
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
				<div type="submit" class="btn col-sm-2" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">FERMER</div>
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;background:transparent" />
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
	<!-- END JQUERY  -->

	 <!--Traitement des fonctions et variables globales js (en premier) -->
     <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/package_function.js"></script>


 <!--Traitement load personnel charger en premier -->
 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/personnel/personnel.js"></script>
  
    <!--Traitement stage-ecole -->
  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/specifique/stage_ecole/stage_ecole.js"></script>

   <!--Traitement stage-pro -->
  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/specifique/stage_pro/stage_pro.js"></script>

   <!--Traitement categorie -->
  <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/specifique/cdd_essai/cdd_essai.js"></script>




 

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

	 		$( "#date_sig,#dateD_01,#dateD_02,#dateD_03,#dateF_03,#dateD_04,#dateD_05,#dateF_O5,#dateD_09,#dateDE_03,#dateFE_03,#dateDE_06,#dateFE_06").datepicker({
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
		        
		        $('#col_partie_2,#stage_ecole,#stage_prof,#cdd_avec_essai,#cdd_lie_projet,#cdd_standart,#cdi_avec_essai,#cdi_standard,#consultant_interne,#consultant_externe,#Avantages_prime').css('display', 'none');
		        if(contrat == "Stage-ecole"){
		        	$('#col_partie_2,#stage_ecole').css('display', 'block');
		        }

		        if(contrat == "Stage professionnel"){
		        	$('#col_partie_2,#stage_prof').css('display', 'block');
		        }

		        if(contrat == "CDD lie au projet"){
		        	$('#col_partie_2,#cdd_lie_projet,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "CDD avec essai"){
		        	$('#col_partie_2,#cdd_avec_essai,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "CDD standard"){
		        	$('#col_partie_2,#cdd_standart,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "CDI avec essai"){
		        	$('#col_partie_2,#cdi_avec_essai,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "CDI standard"){
		        	$('#col_partie_2,#cdi_standard,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "Consultant interne"){
		        	$('#col_partie_2,#consultant_interne').css('display', 'block');
		        }

		        if(contrat == "Consultant externe"){
		        	$('#col_partie_2,#consultant_externe,#Avantages_prime').css('display', 'block');
		        }
		    });


	 		// Ajouter de ligne a la table
			$("#addRowEX").click(function(){    
				addRow();   			
            });

			function  addRow(){ 
			  	var Nouvell_ligne ='<tr>'+
						'<td style="width: 100px;border:none;">'+
							'<select class="form-control select19" style="width: 100%;border: none;margin: 2px auto">'+
								'<option value="0">S&#233;lectionner le libell&#233; de la prime</option>'+
							'</select>'+
						'</td>'+
						'<td style="width: 5px;border:none;">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="number" min="0" placeholder="Montant de la prime" style="width: 100%;border: none;margin: 2px auto" class="form-control montant">'+
						'</td>'+
						'<td style="width: 20px;border:none;text-align: left;">'+
						      '<i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i>'+
						'</td>'+
					'</tr>';
              	$('.tableLE,.tableLP,.tableLDS,.tableLIE,.tableLIS,.tableLEX').append(Nouvell_ligne);

              	//$('.select19').select2({});   
			}

			//Supprimer de ligne a la table
			$(document).on('click','#Suprim',function(){
                $(this).parents("table.test tr").remove();
			});


			// select2 
            $('.select1,.select2,.select3,.select4,.select5,.select6,.select7,.select8,.select9,.select10,.select11,.select12,.select13,.select14,.select15,.select16,.select17,.select18,.select19').select2({
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
 
	
</html>