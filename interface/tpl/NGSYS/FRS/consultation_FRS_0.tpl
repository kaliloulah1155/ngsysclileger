<!DOCTYPE html>
<html lang="fr">
<head>      
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation des frais</title>
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
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/testNum.js'></script>
	
	<!--ABASS INCLUDE-->
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" />
		<link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/bootstrap.css" rel="stylesheet" type="text/css" />
		<link type="text/css"  href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.css"></link>
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->

	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>
	
	<style>

		.col_list{
			width: 22%;
			float: right;
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
		
		.col2_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
		}
		
		.button_plus{
			font-size: 9px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			margin-top: 3px;
		}
		
		.col3_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: 0%; 
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
<body  class='tpl_consultation tpl_consultation_frs' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal'  id="formigr" ACTION='{URL_ATTENTE}' method='POST' data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='FRS'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->


		<input type='hidden' class='appName' value="{NOM_APPLICATION}">

		<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD" value="{POS_VAL_RUB_COD}"  style="width: 50%;">
		
		<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
		<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
		<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
		<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
		<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">


		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_MIS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

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
						<li class="active b1" ><a role="button" class=" btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
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

								<div class="col-sm-12" style="margin-top: 5px;">
									<div class="col1_partie text-center">
										<span class="title text-while">DESCRIPTIF</span>
									</div>

									<div class="col2_partie" style="padding: 2%;">
										<div class="col-sm-12 text-center" style="margin-bottom: 10px">
											<label>Les champs avec (<span class='text'></span>) sont obligatoires</label>
										</div>

										<div class="form-group row">

											<div class="col-sm-4">
												<label for="bio">Destination<span class='text'></span> :</label>
			       									<select class="form-control destination"   name="POS_VAL_RUB_DTN">
												</select>
												<input type="hidden"  class="interdestination" name='POS_VAL_CTRL_DTN' id='POS_VAL_CTRL_DTN' value='{POS_VAL_RUB_DTN}'>
												<input type="hidden" class="lib_destination" name="POS_VAL_RUB_A1" value="{POS_VAL_RUB_A1}" />
											</div>

											<div class="col-sm-4">
												<label for="bio">Profil<span class='text'></span> :</label>
												<select class="form-control profil"   name="POS_VAL_RUB_LOG">
												</select>
												<input type="hidden"   class="interprofil" name='POS_VAL_CTRL_LOG' id='POS_VAL_CTRL_LOG' value='{POS_VAL_RUB_LOG}'>
												<input type="hidden" class="lib_profil" name="POS_VAL_RUB_A2" value="{POS_VAL_RUB_A2}" />
											</div>

											<div class="col-sm-4">
												<label for="bio">Hotel<span class='text'></span> :</label>
												<input type="text" onkeypress="return testNum(event, this, 2);" name="POS_VAL_RUB_L1A" value="{POS_VAL_RUB_L1A}" placeholder="Hotel" class="form-control hotel amount">
											</div>

											<div class="col-sm-4" style="margin-top: 13px">
												<label for="bio">Nourriture<span class='text'></span> :</label>
												<input type="text" onkeypress="return testNum(event, this, 2);" name="POS_VAL_RUB_L1B" value="{POS_VAL_RUB_L1B}" placeholder="Nourriture" class="form-control nourriture amount">
											</div>

											<div class="col-sm-4" style="margin-top: 13px">
												<label for="bio">Deplacement  Urbain<span class='text'></span> :</label>
												<input type="text" onkeypress="return testNum(event, this, 2);" name="POS_VAL_RUB_L1C" value="{POS_VAL_RUB_L1C}" placeholder="Deplacement  Urbain" class="form-control deplacement_urb amount">
											</div>

											<div class="col-sm-4" style="margin-top: 13px">
												<label for="bio">Assurance<span class='text'></span> :</label>
												<input type="text" onkeypress="return testNum(event, this, 2);"  name="POS_VAL_RUB_L1D" value="{POS_VAL_RUB_L1D}" placeholder="Assurance" class="form-control assurance amount">
											</div>

											<div class="col-sm-4" style="margin-top: 13px">
												<label for="bio">Transport<span class='text'></span> :</label>
												<input type="text" onkeypress="return testNum(event, this, 2);" name="POS_VAL_RUB_L1E" value="{POS_VAL_RUB_L1E}" placeholder="Transport" class="form-control transport amount">
											</div>

											<div class="col-sm-8 text-center" style="padding-top: 50px">
												<input type="hidden" class="totalprice"  name="POS_VAL_RUB_K9" value="{POS_VAL_RUB_K9}" />
												TOTAL : <span class="montant">0 F CFA</span>
											</div>

										</div>

										<div class="row" style="margin-top: 1%">

											<div class="col-sm-10 autresBesions">
												<label for="bio">Autres besions:</label>
												<div class="row">
													<div class="col-sm-12">
														<table class="test tableligne" id="table_tache" style="width: 100%;">
															 <thead>
																<tr>    
																	<td style="width: 100px;border:none;text-align: left;margin-right: 0;">
																		<span style="width: 100%;font-size: 12px;font-weight: 1;">Libell&#233; :</span>
																	</td>
																	<td style="width: 100px;border:none;text-align: left; margin-left: 0;">
																		<span style="width: 100%;font-size: 12px;font-weight: 1;">Prix unitaire :</span>
																	</td> 
																</tr>
															 </thead>

																	 <!-- <tr>
																			<td style="width: 90px;border:none;">
																					<select name="besoins[]" class="form-control besoin select2" style="width: 95%">
																						<option>Veuillez selectionnez</option>
																							<option value="' + newData[i]['id'] + '"    >' +newData[i]['valeur'] + '</option>
																					</select>
																			</td>
																			<td style="width: 70px;border:none;">
																					<input type="text" name="pu[]" placeholder="Prix unitaire" class="form-control pu">
																			</td>
																		</tr> -->

															<tbody class="tableL nvlligne">
																 
															</tbody>
														</table>

													</div>

													<div class="col-sm" style="float: right;padding-right: 15px;">
														<span class="btn button_plus Suprim" title="Suprimer la derni&#232;re ligne" style="margin-right: 5px;">Suprimer</span>
														<span class="button_plus addRowRl btn">Ajouter une ligne</i></span>
													</div>

												</div>
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
						<div class="col2_partie text-center" style="padding-top: 0%.;">
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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
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
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.16.0/jquery.validate.min.js"></script>
		<script src="../dist/jquery-steps.js"></script>
		<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
	   
	<!-- endjquery  -->
	
	 <script>

	 var bouton_initial = $('.bouton_sub').val();
