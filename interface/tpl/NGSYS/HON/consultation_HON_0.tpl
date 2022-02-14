<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation Honoraire net</title>
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
<body  class='tpl_consultation tpl_consultation_hon' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id='formHON' ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='HON'/>
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
									<div class="col2_partie" style="padding: 5px;">
										<!-- Matricule & Nom -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Code</label>
												<input type="text" id='input_cdc'  class="form-control" name='POS_VAL_RUB_CDC' value="{POS_VAL_RUB_CDC}" onBlur="javascript:maximum(this,'119');" onClick="closeSearch('search_suggest_tpl')" style="width: 100%">
											</div>
											<div class="col-sm-6">
												<label for="bio">Nom</label>
												<input type="text" id='input_nom' class="form-control" value="{POS_VAL_RUB_NOM}" name='POS_VAL_RUB_NOM' data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup" style="width: 100%">

											</div>
										</div>
										<!-- prenom & Service -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Pr&#233;noms</label>
												<input type="text" id='input_pre' name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" class="form-control" style="width: 100%" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
											</div>
											<div class="col-sm-6">
												<label for="bio">Service</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_SER' value="{POS_VAL_RUB_SER}" style="width: 100%" onBlur="javascript:maximum(this,'119');">
											</div>
										</div>
										<!-- Level & Recharge -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Level</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_LVL' value="{POS_VAL_RUB_LVL}" style="width: 100%">
											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Recharge</label></br>
												<input type="text" name='POS_VAL_RUB_RCH' class="form-control" value="{POS_VAL_RUB_RCH}" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
										</div>
										<!-- Charge fiscale & Brute -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Charge fiscale</label>
												<input type="text"  name='POS_VAL_RUB_CHF' value="{POS_VAL_RUB_CHF}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Brute</label></br>
												<input type="number" name='POS_VAL_RUB_BRT' value="{POS_VAL_RUB_BRT}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
										</div>
										<!-- Pret & Avance -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Pr&#234;t</label>
												<input type="number"  class="form-control" name='POS_VAL_RUB_PTE' value="{POS_VAL_RUB_PTE}" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Avance</label></br>
												<input type="number" class="form-control" name='POS_VAL_RUB_AVA' value="{POS_VAL_RUB_AVA}" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
										</div>
										<!-- Autres & Honoraire net -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Autres</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_AUR' value="{POS_VAL_RUB_AUR}" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Honoraire net</label></br>
												<input type="text"  class="form-control" name='POS_VAL_RUB_HON' value="{POS_VAL_RUB_HON}" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
										</div>
										<!-- Total & Net à payé -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Total</label>
												<input type="number" class="form-control" name='POS_VAL_RUB_TTL' value="{POS_VAL_RUB_TTL}" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Net &#224; payer</label></br>
												<input type="number" name='POS_VAL_RUB_NE2' value="{POS_VAL_RUB_NE2}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5"style="margin-top: 0%;">
									<div class="col1_partie text-center">
										<span class="title text-while">INFOS COMPLEMENTAIRES</span>
									</div>
									<div class="col2_partie" style="padding: 5px;">
										<!-- Retrait & AT -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Retrait</label>
												<input type="text"  class="form-control" name='POS_VAL_RUB_RET' value="{POS_VAL_RUB_RET}" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">AT</label></br>
												<input type="text" name='POS_VAL_RUB_AT2' value="{POS_VAL_RUB_AT2}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
										</div>
										<!-- PF & Tatal CNPS -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">PF</label>
												<input type="text" class="form-control" name='POS_VAL_RUB_PF' value="{POS_VAL_RUB_PF}" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Tatal CNPS</label></br>
												<input type="text" class="form-control" name='POS_VAL_RUB_TCN' value="{POS_VAL_RUB_TCN}" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
										</div>
										<!-- Assurance & Tatal charges -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Assurance</label>
												<input type="text"  class="form-control" name='POS_VAL_RUB_ASN' value="{POS_VAL_RUB_ASN}" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Total charge</label></br>
												<input type="text" name='POS_VAL_RUB_TOC' value="{POS_VAL_RUB_TOC}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
										</div>
										<!-- Produit & Marge -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Produit</label>
												<input type="text" name='POS_VAL_RUB_PDT' class="form-control" value="{POS_VAL_RUB_PDT}" onBlur="javascript:maximum(this,'119');" style="width: 100%">
											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Marge</label></br>
												<input type="number" name='POS_VAL_RUB_MAG' value="{POS_VAL_RUB_MAG}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
										</div>
										<!-- M.FEES & Facture HT -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">M.FEES</label>
												<input type="text" name='POS_VAL_RUB_MFE' value="{POS_VAL_RUB_MFE}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Facture HT</label></br>
												<input type="text" name='POS_VAL_RUB_FHT' name='POS_VAL_RUB_FHT' class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
										</div>
										<!-- Marge totale & Net &#224; pay&#233; -->
										<div class="form-group row">
											<div class="col-sm-6">
												<label for="bio">Marge totale</label>
												<input type="number" name='POS_VAL_RUB_MTO' value="{POS_VAL_RUB_MTO}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">

											</div>
											<div class="col-sm-6" style="float: right">
												<label for="bio">Net &#224; payer</label></br>
												<input type="number" name='POS_VAL_RUB_NAP' value="{POS_VAL_RUB_NAP}" onBlur="javascript:maximum(this,'119');" class="form-control" style="width: 100%">

											</div>
										</div>
										<!-- Congé -->
										<div class="form-group row">
											<div class="col-sm-6" style="float: right">
												<label for="bio">Cong&#233;</label></br>
												<input type="text" name='POS_VAL_RUB_CGE' value="{POS_VAL_RUB_CGE}" class="form-control" style="width: 100%">
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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" class="form-control" style="width: 100%">
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
 		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
 		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

	<!-- endjquery  -->
	
		<script>
			$('#formHON').parsley();

		
			if($('.get_mode').val()=='CONSULTATION'){
			$('.btn').hide(); 
	
		}
		 
	</script>
	
</html>


