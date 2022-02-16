<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de registre employeur</title>
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
	
	<!--ABASS INCLUDE-->
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/bootstrap.css" rel="stylesheet" type="text/css" />
		<link type="text/css"  href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.css"></link>
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
	  
	<style>

		.col_list{
			width: 22%;
			float: right;
			font-family: 'Times New Roman';
			font-size: 14px;
			background-color: transparent;
			font-weight: lighter; 
		}

		.hearder_card{
			width: 100%;
			border: 1px solid #4a67b3; 
			padding: 1px;
		}
			
		.col1_partie{
			width: 100%;
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
			margin: -2% 0%; 
			margin-bottom: 2%;
			padding-top: 3%;
			padding-left: 5%;
			padding-right: 5%;
		}
			
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
		}
		
		.header-const{
			margin-bottom: 3%;
		}
		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}



		/*Debut de la Barre de progression  */

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
			width: 60px;
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

		/*Debut de la Barre de progression  1  */



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
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_reg' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formpret" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='REG'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->

		<input type='hidden' class='appName' value="{NOM_APPLICATION}">
		
		<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
		<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
		<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
		<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
		<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">


		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_REG_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
			<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
		</a>
		</div>

		<header class="header-const">
			<div id="actions-container" class="ui-widget-content titre-boutons" style="padding-left: 3%; text-align: center; background: transparent; border: none">
				 {ENTETE}
			</div>
			<div class="navbar navbar-default t3-mainnav marginBottom-0" role="navigation" style="margin-top: -1.7%">
				<div class="navbar-header">
					<button title="Clicquez ici pour voir les onglets" style="float:left;" type="button" class="btn navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-5">
						<i class="fa fa-bars fa-lg"></i> 
					</button>
				</div>
				<div class="collapse navbar-collapse " id="navbar-collapse-3">
					<ul class="nav navbar-nav level0 nav-tabs">
						<li class="active b1" ><a role="button" class="btn btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						<!-- <li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li> -->
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>

      

		<div class="tab-content">
		   <div class="tab-pane fade active in"  id="tabs-1">
		   		<section class="botton_pris">
				<a href="javascript:void(0)"  style="display:none" class="btn p-1 bg-info print_vbtn">Visualiser le pdf</a>
				<a href="javascript:void(0)" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
			</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="col-sm-12 mt-5">
								<div class="col1_partie text-center">
									<span class="title text-while">DESCRIPTIF</span>
								</div>
								<div class="col2_partie">
									<div class="row" style="padding-top: 1%;padding-bottom: 2%">
										<div class="col-sm-6" style="margin-top: 13px">
											<label>Nom & pr&#233;noms :</label>
											<!--<select id="selection" name='POS_VAL_RUB_CIV' class="form-control selectNom" style="width: 100%;">
												<option value="" selected>Veuillez s&#233;lectionner</option>
											</select>-->
												<input type="hidden" disabled="true" name="POS_VAL_RUB_NOM" value="{POS_VAL_RUB_NOM}" class="form-control nom" style="width: 100%">
												<input type="hidden" disabled="true" name="POS_VAL_RUB_PRE" value="{POS_VAL_RUB_PRE}" class="form-control prenoms" style="width: 100%">

												<input type="hidden" disabled="true" name="POS_VAL_RUB_MEL" value="{POS_VAL_RUB_MEL}" class="form-control email" style="width: 100%">
