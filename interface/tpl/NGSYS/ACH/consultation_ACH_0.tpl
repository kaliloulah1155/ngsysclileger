<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<HTML>
<HEAD>
 <!-- le background du menu principal (vert dominant) background-color:#268e8a; -->
	<meta name="keywords" content="sesin">
	<meta name="HandheldFriendly" content="true" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="apple-mobile-web-app-capable" content="YES" />
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no, maximum-scale=1.0, user-scalable=no" /> 
 
	<TITLE>{TITRE_FENETRE}</TITLE>
	<LINK REL="stylesheet" type='text/css' href='../../../../include/style/style{UPDATE_INC_FILE}.css'>
	<LINK REL="stylesheet" type='text/css' href='../../../../include/style/styletypedoc{UPDATE_INC_FILE}.css'>
	<LINK REL="stylesheet" type='text/css' href='../../../../include/style/lrstyle{UPDATE_INC_FILE}.css'>
	<SCRIPT type='text/javascript' src='../../../../include/script/association{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/vocabulaire{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/fermeture{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/saisie{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/calendrier{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/attente_fichier{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/recupcontrolsaisie{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/navigation{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/action_tableau{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT type='text/javascript' src='../../../../include/script/ajax_search{UPDATE_INC_FILE}.js'></SCRIPT>
	<SCRIPT language='javascript' src='../../../../include/script/ajax_recup_listhier.js'></SCRIPT>
	<SCRIPT language='javascript' src='../../../../include/script/ajax_recup_arbo_dossier.js'></SCRIPT>
	
	<base target="_self">
	
	<!--ABASS INCLUDE-->
		<link href="/include/ressources/plugins/all/fonts/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
		<link href="/include/ressources/plugins/all/css/local/template.css" rel="stylesheet" type="text/css" />
		<link href="/include/ressources/plugins/all/css/local/bootstrap.css" rel="stylesheet" type="text/css" />
		<link type="text/css"  href="/include/bootstrap-3.3.7/dist/css/bootstrap.css"></link>
		<script type="text/javascript"  src="/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script type="text/javascript"  src="/include/jQuery/jquery.min.js"></script>
	<!--ABASS INCLUDE-->
	
	<!-- JQUERY UI -->
		<link href="../../../../include/libraries/jquery-ui/css/smoothness/jquery-ui-1.10.3.custom.css" rel="stylesheet" type="text/css" />
	<!-- END JQUERY UI -->
	
	<!-- DATA TABLES -->
	<link rel="stylesheet" type='text/css' href='../../../../include/assets/vendors/DataTables/DataTables-1.10.18/css/dataTables.bootstrap.css'>
	<script type="text/javascript"  src="../../../../include/assets/vendors/DataTables/DataTables-1.10.18/js/dataTables.jqueryui.min.js"></script>
	<style type="text/css" title="currentStyle">@import "../../../../include/libraries/datatables/extras/TableTools/media/css/TableTools.css";</style>
	<script type="text/javascript" language="javascript" src="../../../../include/libraries/datatables/media/js/jquery.dataTables.js"></script>
	<script type="text/javascript" charset="utf-8" src="../../../../include/libraries/datatables/extras/TableTools/media/js/TableTools.js"></script>
	<script type="text/javascript" charset="utf-8" src="../../../../include/libraries/datatables/extras/TableTools/media/js/ZeroClipboard.js"></script>
	<script type="text/javascript" language="javascript" charset="utf-8" src="../../../../include/libraries/datatables/datatables-initialization.js"></script>
	<style>
		.legend-fieldset{
			background-color:#3186B1;
			width:95%;
			height:30px;
		}
		
		#title-head{
			font-size:18px;
			text-transform: uppercase;
		}
		.legend-fieldset>h5{
			text-align:center;
			color:white;
		}
		.fields-row>div{
			margin-top:10px;
			z-index:0;
		}
		
		fieldset{
			margin-top:10px;
			margin-left:5px;
			margin-right:5px;
			padding-bottom:10px;
			z-index:0;
		}
		
		.titre-entete{
			background-image: linear-gradient(180deg, #3186B1, #3186B1);   /*css de l'entete */
			padding:opx;
			margin:0px;
			height:50px;
		}
		
		h5.titre-fieldset{
			color:#3186B1;
			font-weight:bold;
		}
		
		div.zindex0{
			z-index:0;
			padding-top:5px;
		}
		
		div.titre-boutons{
			margin-top:-20px;
		}
		#btn_valider{
			border: none;
			padding:opx;
			background: url("/images/icons/btn_valider.png") no-repeat 0 0;
			max-height:35px; 
			background-color:none;
		}
		
		.b1 {
				border:1px solid ;
		}
	</style>
	<script>
		$(document).ready(function() {
			$('#montableau').DataTable();
		});
     //Add zoom by ibson
        function myzoom() {
            document.body.style.zoom = "80%" 
        }
	</script>
