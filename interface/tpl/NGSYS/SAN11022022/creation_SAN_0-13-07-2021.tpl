<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation de sanction</title>
	<link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
	<link href="/{NOM_APPLICATION}/include/alert/sweetalert.css" rel="stylesheet">
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
			padding: 7px;
			padding-top: 5px;
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
	</style>
</head>   
<body  class='tpl_creation tpl_creation_san' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formsanct" ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='SAN'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->
				<input type='hidden' class='appName' value="{NOM_APPLICATION}">
				<input type='hidden' class='appName1' value="{NOM_APPLICATION}">


					<!-- données de l'utilisateur connecté -->
						<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
						<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
						<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
						<input type="text" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
					<!--fin données de l'utilisateur connecté -->

        </div>


		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_SAN_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>
		
		
			<div class="row" style="margin-top: 3%">		
		<nav class="container-fluid">

						<!-- 12_ 1 infos -->
				<div class="col-sm-12 mt-5">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>
					<div class="col2_partie" style="padding: 25px;">
						<div class="row">
								<input type="hidden" name="POS_VAL_RUB_NOM" value="{POS_VAL_RUB_NOM}" class="nom_pers" />
								<input type="hidden" name="POS_VAL_RUB_PRE" value="{POS_VAL_RUB_PRE}" class="prenoms_pers" />
								<input type="hidden" name="POS_VAL_RUB_MAT" value="{POS_VAL_RUB_MAT}" class="matricule_pers" />
							
							<div class="col-sm-4">
								<label for="bio">Nom & pr&#233;noms :</label>
								<select id="interimaire" class="form-control select2 personnel" name='POS_VAL_RUB_INT' style="width: 100%;">
									<option value="{POS_VAL_RUB_INT}" selected>{POS_VAL_RUB_INT}</option>
								</select>
								<input type="hidden" class="init_personnel" name='POS_VAL_CTRL_INT' id='POS_VAL_CTRL_INT' required="true" value='{POS_VAL_RUB_INT}'>
							</div>
							<div class="col-sm-4">
								<label for="bio">Fonction :</label>
								<input type="text" name="POS_VAL_RUB_FON" value="{POS_VAL_RUB_FON}" placeholder="Fonction" class="form-control poste" required="true" style="width: 100%;">
							</div>
							<div class="col-sm-4">
								<label for="bio">Nature de la santion :</label>
								<select name='POS_VAL_RUB_NAT'  value="{POS_VAL_RUB_NAT}" class="form-control select2 nature Nature" required="true" style="width: 100%;">
 								</select>
								<input type="hidden" name='POS_VAL_CTRL_NAT'class="init_nature"  id='POS_VAL_CTRL_NAT' value='{POS_VAL_RUB_NAT}'>
							</div>
						</div>

						<div class="row" style="margin-top: 13px">
							<div class="col-sm-4">
								<label for="bio">Date de defaute :</label>
								<input type="text" name='POS_VAL_RUB_DAE'value="{POS_VAL_RUB_DAE}" placeholder="jj/mm/aaaa" class="form-control datepicker dtFlt" id="date1" style="width: 100%;" required="true">
							</div>
							<div class="col-sm-4">
								<label>Date de demande d'explication :</label>
								<input type="text" name='POS_VAL_RUB_DAD' value="{POS_VAL_RUB_DAD}" placeholder="jj/mm/aaaa" class="form-control datepicker dtDmd" id="date2" style="width: 100%;" required="true">
							</div>
							<div class="col-sm-4">
								<label for="bio">Date de reception d'explication :</label>
								<input type="text" name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" placeholder="jj/mm/aaaa" class="form-control datepicker dtRecp" id="date3" style="width: 100%;" required="true">
							</div>
						</div>

						<div class="row" style="margin-top: 13px">
							<div class="col-sm-4">
								<label for="bio">Date de notification :</label>
								<input type="text" name="POS_VAL_RUB_DFE" value="{POS_VAL_RUB_DFE}" placeholder="jj/mm/aaaa" class="form-control datepicker" id="date4" style="width: 100%;" required="true">
							</div>
						</div>

						<div class="row" style="margin-top: 13px">
							<div class="col-sm-12">
								<label for="bio">Commentaires</label>
								<textarea type="text" rows="3" class="form-control" name='POS_VAL_RUB_COM' style="width: 100%; resize: none">{POS_VAL_RUB_COM}</textarea>
							</div>
						</div>

					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg" type="submit" id="app" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
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
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/SAN/select2/select2tr.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/SAN/packs_fpo.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script>



	<!-- END JQUERY  -->

	 <script>

		//donnee de l'utilisateur connecté
			var nom=$('.nom').val();
			var prenom=$('.prenom').val();
			var fonction=$('.fonction').val();
			var departement=$('.departement').val();

			$('.viewnom').val(nom);
			$('.viewprenom').val(prenom);
			$('.viewfonction').val(fonction);
			$('.viewdepartement').val(departement);
		//Fin des donnees de l'utilisateur connecté
 

		$('#formsanct').parsley();

		$(document).ready(function () {

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			$('#app').click(function(){
				if($.trim($('.dtRecp, .dtDmd, .dtFlt').val())==""){
					swal("ATTENTION", "Un probl\u00e8me est survenu, veuillez r\u00e9essayez plus tard ou v\u00e9rifier les valeurs renseign\u00e9es dans les champs du formulaire", "error");
				}

				else{

		          swal({
						title: 'success',
						text: "VOTRE OPERATION S'EST DEROULEE AVEC SUCCES",
					},
					function(){

						setTimeout(function(){
						   $(".cform").submit();
						  }, 500000);
					      
					});
		        }
	        });



			// select2 
            $('.select1,.select2,.select3,.select4,.select5').select2({
                placeholder:'Selectionnez le nom et le(s) prenom(s)',
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });



			 $('#date1,#date2,#date3,#date4').datepicker({
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