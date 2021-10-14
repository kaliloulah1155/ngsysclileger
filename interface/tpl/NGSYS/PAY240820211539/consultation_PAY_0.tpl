<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation fiche de paye</title>
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
	<!--ABASS INCLUDE-->
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>
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

		/*Fin de la Barre de progression  1  */


	</style>
</head>
<body  class='tpl_consultation tpl_consultation_pay' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' class="cform" ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='PAY'/>
		<input type='hidden' name='MODE' value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->

		<input type='hidden' class='appName' value="{NOM_APPLICATION}">
		
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
						<li class="b2"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2" style="width: 100%;padding-top: -11px;">Traitement</a></li>
						<li class="b3"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-3" style="width: 100%;padding-top: -11px;">Document</a></li>
						<li class="b4"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-4" style="width: 100%;padding-top: -11px;">Historique</a></li>
					</ul>
				</div>
			</div>
		</header>

		<div class="tab-content" style="margin-top: 0px;">
		   <div class="tab-pane fade active in"  id="tabs-1" style="margin-top: 0;">
		   	 <section class="botton_pris" style="display:none">
				<a href="javascript:void(0)"  style="display:none" class="btn p-1 bg-info print_vbtn">Visualiser le pdf</a>
				<a href="javascript:void(0)" class="btn p-1 bg-info print_btn">G&#233;n&#233;rer le pdf</a>
			</section>
				<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<!-- debut -->
						<nav class="container-fluid">
							
							<div class="row">
								<div class="col-sm-12">
									<div class="col1_partie text-center">
										<span class="title text-while">GENERALITE</span>
									</div>
									<div class="col2_partie">
										<!-- nom de l'utilisateur-->
				<input  class="form-control nom" type="hidden" name='POS_VAL_RUB_NOM' value="{POS_VAL_RUB_NOM}" placeholder="nom"  >
 				<input  class="form-control prenoms" type="hidden" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" placeholder="prenoms"  >
 				<input  class="form-control matricule" placeholder="matricule" type="hidden" name='POS_VAL_RUB_MAT'  value="{POS_VAL_RUB_MAT}"  >

										<div class="row">


											<div class="col-sm-offset-3 col-sm-6" style="margin-top: 13px">
												<label>Nom & pr&#233;mons :</label>
												<select name="POS_VAL_RUB_MEL" class="form-control selectNom personnel prs" style="width: 100%;">
												    <option value="">Veuillez s&#233;lectionner</option>
												</select>
												<input type="hidden"  class="interselectperso" name='POS_VAL_CTRL_MEL' id='POS_VAL_CTRL_MEL' value='{POS_VAL_RUB_MEL}'>
											</div>
											<!--
											<div class="col-sm-6" style="margin-top: 13px">
												<label>Statut employ&#233; :</label>
												<select name="category" class="form-control selectEntres" id="selectStatus" style="width: 100%;">
												    <option value="">Veuillez s&#233;lectionner</option>
												    <option value="SALAIRE EMPLOYE">Salaire employ&#233;</option>
												    <option value="SALAIRE STAGIAIRE">Salaire stagiaire</option>
												    <option value="SALAIRE CONSULTANT">Salaire consultant</option>
												</select>
											</div>
											-->


										</div>


									</div>
								</div>
							</div>

							<div class="row" style="margin-top: 1%">
								<div class="col-sm-12 deuxieme_col" style="margin-top: 2%;">
									<div class="col1_partie text-center">
										<span class="title text-while">SPECIFIQUE</span>
									</div>
									<div class="col2_partie">
						<div class="row">
							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Salaire brute :</label>
								<input type="text" name="POS_VAL_RUB_SLB" value="{POS_VAL_RUB_SLB}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control brute" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Charge fiscale :</label>
								<input type="text" name="POS_VAL_RUB_CHF" value="{POS_VAL_RUB_CHF}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control chf_fiscale" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Retraite:</label>
								<input type="text" name="POS_VAL_RUB_RET" value="{POS_VAL_RUB_RET}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control retraite" placeholder="0" readonly="true" style="width: 100%">
							</div>
							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>AT:</label>
								<input type="text" name="POS_VAL_RUB_AT2" value="{POS_VAL_RUB_AT2}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control at" placeholder="0" readonly="true" style="width: 100%">
							</div>
							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>PF:</label>
								<input type="text" name="POS_VAL_RUB_PF" value="{POS_VAL_RUB_PF}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control pf" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Total CNPS:</label>
								<input type="text" name="POS_VAL_RUB_TCN" value="{POS_VAL_RUB_TCN}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control tot_cnps" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Total charge:</label>
								<input type="text" name="POS_VAL_RUB_TOC" value="{POS_VAL_RUB_TOC}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control tot_charge" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Facture HT:</label>
								<input type="text" name="POS_VAL_RUB_FHT" value="{POS_VAL_RUB_FHT}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control factureHT" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Duree :</label>
								<input type="text" name="POS_VAL_RUB_DUR"  value="{POS_VAL_RUB_DUR}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control duree" placeholder="0" style="width: 100%">
							</div> 


							<div class="col-sm-4 sursalaire" style="margin-top: 13px;display: none;">
								<label>Sursalaire :</label>
								<input type="text" name="POS_VAL_RUB_SRA" value="{POS_VAL_RUB_SRA}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control vsursalaire" placeholder="0" style="width: 100%">
							</div> 

							<div class="col-sm-4 transportImpos" style="margin-top: 13px;">
								<label>Transport imposable :</label>
								<input type="text" name="POS_VAL_RUB_TRA" value="{POS_VAL_RUB_TRA}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control trans_impos" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 rendement" style="margin-top: 13px;display: none;">
								<label>Rendement :</label>
								<input type="text" name="POS_VAL_RUB_RDT" value="{POS_VAL_RUB_RDT}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control vrendement" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 representation" style="margin-top: 13px;">
								<label>Representation :</label>
								<input type="text" name="POS_VAL_RUB_RTN" value="{POS_VAL_RUB_RTN}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control vrepresentation" placeholder="0" style="width: 100%">
							</div>
							<div class="col-sm-4 assurances" style="margin-top: 13px;display: none;">
								<label>Produit :</label>
								<input type="text" name="POS_VAL_RUB_PRO" value="{POS_VAL_RUB_PRO}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control produit" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Marge :</label>
								<input type="text" name="POS_VAL_RUB_MAG" value="{POS_VAL_RUB_MAG}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control marge" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Marge total :</label>
								<input type="text" name="POS_VAL_RUB_MTB" value="{POS_VAL_RUB_MTB}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control marge_tot" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>Net a payer (cst) :</label>
								<input type="text" name="POS_VAL_RUB_NET" value="{POS_VAL_RUB_NET}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control net_a_payer" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>T.Deduction (total:cst) :</label>
								<input type="text" name="POS_VAL_RUB_DDN" value="{POS_VAL_RUB_DDN}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control tdeduction" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4" style="margin-top: 13px;display: none;">
								<label>M. Fees :</label>
								<input type="text" name="POS_VAL_RUB_MFE" value="{POS_VAL_RUB_MFE}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control mfees" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 assurances" style="margin-top: 13px;">
								<label>Assurance :</label>
								<input type="text" name="POS_VAL_RUB_ASN" value="{POS_VAL_RUB_ASN}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control assurance" placeholder="0" style="width: 100%">
							</div>
						 
							 
							<div class="col-sm-4 avances" style="margin-top: 13px;display: none;">
								<label>Avance :</label>
								<input type="text" name="POS_VAL_RUB_AVA" value="{POS_VAL_RUB_AVA}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control avance" placeholder="0" style="width: 100%">
							</div>


							<div class="col-sm-4 autres" style="margin-top: 13px;display: none;">
								<label>Autres :</label>
								<input type="text" name="POS_VAL_RUB_AUR" value="{POS_VAL_RUB_AUR}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control autre" placeholder="0" style="width: 100%">
							</div>

							<!-- Les champs soit grisé ou masqué -->
							<div class="col-sm-4 pret" style="margin-top: 13px;display: none;">
								<label>Pr&#234;t :</label>
								<input type="text" name="POS_VAL_RUB_PTE" value="{POS_VAL_RUB_PTE}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control vpret" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 level" style="margin-top: 13px;display: none;">
								<label>Level :</label>
								<input type="text" name="POS_VAL_RUB_LVL" value="{POS_VAL_RUB_LVL}"  class="form-control level" placeholder="Level" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 entreprise" style="margin-top: 13px;display: none;">
								<label>Entreprise :</label>
								<input type="text" name="POS_VAL_RUB_ENT" value="{POS_VAL_RUB_ENT}" class="form-control entreprise" placeholder="Entreprise" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 is" style="margin-top: 13px;display: none;">
								<label>IS :</label>
								<input type="text" name="POS_VAL_RUB_IS" value="{POS_VAL_RUB_IS}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control vis" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 cn" style="margin-top: 13px;display: none;">
								<label>CN :</label>
								<input type="text" name="POS_VAL_RUB_CNV" value="{POS_VAL_RUB_CNV}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control vcn" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 igr" style="margin-top: 13px;display: none;">
								<label>IGR :</label>
								<input type="text" name="POS_VAL_RUB_IGR" value="{POS_VAL_RUB_IGR}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control vigr" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 cnps" style="margin-top: 13px">
								<label>CNPS :</label>
								<input type="text" name="POS_VAL_RUB_CNS" value="{POS_VAL_RUB_CNS}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control vcnps" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 " style="margin-top: 13px;display:none">
								<label>Total -salaire net :</label>
								<input type="text" name="POS_VAL_RUB_TOL" value="{POS_VAL_RUB_TOL}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control tol" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 " style="margin-top: 13px;display:none">
								<label>NET -salaire net :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control net" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 ancinnete" style="margin-top: 13px;display: none;">
								<label>Anciennet&#233; :</label>
								<input type="text" name="POS_VAL_RUB_ACI" value="{POS_VAL_RUB_ACI}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control anciennete" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 astreinte" style="margin-top: 13px;display: none;">
								<label>Astreinte :</label>
								<input type="text" name="POS_VAL_RUB_ATR" value="{POS_VAL_RUB_ATR}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control vastreinte" placeholder="0"  style="width: 100%">
							</div>

							<div class="col-sm-4 heureSup" style="margin-top: 13px;display: none;">
								<label>Heure suplementaire :</label> 
								<input type="text" name="POS_VAL_RUB_HSU" value="{POS_VAL_RUB_HSU}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control heure_sup" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 transport" style="margin-top: 13px;display: none;">
								<label>Transport :</label>
								<input type="text" name="POS_VAL_RUB_TRS" value="{POS_VAL_RUB_TRS}"  onkeypress="return testNum(event, this, 2);" min="0" class="form-control vtransport" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 salaireBase" style="margin-top: 13px;display: none;">
								<label>Salaire de base :</label>
								<input type="text" name="POS_VAL_RUB_SAB" value="{POS_VAL_RUB_SAB}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control salaire_base" placeholder="0" readonly="true" style="width: 100%">
							</div>

							
							<div class="col-sm-4 salaireBrute" style="margin-top: 13px;display: none;">
								<label>Salaire brute imposable :</label>
								<input type="text" name="POS_VAL_RUB_SBI" value="{POS_VAL_RUB_SBI}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control slr_brt_impo " placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 salaireNet" style="margin-top: 13px;display: none;">
								<label>Salaire net :</label>
								<input type="text" name="POS_VAL_RUB_SLN" value="{POS_VAL_RUB_SLN}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control slrnet" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 salaireNetPaye" style="margin-top: 13px;display: none;">
								<label>Salaire net pay&#233; :</label>
								<input type="text" name="POS_VAL_RUB_SAL" value="{POS_VAL_RUB_SAL}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control netpaye" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 honoraireNet" style="margin-top: 13px;display: none;">
								<label>Honoraire net :</label>
								<input type="text" name="POS_VAL_RUB_HNE"  value="{POS_VAL_RUB_HNE}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control honoraire_net" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 " style="margin-top: 13px;display: none;">
								<label>Recharge :</label>
								<input type="text" name="POS_VAL_RUB_RCH" value="{POS_VAL_RUB_RCH}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control recharge" placeholder="0" readonly="true" style="width: 100%">
							</div>

							 
							<div class="col-sm-4 honoraireNetPaye" style="margin-top: 13px;display: none;">
								<label>Honoraire net pay&#233; :</label>
								<input type="text" name="POS_VAL_RUB_HNP" value="{POS_VAL_RUB_HNP}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control honoraire_net_paye" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<!--DEBUT TAXE PATRONALE -->
							<input type="hidden" name="POS_VAL_RUB_TA" value="{POS_VAL_RUB_TA}" class="ta" value="">
							<input type="hidden" name="POS_VAL_RUB_TFP" value="{POS_VAL_RUB_TFP}" class="tfpc" value="">
							<input type="hidden" name="POS_VAL_RUB_FAM" value="{POS_VAL_RUB_FAM}" class="famille" value="">
							<input type="hidden" name="POS_VAL_RUB_ACC" value="{POS_VAL_RUB_ACC}" class="acc" value="">
							   <!--input retraite -->
							<input type="hidden" name="POS_VAL_RUB_TO1" value="{POS_VAL_RUB_TO1}" class="total_txt" value="">
							<input type="hidden" name="POS_VAL_RUB_TFI" value="{POS_VAL_RUB_TFI}" class="total_fisc" value=""> 
							    <!--input tot_cnps totale CNPS -->
							  <input type="hidden" name="POS_VAL_RUB_TO2" value="{POS_VAL_RUB_TO2}" class="ratios_empl" value=""> 
							<!--FIN TAXE PATRONALE -->
           		<!--type contrat-->
							<input type="hidden" name="POS_VAL_RUB_C2" class="typcontrat" value="{POS_VAL_RUB_C2}">

							<!--part-->
							<input type="hidden" name="POS_VAL_RUB_PRT" class="vpart" value="{POS_VAL_RUB_PRT}">

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
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CRE} </strong>
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
							<span class="title1">ADM</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times; display: none;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4A}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 adm_visa" style="font-size: 13px;">{POS_VAL_RUB_VC0}</strong>
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
							<span class="title1">CONTROLEUR</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times; display: none;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4B}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 control_visa" style="font-size: 13px;">{POS_VAL_RUB_VC1}</strong>
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
							<span class="title1">FINANCE</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;display: none;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4C}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 finance_visa" style="font-size: 13px;">{POS_VAL_RUB_VC2}</strong>
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
							<span class="title1">DGA</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;display: none;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4D}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 dga_visa" style="font-size: 13px;">{POS_VAL_RUB_VC3}</strong>
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
							<span class="title1">DG</span>
							<!-- zone d'affichage -->
							<div class="jumbotron pt-1" style="width: 30%; padding-top: 1%;padding-bottom: 3%;background: #4a67b3;color:#fff;border-radius:5px;z-index:999">
								<!-- Affichage du login  -->
								<p class="d-flex">
									<span class="pr-3" style="font-size: 13px; font-family: Times;display: none;">Login :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_A4E}</strong>
								</p>
								<!-- Affichage du visa -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Visa :</span>
									<strong class="pt-1_pl-5 dg_visa" style="font-size: 13px;">{POS_VAL_RUB_VC4}</strong>
								</span>
								<!-- Affichage de la date -->
								<span class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;padding-left: 3%">Date :</span>
									<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_DT6}</strong>
								</span>
								<!-- Commentaire -->
								<p class="d-flex">
									<span class="pr-4" style="font-size: 13px; font-family: Times;">Commentaire :</span>
										<strong class="pt-1_pl-5" style="font-size: 13px;">{POS_VAL_RUB_CT5}</strong>
									</span>
								</p>
							</div>
						</div>
						
						
						
						<span class="bar1"></span>
						<div class="circle1">
							<span class="label1">7</span>
							<span class="title1">CLOS</span>
							
						</div>
						
					</div>

						<!--commentaire sur  de la ligne de vie -->

					<div class="row jumbotron rhconnex" style="margin: auto;padding: 12px">
						<!-- acteur 1 -->
						<div class="acteur1">
							<div class="col-sm-4" style="padding-bottom: 3%; display: none;">
								<label for="bio">ADM</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4A' value="{POS_VAL_RUB_A4A}" style="width: 80%;">
								</div>	
							</div>
							<div class="col-sm-5 admconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du manager Admin</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT1' style="width: 250%;resize: none">{POS_VAL_RUB_CT1}</textarea>
							</div>
						</div>
						<!-- acteur 2 -->
						<div class="acteur2">
							<div class="col-sm-4" style="padding-bottom: 3%; display:none;">
								<label for="bio">CONTROLEUR</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4B' value="{POS_VAL_RUB_A4B}" class="form-control" placeholder="" style="width: 80%;">
										<!--<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4B', 'POS_VAL_RUB_A4B')">
											<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>-->
									</div>
							</div>
							<!--<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC1}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT2' value="{POS_VAL_RUB_DT2}" class="form-control" placeholder="" style="width: 100%;">
							</div>-->
							<div class="col-sm-5 contrconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du controleur de gestion</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT2' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT2}</textarea>
							</div>
						</div>

						<!-- acteur 3 -->
						<div class="acteur3">
							<div class="col-sm-4" style="padding-bottom: 3%;display: none;">
								<label for="bio">FINANCE</label>
									<div class="info_group" style="display:flex;flex-direction:row">
										<input type="text" name='POS_VAL_RUB_A4C' value="{POS_VAL_RUB_A4C}" class="form-control" placeholder="" style="width: 80%;">
										<!--<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'A4C', 'POS_VAL_RUB_A4C')">
											<img class="img-fluid" src="/{NOM_APPLICATION}/images/icons/btn_mode_modification.png" width="20" height="20" style="margin:7px 7px;cursor: pointer;">
										</a>-->
									</div>
							</div>
							<!--<div class="col-sm-1" style="padding-bottom: 3%">
								<label for="bio">Visa</label>
								<label for="bio" class="input-group-addon">
									<img src="../../../../images/visas/visa_{POS_VAL_RUB_VC1}.gif" alt="">
								</label>
							</div>
							<div class="col-sm-2" style="padding-bottom: 3%">
								<label for="bio">Date</label>
								<input type="text" name='POS_VAL_RUB_DT2' value="{POS_VAL_RUB_DT2}" class="form-control" placeholder="" style="width: 100%;">
							</div>-->
							<div class="col-sm-5 financeconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire de la finane</label>
								<textarea class="form-control" id="bio" name='POS_VAL_RUB_CT3' rows="5" style="width: 250%;resize: none">{POS_VAL_RUB_CT3}</textarea>
							</div>
						</div>

						<!-- acteur 4 -->
						<div class="acteur4">
							<div class="col-sm-4" style="padding-bottom: 3%; display:none;">
								<label for="bio">DGA</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4D' value="{POS_VAL_RUB_A4D}" style="width: 80%;">
								</div>	
							</div>
							<div class="col-sm-5 dgaconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du DGA</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT4' style="width: 250%;resize: none">{POS_VAL_RUB_CT4}</textarea>
							</div>
						</div>

						<!-- acteur 5 -->
						<div class="acteur5">
							<div class="col-sm-4" style="padding-bottom: 3%; display:none;">
								<label for="bio">DG</label>
								<div class="info_group" style="display:flex;flex-direction:row">
									<input type="text" class="form-control" name='POS_VAL_RUB_A4E' value="{POS_VAL_RUB_A4E}" style="width: 80%;">
								</div>	
							</div>
							<div class="col-sm-5 dgconnex" style="padding-bottom: 3%">
								<label for="bio">Commentaire du DG</label>
								<textarea class="form-control" id="bio" rows="5" name='POS_VAL_RUB_CT5' style="width: 250%;resize: none">{POS_VAL_RUB_CT5}</textarea>
							</div>
						</div>										
					</div>
				


						<!-- Fin du commentaire de la ligne de vie -->

				</div>
		   </div>
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
					<div class="col-sm-12" style="margin-bottom: 2%;">
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
						<div class="col2_partie text-center" style="padding-top: 1%">
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
									<input type="text" name="POS_VAL_RUB_NUD" id="numposeidon" placeholder="N&#176; poseidon" class="form-control" value="{POS_VAL_RUB_NUD}"  style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" name="POS_VAL_RUB_ETF" value="{POS_VAL_RUB_ETF}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  name="POS_VAL_RUB_HIS" class="form-control" id="bio" rows="5" style="width: 100%;resize: none;">{POS_VAL_RUB_HIS}</textarea>
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
								  <textarea name="POS_VAL_RUB_AVU" class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea name="POS_VAL_RUB_AMO" class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea name="POS_VAL_RUB_ASU" class="form-control" id="bio" rows="2" style="width: 100%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
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
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
	<!-- endjquery  -->
		<script language='javascript' src="../../../../include/script/testNum.js"></script>
	 <script>


    var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
	      	$('.bouton_sub').hide();	
			}


	 	//Traitement sur les commentaires

		var prof_util = "{PROFIL_UTILISATEUR}";	 
		var str = prof_util;
		var profil_util = str.substring(0, 9); 


		$('.admconnex,.admconnex,.contrconnex,.financeconnex,.dgaconnex,.dgconnex').hide();
			if(profil_util=='RH'){
				$('.rhconnex').hide();
			}

			if(profil_util=='MANAGER_A'){
				$('.admconnex').show();
			}

			if(profil_util=='CONTROLEU'){
				$('.contrconnex').show();
			}

			if(profil_util=='FINANCE'){
				$('.financeconnex').show();
			}

			if(profil_util=='DGA'){
				$('.dgaconnex').show();
			}

			if(profil_util=='DIRECTEUR'){
				$('.dgconnex').show();
			}


		
	 	//Fin des traitements sur les commentaires



		var bouton_initial = $('.bouton_sub').val();
		var caractere_hermes = "LIBELLE_ACTION_HERMES";
		var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
		if(comp===true){
		$('.bouton_sub').hide();	
			}
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

	//   Barre de progression 1
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
			//  Fin Barre de progression 1

	$(document).ready(function(){

		// select2 
        $('.selectNom').select2({
            theme:'bootstrap4',
            tags:true,
            allowClear: true
        });


       $('.deuxieme_col').hide();
            $('.deuxieme_col,.sursalaire,.transportImpos,.rendement,.representation,.assurances,.avances,.autres,.pret,.level,.entreprise,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye,.honoraireNet,.honoraireNetPaye,.transportImpos').css('display','none');
 
	});
		 
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

 <script>
 	  //no-cache script
	 var today_cache = new Date();
     let time_cache =today_cache.getDate()+''+today_cache.getMonth()+''+today_cache.getFullYear()+''+today_cache.getHours() +''+today_cache.getMinutes()+''+today_cache.getSeconds();

    
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/stagiaire/stagiaire.js?t="+time_cache+"'><\/script>");
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/consultant/consultant.js?t="+time_cache+"'><\/script>");
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/salarie/salarie.js?t="+time_cache+"'><\/script>");

     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/salarie/cn.js?t="+time_cache+"'><\/script>");
      document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/salarie/igr.js?t="+time_cache+"'><\/script>");
      document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/salarie/taxe_patronale.js?t="+time_cache+"'><\/script>");
      document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/personnel/personnel.js?t="+time_cache+"'><\/script>");

      document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/bulletin_normalpdf/pdfbulletin_normal.js?t="+time_cache+"'><\/script>");

    </script>
    <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/notification.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/workflowPAY.js"></script>

	
</html>

	 