</HEAD>

<body class='tpl_consultation tpl_consultation_ach' onLoad='initTplConsultation();{GRISE_CHAMP};myzoom();' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color:#e1e1e1;">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='ACH'>
		<input type='hidden' name='MODE' value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='1'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->
		
		<div id="actions-container" class="ui-widget-content titre-boutons ">
			<div class="container-fluid t3-module module intro-title titre-entete">
				<h3  class="module-title text-center" style="text-transform: unset; padding-top:20px;; color:white; "><span class="title-head" > {TITRE_ENTETE_PAGE}</span></h3>
				<div class="col-xs-1 col-sm-1 col-md-1 col-lg-1"></div>
				<div style="z-index:0; padding-left:30px;" class="col-xs-12 col-sm-12 col-md-4 col-lg-4 center-block">
					<!-- BEGIN BLOC_MODIFICATION_HERMES -->
					<!-- BEGIN BLOC_HERMES -->	
					<SELECT class="col-xs-7 col-sm-7 col-md-7 col-lg-7"  role="button" name='POS_ACTION_HERMES' onChange='appel_desactivation()'>
					<!-- BEGIN POS_LISTE_ACTIONS_HERMES -->
						<OPTION value="{POS_CODE_ACTION_HERMES}" {SELECTED_ACTION_HERMES}> {POS_LIBELLE_ACTION_HERMES}</OPTION>
					<!-- END POS_LISTE_ACTIONS_HERMES -->
					</SELECT>
					<input class="col-xs-5 col-sm-5 col-md-4 col-lg-4" id="btn_valider" title="Exécuter l'action selectionnée" type="submit" class='bouton_sub' name='TYPE_ACTION' value="{LIBELLE_ACTION_HERMES}" >
					<!-- END BLOC_HERMES -->
					<!-- END BLOC_MODIFICATION_HERMES -->
				</div>
				<div  class="col-xs-12 col-sm-12 col-md-7 col-lg-7">
					{BOUTON}
				</div>
			</div>		
		</div>
	<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="main_div">
			<div class="navbar navbar-default t3-mainnav marginBottom-0" role="navigation" >
				<div class="navbar-header">
					<button title="Clicquez ici pour voir les onglets" style="float:left;" type="button" class="btn navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse-5">
						<i class="fa fa-bars fa-lg"></i> 
					</button>
				</div>
				<div class="collapse navbar-collapse " id="navbar-collapse-5">
					<ul class="nav navbar-nav level0 nav-tabs" style="width:90%;">
						<li class="active b1" ><a role="button" class="btn btn-outline-primary" data-toggle="tab" href="#tabs-1">PLAN DE CLASSEMENT</a></li>
						<li class="b1"><a role="button" class="btn-outline-primary" data-toggle="tab" href="#tabs-2">HISTORIQUE</a></li>
					</ul>
				</div>
			</div>
			
				
			<div class="tab-content " style="margin-top:-20px; ">
				<div class="tab-pane fade active in "  id="tabs-1" style="margin-top:0.5%; margin-left:-2%;"><!--debut tab 1 : onglet Général-->
					<div class='col-lg-3 col-md-3 col-sm-12 col-xs-12'></div>
					<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
						<div class="ts-service-info" >
							<fieldset class="side-by-side panel panel-primary">
								<legend class="legend-fieldset center-block" style="">
									<h5> Informations</h5>	
								</legend>
								
								<!-- BEGIN LIEN_MULTIPLE_PROFIL_LISTE_DAH -->
								 
									<div class="fields-row">
										<table id="montableau" class="tablelr display table" id="rfarchives" >
											<thead>
												<tr class='titrecolonne' >
													<th style="text-align: center"></th>
													<!-- BEGIN ENTETE_DAH -->
													<th   style="text-align: center" >{TITRE_COLONNE}</th>
													<!-- END ENTETE_DAH -->
													
												</tr>
											</thead>
											<tbody>
												<!-- BEGIN LISTE_REPONSES_DAH -->
												<tr>
													<td style="text-align: center" >
														<a href="javascript:void consulterDocFromTpl({POS_NUMDOC_LIE});">
														<IMG SRC="../../../../images/icons/folder.gif" title="Cliquez sur l'icône pour consulter la fiche" ALIGN="MIDDLE" BORDER="0">
														</a>
													</td>   
													<!-- BEGIN LR_REPONSE_DAH -->
													<td style="text-align: center"> {ZONE_LR} </td>
													<!-- END LR_REPONSE_DAH -->
													
												</tr>
												<!-- END LISTE_REPONSES_DAH -->
											</tbody>
										</table>
									</div>
								 
								<!-- END LIEN_MULTIPLE_PROFIL_LISTE_DAH -->
							</fieldset>		
						</div>
					</div>	
				</div>	<!--fin tab 1 : onglet Général-->	
				<!--debut tab 2 : historique-->