var caractere_hermes = "LIBELLE_ACTION_HERMES";
var  comp =bouton_initial.indexOf(caractere_hermes) !== -1;
if(comp===true){
	$('.btn').hide();	
}else{
	$('.btn').show();	
}


	   //-------number format 
    Number.prototype.formatMoney=function(decPlaces,thouSeparator,decSeparator){
      var n=this,
        decPlaces=isNaN(decPlaces=Math.abs(decPlaces))?2 : decPlaces,
        decSeparator=decSeparator ==undefined ? ".":decSeparator,
        thouSeparator=thouSeparator ==undefined ? ".":thouSeparator,
        sign=n<0 ? "_":"",
        i=parseInt(n=Math.abs(+n ||0).toFixed(decPlaces))+"",
        j=(j=i.length)>3 ? j%3 :0;

        return sign+(j ? i.substr(0,j)+thouSeparator : "")
        +i.substr(j).replace(/(\d{3})(?=\d)/g,"$1"+thouSeparator)
        +(decPlaces ? decSeparator+Math.abs(n-i).toFixed(decPlaces).slice(2):"");
    };
    //------ fin number format
		var prof_util = "{PROFIL_UTILISATEUR}";	 
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
	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/FRS/Mes_scripts_ihm/niveau2.js"></script>
	<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/FRS/update.js"></script>
	
</html>


