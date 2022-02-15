<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Demande de formation</title>
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
			padding: 17px;
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
		span.text:after {
			content: "*";
			color: red;
		}

		label{
			font-size: 15px;
			font-weight: 100;
		}

	</style>
</head>
<body   class='tpl_creation tpl_creation_dfm' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formdmdformation" ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();' data-parsley-validate>
 	 
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

			<input type='hidden' class='appName' value="{NOM_APPLICATION}">
			<!-- end important pour lancer la boite aux lettres  -->
			<!-- données de l'utilisateur connecté -->
			<input type="hidden" name='POS_VAL_RUB_NOM' class="viewnom" value="{POS_VAL_RUB_NOM}" >
			<input type="hidden" name='POS_VAL_RUB_PRE' class="viewprenom" value="{POS_VAL_RUB_PRE}" >
			<input type="hidden" name='POS_VAL_RUB_FON' class="viewfonction" value="{POS_VAL_RUB_FON}" >
			<input type="hidden" name='POS_VAL_RUB_DPT' class="viewdepartement" value="{POS_VAL_RUB_DPT}" >
		<!--fin données de l'utilisateur connecté -->
		

		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			 <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_DFM_lnv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a> 

			<!--<a href="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DFM/liste/liste_DFM_1.php?APPLI={NOM_APPLICATION}&USER={NOM_UTILISATEUR}&PROFIL={PROFIL_UTILISATEUR}">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>-->
		</div>

		<nav class="container-fluid">
			<div class="row" style="margin-top: 1%">
				<div class="col-sm-12" style="margin-top: 2%;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIFS</span>
					</div>
					<div class="col2_partie" style="padding-top: 1%;">
						<div class="row">
							<div class="col-sm-12 text-center" style="margin-bottom: 13px">
								<label style="font-weight: 100; font-size: 13px;">Les champs avec (<span class='text'></span>) sont obligatoires</label>
							</div>
							<div class="col-sm-4">
								<label>Ann&#233;e du plan<span class='text'></span> :</label>
								<input type="text" name='POS_VAL_RUB_APL'  value="{POS_VAL_RUB_APL}" class="form-control plan" placeholder="Ann&#233;e de plan" style="width: 100%" required="true">
							</div>
							<div class="col-sm-4">
								<label>Action de formation n&#176;<span class='text'></span> :</label>
								<input type="text" name="POS_VAL_RUB_ANF" value="{POS_VAL_RUB_ANF}" class="form-control action" placeholder="Action de formation n&#176;" style="width: 100%" required="true">
							</div>
							<div class="col-sm-4">
								<label>Intitul&#233; de l&#145;action de formation<span class='text'></span> :</label>
								<input type="text"  name="POS_VAL_RUB_IAF" value="{POS_VAL_RUB_IAF}" class="form-control intitule" placeholder="Intitul&#233; de l&#145;action de formation" style="width: 100%" required="true">
							</div>
							<div class="col-sm-4" style="margin-top: 13px;padding-left: 5%">
								<label>Intitul&#233;<span class='text'></span> :</label><br>
								<input type="radio" name="POS_VAL_RUB_TA1" checked value="INTRA" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Intra</span><br>
								<input type="radio" name="POS_VAL_RUB_TA1" value="INTER" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Inter</span><br>
								<input type="radio" name="POS_VAL_RUB_TA1" value="INTERNE" style="margin-right: 1%"><span style="font-size: 12px;">Interne</span><br>
								<input type="hidden" name="POS_VAL_CTRL_TA1" value="{POS_VAL_RUB_TA1}">
							</div>
							<div class="col-sm-4" style="margin-top: 13px;padding-left: 5%">
								<label class="but">But de la formation<span class='text'></span> :</label><br>
								<input type="radio" class="btnFors" checked name="POS_VAL_RUB_BUF" value="INITIATION" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Initiation</span><br>
								<input type="radio" class="btnFors" name="POS_VAL_RUB_BUF" value="PERFECTIONNEMENT" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Perfectionnement</span><br>
								<input type="radio" class="btnFors" name="POS_VAL_RUB_BUF" value="RECONVERSION" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Reconversion</span><br>
								<input type="radio" class="btnFors" name="POS_VAL_RUB_BUF"  value="AUTRES" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Autres (&#224; pr&#233;ciser)</span><br>
								<input name="POS_VAL_RUB_BU1" value="{POS_VAL_RUB_BU1}"  type="text" class="form-control" id="autresLigne" placeholder="" style="width: 100%;">
								<input type="hidden" name="POS_VAL_CTRL_BUF" value="{POS_VAL_RUB_BUF}">
							</div>
						</div>
						<div class="row">
							<div class="col-sm-12">
								<label>Objectifs p&#233;dagogiques<span class='text'></span> :</label>
								<br>
								<span style="font-size: 12px;margin-left: 1%;">A l&#146;issue de la formation, le (s) b&#233;n&#233;ficiaire (s) doit (vent) &#234;tre capable (s) de :</span>
								<textarea type="text" rows="3" name='POS_VAL_RUB_OBP' class="form-control objectif" style="width: 100%; resize:none" required="true">{POS_VAL_RUB_OBP}</textarea>
							</div>
						</div>
						<!-- Identifiant de la fiche poste (générer dans le code javascript) -->
				<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD" value='{POS_VAL_RUB_COD}'>
						<div class="row" style="margin-top: 15px">
							<div class="col-sm-12">
								<label>B&#233;n&#233;ficiaires de la formation :</label>
								<table class="table" id="table" style="width: 100%;margin: auto;">
									<thead>
										<tr>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<label for="bio">Nom & Pr&#233;noms</label>
											</td>
											<td style="width: 45px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<label for="bio">Genre</label>
											</td>
											<td style="width: 45px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<label for="bio">Date de naissance</label>
											</td>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<span>Nationalit&#233;</span>	
											</td>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<span>Fonction</span>	
											</td>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<span>Cat&#233;gorie</span>	
											</td>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<span>Ann&#233;e d&#145;embauche</span>	
											</td>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<span>CNPS</span>	
											</td>
											<td style="width: 30px; border: 1px solid;font-weight: bold;text-align: center;font-size: 11px">
												<span>Statut</span>	
											</td>
											 
										</tr>
								</thead>
								<tbody class="estimation">
										<tr>
											<td style="width: 30px; border: 1px solid">
												<select name="personnel[]" class="form-control selectNom lib_personnel" style="width: 100%;">
												    
												</select>	
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="civilite[]" type="text" class="form-control civilite" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="datenaiss[]" type="text" class="form-control datenaiss" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="nationalite[]" type="text" class="form-control nationalite" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="fonction[]" type="text" class="form-control fonction" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="categorie[]" type="text" class="form-control categorie" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="dtembauche[]" type="text" class="form-control dtembauche" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="cnps[]" type="text" class="form-control cnps" style="width: 100%;background: transparent;">
											</td>
											<td style="width: 45px; border: 1px solid">
												<input name="position[]" type="text" class="form-control position" style="width: 100%;background: transparent;">
											</td>
										</tr>
									</tbody>
								</table>
								<div class="col-sm-12">
									<i class="fa fa-archive btn" id="suprimeNvlls" title="Suprimer la derni&#232;re ligne" style="margin-left: -1%;margin-top: 3px;background: #4a67b3;color: #FFF;display: none;position: absolute;"></i>
									<span class="btn" id="ligneNvlls" style="float: right;margin-top: 3px;margin-right: -1%;color: #FFF;background: #4a67b3;">Ajouter une ligne</span>
								</div>
							</div>
						</div>
					</div>


					<!-- Deuxieme partie -->
					<div class="row" style="margin-top: 1%;">
						<div class="col-sm-12" style="margin-top: 2%;">
							<div class="col1_partie text-center">
								<span class="title text-while">DESCRIPTIFS</span>
							</div>
							<div class="col2_partie" style="padding-top: 2%;">
								<div class="row">
									<div class="col-sm-4">
										<label>Entreprise :</label>
										<select name='POS_VAL_RUB_ENT' class="form-control selectEnp entreprise" style="width: 100%;">
										</select>
										<input type="hidden"  class="interselectentreprise" name='POS_VAL_CTRL_ENT' id='POS_VAL_CTRL_ENT' value='{POS_VAL_RUB_ENT}'>
									</div>
									<div class="col-sm-4">
										<label>Lieu de formation :</label>
										<input name="POS_VAL_RUB_LIF" value="{POS_VAL_RUB_LIF}" type="text" class="form-control" placeholder="Lieu de formation" style="width: 100%">
									</div>
									<div class="col-sm-4">
										<label></label><br>
										<input type="checkbox" class="btnFors cbk1" name="POS_VAL_RUB_E1" value="NON" style="margin-right: 1%"><span style="font-size: 12px;margin-right: 3%">Etranger</span>

										<input type="checkbox" class="btnFors cbk2" name="POS_VAL_RUB_E2" value="NON" style="margin-right: 1%;margin-left: 11%"><span style="font-size: 12px;margin-right: 3%">Diplomant</span>
										<input type="text" style="width: 100%;visibility: hidden;">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-4">
										<label>Date d&#233;but de formation :</label>
										<input name="POS_VAL_RUB_DEI" value="{POS_VAL_RUB_DEI}" type="text" class="form-control" id="date1" placeholder="jj/mm/aaaa" style="width: 100%">
									</div>
									<div class="col-sm-4">
										<label>Date fin de formation :</label>
										<input name="POS_VAL_RUB_DFI" value="{POS_VAL_RUB_DFI}" type="text" class="form-control" id="date2" placeholder="jj/mm/aaaa" style="width: 100%">
									</div>
									<div class="col-sm-4">
										<label>Nombre de groupe :</label>
										<input name="POS_VAL_RUB_NGP" value="{POS_VAL_RUB_NGP}"  type="text" class="form-control" placeholder="Nombre de groupe" style="width: 100%">
									</div>
								</div>
								<div class="row" style="margin-top: 13px">
									<div class="col-sm-4">
										<label>Co&#251;t total de formation :</label>
										<input type="text" name="POS_VAL_RUB_COT" value="{POS_VAL_RUB_COT}" class="form-control"   style="width: 100%">
									</div>
									<div class="col-sm-4">
										<label>Structure et &eacute;tablissement de formation :</label>
										<input type="text" name="POS_VAL_RUB_SET" value="{POS_VAL_RUB_SET}" class="form-control"   style="width: 100%">
									</div>
									 
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg_dfm" type="submit" id="app" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div>  
		</nav>
			
	</form>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script>
	<!-- END JQUERY  -->
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/DFM/packs/packages.js"></script>

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
//Fin desdonnées de l'utilisateur connecté

	//UUID CODE   ::creation d'un code unique pour chaque document :poste idem à ID
     function generateUUID() { // Public Domain/MIT
		    var d = new Date().getTime();//Timestamp
		    var d2 = (performance && performance.now && (performance.now()*1000)) || 0;//Time in microseconds since page-load or 0 if unsupported
		    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
		        var r = Math.random() * 16;//random number between 0 and 16
		        if(d > 0){//Use timestamp until depleted
		            r = (d + r)%16 | 0;
		            d = Math.floor(d/16);
		        } else {//Use microseconds since page-load if supported
		            r = (d2 + r)%16 | 0;
		            d2 = Math.floor(d2/16);
		        }
		        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
		    });
		}

	$('.loadcode').val(generateUUID());
 </script>
	<script>
		$('#formdmdformation').parsley();
		$(document).ready(function () {

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});


			//script du bouton enregistrer 
	        $('#formdmdformation').submit(function(event){
				event.preventDefault();

				if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
			        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			          	event.currentTarget.submit();
			        }else{
			    	return false;
			    }
	        });



			// select2 
            $('.selectNom').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });

            // masquer & demasquer le champ de precision du bouton radio autre
            $("#autresLigne").hide();
            $(document).on('click','.btnFors',function(){
            	let valbnt = $(this).val();
            	if(valbnt == "AUTRES"){
            		$("#autresLigne").show();
            	}
            	else{
            		$("#autresLigne").hide();
            	}
            });

			$('#date1,#date2').datepicker({
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

   
			// Ajouter de ligne mission 
			/*$("#ligneNvlls").click(function(){   
				addRowMs();
				$("#suprimeNvlls").css("display","block");
            });*/
			function  addRowMs(){ 
			  	var Nouvell_ligne ='<tr>'+
						'<td style="width: 30px; border: 1px solid">'+
							'<select name="category" class="form-control selectNom" style="width: 100%;">'+
							    '<option value="0">Veuillez s&#233;lectionner</option>'+
							'</select>'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
						'<td style="width: 45px; border: 1px solid">'+
							'<input type="text" class="form-control" style="width: 100%;background: transparent;">'+
						'</td>'+
					'</tr>';
              	$('.estimation').append(Nouvell_ligne);
			}
				//Supprimer de ligne a la table
			$(document).on('click','#suprimeNvlls',function(){
				  let rowcount=$('.table > .estimation').children().length;
				  if(rowcount==3){
				  	$(this).hide();
				  }else{$(this).show();}
                 $('.estimation tr:gt(0):last').remove();
			});

		});
	
	</script>
</body>
</html>