<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Honoraire net</title>
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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script language='javascript' src='/NGSYS/include/script/action_accueil.js'></script>
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
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
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

		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_hon' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id='formHON' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='HON'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->
 
        </div>
		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_HON_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">

				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<!-- 12_ 1 infos -->
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
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
								<label for="bio">Pr&#233;nom</label>
								<input type="text" id='input_pre' name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" class="form-control" style="width: 100%" autocomplete="on" onClick="closeSearch('search_suggest_tpl')" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-required="true" data-parsley-trigger="keyup">
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
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
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
								<label for="bio">Tatal charges</label></br>
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
								<input type="text" name='POS_VAL_RUB_MAG' value="{POS_VAL_RUB_MAG}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">

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
								<input type="text" name='POS_VAL_RUB_MTO' value="{POS_VAL_RUB_MTO}" class="form-control" onBlur="javascript:maximum(this,'119');" style="width: 100%">
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
			<!-- button -->
			<div class="row col_btn">
				<!-- <div type="submit" class="btn col-sm-2" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">FERMER</div> -->
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%;background:transparent">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;background:transparent" />
			</div>  
		</nav>
			
	</form>
</body>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
	<!-- END JQUERY  -->
	 <script>
	 $('#formHON').parsley();
		 
	</script>
	
</html>