<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation heure supplementaire</title>
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
			padding-left: 27px;
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
<body  class='tpl_consultation tpl_consultation_hsu' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formheuresupplementaire" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='HSU'/>
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
					<button title="Cliquez ici pour voir les onglets" style="float:left;" type="button" class="btn navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-5">
						<i class="fa fa-bars fa-lg"></i> 
					</button>
				</div>
				<div class="collapse navbar-collapse " id="navbar-collapse-3">
					<ul class="nav navbar-nav level0 nav-tabs">
						<li class="active b1" ><a role="button" class="btn btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li>
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
									<div class="col2_partie" style="padding: 10px;">
										<!-- Matricule & Nom -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Matricule</label>
												<input  class="form-control" id="bio" name='POS_VAL_RUB_MAT'  value="{POS_VAL_RUB_MAT}" id='input_mat' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_mat')">
											</div>
											<div class="col-sm-6">
												<label for="bio">Nom</label>
												<input class="form-control" type="text" id="bio" name='POS_VAL_RUB_NMG' size='15' value="{POS_VAL_RUB_NMG}" onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">
											</div>
										</div>
										<!-- Prénom & Service -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">P&#233;rnom</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_PRE'  value="{POS_VAL_RUB_PRE}" id='input_pre' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
											</div>
											<div class="col-sm-6">
												<label for="bio">Service</label>
												<input  type="text"  class="form-control" name='POS_VAL_RUB_SER'  value="{POS_VAL_RUB_SER}" id='input_ser' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_ser')">
											</div>
										</div>
										<!-- Jour(7h à 21h)HSJ & Nuit(21h à 7h)HSN -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Jour(7h &agrave; 21h)HSJ</label>
												<input type="number"  class="form-control" name='POS_VAL_RUB_HSJ'  value="{POS_VAL_RUB_HSJ}" id='input_hsj' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_hsj')">
											</div>
											<div class="col-sm-6">
												<label for="bio">Nuit(21h &agrave; 7h)HSN</label>
												<input type="number" class="form-control" name='POS_VAL_RUB_HSN'  value="{POS_VAL_RUB_HSN}" id='input_hsn' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_hsn')">
											</div>
										</div>
										<!-- Dimanche et de jour férié(7h à 21h)HSD -->
										<div class="form-group row">
											<div class="col-sm-8">
												<label for="bio">Dimanche et de jour f&#233;ri&#233;(7h &agrave; 21h)HSD</label>
												<input type="number"  class="form-control" name='POS_VAL_RUB_HSD'  value="{POS_VAL_RUB_HSD}" id='input_hsd' onBlur="javascript:maximum(this,'119');"   autocomplete="on" onClick="closeSearch('search_suggest_hsd')">
											</div>
										</div>
										<!-- Commentaires -->
										<div class="form-group row">
											<div class="col-sm-12">
												<label for="bio">Commentaires :</label>
												<textarea class="form-control" id="bio" style="resize: none;margin-top: -1%;" name='POS_VAL_RUB_COM'  rows='2'>{POS_VAL_RUB_COM}</textarea>
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">INFOS SUPPLEMENTAIRES</span>
									</div>
									<div class="col2_partie" style="padding: 30px;">
										<label for="bio">Validation Manager</label>
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Nom</label>
												<input type="text"  class="form-control" name='POS_VAL_RUB_NOM'  value="{POS_VAL_RUB_NOM}" id='input_nom' onBlur="javascript:maximum(this,'119');" onkeyup="searchSuggest(this,'PRS', 'TPL', 'input_tpl', 'search_suggest_tpl');" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
											</div>
											<div class="col-sm-6">
												<label for="bio">Pr&#233;nom</label>
												<input type="text" class="form-control " name='POS_VAL_RUB_PMG' size='15' value="{POS_VAL_RUB_PMG}" onBlur="javascript:maximum(this,'119');" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Date</label>
												<input type="text" class="form-control datepicker" id="date2" name='POS_VAL_RUB_DAA' size='15' value="{POS_VAL_RUB_DAA}" onBlur="javascript:maximum(this,'119');">
											</div>
										</div>
										<label style="padding-top= 15%"></label>
										<label for="bio">Accord Direction</label>
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Nom</label>
												<input type="text" class="form-control " name='POS_VAL_RUB_NDG' size='15' value="{POS_VAL_RUB_NDG}" onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">
											</div>
											<div class="col-sm-6">
												<label for="bio">P&#233;rnom</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_PDG' size='15' value="{POS_VAL_RUB_PDG}" onBlur="javascript:maximum(this,'119');" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">
											</div>
										</div>
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Date</label>
												<input class="form-control datepicker " name='POS_VAL_RUB_DAV' id="date3"  value="{POS_VAL_RUB_DAV}" onBlur="javascript:maximum(this,'119');" data-parsley-trigger="keyup">
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
			<div class="tab-pane fade in "  id="tabs-2" style="margin-top:0.5%;">
			   tabs2
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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}"  placeholder="N&#176; poseidon" class="form-control" style="width: 100%">

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
 		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- endjquery  -->
	
	 <script>
		$('#formheuresupplementaire').parsley();
		//affichage en fonction du MODE sur le Formulaire  
	if($('.get_mode').val()=='CONSULTATION'){
		$('.btn').hide();
	}
		 

		$(document).ready(function () {

			 $('#date1,#date2, #date3').datepicker({
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
	
	
 
   
	</script>
	
</html>


