<!DOCTYPE html>
<html lang="fr">
<head>   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de la Fiche d&#146;identification</title>
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
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
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
		}
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 

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
		

		
		/* media query 
		@media (min-width: 576px) { 
			.col2_partie{
				height: 110vh;
			}
			
			.btn{
				font-size: 12px;
			}
		}

		@media (min-width: 992px) { 
			.col2_partie{
				height: 110vh
			}
		}

		@media (min-width: 1200px) {  
			.col2_partie{
				height: 110vh;
			}
		}*/
	</style>
	<script>
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
				dateFormat: 'dd-mm-yy'
			});
		});
	</script>
</head>
<body  class='tpl_consultation tpl_consultation_prs' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formperso" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
		 <input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='PRS'/>
		<input type='hidden' class="get_mode" name='MODE' value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->

		<input type='hidden' class='appName' value="{NOM_APPLICATION}">

		
		<header class="header-const ">
			<div id="actions-container" class="ui-widget-content titre-boutons entete" style="padding-left: 3%; text-align: center; background: transparent; border: none">
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
						<!-- <li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li> -->
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
				<a href="javascript:void(0)" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
			</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							<div class="row" style="margin-top: 7%">
								<div class="col-sm-12 mt-5" style="margin-top: -5.6%;">
									<div class="col1_partie text-center">
										<span class="title text-while">FICHE D&#145;IDENTIFICATION</span>
									</div>
									<div class="col12_partie" style="padding-top: 3%;">
										<div class="row" style="margin: 0.5% 0%">
											<div class="col-sm-3" style="margin-top: 5px; ">
												<label>Matricule</label>
												<input type="text" name='POS_VAL_RUB_MAT' value="{POS_VAL_RUB_MAT}" class="form-control" style="width: 100%;"/>
											</div>
										
												<input type="hidden" name='POS_VAL_RUB_COD' value="{POS_VAL_RUB_COD}" placeholder="Code"  class="form-control"  />
										</div>
										
										<!-- civilite & Nom de l'epoux -->
										<div class="form-group row" style="margin: 0.5% 0%">  
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Civilit&eacute;</label>
												<select id="selection" name='POS_VAL_RUB_CIV' class="form-control civilite" style="width: 100%;">
													<option value="" selected>Veuillez s&#233;lectionner</option>
													<option value="M">Monsieur</option>
													<option value="MME">Madame</option>
													<option value="MLLE">Mademoiselle</option>
												</select>
												<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV'  value='{POS_VAL_RUB_CIV}'>
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Nom de l&#146;&#233;poux</label>
												<input type="text" id="epoux"  placeholder="Nom de l&#146;&#233;poux" value="{POS_VAL_RUB_NEP}" name='POS_VAL_RUB_NEP' disabled data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" class="form-control" style="width: 100%;"/>
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Nom</label>
												<input type="text" class="form-control" placeholder="Nom" name='POS_VAL_RUB_NOM' data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" value="{POS_VAL_RUB_NOM}" style="width: 100%;"/>
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Pr&eacute;noms</label>
												<input type="text" class="form-control" placeholder="Pr&eacute;noms" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%;"/>
											</div>
										</div>
										<!-- Deuxieme ligne -->
										<div class="form-group row" style="margin: 0.5% 0%">
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Contact 1</label>
							  					<input type="text" placeholder="Contact 1" name='POS_VAL_RUB_TPH' value="{POS_VAL_RUB_TPH}" placeholder="Contact 1" class="form-control" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" class="form-control" style="width: 100%;"/>
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Contact 2</label>
							  					<input type="text" name='POS_VAL_RUB_TPM' value="{POS_VAL_RUB_TPM}" placeholder="Contact 2" class="form-control" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" style="width: 100%;"/>
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Date de naissance</label>
												<input type="text" id="date1" name="POS_VAL_RUB_DNS" value="{POS_VAL_RUB_DNS}" class="form-control text-center" style="width: 100%;">
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Lieu de naissance</label>
												<input type="text" name='POS_VAL_RUB_LNS' value="{POS_VAL_RUB_LNS}" placeholder="Lieu de naissance" class="form-control" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" class="form-control" style="width: 100%;"/>
											</div>
										</div>
										
										<!-- troisième ligne -->
										<div class="row" style="margin: 0.5% 0%">
											<div class="col-sm-3" style="margin-top: 5px">
												<label>E-mail</label>
												<input type="email" placeholder="E-mail" class="form-control" name='POS_VAL_RUB_MEL' value="{POS_VAL_RUB_MEL}" data-parsley-pattern="/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/" style="width: 100%;"/>
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Bo&#238;te postale</label>
												<input type="text" placeholder="Bo&#238;te postale" name='POS_VAL_RUB_BP' value="{POS_VAL_RUB_BP}" class="form-control" style="width: 100%;">
											</div>
											<div class="col-sm-3" style="margin-top: 5px" style="width: 100%;">
												<label>Nature de pi&egrave;ce</label>
												<select name='POS_VAL_RUB_NTP' rows="1" class="form-control" class="form-control" rows="1">
													<option value="" selected>Veuillez s&#233;lectionner</option>
													 <option value="ATTESTATION">Atttestation d'identit&eacute; </option>
													 <option value="CNI">CNI </option>
													 <option value="PERMIS DE CONDUIRE">Permis de conduire </option>
													 <option value="PASSEPORT">Passeport </option>
													 <option value="CARTE CONSULAIRE">Carte consulaire </option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_NTP' id='POS_VAL_CTRL_NTP' value='{POS_VAL_RUB_NTP}'>

											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Num&eacute;ro de pi&egrave;ce</label>
												<input type="text" name='POS_VAL_RUB_NPI' value="{POS_VAL_RUB_NPI}" data-parsley-trigger="keyup" data-parsley-pattern="^[A-Z0-9 ]*$" placeholder="Num&eacute;ro de pi&egrave;ce" class="form-control" style="width: 100%;"/>
											</div>
										</div>
										
										<!-- Quatrième ligne -->
										<div class="row" style="margin: 0.5% 0%">
											<div class="col-sm-3" style="margin: 0.5% 0%">
											<label>Nationalit&eacute;</label>
											<select id="nationalite" name='POS_VAL_RUB_NAT' class="form-control" rows="1" data-parsley-required="true" >
												<option value="" >Selectionner</option>
											</select>
											<input type="hidden" name='POS_VAL_CTRL_NAT' id='POS_VAL_CTRL_NAT' value='{POS_VAL_RUB_NAT}'>
										</div>

											<div class="col-sm-3" style="margin-top: 5px">
												<label>Lieu de domicile</label>
												<input type="text" name='POS_VAL_RUB_CNE'value="{POS_VAL_RUB_CNE}" placeholder="Lieu de domicile" class="form-control" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$" style="width: 100%;">
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Situation matrimoniale</label>
												<select id="selection" rows="1" name='POS_VAL_RUB_SIF' class="form-control matrimoniale"style="width: 100%;">
													 
												</select>
												<input type="hidden" name='POS_VAL_CTRL_SIF' id='POS_VAL_CTRL_SIF'  value='{POS_VAL_RUB_SIF}'>

											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Nombre d&#146;enfants</label>
												<input type="number" name='POS_VAL_RUB_NEF' value="{POS_VAL_RUB_NEF}" placeholder="Nombre d&#146;enfant" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup" min="0"max="50" data-parsley-pattern="[0-9][0-9]?" style="width: 100%;"/>
											</div>
										</div>
										
										<!-- Cinquième ligne -->
										<div class="row" style="margin: 0.5% 0%">
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Banque</label>
												<select id="selection" name='POS_VAL_RUB_BQE' class="form-control" style="width: 100%;">
													<option value="0">Veuillez s&#233;lectionner</option>
													<option value="Afrilan First Bank">Afrilan First Bank</option>
													<option value="Bank Of Africa">Bank Of Africa</option>
													<option value="Banque Atlantique">Banque Atlantique</option>
													<option value="BDA">BDA</option>
													<option value="Banque Populaire">Banque Populaire</option>
													<option value="BSIC">BSIC</option>
													<option value="BDU-CI">BDU-CI</option>
													<option value="BGFIBank">BGFIBank</option>
													<option value="BHCI">BHCI</option>
													<option value="BICICI">BICICI</option>
													<option value="BMS-CI">BMS-CI</option>
													<option value="BNI">BNI</option>
													<option value="Bridge Bank Group">Bridge Bank Group</option>
													<option value="CITI">CITI</option>
													<option value="Coris Bank">Coris Bank</option>
													<option value="Diamond">Diamond</option>
													<option value="Ecobank">Ecobank</option>
													<option value="GTBank">GTBank</option>
													<option value="NSIA">NSIA</option>
													<option value="Orabank">Orabank</option>
													<option value="Orange Banque">Orange Banque</option>
													<option value="Société Ivoirienne de Banque">Soci&#233;t&#233; Ivoirienne de Banque</option>
													<option value="SGBCI">SGBCI</option>
													<option value="Stanbic Bank">Stanbic Bank</option>
													<option value="Standard Chartered">Standard Chartered</option>
													<option value="UBA">UBA</option>
													<option value="Versus Bank">Versus Bank</option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_BQE' id='POS_VAL_CTRL_BQE' value="{POS_VAL_RUB_BQE}" placeholder="Banque" />
											</div>
											<div class="col-sm-3" style="margin-top: 5px">
												<label>RIB</label>
												<input type="text" name='POS_VAL_RUB_RIB' id='POS_VAL_CTRL_RIB' value="{POS_VAL_RUB_RIB}" placeholder="RIB" class="form-control" style="width: 100%;" />
											</div>
											<!-- <div class="col-sm-3" style="margin-top: 5px">
													<label>N&deg; CNPS</label>
													<input type="text" name='POS_VAL_RUB_CNP' id='POS_VAL_CTRL_CNP'  value="{POS_VAL_RUB_CNP}" placeholder="N&ordm; CNPS" class="form-control" data-parsley-trigger="keyup" style="width: 100%;" />
											</div> -->
											<div class="col-sm-3" style="margin-top: 5px">
												<label>Date d&apos;entr&#233;e</label>
												<input type="text" id="date2" name='POS_VAL_RUB_DAE' value="{POS_VAL_RUB_DAE}" placeholder="Date d&apos;entr&#233;e" class="form-control" data-parsley-trigger="keyup" style="width: 100%;" />
											</div>
										</div>
										
										<!-- <div class="row" style="margin: 0.5% 0%">
											<div class="col-sm-12" style="margin-top: 5px">
												<label>Avantages</label>
												<textarea class="form-control" name='POS_VAL_RUB_AVT' rows="2" style="width: 100%;resize: none">{POS_VAL_RUB_AVT}</textarea>
											</div>
										</div> -->
										
										<!-- En cas d'urgence  -->
										<label for="bio" style="margin: 1% 2%; font-size: 19px">En cas d&#146;urgence</label>
										
										<div class="row" style="margin: 0.5% 0%">
											<div class="col-sm-3">
												<label for="bio">Nom</label>
												<input type="text" placeholder="Nom" name='POS_VAL_RUB_PAC' value="{POS_VAL_RUB_PAC}"  class="form-control" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%;"/>
											</div>
											<div class="col-sm-3">
												<label for="bio">Pr&eacute;noms</label>
												<input type="text" placeholder="Pr&eacute;noms" value="{POS_VAL_RUB_PRM}" name='POS_VAL_RUB_PRM' class="form-control" data-parsley-required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%;"/>
											</div>
											<div class="col-sm-3">
												<label for="bio">Contact</label>
												<input type="text" placeholder="Contact" name='POS_VAL_RUB_NTC' value="{POS_VAL_RUB_NTC}" class="form-control" data-parsley-required="true" data-parsley-trigger="keyup"  data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" style="width: 100%;"/>
											</div>
											<div class="col-sm-3">
												<label for="bio">Filiation</label>
												<select id="selection"  name='POS_VAL_RUB_FLN' class="form-control" rows="1" style="width: 100%;">
													<option value="" selected>Veuillez s&#233;lectionner</option>
													<option value="Pere">P&#232;re</option>
													<option value="Mere">M&#232;re</option>
													<option value="Grand-pere">Grand-p&#232;re</option>
													<option value="Grand-mere">Grand-m&#232;re</option>
													<option value="Oncle">Oncle</option>
													<option value="Tante">Tante</option>
													<option value="Cousin">Cousin</option>
													<option value="Cousine">Cousine</option>
													<option value="Neveu">Neveu</option>
													<option value="Niece">Ni&#232;ce</option>
													<option value="Grand-frere">Grand-fr&#232;re</option>
													<option value="Grand-Soeur">Grand-Soeur</option>
												</select>
												<input type="hidden" name='POS_VAL_CTRL_FLN' id='POS_VAL_CTRL_FLN' value='{POS_VAL_RUB_FLN}'>

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
			<div class="tab-pane fade in text-center"  id="tabs-2" style="margin-top:0.5%;">
			   <h3>Pas de traitement !</h3>
		   </div>
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
					<div class="col-sm-6" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 3%;">
							<iframe  src="../consultation/afficher_fichier.php?POS_TYPEDOC=NOT&POS_NUM_DOC={POS_NUM_DOC}&MODE={MODE}&MODE_FICHIER={MODE_FICHIER}" 
							name='fichier' id='fichierid'  height='100px' width='99%' scrolling='auto' frameborder='0' style="background: transparent"></iframe>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">VISUALISEUR</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 3%">
							<iframe id='frm_affiche_fichier' name='frm_affiche_fichier' src='../afficheur/afficher_menu_fichier.php?POS_NUM_DOC={POS_NUM_DOC}#view=FitH'  height='630px' width='98%' scrolling='auto' frameborder='0' style=""></iframe>
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
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
							
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" id="bio" rows="5" name='POS_VAL_RUB_HIS' style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
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
								  <textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_AVU' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_AMO' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
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
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>

             <!-- requete de la mise en oeuvre d'une requete ajax-->
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/departement/phppromise.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/prspdf/pdfdemo.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/nationalite/nat.js"></script>


	<!-- endjquery  -->

	
	 <script>
			if($('.get_mode').val()=='CONSULTATION'){
					$('.btn').hide();
					jQuery("input[type='text']").prop("disabled", true);
					jQuery("input[type='number']").prop("disabled", true);
					 jQuery("select").prop("disabled", true);
					  jQuery("input[type='email']").prop("disabled", true);
					  jQuery("textarea").prop("disabled", true);
			}

			var selectCivilite=$.trim($('.selectCivilite').val());
		   if(selectCivilite == 'MME'){
				$('#epoux').prop("disabled",false);	
			}
			else{
				$('#epoux').val('');
				$('#epoux').prop("disabled",true);	
			}




            $('.civilite').on('change',function(){
            
			var selectCivilite=$.trim($(this).val());

			console.log(selectCivilite);
			if(selectCivilite == 'MME'){
				$('#epoux').prop("disabled",false);	
			}
			else{
				$('#epoux').val('');
				$('#epoux').prop("disabled",true);	
			}
		});

		 //affichage en fonction du MODE sur le Formulaire 
			$('#formperso').parsley();
		 //affichage en fonction du MODE sur le Formulaire 


		  var  selectmat ="";
		 let civil =$('.selectCivilite').val();
		 if (civil != "") {
             
			 

			  switch (civil) {

					 case 'MME':
						 				

							selectmat="<option value='MARIEE'> Mari&eacute;e</option>";
							jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);	

				  break;
				
					case 'M':
							selectmat="<option value='' selected>Veuillez s&#233;lectionner</option>"+
							"<option value='CELIBATAIRE'> C&eacute;libataire</option>"+
				             "<option value='MARIE'> Mari&eacute;</option>"+
				             "<option value='VEUF'> Veuf</option>";
							 jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);


				  break;
				case 'MLLE':
							selectmat="<option value='' selected>Veuillez s&#233;lectionner</option>"+
							"<option value='CELIBATAIRE'> C&eacute;libataire</option>"+
				             "<option value='VEUVE'> Veuve</option>";
							 jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);


				  break;
				  default :  jQuery(".matrimoniale").prop("disabled", true);
			 
				 } 
 
		}
		
		$(".civilite").on("change", function() {
			let situation = $(this).val();
			

		         $('.matrimoniale').empty();


			if (situation != "") {

				  
				 switch (situation) {
		 
						 case 'MME':
						 				

							selectmat="<option value='MARIEE'> Mari&eacute;e</option>";
							jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);	

				  break;
				
					case 'M':
							selectmat="<option value='' selected>Veuillez s&#233;lectionner</option>"+
							"<option value='CELIBATAIRE'> C&eacute;libataire</option>"+
				             "<option value='MARIE'> Mari&eacute;</option>"+
				             "<option value='VEUF'> Veuf</option>";
							 jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);


				  break;
				case 'MLLE':
							selectmat="<option value='' selected>Veuillez s&#233;lectionner</option>"+
							"<option value='CELIBATAIRE'> C&eacute;libataire</option>"+
				             "<option value='VEUVE'> Veuve</option>";
							 jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);
				  break;
				  default :  jQuery(".matrimoniale").prop("disabled", true);

			}

			}	
			 
	});

	</script>
	
</html>


