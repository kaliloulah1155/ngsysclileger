
<!DOCTYPE html>
<html lang="fr">
<head>        
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Creation de poste</title>
	<link href="/NGSYS/include/style_nouveau/style_accueil.css" rel="stylesheet">
    <link href="/NGSYS/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET' />
	<script type='text/javascript' src='/NGSYS/include/script/association.js'></script> 
	<script type='text/javascript' src='/NGSYS/include/script/vocabulaire.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/fermeture.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/saisie.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/calendrier.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/attente_fichier.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/recupcontrolsaisie.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/navigation.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/action_tableau.js'></script>
	<script type='text/javascript' src='/NGSYS/include/script/ajax_search.js'></script>
	<script language='javascript' src='/NGSYS/include/script/ajax_recup_listhier.js'></script>
	<script language='javascript' src='/NGSYS/include/script/ajax_recup_arbo_dossier.js'></script>
	<script language='javascript' src='/NGSYS/include/script/action_accueil.js'></script>

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
<body  class='tpl_creation tpl_creation_pos' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal'  id="formposte" ACTION='/NGSYS/interface/session/principal/attente/attente.php' method='POST' onSubmit='return validerCreation();'  data-parsley-validate>	
			    <input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='POS'>
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
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_POS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>

		<nav class="container-fluid">
			<div class="row" style="margin-top: 3%">
				<div class="col1_partie text-center">
					<span class="title text-while">DESCRIPTIF</span>
				</div>

				<!-- Identifiant de la fiche poste (générer dans le code javascript) -->
				<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD" value='{POS_VAL_RUB_COD}'>


				<div class="col2_partie" style="padding: 2%;">
					<div class="row">
						<div class="col-sm-4">
							<label for="bio">Intitul&#233; du poste :</label>
							<input type="text"  oninput="this.value = this.value.toUpperCase()" name="POS_VAL_RUB_IPO" value='{POS_VAL_RUB_IPO}' class="form-control intposte" placeholder="Intitul&#233; du poste" style="width: 100%;height:35px;padding: 2%;border-radius:3px;" value="" />
						</div>
						<div class="col-sm-4">
							<label for="bio">D&#233;partement :</label>
							<select id="depart" name='POS_VAL_RUB_DPT' class="form-control selectDeps" style="width: 100%;">
							         <option value="">Veuillez s&#233;lectionner</option>
							</select>
							<input type="hidden" class="initdepartement" name='POS_VAL_CTRL_DPT' id='POS_VAL_CTRL_DPT' value='{POS_VAL_RUB_DPT}'>
						</div>
						<div class="col-sm-4">
							<label for="bio">Service :</label>
							<select id="service" name='POS_VAL_RUB_SER'  class="form-control selectServs" style="width: 100%;">
							    <option value="">Veuillez s&#233;lectionner</option>
							</select>
							<input type="hidden" class="initservice" name='POS_VAL_CTRL_SER' id='POS_VAL_CTRL_SER' value='{POS_VAL_RUB_SER}'>

						</div>
					</div>

					<div class="row" style="margin-top: 13px;">
						<div class="col-sm-4">
							<label for="bio">Hi&#233;rarchie op&#233;rationnelle :</label>
							<select id="hiera_opera" name='POS_VAL_RUB_HIO' class="form-control selectOpes" style="width: 100%;">
							    <option value="">Veuillez s&#233;lectionner</option>
							</select>
							<input type="hidden" class="inithiera_opera" name='POS_VAL_CTRL_HIO' id='POS_VAL_CTRL_HIO' value='{POS_VAL_RUB_HIO}'>
						</div>
						<div class="col-sm-4">
							<label for="bio">Hi&#233;rarchie fonctionnelle :</label>
							<select id="hiera_fonct" name='POS_VAL_RUB_HIF' class="form-control selectFonts" style="width: 100%;">
							    <option value="">Veuillez s&#233;lectionner</option>
							</select>
							<input type="hidden" class="inithiera_fonct" name='POS_VAL_CTRL_HIF' id='POS_VAL_CTRL_HIF' value='{POS_VAL_RUB_HIF}'>
						</div>
						<div class="col-sm-4">
							<label for="bio">Relations exterieures :</label>
							<table class="table">
						        <tbody class="exterieures">
						          <tr>
						            <td>
										<select name="lib_relexterne[]" class="form-control selectExts relexterne" style="width: 100%;">
 										</select>
						            </td>
						          </tr>
						        </tbody>
						    </table>
							<i class="fa fa-archive btn" id="SuprimExts" title="Suprimer la derni&#232;re ligne" style="margin-left: 33%;margin-top: -4%;position: absolute;background: #4a67b3;color: #FFF;display: none;"></i>
							<span class="btn" id="ligne_exterieures" style="float: right;color: #FFF;background: #4a67b3;margin-top: -5%;margin-right: 2%">Ajouter une ligne</span>
						</div>
					</div>

					<label for="bio" style="margin-top: 13px;">Relations interieures :</label>
					<div class="row">
						<div class="col-sm-12">
							<table class="table tablerelation" style="margin-top: -9px;">
						        <tbody class="relation">
							          <tr>
							            <td class="col-sm-6">
							            	<select  name="all_lib_depart[]" class="form-control selectIntDeps all_depart" style="width: 100%;">
											    <option value="">Veuillez selectionner le d&#233;partement</option>
											</select>
							            </td>
							            <td class="col-sm-6">
							            	<select name="all_lib_service[]" class="form-control selectIntServs all_service" style="width: 100%;">
											    <option value="">Veuillez selectionner le service</option>
											</select>
							            </td>
							          </tr>
						        </tbody>
						    </table>
						</div>
						<div class="col-sm-12">
							<i class="fa fa-archive btn" id="SuprimeRel" title="Suprimer la derni&#232;re ligne" style="margin-left: 77.3%;margin-top: -2.2%;position: absolute;background: #4a67b3;color: #FFF;display: none;"></i>
							<span class="btn" id="ligne_Relat" style="float: right;margin-right: 1%;margin-bottom: 3%;margin-top: -2.5%;color: #FFF;background: #4a67b3;">Ajouter une ligne</span>
						</div>
					</div>
					<label for="bio">Activit&#233;s du poste :</label>
					<div class="row">
						<div class="col-sm-12">
							<table class="table tableactivites" style="margin-top: -9px;">
						        <tbody class="activite">
							          <tr>
							            <td class="col-sm-6">
							            	<select name="lib_pactivite[]" class="form-control selectLibPost lib_pactivite" style="width: 100%;">
 											</select>
							            </td>
							            <td class="col-sm-6">
							            	<select name="lib_ptitre[]" class="form-control selectTitbPost lib_ptitre" style="width: 100%;">
 											</select>
							            </td>
							          </tr>
						        </tbody>
						    </table>
						</div>
						<div class="col-sm-12">
							<i class="fa fa-archive btn" id="SuprimeAct" title="Suprimer la derni&#232;re ligne" style="margin-left: 77.3%;margin-top: -2.2%;position: absolute;background: #4a67b3;color: #FFF;display: none;"></i>
							<span class="btn" id="ligne_Act" style="float: right;margin-right: 1%;margin-top: -2.5%;color: #FFF;background: #4a67b3;">Ajouter une ligne</span>
						</div>
					</div>
				<div class="row">
						<div class="col-sm-12">
							<label for="bio">Mission :</label>
							<table class="table  tablemission">
						        <tbody class="mission">
						          <tr>
						            <td>
										<select name="lib_mission[]" class="form-control selectMission lib_mission" style="width: 100%;margin-top: -1%">
 										</select>
										 
						            </td>
						          </tr>
						        </tbody>
						    </table>
							<i class="fa fa-archive btn" id="SuprimMis" title="Suprimer la derni&#232;re ligne" style="margin-left: 76%;margin-top: -2.3%;position: absolute;background: #4a67b3;color: #FFF;display: none;"></i>
							<span class="btn" id="ligne_mision" style="float: right;color: #FFF;background: #4a67b3;margin-top: -2.5%;margin-right: 2%">Ajouter une ligne</span>
						</div>
						<div class="col-sm-12">
							<label for="bio">Indicateurs de performance :</label>
							<table class="table tableindicateur">
						        <tbody class="indicateur">
						          <tr>
						            <td>
										<select name="lib_indperforma[]" class="form-control selectIndis lib_indperforma" style="width: 100%;margin-top: -1%">
 										</select>
										 
						            </td>
						          </tr>
						        </tbody>
						    </table>
							<i class="fa fa-archive btn" id="SuprimInd" title="Suprimer la derni&#232;re ligne" style="margin-left: 76%;margin-top: -2.3%;position: absolute;background: #4a67b3;color: #FFF;display: none;"></i>
							<span class="btn" id="ligne_indicateur" style="float: right;color: #FFF;background: #4a67b3;margin-top: -2.5%;margin-right: 2%">Ajouter une ligne</span>
						</div>
					</div>
					<div class="row" style="margin-top: 13px;">
						<div class="col-sm-12">
							<label for="bio">Condition d&#145;acces au poste :</label>
							<table class="table" id="table_tache" style="width: 100%;margin: auto;">
								<tbody  class="tableL">
									<tr>
										<td style="width: 30px; border: 1px solid">
											<label for="bio">Libell&#233;</label>
										</td>
										<td style="width: 45px; border: 1px solid">
											<label for="bio">Recrutement interne</label>
										</td>
										<td style="width: 45px; border: 1px solid">
											<label for="bio">Recrutement externe</label>
										</td>
									</tr>
									<tr>
										<td style="width: 30px; border: 1px solid">
											<span>Niveau de formation / dipl&#244;me</span>	
										</td>
										<td style="width: 45px; border: 1px solid">
											<select name="POS_VAL_RUB_DP1" class="form-control selectForServsI diplome1" style="width: 100%;">
 											</select>
 											<input type="hidden" class="init_diplome1" name='POS_VAL_CTRL_DP1' id='POS_VAL_CTRL_DP1' value='{POS_VAL_RUB_DP1}'>
										</td>
										<td style="width: 45px; border: 1px solid">
											<select name="POS_VAL_RUB_DP2" class="form-control selectforServsE diplome2" style="width: 100%;">
 											</select>
 											<input type="hidden" class="init_diplome2" name='POS_VAL_CTRL_DP2' id='POS_VAL_CTRL_DP2' value='{POS_VAL_RUB_DP2}'>
										</td>
									</tr>
									<tr>
										<td style="width: 30px; border: 1px solid">
											<span>Sp&#233;cialit&#233;</span>	
										</td>
										<td style="width: 45px; border: 1px solid">
											<input type="text" name="POS_VAL_RUB_SPE" value="{POS_VAL_RUB_SPE}" class="form-control" placeholder="Sp&#233;cialit&#233;">
										</td>
										<td style="width: 45px; border: 1px solid">
											<input type="text" name="POS_VAL_RUB_SP1" value="{POS_VAL_RUB_SP1}" class="form-control" placeholder="Sp&#233;cialit&#233;">
										</td>
									</tr>
									<tr>
										<td style="width: 30px; border: 1px solid">
											<span>Exp&#233;rience professionnelle</span>	
										</td>
										<td style="width: 45px; border: 1px solid">
											<input type="text" name="POS_VAL_RUB_EX1" value="{POS_VAL_RUB_EX1}" onkeypress="return testNum(event, this, 2);"  min="0" class="form-control" placeholder="Exp&#233;rience professionnelle">
										</td>
										<td style="width: 45px; border: 1px solid">
											<input type="text" name="POS_VAL_RUB_EX2" value="{POS_VAL_RUB_EX2}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="Exp&#233;rience professionnelle">
										</td>
									</tr>
									<tr>
										<td style="width: 30px; border: 1px solid">
											<span>Exigence particuliere</span>	
										</td>
										<td style="width: 45px; border: 1px solid">
											<textarea class="form-control" name="POS_VAL_RUB_EXG"   style="width: 100%;resize: none"  rows="2">{POS_VAL_RUB_EXG}</textarea>
										</td>
										<td style="width: 45px; border: 1px solid">
											<textarea class="form-control" name="POS_VAL_RUB_EGC"   style="width: 100%;resize: none"  rows="2">{POS_VAL_RUB_EGC}</textarea>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>    

					<div class="row" style="margin-top: 17px;">
						<div class="col-sm-4" style="padding-left: 30px">
							<label for="bio">Capacit&#233;s techniques :</label><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_E1" class="cbk1" value="NON">
								<i>Pas significatif</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_E2" class="cbk2" value="NON">
								<i>Normale</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_E3" class="cbk3" value="NON">
								<i>Forte</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_E4" class="cbk4" value="NON">
								<i>Tr&#232;s forte</i>
							</span>
						</div>
						<div class="col-sm-4" style="padding-left: 30px">
							<label for="bio">Capacit&#233;s d&#145;encadrement :</label><br>
							<span style="width: 100%;" >
								<input type="checkbox" name="POS_VAL_RUB_EX3" class="cbk5" value="NON">
								<i>Sans objet</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_EX4" class="cbk6" value="NON">
								<i>Normale</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_EX5" class="cbk7" value="NON">
								<i>Importante</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_EX6" class="cbk8" value="NON">
								<i>Tr&#232;s Importante</i>
							</span>
						</div>
						<div class="col-sm-4" style="padding-left: 30px">
							<label for="bio">Capacit&#233;s d&#145;organisation :</label><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC1" class="cbk9" value="NON">
								<i>Pas significatif</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC2" class="cbk10" value="NON">
								<i>Normale</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC3" class="cbk11" value="NON">
								<i>Forte</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC4" class="cbk12" value="NON">
								<i>Tr&#232;s forte</i>
							</span>
						</div>
					</div>

					<label for="bio" style="margin-top: 15px;">Qualit&#233;s dominantes :</label>
					<div class="row">
						<div class="col-sm-4">
							<table class="table tableDominante">
						        <tbody class="dominante">
						        	<tr>
						        		<td>
						        			<select name="lib_qualdom[]"  class="form-control selectDoms lib_qualdom" style="width: 100%;margin-top: -2%">
												 
											</select>
						        		</td>
						        	</tr>
								</tbody>
						    </table>
						</div>
						<div class="col-sm-12">
							<i class="fa fa-archive btn" id="SuprimDom" title="Suprimer la derni&#232;re ligne" style="margin-left: 10.5%;margin-top: -2.2%;position: absolute;background: #4a67b3;color: #FFF;display: none"></i>
							<span class="btn" id="ligne_Dim" style="float: right;margin-right: 70%;color: #FFF;background: #4a67b3;margin-top: -2.5%;">Ajouter une ligne</span>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2 btn_enreg_pos" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
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
	<!-- END JQUERY  -->

	<script language='javascript' src="../../../../include/script/testNum.js"></script>
	 
 <script>
 	  //no-cache script
	 var today_cache = new Date();
     let time_cache =today_cache.getDate()+''+today_cache.getMonth()+''+today_cache.getFullYear()+''+today_cache.getHours() +''+today_cache.getMinutes()+''+today_cache.getSeconds();

    
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/POS/departement/depart_service.js?t="+time_cache+"'><\/script>");
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/POS/packages/packages_pos.js?t="+time_cache+"'><\/script>");
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/POS/packages/pos_register.js?t="+time_cache+"'><\/script>");


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
		  
		$('#formposte').parsley();

		$(document).ready(function(){
			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			// select2 
            $('.selectInts,.selectDeps,.selectServs,.selectOpes,.selectFonts,.selectExts,.selectIntDeps,.selectIntServs,.selectForServsI,.selectforServsE,.selectDoms,.selectLibPost,.selectTitbPost,.selectMission,.selectIndis').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });



            // Ajouter de ligne relation interieure
			/*$("#ligne_Relat").click(function(){   
				addRowRl();
				$("#SuprimeRel").css("display","block");
            });
			function  addRowRl(){ 
			  	var Nouvell_ligne ='<tr>'+
								'<td class="col-sm-6">'+
										'<select name="category" class="form-control" style="width: 100%;margin-top:-2%">'+
										'<option value="0">D&#233;partement</option>'+
										'</select>'+
									'</td>'+
									'<td class="col-sm-6">'+
										'<select name="category" class="form-control" style="width: 100%;margin-top:-2%">'+
										'<option value="0">Service</option>'+
										'</select>'+
									'</td>'+
								'</tr>';
              	$('.relation').append(Nouvell_ligne);
			}*/
					//Supprimer de ligne a la table
			$(document).on('click','#SuprimeRel',function(){
				  let rowcount=$('.tablerelation > .relation').children().length;
				  if(rowcount==2){
				  	$(this).hide();
				  }else{$(this).show();}
                $('.relation tr:gt(0):last').remove();
			});

           
           // Ajouter de ligne activite poste
           /*
			$("#ligne_Act").click(function(){   
				addRowAct();
				$("#SuprimeAct").css("display","block");
            });
			function  addRowAct(){ 
			  	var Nouvell_ligne ='<tr>'+
								'<td class="col-sm-6">'+
										'<select name="category" class="form-control" style="width: 100%;margin-top:-2%">'+
										'<option value="0">Libell&#233;</option>'+
										'</select>'+
									'</td>'+
									'<td class="col-sm-6">'+
										'<select name="category" class="form-control" style="width: 100%;margin-top:-2%">'+
										'<option value="0">Titre</option>'+
										'</select>'+
									'</td>'+
								'</tr>';
              	$('.activite').append(Nouvell_ligne);
			}*/
					//Supprimer de ligne a la table
			$(document).on('click','#SuprimeAct',function(){
				  let rowcount=$('.tableactivites > .activite').children().length;
				  if(rowcount==2){
				  	$(this).hide();
				  }else{$(this).show();}
                $('.activite tr:gt(0):last').remove();
			});



            // Ajouter de ligne mission 

            /*
 			$("#ligne_mision").click(function(){   
				addRowMs();
				$("#SuprimMis").css("display","block");
            });
			function  addRowMs(){ 
			  	var Nouvell_ligne ='<tr>'+
					'<td>'+
						'<select name="category" class="form-control selectMission" style="width: 100%;margin-top: -1%">'+
							'<option value="0">Veuillez s&#233;lectionner</option>'+
						'</select>'+
					'</td>'+
					'</tr>';
              	$('.mission').append(Nouvell_ligne);
			}*/
				//Supprimer de ligne a la table
			$(document).on('click','#SuprimMis',function(){
				  let rowcount=$('.tablemission > .mission').children().length;
				  if(rowcount==2){
				  	$(this).hide();
				  }else{$(this).show();}
                 $('.mission tr:gt(0):last').remove();
			});


			// Ajouter de ligne indicateur
			/*$("#ligne_indicateur").click(function(){   
				addRowIn();
				$("#SuprimInd").css("display","block");
            });
			function  addRowIn(){ 
			  	var Nouvell_ligne ='<tr>'+
					'<td>'+
						'<select name="category" class="form-control selectIndis" style="width: 100%;margin-top: -1%">'+
							'<option value="0">Veuillez s&#233;lectionner</option>'+
						'</select>'+
					'</td>'+
					'</tr>';
              	$('.indicateur').append(Nouvell_ligne);
			}*/
				//Supprimer de ligne a la table
			$(document).on('click','#SuprimInd',function(){
				  let rowcount=$('.tableindicateur > .indicateur').children().length;
				  if(rowcount==2){
				  	$(this).hide();
				  }else{$(this).show();}
               
                 $('.indicateur tr:gt(0):last').remove();
			});

			// Ajouter de ligne  relation exterieures  :: sera traiter en ajax
		 
				//Supprimer de ligne a la table
			$(document).on('click','#SuprimExts',function(){
				  let rowcount=$('.table > .exterieures').children().length;
				  if(rowcount==2){
				  	$(this).hide();
				  }else{$(this).show();}
                 $('.exterieures tr:gt(0):last').remove();
			});


			// Ajouter de ligne  qualité dominante :: sera traiter en ajax
			/*$(document).on('click','#ligne_Dim',function(){
				addRowDom();
				$("#SuprimDom").css("display","block");
            });
			function  addRowDom(){ 
			  	var Nouvell_ligne ='<tr>'+
									'<td>'+
										'<select name="category" class="form-control" style="width: 100%;margin-top: -2%">'+
										'<option value="0">Veuillez s&#233;lectionner</option>'+
										'</select>'+
									'</td>'+
								'</tr>';
              	$('.dominante').append(Nouvell_ligne);
			}*/
				//Supprimer de ligne a la table
			$(document).on('click','#SuprimDom',function(){
				  let rowcount=$('.tableDominante > .dominante').children().length;
				  if(rowcount==2){
				  	$(this).hide();
				  }else{$(this).show();}
                 $('.dominante tr:gt(0):last').remove();
			});





		});
	
	</script>
	
</html>