<input type="text" disabled="true"  name="POS_VAL_RUB_INT" value="{POS_VAL_RUB_INT}" class="form-control nom_pre" style="width: 100%">
											 
											<!-- Catégorie -->
											<input type="hidden" name="POS_VAL_RUB_CAE" value="{POS_VAL_RUB_CAE}" class="form-control" style="width: 100%">

										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Classement dans la hièrarchie professionnelle :</label>
											<!-- Catégorie -->
											<input type="hidden" name="POS_VAL_RUB_CAE" value="{POS_VAL_RUB_CAE}" class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Date du classement :</label>
											<input type="text" name="POS_VAL_RUB_DCL" value="{POS_VAL_RUB_DCL}" class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Salaire de base :</label>
											<input type="text" name="POS_VAL_RUB_SAB" value="{POS_VAL_RUB_SAB}" class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Date de fixation :</label>
											<input type="text" name="POS_VAL_RUB_DAF" value="{POS_VAL_RUB_DAF}" class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Prime d&#145;anciennet&#233; :</label>
											<input type="text" name="POS_VAL_RUB_PRA" value="{POS_VAL_RUB_PRA}" class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Prime de rendement :</label>
											<input type="text" name="POS_VAL_RUB_PRR" value="{POS_VAL_RUB_PRR}" class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Indemnit&eacute; de transport :</label>
											<input type="text" name="POS_VAL_RUB_IND" value="{POS_VAL_RUB_IND}" class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="margin-top: 13px">
											<label>Autres indemnit&eacute;s :</label>
											<input type="text" name="POS_VAL_RUB_ATI" value="{POS_VAL_RUB_ATI}" class="form-control" placeholder="Autres indemnit&eacute;s" style="width: 100%">
										</div>

										<div class="col-sm-6" style="margin-top: 13px">
											<label>Horaire du travail :</label>
											<input type="text" name="POS_VAL_RUB_HOR" value="{POS_VAL_RUB_HOR}"  class="form-control" placeholder="Horaire du travail"  style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Date affectation :</label>
											<input type="text" name="POS_VAL_RUB_DTA" value="{POS_VAL_RUB_DTA}"  class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Date de depart en cong&#233; :</label>
											<input type="text" name="POS_VAL_RUB_DCO" value="{POS_VAL_RUB_DCO}"  class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Nombre de jours :</label>
											<input type="text" name="POS_VAL_RUB_NMJ" value="{POS_VAL_RUB_NMJ}"  class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="margin-top: 13px">
											<label>Renum&#233;ration de cong&#233; :</label>
											<input type="text" name="POS_VAL_RUB_REN" value="{POS_VAL_RUB_REN}"  class="form-control" placeholder="Renum&#233;ration de cong&#233;" style="width: 100%">
										</div>

										<div class="col-sm-6" style="display: none;margin-top: 13px">
											<label>Date de la reprise de travail :</label>
											<input type="text" name="POS_VAL_RUB_A1" value="{POS_VAL_RUB_A1}"  class="form-control" style="width: 100%">
										</div>

										<div class="col-sm-6" style="margin-top: 13px">
											<label>Cautionnement :</label><br>

											<input type="radio" name="POS_VAL_RUB_CAU" value="OUI" class="btnFors" style="margin-right: 0.2%;margin-left: 0.3%">
											<span style="font-size: 12px;margin-right: 3%">Oui</span>

											<input type="radio" name="POS_VAL_RUB_CAU" value="NON" class="btnFors" checked style="margin-right: 0.2%">
											<span style="font-size: 12px;">Non</span>

											<input type="hidden" name="POS_VAL_CTRL_CAU" value="{POS_VAL_RUB_CAU}">

										</div>
									</div>
									<div class="row" style="margin-top: 13px">
										<label style="font-size: 19px;font-weight: 500;margin-left: 10px">EN NATURE</label>
										<br>
										<div class="col-sm-3" style="padding-left: 2%; padding-bottom: 2%">
											<label>Nourriture :</label><br>
											<input type="radio" name="POS_VAL_RUB_NRR" value="OUI" class="btnFors" style="margin-right: 0.2%;margin-left: 1%">
											<span style="font-size: 12px;margin-right: 3%">Oui</span>
											<input type="radio" name="POS_VAL_RUB_NRR" value="NON" class="btnFors" checked style="margin-right: 0.2%">
											<span style="font-size: 12px;">Non</span>
											<input type="hidden" name="POS_VAL_CTRL_NRR" value="{POS_VAL_RUB_NRR}">
										</div>

										<div class="col-sm-3" style="padding-bottom: 2%">
											<label>Logement :</label><br>
											<input type="radio" class="btnFors" name="POS_VAL_RUB_LOG" value="OUI" style="margin-left: 1%">
											<span style="font-size: 12px;margin-right: 3%">Oui</span>
											<input type="radio" name="POS_VAL_RUB_LOG" value="NON" class="btnFors" checked style="margin-right: 0.2%">
											<span style="font-size: 12px;">Non</span>
											<input type="hidden" name="POS_VAL_CTRL_LOG" value="{POS_VAL_RUB_LOG}">

										</div>
									</div>
								</div>
							</div>
						</nav>
					<!-- fin -->
				</div>
		   </div>

		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
					<div class="col-sm-12" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col3_partie" style="padding-top:0%;">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  width='100%' height='100px' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
						</div>
					</div>
					<div class="col-sm-12" style="margin-top:0.7%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">VISUALISEUR</span>
						</div>
						<div class="col3_partie text-center" style="padding-top: 0%">
							<iframe id='frm_affiche_fichier' name='frm_affiche_fichier' src='../afficheur/afficher_menu_fichier.php?POS_NUM_DOC={POS_NUM_DOC}#view=FitH'  height='630px' width='99%' scrolling='auto' frameborder='0' style=""></iframe>
						</div>
					</div>
				</div>
		   </div>
		   <!-- historique -->
		   <div class="tab-pane fade in "  id="tabs-4" style="margin-top:0.7%;">
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
									<input type="text" id="numposeidon" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="Etat Fiche" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_HIS' rows="5" style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
								</div>
							</div>
						</div>
								<!-- 12_ 2 infos -->
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 10px">AUTORISATION D'ACCES</span>
							</div>
							<div class="col3_partie" style="padding: 5%;">
								<div class="form-group">
								   <label for="bio">Consultation :</label>
								  <textarea  class="form-control" id="bio" rows="2"  name='POS_VAL_RUB_AVU' style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_AMO' style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_ASU' style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
								</div>
							</div>
						</div>
					</div>
				</nav>
		   </div>
		</div>
	</form>
</body>

	<!-- jquery  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
		<script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- endjquery  -->

<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/REG/regpdf/pdfregistre.js"></script>
		
	<!-- imporation du fichier de desactivation des champs -->
		<script src="../../../../disable_fields.js"></script>
	 <script>

	  // vnbreemprunt vprelevmens vqutotite vmtnemprunt vdatefinprelev vqutotiteprele
     $('.nom_pre').val($('.nom').val()+' '+$('.prenoms').val() );

	var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
		$('.bouton_sub').hide();	
			}
   
	</script>
 	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/REG/notification.js"></script>

	
</html>


