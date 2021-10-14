<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation du contrat</title>
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
	          <!--formatage des nombres au format monétaire francais-->



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
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
			padding-left: 27px;
			padding-top: 5px;
		}
		
		.header-const{
			margin-bottom: 3%;
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

		.botton_pris{
			width: 100%;
			margin-top: -3%;
			padding-top: 0%;
			padding-right: 3%;
		}
		
		.botton_pris a{
			float: right;
			margin: 1%;
			color: black;
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


		/* Barre de progression  1  */
		
		.progres1 {
			width: 80%;
			margin: 20px auto;
			text-align: center;
		}
		.progres1 .circle1, .progres1 .bar1 {
			display: inline-block;
			background: #fff;
			width: 40px;
			height: 40px;
			border-radius: 40px;
			border: 1px solid #d5d5da;
		}
		.progres1 .bar1 {
			position: relative;
			width: 90px;
			height: 8px;
			top: -30px;
			margin-left: -5px;
			margin-right: -5px;
			border-left: none;
			border-right: none;
			border-radius: 0;
		}
		.progres1 .circle1 .label1 {
			display: inline-block;
			width: 32px;
			height: 32px;
			line-height: 32px;
			border-radius: 32px;
			margin-top: 3px;
			color: #b5b5ba;
			font-size: 17px;
		}
		.progres1 .circle1 .title1  {
			color: #b5b5ba;
			font-size: 13px;
			line-height: 30px;
			margin-left: -5px;
		}
		/* Done / Active */
		.progres1 .bar1.done1, .progres1 .circle1.done1 {
			background: #eee;
		}
		.progres1 .bar1.active1 {
			background: linear-gradient(to right,  40%, #FFF 60%);
		}
		.progres1 .circle1.done1 .label1 {
			color: #FFF;
			background: #81CE97;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres1 .circle1.done1 .title1  {
			color: #444;
		}
		.progres1 .circle1.active1 .label1 {
			color: #FFF;
			background: #0c95be;
			box-shadow: inset 0 0 2px rgba(0, 0, 0, .2);
		}
		.progres1 .circle1.active1 .title1  {
			color: #0c95be;
		}
		.progres1 {
			height:auto;
		}
		span {
			transition: background 2s;
		}

		.progres1 .circle1 div{
			display: none;
		}

		.progres1 .circle1:hover div{
			display: block;
			position: absolute;
			width: 20%;
			padding-bottom: 7px;
			margin: 0% -8%;
		}

		.progres1 .circle1 div span{
			font-size: 13px; 
			font-family: 'Times New Roman', Times, serif;
		}

		.container-info{
			width: 23%;
			margin: auto;
			margin-top: 11px;
			padding: 12px;
			background: #8097d3;
		}
				/*FIN Barre de progression  1  */


	</style>
</head>
<body  class='tpl_consultation tpl_consultation_pro' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formcontrat" ACTION='{URL_ATTENTE}' method='POST'>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='COT'>
				<input type='hidden' name='MODE'  class="get_mode" value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

					  <!-- nom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_NOM'  value="{USER_PRS_NOM}" id='input_nom' >
				<!--prénom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_PRE'  value="{USER_PRS_PRE}" id='input_pre'>
				<!--fonction de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_FON'  value="{USER_PRS_FON}" id='input_fon' >
				<!--departement de l'utilisateur-->
				<input class="form-control" type="hidden" name='POS_VAL_RUB_DPT' size='15' value="{USER_PRS_DPT}" >
        </div>
		<header class="header-const">
		<div id="actions-container" class="ui-widget-content titre-boutons" style="padding-left: 3%; text-align: center; background: transparent; border: none">
				 {ENTETE}
			</div>
			<div class="navbar navbar-default t3-mainnav marginBottom-0" role="navigation" style="margin-top: -1.7%">
				<div class="navbar-header">
					<button title="Cliquez ici pour voir les onglets" style="float:left;" type="button" class="btn navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-5">
						<i class="fa fa-bars fa-lg"></i> 
					</button>
				</div>
				<div class="collapse navbar-collapse " id="navbar-collapse-3">
					<ul class="nav navbar-nav level0 nav-tabs">
						<li class="active b1" ><a role="button" class=" btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li>
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>

		
		
		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
		   	<section class="botton_pris">
			<a href="javascript:void(0)"  style="display:none" class="btn p-1 bg-info print_vbtn">Visualiser le pdf</a>
			<a href="javascript:void(0)"  data-contrat="abrege cddi simple" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
		</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">

							<div class="row" style="margin-top: 0%">
								<div class="col-sm-12">
									<div class="col1_partie text-center">
										<span class="title text-while">GENERALITE</span>
									</div>
									<div class="col2_partie" style="padding-top: 3%;">
										<div class="container-fluid">
											<div class="row">
												<div class="col-sm-6">
													 <input type="hidden" name="POS_VAL_RUB_CIV" value="{POS_VAL_RUB_CIV}" class="civilite_pers" />
													 <input type="hidden" name="POS_VAL_RUB_NOM" value="{POS_VAL_RUB_NOM}" class="nom_pers" />
													 <input type="hidden" name="POS_VAL_RUB_PRE" value="{POS_VAL_RUB_PRE}" class="prenoms_pers" />
													 <input type="hidden" name="POS_VAL_RUB_MAT" value="{POS_VAL_RUB_MAT}" class="matricule_pers" />
													  <input type="hidden" name="POS_VAL_RUB_DSV" value="{POS_VAL_RUB_DSV}" class="dateEnreg_pers" />
													<label for="bio">Nom & Pr&#233;noms :</label>
													<select id="interimaire" style="width: 100%;" name='POS_VAL_RUB_MEL' class="form-control selectPers personnel" rows="1" data-parsley-required="true" >
													    <option value="0">Veuillez s&#233;lectionner</option>
													</select>
													<input type="hidden"  class="interselectperso" name='POS_VAL_CTRL_MEL' id='POS_VAL_CTRL_MEL' value='{POS_VAL_RUB_MEL}'>
												</div>
												<div class="col-sm-6">
													<label for="bio">Type de conctrat :</label>
													<select id="select_contrat" name='POS_VAL_RUB_TYE' class="form-control t_contrat" style="width: 100%;">
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
													<input type="hidden"  class="interselectcontrat" name='POS_VAL_CTRL_TYE' id='POS_VAL_CTRL_TYE' value='{POS_VAL_RUB_TYE}'>
										<!-- existance d'un contrat -->
									  <input type="hidden" name="POS_VAL_RUB_EXT" value="{POS_VAL_RUB_EXT}" class="exist_contrat"   />

									  <!--activé ou desactivé un contrat -->
									  <input type="hidden" name="POS_VAL_RUB_ACT" value="{POS_VAL_RUB_ACT}" class="status_activ_cot"  />
												</div>
												<div class="col-sm-6" style="margin-top: 13px">
													<label>Salaire :</label>
													<input type="text" name="POS_VAL_RUB_SAL" value="{POS_VAL_RUB_SAL}" class="form-control montant_net" min="1" placeholder="Salaire" style="width: 100%;">
												</div>
												<!-- montant en lettre -->
								<input type="hidden" name="POS_VAL_RUB_MDT" value="{POS_VAL_RUB_MDT}" class="form-control montant_letter" />
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
										<span class="title text-while">ETAPE 2</span>
									</div>
									<div class="col2_partie">
										<div class="container-fluid">
											<div class="row">

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="diplomes">
													<label for="bio">Dipl&#244;me :</label>
													<select name='POS_VAL_RUB_DIP' class="form-control selectDip diplome" style="width: 100%;">
													    
													</select>
													<input type="hidden"  class="interselectdiplome" name='POS_VAL_CTRL_DIP' id='POS_VAL_CTRL_DIP' value='{POS_VAL_RUB_DIP}'>
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="filieres">
													<label for="bio">Fili&#232;re :</label>
													<select name='POS_VAL_RUB_FLR' class="form-control selectFil filiere" style="width: 100%;">
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
													<select  name='POS_VAL_RUB_FON' class="form-control selectFont fonction"  style="width: 100%;">
 													</select>
 													<input type="hidden"  class="interselectfonction" name='POS_VAL_CTRL_FON' id='POS_VAL_CTRL_FON' value='{POS_VAL_RUB_FON}'>
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="categories">
													<label for="bio">Cat&#233;gorie :</label>
													<select name='POS_VAL_RUB_CAE' class="form-control selectCat categorie" style="width: 100%;">
													   
													</select>
													<input type="hidden"  class="interselectcategorie" name='POS_VAL_CTRL_CAE' id='POS_VAL_CTRL_CAE' value='{POS_VAL_RUB_CAE}'>
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="cnps">
													<label>CNPS :</label>
													<input type="text" name="POS_VAL_RUB_CNP" value="{POS_VAL_RUB_CNP}"   class="form-control" placeholder="CNPS" style="width: 100%;">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="assurances">
													<label>Assurance :</label>
													<input type="text" name="POS_VAL_RUB_ASN" value="{POS_VAL_RUB_ASN}" class="form-control" placeholder="Assurance" style="width: 100%;">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="Levels">
													<label>Level :</label>
													<select name='POS_VAL_RUB_LVL' class="form-control selectLevs level" style="width: 100%;">
 													</select>
 													<input type="hidden"  class="interselectlevel" name='POS_VAL_CTRL_LVL' id='POS_VAL_CTRL_LVL' value='{POS_VAL_RUB_LVL}'>
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="projets">
													<label>Projet :</label>
													<input type="text" name="POS_VAL_RUB_LPR" value="{POS_VAL_RUB_LPR}" class="form-control" placeholder="Projet" style="width: 100%;">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="volumeHoraiares">
													<label>Volume horaire</label>
													<input type="text" name="POS_VAL_RUB_VHE" value="{POS_VAL_RUB_VHE}"   class="form-control horaire" min="1" placeholder="Volume horaire" style="width: 100%;">

													<input type="hidden" class="horaire_lettre" name="POS_VAL_RUB_A1" value="{POS_VAL_RUB_A1}">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="nombreJours">
													<label>Nombre de jours</label>
													<input type="text" name="POS_VAL_RUB_NBR" value="{POS_VAL_RUB_NBR}" class="form-control nbrejrs"  placeholder="Nombre de jours" style="width: 100%;">
													<input type="hidden" class="nbrejrs_lettre" name="POS_VAL_RUB_A2" value="{POS_VAL_RUB_A2}">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="periodeEssai">
													<label>Dur&#233;e d&#146;essai (en mois) :</label>
													<input type="text" name="POS_VAL_RUB_DRU" value="{POS_VAL_RUB_DRU}" class="form-control duree_essai"  placeholder="Dur&#233;e d&#146;essai (en mois)" style="width: 100%;">
													<input type="hidden" name="POS_VAL_RUB_DLA" value="{POS_VAL_RUB_DLA}" class="mois_lettre_essai" />
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dateDebutEssai">
													<label>Date d&#233;but d&#146;essai :</label>
													<input type="text" name="POS_VAL_RUB_DEI" value="{POS_VAL_RUB_DEI}" id="dateDebutEs" class="form-control datedeb_essai" placeholder="jj/mm/aaaa" style="width: 100%;">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dateFinEssai">
													<label>Date fin d&#146;essai :</label>
													<input type="text" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" id="dateFinEs" readonly="true" class="form-control datefin_essai" placeholder="jj/mm/aaaa" style="width: 100%;">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dureeContrats">
													<label>Dur&#233;e du contrat (en mois)</label>
													<input type="text" name="POS_VAL_RUB_MOI" value="{POS_VAL_RUB_MOI}"  class="form-control ecole_duree" min="1" placeholder="Dur&#233;e du contrat (en mois)" style="width: 100%;">
     
													<!-- Mois en lettre -->
									<input type="hidden"  name="POS_VAL_RUB_M1" value="{POS_VAL_RUB_M1}"     class="mois_lettre" />
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;" id="dateDebutContrats">
													<label>Date d&#233;but du contrat :</label>
													<input type="text"  name="POS_VAL_RUB_DDT" value="{POS_VAL_RUB_DDT}" id="dateDebutConts" class="form-control ecole_datedeb" placeholder="jj/mm/aaaa" style="width: 100%;">
												</div>

												<div class="col-sm-4" style="margin-top: 13px;display: none;display: none;" id="dateFinContrats">
													<label>Date fin du contrat :</label>
													<input type="text" readonly="true" name="POS_VAL_RUB_DEC" value="{POS_VAL_RUB_DEC}"  id="dateFinConts " class="form-control ecole_datefin" placeholder="jj/mm/aaaa" style="width: 100%;">
												</div>

											</div>

											<!-- PRIME  -->
											<div class="row" id="Avantages_prime" style="margin-top: 13px;display: none;">
												<!--  -->
												
												<div class="col-sm-12" style="margin-top: -3px;">
													<label>Avantages :</label>
													<div style="color:red">
														<i>Veuillez ajouter les charact&egrave;res -* avant l'ajout du texte au d&eacute;but d'une nouvelle ligne </i>
													</div>
													<textarea type="text" name="POS_VAL_RUB_COM" class="form-control" rows="3" style="width: 100%;resize: none;">{POS_VAL_RUB_COM}</textarea>
												</div>
												<div class="col-sm-4" style="margin-top: 13px;">
													<label style="font-size: 19px">Prime :</label> <br/>
													<input type="radio" id="OuiboxEX" name="POS_VAL_RUB_PRM" value="OUI"><span style="font-size: 14px;margin-left: 1%">Oui</span>
													<input type="radio" id="NonboxEX" name="POS_VAL_RUB_PRM" value="NON" style="margin-left: 9%"><span style="font-size: 14px;margin-left: 2%">Non</span>
													 	<input type="hidden" name="POS_VAL_CTRL_PRM" value="{POS_VAL_RUB_PRM}">
												</div>
												<div class="col-sm-8 prime_tabEX" style="margin-left: 15%;margin-top: -4%; display: none;">
														<table class="test tableTaches" style="width: 100%;margin: 2% auto;">
															<tbody class="tableL">
																<tr>
																	<td style="width: 100px;border:none;">
																		<select  name="lib_prime[]" class="form-control selectPrims lib_prime" style="width: 100%;border: none;margin: 2px auto">
																	     	 
																		</select>
																	</td>
																	<td style="width: 5px;border:none;">
																	</td>
																	<td style="width: 100px;border:none;">
																		<input type="text" name="montant_prime[]" min="0" placeholder="Montant de la prime" style="width: 100%;border: none;margin: 2px auto" class="form-control montant_prime">
																	</td>
																	<td style="width: 20px;border:none;text-align: left;visibility: hidden">
																		<i class="fa fa-archive" title="Suprimer la ligne" id="Suprim"></i>
																	</td>
																</tr>
															</tbody>
														</table>
														<span class="t_total"></span>
														<div class="col-sm-12">
															<i class="fa fa-archive btn" id="SuprimeLigs" title="Suprimer la derni&#232;re ligne" style="margin-left: 67%;margin-top: -0.9%;position: absolute;background: #4a67b3;color: #FFF;font-size: 11px;"></i>
															<span class="button_plus" id="addRowEX">Ajouter une ligne</span>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

						</nav>
					<!-- fin -->
				</div>
		   </div>
		   <!-- traitement -->
			 <!-- traitement -->
			<div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			   	<div class="info"  style="">

					<div class="jumbotron container-info" style="display:none;">
						<table class="table" align="center" id="tblMain">
							<tr>
								<td style="font-size: 15px; font-family: 'Times New Roman';">
									<span name="current" class="label1 label-success" data-value="{POS_VAL_RUB_EAC}"><b>{POS_VAL_RUB_EAC}</b></span>
								</td>
							</tr>
						</table>
					</div>
					<div class="progres1">

					   <div class="circle1" style="display: none;">
							<span class="label1">0</span>
							<span class="title1">User1</span>
						</div>
						<span class="bar1" style="display: none;"></span>


						<div class="circle1">
							<span class="label1">1</span>
							<span class="title1">RH</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 20%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CRE}</strong>
								</p>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DCR}</strong>
								</span>
							</div>
						</div>
						<span class="bar1"></span>

						<div class="circle1">
							<span class="label1">2</span>
							<span class="title1">EMPLOYE</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4A}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 empl_visa" style="font-size: 13px;">{POS_VAL_RUB_VC0}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT1}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT1}</strong>
									</span>
								</p>
							</div>
						</div>
						
						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">3</span>
							<span class="title1">MANAGER_ADM</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4B}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 mng_visa" style="font-size: 13px;">{POS_VAL_RUB_VC1}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT2}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT2}</strong>
									</span>
								</p>
							</div>
						</div>
						
						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">4</span>
							<span class="title1">DGA</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4C}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 dga_visa" style="font-size: 13px;">{POS_VAL_RUB_VC2}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT3}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT3}</strong>
									</span>
								</p>
							</div>
						</div>

						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">5</span>
							<span class="title1">DG</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4D}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5  e_adm_visa" style="font-size: 13px;">{POS_VAL_RUB_VC3}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT5}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT4}</strong>
									</span>
								</p>
							</div>
						</div>
						
						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">6</span>
							<span class="title1">CLOS</span>
							
						</div>
					</div>

						<!--commentaire sur  de la ligne de vie du parcours de l'employe -->

					<div class="row jumbotron" style="margin: auto;padding: 12px">

					<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">EMPLOYE</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
									<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4A', 'POS_VAL_RUB_A4A')">
									   <img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
									</a>
								</div>	
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC0}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT1' value="{POS_VAL_RUB_DT1}" class="form-control" style="width: 100%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT1' style="width: 90%;resize: none">{POS_VAL_RUB_CT1}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">MANAGER ADM</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" style="width: 80%;">
									<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4B', 'POS_VAL_RUB_A4B')">
									   <img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
									</a>
								</div>	
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC1}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT2' value="{POS_VAL_RUB_DT2}" class="form-control" style="width: 100%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT2' style="width: 90%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
						</div>
						<!-- acteur 3 -->
						<div class="acteur3">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DGA</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="form-control" placeholder="" style="width: 80%;">
										<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4C', 'POS_VAL_RUB_A4C')">
											<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>
									</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC2}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT3' value="{POS_VAL_RUB_DT3}" class="form-control" placeholder="" style="width: 100%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT3' rows="1" style="width: 90%;resize: none">{POS_VAL_RUB_CT3}</textarea>
							</div>
						</div>
						<!-- acteur 4 -->
						<div class="acteur4">
							<div class="col-sm-4" style="padding-bottom: 3%">
								<label for="bio">DG</label>
									<div class="info_group" style="display:flex;flex-direction:row">
									 	<input type="text" name='POS_VAL_RUB_A4D' value="{POS_VAL_RUB_A4D}" class="form-control" placeholder="" style="width: 80%;">
											<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4D', 'POS_VAL_RUB_A4D')">
												<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
											</a>
									</div>
							</div>
							<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC3}.gif" alt="">

								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT5' value="{POS_VAL_RUB_DT5}" class="form-control" placeholder="" style="width: 90%;">
							</div>
							<div class="col-sm-5" style="padding-bottom: 3%">
								<label for="bio">Commentaire</label>
								<textarea class="form-control" id="bio" rows="1" name='POS_VAL_RUB_CT4' style="width: 90%;resize: none">{POS_VAL_RUB_CT4}</textarea>
							</div>
						</div>
					</div>
				
	<!-- Fin du commentaire de la ligne de vie -->

				</div>
		   	</div>
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
					<div class="col-sm-6" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 5%. padding-bottom: 0;">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">VISUALISEUR</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 3%">
							<iframe id='frm_affiche_fichier' name='frm_affiche_fichier' src='../afficheur/afficher_menu_fichier.php?POS_NUM_DOC={POS_NUM_DOC}#view=FitH'  height='630px' width='99%' scrolling='auto' frameborder='0' style=""></iframe>
						</div>
					</div>
				</div>
		   </div>
		   <!-- historique -->
		   <div class="tab-pane fade in "  id="tabs-4" style="margin-top:0.5%;">
			   <nav class="container-fluid">
					<div class="row" style="margin-top: 1%">
								<!-- 12_ 1 infos -->
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 12px">HISTORIQUE</span>
							</div>
							<div class="col3_partie" style="padding: 5%;">
								<!-- N° poseidon -->
								<div class="form-group row" style="margin: 0%">
									<label for="bio">N&#176; poseidon</label>
									<input type="text" name='POS_VAL_RUB_NUD' id="numposeidon" value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>

 									 
									<input type="hidden" name='POS_VAL_RUB_DCR' id="date_enreg" value="{POS_VAL_RUB_DCR}" placeholder="Date de creation" class="form-control" style="width: 100%">
								 
								<!-- Etat Fiche -->
								<div class="form-group" style="margin-top: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin-top: 2%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" name='POS_VAL_RUB_HIS'   style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
								</div>
							</div>
						</div>
								<!-- 12_ 2 infos -->
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 10px">AUTORISATION D'ACCES</span>
							</div>
							<div class="col3_partie" style="padding-top: 5%;">
								<!-- Consultation -->
								<div class="form-group">
								   <label for="bio">Consultation :</label>
								  <textarea  class="form-control" id="bio" name='POS_VAL_RUB_AVU' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_AMO' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_ASU' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
								</div>
							</div>
						</div>
					</div>
				</nav>
		   </div>
		</div>


		<script type="text/javascript">
			
		</script>
			
	</form>
