<!DOCTYPE html>
<html lang="fr">
<head>   
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consommation asur&#233;e</title>
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
     
	<style>
		.col_list{
			width: 23%;
			float: right;
			padding-top: 1%;
			/*margin-right: 3%;*/
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
			font-size: 15px
			width:100%;
			border: 1px solid #4a67b3; 
		}
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
			background:transparent
		}

		label{
			font-size: 15px;
			font-weight: 100;
		}

		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
	</style>
</head>
<body class='tpl_creation tpl_creation_cas' onLoad='initTplCreation();' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formconso" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>

				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='CAS'>
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

		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a  style="display:none" href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_CAS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
			<a href="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/CAS/liste/liste_CAS_1.php?APPLI={NOM_APPLICATION}">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
						<!-- 12_ 1 infos -->
				<div class="col-sm-12 mt-5" style="margin-top: 7%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>
					<div class="col2_partie text-center" style="padding-top: 4%;padding-bottom: 4%;">
						<div class="row">
							<div class="col-sm-4" style="margin-top: 13px">
								<input type="hidden" name='POS_VAL_RUB_DCR' value="{POS_VAL_RUB_DCR}"/>
							</div>

							<div class="col-sm-4" style="margin-top: 13px">
								<input type="hidden"  name='POS_VAL_RUB_COD' value="{POS_VAL_RUB_COD}"  class="form-control numero" style="width: 100%">
							</div>
						</div>
						<span>Pour charger le document de consommation assur&#233;e cliquez sur le bouton &rdquo;SUIVANT&rdquo;</span>
					</div>
				</div>
			</div>

			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 suivant" type="submit" value="SUIVANT" style="font-size: 12px;margin-left: 5%;" />  
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
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/CAS/code/code.js"></script>

	<!-- END JQUERY  -->

	 <script>

		$('#formconso').parsley();

		$(document).ready(function (){

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es .")){
							{CODE_ACTION_FERMER}
				}
			});

		});
	
	 </script>
	
</html>