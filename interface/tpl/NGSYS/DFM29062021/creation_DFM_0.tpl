<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demande de formation</title>
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
			padding: 17px;
			padding-top: 5px;
		}
		
		.flex-justify{
			display: flex;
			flex-direction: row;
			justify-content: space-between;
		}
		     
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
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
<body   class='tpl_creation tpl_creation_dfm' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formdmdformation" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();' data-parsley-validate>
 	 
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='DFM'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

		<div class="col_list text-center jumbotron px-3">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
            <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_DFM_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
            </a>
		</div>
		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<div class="col-sm-6 mt-5" style="margin-top: -5.6%;">
					<!-- 12_ 1 infos -->
					<div class="col1_partie text-center">
						<span class="title text-while">BENEFICAIRE DE LA FORMATION</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
						<div class="row form-group">
							<!-- Entreprise & Année de plan -->
							<div class="col-sm-6">
								<label>Entreprise</label>
								<input type="text" name='POS_VAL_RUB_ENT'  value="{POS_VAL_RUB_ENT}" class="form-control" placeholder="Entreprise" style="width: 100%"  data-parsley-required="true" >
							</div>
							<div class="col-sm-6">
								<label>Ann&#233;e de plan</label>
								<input type="text" name='POS_VAL_RUB_APL'  value="{POS_VAL_RUB_APL}" class="form-control" placeholder="Ann&#233;e de plan" style="width: 100%">
							</div>
						</div>
						<div class="row form-group">
							<!-- Action de formation -->
							<div class="col-sm-6">
								<label>Action de formation</label>
								<input type="text" name='POS_VAL_RUB_ANF'  value="{POS_VAL_RUB_ANF}" class="form-control" placeholder="Action de formation" style="width: 100%">
							</div>
							<div class="col-sm-6 mt-3">
								<label>Statuts</label><br>
								<input type="radio" name="POS_VAL_RUB_TA1"  value="INTER"><span style="font-size: 12px;">Inter</span>
								<input type="radio" name="POS_VAL_RUB_TA1"   value="INTRA"><span style="font-size: 12px;">Intra</span>
								<input type="radio"   name="POS_VAL_RUB_TA1"  value="INTERNE"><span style="font-size: 12px;">Interne</span>
								<input type="hidden" name="POS_VAL_CTRL_TA1" value="{POS_VAL_RUB_TA1}">
							</div>
						</div>
						<div class="row form-group">
							<!-- Intitul&#233; de formation & Structure de formation -->
							<div class="col-sm-6">
								<label>Intitul&#233; de formation</label>
								<textarea type="text" rows="2" class="form-control" name='POS_VAL_RUB_IAF' placeholder="Intitul&#233; de l&#146;action de formation" style="width: 100%; resize:none">{POS_VAL_RUB_IAF}</textarea>
							</div>
							<div class="col-sm-6">
								<label>Structure de formation</label>
								<textarea type="text" rows="2" name='POS_VAL_RUB_SET' class="form-control" placeholder="Structure de formation" style="width: 100%; resize:none">{POS_VAL_RUB_SET}</textarea>
							</div>
						</div>
						<div class="row form-group">
							<!-- Cadre & Agents de maitrise -->
							<div class="col-sm-6">
								<label>Cadre</label>
								<input type="text" name='POS_VAL_RUB_NCA'  value="{POS_VAL_RUB_NCA}" class="form-control" placeholder="Cadre" style="width: 100%">
							</div>
							<div class="col-sm-6">
								<label>Agents de maitrise</label>
								<input type="text" name='POS_VAL_RUB_NAG'  value="{POS_VAL_RUB_NAG}" class="form-control" placeholder="Agents de maitrise" style="width: 100%">
							</div>
						</div>
						<div class="row form-group">
							<!-- Employé/Ouvrier & Total -->
							<div class="col-sm-6">
								<label>Employ&#233;/Ouvrier</label>
								<input type="text" name='POS_VAL_RUB_NEO'  value="{POS_VAL_RUB_NEO}" class="form-control" placeholder="Employ&#233;/Ouvrier" style="width: 100%">
							</div>
							<div class="col-sm-6">
								<label>Total</label>
								<input type="text" name='POS_VAL_RUB_TOL'  value="{POS_VAL_RUB_TOL}" class="form-control" placeholder="Total" style="width: 100%">
							</div>
						</div>
						<div class="row form-group">
							<!-- Diplomant & Etranger -->
							<div class="col-sm-6">
								<label>Diplomant</label><br>
								<input type="radio"  name="POS_VAL_RUB_TA2" value="OUI"><span style="font-size: 12px;">Oui</span>
								<input type="radio" name="POS_VAL_RUB_TA2" value="NON"><span style="font-size: 12px;">Non</span>
								<input type="hidden" name="POS_VAL_CTRL_TA2" value="{POS_VAL_RUB_TA2}">
							</div>
							<div class="col-sm-6">
								<label>Etranger</label><br>
								<input type="radio" name="POS_VAL_RUB_TA3" value="OUI"><span style="font-size: 12px;">Oui</span>
								<input type="radio" name="POS_VAL_RUB_TA3" value="NON"><span style="font-size: 12px;">Non</span>
								<input type="hidden" name="POS_VAL_CTRL_TA3" value="{POS_VAL_RUB_TA3}">
							</div>
						</div>
						<div class="row form-group text-center">
							
						</div>
					</div>
				</div>
				<!-- 12_ 2 infos -->
				<div class="col-sm-6 mt-5"style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">INFOS COMPLEMENTAIRES</span>
					</div>
					<div class="col2_partie" style="padding-top: 5%;">
						<div class="row form-group">
							<!-- Début de formation & Fin de formation -->
							<div class="col-sm-6">
								<label>D&#233;but de formation</label>
								<input type="text" id="date1" name="POS_VAL_RUB_DEI" value="{POS_VAL_RUB_DEI}" class="form-control datepicker" style="width: 100%">
								 
							</div>
							<div class="col-sm-6">
								<label>Fin de formation</label>
								<input type="text" id="date2"  name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" class="form-control datepicker" style="width: 100%">
							</div>
						</div>
						<div class="row form-group">
							<!-- Lieu de formation & Nombre de groupe -->
							<div class="col-sm-6">
								<label>Lieu de formation</label>
								<input type="text" name='POS_VAL_RUB_LIF'  value="{POS_VAL_RUB_LIF}" class="form-control" placeholder="Lieu de formation" style="width: 100%">
							</div>
							<div class="col-sm-6">
								<label>Nombre de groupe</label>
								<input type="text" name='POS_VAL_RUB_NGP' value="{POS_VAL_RUB_NGP}" class="form-control" placeholder="Nombre de groupe" style="width: 100%">
							</div>
						</div>
						<div class="row form-group">
							<!-- Nombre d'heure par groupe & Cout total -->
							<div class="col-sm-6">
								<label>Nombre d&#146;heure par groupe</label>
								<input type="text" name='POS_VAL_RUB_NHG' value="{POS_VAL_RUB_NHG}" class="form-control" placeholder="Nombre d&#146;heure par groupe" style="width: 100%">
							</div>
							<div class="col-sm-6">
								<label>Cout total</label>
								<input type="text" name='POS_VAL_RUB_COT'  value="{POS_VAL_RUB_COT}" class="form-control" placeholder="Cout total" style="width: 100%">
							</div>
						</div>
						<div class="row form-group">
							<!-- Objectif pédagogique -->
							<div class="col-sm-12">
								<label>But de la formation</label><br>
								<input type="radio" name="POS_VAL_RUB_BUF" value="INITIATION"><span style="font-size: 12px;">Initiation</span>
								<input type="radio"name="POS_VAL_RUB_BUF" value="PERFECTIONNEMENT" ><span style="font-size: 12px;">Perfectionnement</span>
								<input type="radio" name="POS_VAL_RUB_BUF" value="RECONVERSION" ><span style="font-size: 12px;">Reconversion</span>
								<input type="radio" name="POS_VAL_RUB_BUF" value="AUTRES(A PRECISER)"><span style="font-size: 12px;">Autres(&#224; pr&#233;ciser)</span>
								<input type="hidden" name="POS_VAL_CTRL_BUF" value="{POS_VAL_RUB_BUF}">
							</div>
						</div>
						<div class="row form-group">
							<!-- Pr&#233;ciser -->
							<div class="col-sm-10">
								<textarea type="text"  name='POS_VAL_RUB_BU1' rows="2" class="form-control" placeholder="Pr&#233;ciser" style="width: 100%; resize:none">{POS_VAL_RUB_BU1}</textarea>
							</div>
						</div>
						<div class="row form-group">
							<!-- Nombre d'heure par groupe & Cout total -->
							<div class="col-sm-12">
								<label>Objectif p&#233;dagogique</label>
								<textarea type="text" rows="3" name='POS_VAL_RUB_OBP' class="form-control" placeholder="A l&#146;issue de la formation, le (s) b&#233;n&#233;ficiaire (s) doit (vent) &#234;tre capable (s) de :" style="width: 100%; resize:none">{POS_VAL_RUB_OBP}</textarea>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div>  
		</nav>
			
	</form>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
	<!-- END JQUERY  -->
	<script>
		$('#formdmdformation').parsley();
		$(document).ready(function () {
			 $('#date1 , #date2').datepicker({
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
</body>
</html>