</body>
	<!-- JQUERY  -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	   	<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery-ui.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/script/progress/jquery.validate.min.js"></script>
		<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

		
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>

		 <!-- requete de la mise en oeuvre d'une requete ajax-->
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/traitementjs/cotjs.js"></script>
	<!-- END JQUERY  -->
	<!--Traitement des fonctions et variables globales js (en premier) -->
     <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/package_edit.js"></script>


	<script>
				 
if($('.get_mode').val()=='CONSULTATION'){
	 $('.btn').hide();
	
}


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

			   $(".print_btn").attr("data-contrat", contratabrege);

		});





	 	$(document).ready(function () {


			$( "#dateSig,#dateDebutEs,#dateFinEs,#dateDebutConts,#dateFinConts").datepicker({
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

			// script de bouton radio 
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

	    	function type_contrat(){


	    		 var contrat = $("#select_contrat").val();

	    		 var t_contrat = $(".interselectcontrat").val();
		        
		              
	    		  $('#col_partie_2,#diplomes,#filieres,#domaines,#entreprises,#Levels,#assurances,#fonctions,#categories,#projets,#cnps,#volumeHoraiares,#nombreJours,#periodeEssai,#dateDebutEssai,#dateFinEssai,#dureeContrats,#dateDebutContrats,#dateFinContrats,#Avantages_prime').css('display', 'none');

		        if(contrat == "Stage-ecole" || t_contrat == "Stage-ecole"){
		        	$('#col_partie_2,#diplomes,#filieres,#entreprises,#Levels,#assurances,#dureeContrats,#dateDebutContrats,#dateFinContrats').css('display', 'block');
		        }

		        if(contrat == "Stage professionnel" || t_contrat == "Stage professionnel" ){
		        	$('#col_partie_2,#domaines,#entreprises,#Levels,#assurances,#dureeContrats,#dateDebutContrats,#dateFinContrats').css('display', 'block');
		        }

		        if(contrat == "CDD avec essai" || t_contrat == "CDD avec essai"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#periodeEssai,#dateDebutEssai,#dateFinEssai,#dureeContrats,#dateDebutContrats,#dateFinContrats,#Avantages_prime').css('display', 'block');
		        }

		         if(contrat == "CDD lie au projet" || t_contrat == "CDD lie au projet" ){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#Levels,#entreprises,#dateDebutContrats,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "CDD standard" ||  t_contrat == "CDD standard"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#dureeContrats,#dateDebutContrats,#dateFinContrats,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "CDI avec essai" || t_contrat == "CDI avec essai" ){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#periodeEssai,#dateDebutEssai,#dateFinEssai,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "CDI standard" || t_contrat == "CDI standard"){
		        	$('#col_partie_2,#fonctions,#categories,#cnps,#Avantages_prime').css('display', 'block');
		        }

		        if(contrat == "Consultant interne" || t_contrat == "Consultant interne" ){
		        	$('#col_partie_2,#fonctions,#assurances,#volumeHoraiares,#nombreJours,#dureeContrats').css('display', 'block');
		        }

		        if(contrat == "Consultant externe" || t_contrat == "Consultant externe" ){
		        	$('#col_partie_2,#fonctions,#assurances,#entreprises,#projets,#dateDebutContrats,#Avantages_prime').css('display', 'block');
		        }
	    	}
	    	 type_contrat();
			$("select#select_contrat").change(function(){
		       type_contrat();
		    });


	 		// Ajouter de ligne a la table
			/*$(document).on('click','#addRowEX',function(){   
				//addRow();  
				$("#SuprimeLigs").css("display","block"); 			
            });*/

			// Ajouter de ligne a la table  traitement effectue dans mon js
			/*function  addRow(){ 
			  	var Nouvell_ligne ='<tr>'+
						'<td style="width: 100px;border:none;">'+
							'<select class="form-control" style="width: 100%;border: none;margin: 2px auto">'+
								'<option value="0">S&#233;lectionner le libell&#233; de la prime</option>'+
							'</select>'+
						'</td>'+
						'<td style="width: 5px;border:none;">'+
						'</td>'+
						'<td style="width: 100px;border:none;">'+
							'<input type="text" min="0" placeholder="Montant de la prime" style="width: 100%;border: none;margin: 2px auto" class="form-control montant">'+
						'</td>'+
					'</tr>';
              	$('.tableL').append(Nouvell_ligne);
			}*/

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
	// fin script IHM
			 
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
		

		//  Barre de progression 


		$('.progres1 .circle1').removeClass().addClass('circle1');
		$('.progres1 .bar1').removeClass().addClass('bar1');
		$(".circle1").first().addClass("active1");

		
			var timer = setInterval(increment, 1000);

		function increment() {
			$(".circle1:not(.done1)").first().removeClass("active1").addClass("done1").children(":first-child").html("&#10003;");
			$(".circle1:not(.done1)").first().addClass("active1");
			$(".circle1.done1").next().addClass("done1");
			if ($(".active1").find(".title1").text() === $("tr:last-child").find(".label1").text()) {
				clearInterval(timer);
			}
		}
		// Fin de la Barre de progression 
		 
	</script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/COT/workflowCOT.js"></script>

	
</html>