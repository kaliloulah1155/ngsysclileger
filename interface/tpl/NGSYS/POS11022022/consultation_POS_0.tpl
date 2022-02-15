<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation du poste</title>
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
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"  src="/{NOM_APPLICATION}/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- <link href="/{NOM_APPLICATION}/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" /> -->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
		<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    	<link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>
	<!-- END JQUERY UI -->
	
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
			padding-top: 5px;
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

		.parsley-error{
			 border-style: solid;
  			border-color: red;
		}
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_pos' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' id="formposte"  ACTION='{URL_ATTENTE}' method='POST'  data-parsley-validate>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='POS'/>
		<input type='hidden' name='MODE' class="get_mode" value='{MODE}'>
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
						<li class="active b1" ><a role="button" class=" btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
						 
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
							
							<div class="row">
								<div class="col1_partie text-center">
									<span class="title text-while">DESCRIPTIF</span>
								</div>
								<!-- Identifiant de la fiche poste (générer dans le code javascript) -->
				<input type="hidden" class="loadcode" name="POS_VAL_RUB_COD" value='{POS_VAL_RUB_COD}' style="width: 100%;">

								<div class="col2_partie" style="padding: 2%;">
									<div class="row">
										<div class="col-sm-4">
											<label for="bio">Intitul&#233; du poste :</label>
											<input type="text"  oninput="this.value = this.value.toUpperCase()" name="POS_VAL_RUB_IPO" value='{POS_VAL_RUB_IPO}' class="form-control intposte" placeholder="Intitul&#233; du poste" style="width: 100%;height:35px;padding: 2%;border-radius:3px;" value="" />
										</div>
										<div class="col-sm-4">
											<label for="bio">D&#233;partement :</label>
											<select id="depart" name='POS_VAL_RUB_DPT' class="form-control selectDeps" style="width: 100%;">
											    <option value="0">Veuillez s&#233;lectionner</option>
											</select>
											<input type="hidden" class="initdepartement" name='POS_VAL_CTRL_DPT' id='POS_VAL_CTRL_DPT' value='{POS_VAL_RUB_DPT}'>
										</div>
										<div class="col-sm-4">
											<label for="bio">Service :</label>
											<select  id="service" name='POS_VAL_RUB_SER'  class="form-control selectServs" style="width: 100%;">
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
											<label for="bio">Relation exterieures :</label>
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

									<label for="bio">Relations interieures :</label>
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
											<span class="btn" id="ligne_Relat" style="float: right;margin-right: 1%;margin-top: -2.5%;color: #FFF;background: #4a67b3;">Ajouter une ligne</span>
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

									<div class="row" style="">
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
												<tbody class="tableL">
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
											<input type="text" name="POS_VAL_RUB_SPE" value="{POS_VAL_RUB_SPE}" class="form-control" placeholder="Sp&#233;cialit&#233;" style="width: 100%;">
										</td>
										<td style="width: 45px; border: 1px solid">
											<input type="text" name="POS_VAL_RUB_SP1" value="{POS_VAL_RUB_SP1}" class="form-control" placeholder="Sp&#233;cialit&#233;" style="width: 100%;">
										</td>
									</tr>
									<tr>
										<td style="width: 30px; border: 1px solid">
											<span>Exp&#233;rience professionnelle</span>	
										</td>
										<td style="width: 45px; border: 1px solid">
											<input type="text" name="POS_VAL_RUB_EX1" value="{POS_VAL_RUB_EX1}" onkeypress="return testNum(event, this, 2);"  min="0" class="form-control" placeholder="Exp&#233;rience professionnelle" style="width: 100%;">
										</td>
										<td style="width: 45px; border: 1px solid">
											<input type="text" name="POS_VAL_RUB_EX2" value="{POS_VAL_RUB_EX2}" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="Exp&#233;rience professionnelle" style="width: 100%;">
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
 								<input type="checkbox" name="POS_VAL_RUB_E1" class="cbk1" value="{POS_VAL_RUB_E1}">
 								<i>Pas significatif</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_E2" class="cbk2" value="{POS_VAL_RUB_E2}">
								<i>Normale</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_E3" class="cbk3" value="{POS_VAL_RUB_E3}">
								<i>Forte</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_E4" class="cbk4" value="{POS_VAL_RUB_E4}">
								<i>Tr&#232;s forte</i>
							</span>
						</div>
						<div class="col-sm-4" style="padding-left: 30px">
							<label for="bio">Capacit&#233;s d&#145;encadrement :</label><br>
							<span style="width: 100%;" >
								<input type="checkbox" name="POS_VAL_RUB_EX3" class="cbk5" value="{POS_VAL_RUB_EX3}">
								<i>Sans objet</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_EX4" class="cbk6" value="{POS_VAL_RUB_EX4}">
								<i>Normale</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_EX5" class="cbk7" value="{POS_VAL_RUB_EX5}">
								<i>Importante</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_EX6" class="cbk8" value="{POS_VAL_RUB_EX6}">
								<i>Tr&#232;s Importante</i>
							</span>
						</div>
						<div class="col-sm-4" style="padding-left: 30px">
							<label for="bio">Capacit&#233;s d&#145;organisation :</label><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC1" class="cbk9" value="{POS_VAL_RUB_FC1}">
								<i>Pas significatif</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC2" class="cbk10" value="{POS_VAL_RUB_FC2}">
								<i>Normale</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC3" class="cbk11" value="{POS_VAL_RUB_FC3}">
								<i>Forte</i>
							</span><br>
							<span style="width: 100%;">
								<input type="checkbox" name="POS_VAL_RUB_FC4" class="cbk12" value="{POS_VAL_RUB_FC4}">
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

						</nav>
					<!-- fin -->
				</div>
		   </div>
		   <!-- traitement -->
			 
		   <!-- document -->
		   <div class="tab-pane fade in "  id="tabs-3" style="margin-top:0.5%;">
				<div class="row">
					<div class="col-sm-12" style="margin-bottom: 2%;">
						<div class="col1_partie text-center">
							<span class="title text-while;font-size: 12px">MES FICHES</span>
						</div>
						<div class="col2_partie text-center" style="padding-top: 1%;">
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
									<input type="text" name='POS_VAL_RUB_NUD' value="{POS_VAL_RUB_NUD}" placeholder="N&#176; poseidon" class="form-control numposeidon" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" name='POS_VAL_RUB_ETF' value="{POS_VAL_RUB_ETF}" class="form-control" style="width: 100%">
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
							<div class="col3_partie" style="padding-top: 10%;">
								<!-- Consultation -->
								<div class="form-group">
								   <label for="bio">Consultation :</label>
								  <textarea  class="form-control" id="bio"  name='POS_VAL_RUB_AVU' rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AVU}</textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" name='POS_VAL_RUB_AMO'  rows="2" style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_AMO}</textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" name='POS_VAL_RUB_ASU' style="width: 90%;resize: none;margin-top: -1%">{POS_VAL_RUB_ASU}</textarea>
								</div>
							</div>
						</div>
					</div>
				</nav>
		   </div>
		</div>
	</form>

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
	<script language='javascript' src="../../../../include/script/testNum.js"></script>
	 
 <script>
 	  //no-cache script
	 var today_cache = new Date();
     let time_cache =today_cache.getDate()+''+today_cache.getMonth()+''+today_cache.getFullYear()+''+today_cache.getHours() +''+today_cache.getMinutes()+''+today_cache.getSeconds();

    
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/POS/departement/depart_service.js?t="+time_cache+"'><\/script>");
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/POS/packages/packages_pos_edit.js?t="+time_cache+"'><\/script>");
     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/POS/packages/pos_register_edit.js?t="+time_cache+"'><\/script>");

     document.write("<script type='text/javascript' src='/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/POS/packs_rows/rows_loader.js?t="+time_cache+"'><\/script>");


    
 </script>
	
	 <script>
	 $('#formposte').parsley();
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

	$(document).ready(function(){

		// select2 
        $('.selectInts,.selectDeps,.selectServs,.selectOpes,.selectFonts,.selectExts,.selectIntDeps,.selectIntServs,.selectForServsI,.selectforServsE,.selectDoms,.selectLibPost,.selectTitbPost,.selectMission,.selectIndis').select2({
            placeholder:'Select Category',
            theme:'bootstrap4',
            tags:true,
            allowClear: true
        });


        // Ajouter de ligne relation interieure
	/*	$("#ligne_Relat").click(function(){   
			addRowRl();
			$("#SuprimeRel").css("display","block");
        });
		function  addRowRl(){ 
		  	var Nouvell_ligne ='<tr>'+
							'<td class="col-sm-6">'+
									'<select name="category" class="form-control select4" style="width: 100%;margin-top:-2%">'+
									'<option value="0">D&#233;partement</option>'+
									'</select>'+
								'</td>'+
								'<td class="col-sm-6">'+
									'<select name="category" class="form-control select4" style="width: 100%;margin-top:-2%">'+
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
	/*	$("#ligne_Act").click(function(){   
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
		/*$("#ligne_mision").click(function(){   
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


		// Ajouter de ligne  relation exterieures
		/*$(document).on('click','#ligne_exterieures',function(){
			addRowExts();
			$("#SuprimExts").css("display","block");
        });
		function  addRowExts(){ 
		  	var Nouvell_ligne ='<tr>'+
								'<td>'+
									'<select name="category" class="form-control" style="width: 100%;margin-top: -2%">'+
										'<option value="0">Veuillez s&#233;lectionner</option>'+
									'</select>'+
								'</td>'+
							'</tr>';
          	$('.exterieures').append(Nouvell_ligne);
		}*/
			//Supprimer de ligne a la table
		$(document).on('click','#SuprimExts',function(){
			  let rowcount=$('.table > .exterieures').children().length;
			  if(rowcount==2){
			  	$(this).hide();
			  }else{$(this).show();}
             $('.exterieures tr:gt(0):last').remove();
		});


		// Ajouter de ligne indicateur
	/*	$("#ligne_indicateur").click(function(){   
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



		// Ajouter de ligne  qualité dominante
	/*	$("#ligne_Dim").click(function(){   
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

</body>	
</html>