<div class="tab-pane fade"  id="tabs-2" >
	<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12">
		<div class="ts-service-info" >
			<fieldset class="side-by-side panel panel-primary">
				<legend class="legend-fieldset center-block">
					<h5 >Historique</h5>	
				</legend>
				<div class="fields-row" >
					<div class="  col-lg-4 col-md-4 col-sm-12 col-xs-12" >	
						<div class="input-group d-inline-block">
							<label class="input-group-addon" for="id_rub_NUD ">N°Poseidon</label>
							<input  class='form-control' readonly="readonly" name='POS_VAL_RUB_NUD' id='id_rub_NUD' size='30' value="{POS_VAL_RUB_NUD}"  onBlur="javascript:maximum(this,'119')"> 
						</div>
					</div>
				</div>
				<div class="fields-row" >
					<div class="  col-lg-5 col-md-5 col-sm-12 col-xs-12" >	
						<div class="input-group d-inline-block">
							<label class="input-group-addon" for="id_rub_ETF ">Etat Fiche</label>
							<input  class='form-control' readonly="readonly"  name='POS_VAL_RUB_ETF' id='id_rub_ETF' size='30' value="{POS_VAL_RUB_ETF}"  onBlur="javascript:maximum(this,'119')"> 
						</div>
					</div>
				</div>
				<div class="fields-row" >
					<div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12" >
						<div class="input-group d-inline-block">
							<label for='id_rub_HIS' class="input-group-addon">Historique </label>
							<textarea style="resize:none; height:250px;"  class='form-control' data_verrou='true' readonly="readonly" wrap='SOFT' name='POS_VAL_RUB_HIS' rows='1' cols='90' id='id_rub_HIS'>{POS_VAL_RUB_HIS}</textarea>
						</div>
					</div>
				</div>
			</fieldset>
		</div>
	</div>
</div>
<!--fin tab 4 : onglet historiques-->
				
			</div>
		</div> 
		
		
				
	</div><!--fin de la zone du contenu des onglets-->
</div>
</form>
	
	
	<!-- JQUERY UI -->
		<script language='javascript' src="../../../../include/libraries/jquery-ui/js/jquery-ui-1.10.3.custom.js"></script>
		<script language='javascript' src="../../../../include/libraries/jquery-ui/jquery-ui-initialization.js"></script>
	<!-- END JQUERY UI -->
	
	<script src="/include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	
</body>
</html>
