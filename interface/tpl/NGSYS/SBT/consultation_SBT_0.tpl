<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation du salaire brute</title>
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
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
	
	<style>
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
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 5px;
		}
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
			padding-left: 27px;
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
		
		.header-const{
			margin-bottom: 3%;
		}

		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_sbt' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal'  id="formsalairebrute" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='SBT'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->
		
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
						 
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>

		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="row" style="margin-top: 1%">
								<!-- 12_ 1 infos -->
								<div class="col-sm-6 mt-5" style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">DESCRIPTIF</span>
									</div>
									<div class="col2_partie" style="padding-top: 5%;">
											<!-- Code & Civilité -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Code</label>
												<input type="text" name='POS_VAL_RUB_CDC'  value="{POS_VAL_RUB_CDC}" class="form-control" placeholder="Code" style="width: 100%">
											</div>
											<div class="col-sm-5">
												<label for="bio">Civilit&eacute;</label>
												<select id="selection" name='POS_VAL_RUB_CIV' class="form-control civilite" rows="1" data-parsley-required="true" >
													<option value="0" disabled="disabled" selected>Veuillez selectionner</option>
														<option value="M">Monsieur</option>
														<option value="MME">Madame</option>
														<option value="MLLE">Mademoiselle</option>
												</select>
												<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV' value='{POS_VAL_RUB_CIV}'>
											</div>
										</div>
										<!-- Nom & Prénom -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Nom</label>
												<input type="text" class="form-control"  placeholder="Nom" style="width: 100%">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Pr&#233;noms</label>
												<input type="text" class="form-control"  placeholder="Pr&#233;noms" style="width: 100%">
											</div>
										</div>
										<!-- Service & Catégorie -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Service</label>
												<input type="text" name='POS_VAL_RUB_SER'  value="{POS_VAL_RUB_SER}" class="form-control" placeholder="Service" style="width: 100%;">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Cat&#233;gorie</label>
												<input type="text" name='POS_VAL_RUB_CAE'  value="{POS_VAL_RUB_CAE}" class="form-control" placeholder="Cat&#233;gorie" style="width: 100%;">
											</div>
										</div>
										<!-- durée & Salaire de base -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Dur&#233;e</label>
												<input type="text" name='POS_VAL_RUB_DUR'  value="{POS_VAL_RUB_DUR}" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?"  class="form-control" placeholder="Dur&#233;e" style="width: 100%;">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Salaire de base</label>
												<input type="text"  name='POS_VAL_RUB_BSE'  data-parsley-pattern="^[0-9]+$" data-parsley-trigger="keyup" value="{POS_VAL_RUB_BSE}" class="form-control" placeholder="Salaire de base" style="width: 100%;">
											</div>
										</div>
										<!-- Sursalaire & Ancienneté -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Sursalaire</label>
												<input type="text" name='POS_VAL_RUB_SRA'   value="{POS_VAL_RUB_SRA}" class="form-control" placeholder="Sursalaire" style="width: 100%;">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Anciennet&#233;</label>
												<input type="text"  name='POS_VAL_RUB_ACI'  value="{POS_VAL_RUB_ACI}" class="form-control" placeholder="Anciennet&#233;" style="width: 100%;">
											</div>
										</div>
										<!-- Astreinte & Heure supplementaire -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Astreinte</label>
												<input type="text" name='POS_VAL_RUB_ATR'  value="{POS_VAL_RUB_ATR}" class="form-control" placeholder="Astreinte" style="width: 100%;">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Heure supplementaire</label>
												<input type="time" name='POS_VAL_RUB_HSU'  value="{POS_VAL_RUB_HSU}" class="form-control" style="width: 100%;">
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">INFOS COMPPLEMENTAIRES</span>
									</div>
									<div class="col2_partie" style="padding-top: 5%;">
										<!-- Transp imp  -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">Transp imp</label>
												<input type="text" name='POS_VAL_RUB_TRA'  value="{POS_VAL_RUB_TRA}"  class="form-control" id="bio" placeholder="Transp imp" style="width: 100%;">
											</div>
										</div>
										<!-- Salaire brute imp -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">Salaire brute imp</label>
												<input type="text" name='POS_VAL_RUB_SLI' size='15' value="{POS_VAL_RUB_SLI}"  class="form-control" id="bio" placeholder="Salaire brute imp" style="width: 100%;">
											</div>
										</div>
										<!-- Representation -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">Representation</label>
												<input type="text" name='POS_VAL_RUB_RTN'  value="{POS_VAL_RUB_RTN}" class="form-control" placeholder="Representation" style="width: 100%;">
											</div>
										</div>
										<!-- Transport -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">Transport</label>
												<input type="text" name='POS_VAL_RUB_TRS'   value="{POS_VAL_RUB_TRS}" class="form-control" placeholder="Transport" style="width: 100%;">
											</div>
										</div>
										<!-- Salaire brute -->
										<div class="row">
											<div class="col-sm-12 form-group">
												<label for="bio">Salaire brute</label>
												<input type="text"  name='POS_VAL_RUB_SLB' value="{POS_VAL_RUB_SLB}" class="form-control" placeholder="Salaire brute" style="width: 100%;">
											</div>
										</div>
										<!-- Assurance & Net calculé  -->
										<div class="row">
											<div class="col-sm-6 form-group">
												<label for="bio">Assurance</label>
												<input type="text" name='POS_VAL_RUB_ASN'  value="{POS_VAL_RUB_ASN}" class="form-control" placeholder="Assurance" style="width: 100%;">
											</div>
											<div class="col-sm-6 form-group">
												<label for="bio">Net calcul&#233;</label>
												<input type="text"  name='POS_VAL_RUB_NET'   value="{POS_VAL_RUB_NET}"  class="form-control" placeholder="Net calcul&#233;" style="width: 100%;">
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
			 
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
					<div class="col-sm-6" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 0%.;">
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
									<input type="text" name='POS_VAL_RUB_NUD'   value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" name='POS_VAL_RUB_ETF'   value="{POS_VAL_RUB_ETF}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" name='POS_VAL_RUB_HIS' id="bio" rows="5" style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
								</div>
							</div>
						</div>
								<!-- 12_ 2 infos -->
						<div class="col-sm-6 mt-5">
							<div class="col1_partie text-center">
								<span class="title text-while;font-size: 10px">AUTORISATION D'ACCES</span>
							</div>
							<div class="col3_partie" style="padding: 5%;">
								<!-- Consultation -->
								<div class="form-group">
								   <label for="bio">Consultation :</label>
								  <textarea  class="form-control" name='POS_VAL_RUB_AVU' id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" name='POS_VAL_RUB_AMO' id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" name='POS_VAL_RUB_ASU' id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
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
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
		<script src="../dist/jquery-steps.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
	<!-- endjquery  -->
	
	 <script>
	 $('#formsalairebrute').parsley();
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
	//affichage en fonction du MODE sur le Formulaire  
	if($('.get_mode').val()=='CONSULTATION'){
		$('.btn').hide();
	}
		 
 
   
	</script>
	
</html>


