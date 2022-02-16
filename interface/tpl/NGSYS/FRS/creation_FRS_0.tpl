<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cr&#233;ation de frais de mission</title>
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

	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>

	<style>

		.col_list{
			width: 22%;
			float: right;
			/*margin-right: 3%;*/
		}

		.col1_partie{
			width: 100%;
			/*height: 7vh; */
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

		.button_plus{
			font-size: 9px;
			background-color: #4a67b3;
			color: #fff;
			font-weight: lighter; 
			cursor: pointer;
			margin-top: 3px;
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
<body  class='tpl_creation tpl_creation_frs' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formFrais" ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'  data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
			<input type='hidden' name='URL' value='{CODE_ACTION}'>
			<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
			<input type='hidden' name='POS_TYPEDOC' value='FRS'>
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

			<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD"  style="width: 50%;">
     
					 
        </div>
		
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_FRS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>
		
		<nav class="container-fluid">

			<div class="row" style="margin-top: 1%">

				<div class="col-sm-12" style="margin-top: 12px;">
					<div class="col1_partie text-center">
						<span class="title text-while">DESCRIPTIF</span>
					</div>

					<div class="col2_partie" style="padding: 1%;">
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

											<tbody class="tableL nvlligne">
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


			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input type="submit" class="btn col-sm-2 btn_enreg " value="ENREGISTRER"  style="font-size: 12px;margin-left: 5%;"/>
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
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/FRS/Mes_scripts_ihm/niveau1.js"></script>

		<script>
	  		$('#formigr').parsley();

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

	  		$(document).ready(function(){


				//script du bouton fermer
				$('.btn_ferme').on('click',function(){
					 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
						{CODE_ACTION_FERMER}
					}
				});

				//script du bouton enregistrer 
			    $('#formFrais').submit(function(event){
					event.preventDefault();

					if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
				        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
				          	event.currentTarget.submit();
				        }else{
				    	return false;
				    }
			    });

			});


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
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/FRS/register.js"></script>

	<!-- END JQUERY  -->
</html>