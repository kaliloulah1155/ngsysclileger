      
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creation de fiche de poste</title>
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

	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>

	<style>
		.col_list{
			width: 23%;
			float: right;
			/*margin-right: 3%;*/
		}
		
		.col1_partie{
			width: 100%; 
			font-family: 'Times New Roman';
			font-size: 16px;
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
			padding-left: 30px;
			padding-right: 30px;
		}
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
			background:transparent
		}

		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}

		label{
			font-size: 15px;
			font-weight: 100;
		}
	</style>
</head>   
<body  class='tpl_creation tpl_creation_fpo' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal'  id="formposte" ACTION='/{NOM_APPLICATION}/interface/session/principal/attente/attente.php' method='POST' onSubmit='return validerCreation();'  data-parsley-validate>	
			    <input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='FPO'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				   
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">

				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				<!-- end important pour lancer la boite aux lettres  -->
		<div class="col_list" style="margin-top: 3%">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_FPO_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		<nav class="container-fluid">
			<div class="row" style="margin-top: 7%">
				<div class="col1_partie text-center">
					<span class="title text-while">DESCRIPTIF</span>
				</div>
				<div class="col2_partie" style="padding: 2%;">
					<div class="row">
						         <input type="hidden" name="POS_VAL_RUB_CIV" value="{POS_VAL_RUB_CIV}" class="civilite_pers" />
								 <input type="hidden" name="POS_VAL_RUB_NOM" value="{POS_VAL_RUB_NOM}" class="nom_pers" />
								 <input type="hidden" name="POS_VAL_RUB_PRE" value="{POS_VAL_RUB_PRE}" class="prenoms_pers" />
								 <input type="hidden" name="POS_VAL_RUB_MAT" value="{POS_VAL_RUB_MAT}" class="matricule_pers" />
						<div class="col-sm-4">
							<label for="bio">Titulaire du poste :</label>
							<select name='POS_VAL_RUB_MEL' class="form-control selectTits personnel" style="width: 100%;">
							    <option value="">Veuillez s&#233;lectionner</option>
							</select>  
							<input type="hidden"  class="interselectperso" name='POS_VAL_CTRL_MEL' id='POS_VAL_CTRL_MEL' value='{POS_VAL_RUB_MEL}'> 
						</div>
						<div class="col-sm-4">
							<input type="hidden" name="POS_VAL_RUB_COD" value="{POS_VAL_RUB_COD}" class="code_pos" style="width: 100%;" />
							<label for="bio">Intitul&#233; du poste :</label>
							<select name="POS_VAL_RUB_IPO" class="form-control selectInts poste" style="width: 100%;">
							    <option value="">Veuillez s&#233;lectionner</option>
							</select>
							<input type="hidden"  class="interselectposte" name='POS_VAL_CTRL_IPO' id='POS_VAL_CTRL_IPO' value='{POS_VAL_RUB_IPO}'> 
						</div>
						<div class="col-sm-4">
							<label for="bio">Type de recrutement :</label>
							<select name="POS_VAL_RUB_TYP" class="form-control type_recrut" style="width: 100%;">
							    <option value="">Veuillez s&#233;lectionner</option>
							    <option value="Recrutement interne">Recrutement interne</option>
							    <option value="Recrutement externe">Recrutement externe</option>
							</select>
							<input type="hidden"  class="interselectrecrut" name='POS_VAL_CTRL_TYP' id='POS_VAL_CTRL_TYP' value='{POS_VAL_RUB_TYP}'> 
						</div>
					</div>
					<div class="row" style="margin-top: 13px;">
						<div class="col-sm-4">
							<label for="bio">Niveau de formation :</label>
							<select name="POS_VAL_RUB_DIP" class="form-control selectForms diplome" style="width: 100%;">
							    <option value="">Veuillez s&#233;lectionner</option>
							</select>
							<input type="hidden"  class="interselectdiplome" name='POS_VAL_CTRL_DIP' id='POS_VAL_CTRL_DIP' value='{POS_VAL_RUB_DIP}'>
						</div>
						<div class="col-sm-4">
							<label for="bio">Exp&#233;rience professionnelle :</label>
							<input type="text" name="POS_VAL_RUB_EXP" value="{POS_VAL_RUB_EXP}"  onkeypress="return testNum(event, this, 2);" class="form-control" min="0" placeholder="Exp&#233;rience professionnelle" style="width: 100%;">
						</div>
					</div>
					<div class="row" style="margin-top: 13px;">
						<div class="col-sm-12">
							<label for="bio">Exigences particuli&#232;res :</label>
							<textarea name="POS_VAL_RUB_EXG" class="form-control" style="width: 100%;resize: none" rows="2" data-parsley-required="true" data-parsley-trigger="keyup">{POS_VAL_RUB_EXG}</textarea>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
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
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

		<script language='javascript' src="../../../../include/script/testNum.js"></script>
	<!-- END JQUERY  -->

	<!--Traitement des fonctions et variables globales js (en premier) -->
     <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/FPO/packs_fpo.js"></script>


	 <script>
		  
		$('#formposte').parsley();

		$(document).ready(function(){
			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			// select2 
            $('.selectTits,.selectInts,.selectForms').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });

		});
	
	</script>
	
</html>