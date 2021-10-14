<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation du poste</title>
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
			padding-top: 5px;
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
<body  class='tpl_consultation tpl_consultation_pos' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formposte"  ACTION='{URL_ATTENTE}' method='POST'  data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='POS'/>
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
						<li class="active b1" ><a role="button" class=" btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						 
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
							<div class="row" style="margin-top: 0%">
								<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5">
									<div class="col1_partie text-center">
										<span class="title text-while">DESCRIPTIF</span>
									</div>
									<div class="col2_partie" style="padding-top: 7%;">
										<!-- Intitulé du poste & Mission du poste -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Intitul&#233; du poste</label>
												<input type="text" name='POS_VAL_RUB_IPO'  value="{POS_VAL_RUB_IPO}"  placeholder="Intitul&#233; du poste" class="form-control" data-parsley-required="true">
											</div>
											<div class="col-sm-6">
												<label>Mission du poste</label>
												<textarea rows="2" name='POS_VAL_RUB_MPO'  class="form-control" style="resize: none">{POS_VAL_RUB_MPO}</textarea>
											</div>
										</div>
										<!-- Hiérarchie opérationnelle & Hiérarchie Fonctionnelle -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Hi&#233;rarchie op&#233;rationnelle</label>
												<input type="text"  name='POS_VAL_RUB_HIO'  value="{POS_VAL_RUB_HIO}"  placeholder="Hi&#233;rarchie op&#233;rationnelle" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Hi&#233;rarchie fonctionnelle</label>
												<input type="text"  name='POS_VAL_RUB_HIF'  value="{POS_VAL_RUB_HIF}"  placeholder="Hi&#233;rarchie op&#233;rationnelle" class="form-control">
											</div>
										</div>
										<!-- Activit&#233; principale & Indicateur de performance -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Activit&#233; principale</label>
												<textarea rows="2" name='POS_VAL_RUB_ACP'  class="form-control" style="resize: none">{POS_VAL_RUB_ACP}</textarea>
											</div>
											<div class="col-sm-6">
												<label>Indicateur de performance</label>
												<textarea rows="2" name='POS_VAL_RUB_IPE' class="form-control" style="resize: none"> {POS_VAL_RUB_IPE}</textarea>
											</div>
										</div>
										<!-- Relation intérieurs & Relation extérieurs -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Relation int&eacute;rieurs</label>
												<input type="text" name='POS_VAL_RUB_RIN' value="{POS_VAL_RUB_RIN}" placeholder="Relation int&eacute;rieurs" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Relation ext&eacute;rieurs</label>
												<input type="text" name='POS_VAL_RUB_REX' value="{POS_VAL_RUB_REX}" placeholder="Relation ext&eacute;rieurs" class="form-control">
											</div>
										</div>
										<!-- Moyens humains & Moyens materiels -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Moyens humains</label>
												<input type="text" name='POS_VAL_RUB_HUM' value="{POS_VAL_RUB_HUM}" placeholder="Moyens humains" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Moyens materiels</label>
												<textarea rows="2" name='POS_VAL_RUB_MAL' class="form-control" style="resize: none"> {POS_VAL_RUB_MAL}</textarea>
											</div>
										</div>
										<!-- Capacité technique & Capacité d'encadrement -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Capacit&eacute; technique</label>
												<input type="text" name='POS_VAL_RUB_CTA' value="{POS_VAL_RUB_CTA}" placeholder="Capacit&eacute; technique" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Capacit&eacute; d&apos;encadrement</label>
												<input type="text" name='POS_VAL_RUB_CEN' value="{POS_VAL_RUB_CEN}" placeholder="d&apos;encadrement" class="form-control">
											</div>
										</div>
										<!-- Capacité d'organisation & Capacité donimantes -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label>Capacit&eacute; d'organisation</label>
												<input type="text" name='POS_VAL_RUB_CO1' value="{POS_VAL_RUB_CO1}" placeholder="Capacit&eacute; d'organisation" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Capacit&eacute; donimantes</label>
												<input type="text" name='POS_VAL_RUB_QDO' value="{POS_VAL_RUB_QDO}" placeholder="Capacit&eacute; donimantes" class="form-control">
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5">
									<div class="col1_partie text-center">
										<span class="title text-while">PROFIL</span>
									</div>
									<div class="col2_partie" style="padding-top: 38px;padding-bottom: 19px;">
										<!-- Age -->
										<div class="form-group row">
											<div class="col-sm-5">
												<label>Age</label>
												<input type="text" name='POS_VAL_RUB_AGE' value="{POS_VAL_RUB_AGE}" placeholder="Age" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" data-parsley-pattern="[0-9][0-9]?"  >
											</div>
										</div>
										<!-- Formation initiale & Autre comp&eacute;tenc exig&eacute;e -->
										<div class="form-group row" style="margin-top: 7%">
											<div class="col-sm-6">
												<label>Formation initiale</label>
												<input type="text" name='POS_VAL_RUB_FOI' value="{POS_VAL_RUB_FOI}" placeholder="Formation initiale" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Autres comp&eacute;tences exig&eacute;es</label>
												<input type="text" name='POS_VAL_RUB_AUT' value="{POS_VAL_RUB_AUT}" placeholder="Autres comp&eacute;tences exig&eacute;es" class="form-control">
											</div>
										</div>
										<!-- exp&eacute;rience professionnelle & exp&eacute;rience dans la fonction -->
										<div class="form-group row" style="margin-top: 7%">
											<div class="col-sm-6">
												<label>Exp&eacute;rience dans la fonction</label>
												<input type="text" name='POS_VAL_RUB_EXF' value="{POS_VAL_RUB_EXF}" placeholder="exp&eacute;rience dans la fonction" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Exp&eacute;rience professionnelle</label>
												<input type="text" name='POS_VAL_RUB_SPE' value="{POS_VAL_RUB_SPE}" placeholder="Sp&eacute;cialit&eacute;" class="form-control">
											</div>
										</div>
										<!-- Niveau de formation & Diplome & Sp&eacute;cialit&eacute; -->
										<div class="form-group row" style="margin-top: 7%">
											<div class="col-sm-6">
												<label>Niveau de formation & Dipl&#244;me</label>
												<input type="text" name='POS_VAL_RUB_NFD' value="{POS_VAL_RUB_NFD}" placeholder="Niveau de formation & Dipl&#244;me" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Sp&eacute;cialit&eacute;</label>
												<input type="text" name='POS_VAL_RUB_SPE' value="{POS_VAL_RUB_SPE}" placeholder="Sp&eacute;cialit&eacute;" class="form-control">
											</div>
										</div>
										<!-- exp&eacute;rience professionnelle & Exigences particuli&#232;res -->
										<div class="form-group row" style="margin-top: 7%">
											<div class="col-sm-6">
												<label>Exp&eacute;rience professionnelle</label>
												<input type="text" name='POS_VAL_RUB_EX1'  value="{POS_VAL_RUB_EX1}" placeholder="exp&eacute;rience dans la fonction" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Exigences particuli&#232;res</label>
												<input type="text" name='POS_VAL_RUB_EXG' value="{POS_VAL_RUB_EXG}" placeholder="Exigences particuli&#232;res" class="form-control">
											</div>
										</div>
										<!-- Horaires de travail & Evolution de poste -->
										<div class="form-group row" style="margin-top: 7%">
											<div class="col-sm-6">
												<label>Horaires de travail</label>
												<input type="text" name='POS_VAL_RUB_HRT'  value="{POS_VAL_RUB_HRT}" placeholder="Horaires de travail" class="form-control">
											</div>
											<div class="col-sm-6">
												<label>Evolution de poste</label>
												<input type="text" name='POS_VAL_RUB_EVP' value="{POS_VAL_RUB_EVP}" placeholder="Evolution de poste" class="form-control">
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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
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
							<div class="col3_partie" style="padding-top: 10%;">
								<!-- Consultation -->
								<div class="form-group">
								   <label for="bio">Consultation :</label>
								  <textarea  class="form-control" id="bio"  name='POS_VAL_RUB_AVU' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_AMO'  rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
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
	 $('#formposte').parsley();
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
		 
  //fonctionnement du Bouton Annuler
	 function videchamp(){
	
	   var inputArray = document.querySelectorAll('input');
		inputArray.forEach(function (input){
			input.value = "";
		});
		var textAreaArray = document.querySelectorAll('textArea');
		textAreaArray.forEach(function (textArea){
			textArea.value = "";
		});
		 
		 return false;
	 }
	//Fin fonctionnement du Bouton Annuler
   
	</script>
	
</html>


