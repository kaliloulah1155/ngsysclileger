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
		<style>
			body{
				background-color:#e1e1e1;
			}
			
			#main_div{
				z-index:0;
				background-color:#e1e1e1; 
				margin-top:-30px;
			}
			.legend-fieldset{
				background-color:#3186B1;
				width:95%;
				height:30px;
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
				background-image: linear-gradient(180deg, #3186B1, #3186B1);
				padding:opx;
				margin:0px;
				height:100px;
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
			
			#input-icon{
				margin:1%;
				float:right;
				z-index:1;
			}
			
			.b1 {
				border:1px solid ;
			}
		</style>
</HEAD>

<body class='tpl_creation tpl_creation_ach' onLoad='initTplCreation();'>
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
		<input type='hidden' name='NB_ONGLETS' value='1'>

		<div id="actions-container" class="titre-boutons">
			<div class="t3-module module intro-title titre-entete" id="Mod123">
				<h3  class="module-title text-center " style="text-transform: unset; padding-top:20px;; color:white; "><span class="title-head" >{TITRE_ENTETE_PAGE}</span></h3>
				<div style="z-index:0;">
					{TITRE_BOUTONS}
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
					</ul>
				</div>
			</div>
			
				
			<div class="tab-content " style="margin-top:-20px; ">
				<div class="tab-pane fade active in "  id="tabs-1" style="margin-top:0.5%; margin-left:-2%;"><!--debut tab 1 : onglet Général-->
					<div class='col-lg-3 col-md-3 col-sm-12 col-xs-12'></div>
					<div class="  col-lg-6 col-md-6 col-sm-12 col-xs-12">
						<div class="ts-service-info" >
							<fieldset class="side-by-side panel panel-primary">
								<legend class="legend-fieldset center-block" style="">
									<h5> Informations</h5>	
								</legend>
								
								 
								<div class="fields-row" >
									<div class="  col-lg-10 col-md-10 col-sm-12 col-xs-12" >
											<div style="margin:1%; float:right;" class="d-inline-block">
												<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'LIB', 'POS_VAL_RUB_LIB')"><div class='iconvocmonolie' id='img_voc_LIB' title='Libellé'></div></a>
											</div>
											<div class="input-group d-inline-block">
												<label class="input-group-addon" for="id_rub_LIB" ><img  src='../../../../images/icons/vert.png' title='Autocomplétion'> Libellé </label>
												<input class="form-control"  name='POS_VAL_RUB_LIB' id='id_rub_LIB' size='20' value="{POS_VAL_RUB_LIB}"  onBlur="javascript:maximum(this,'119')"
												onKeyDown='return autoCompleteKeyDown(event);' onkeyup="return searchSuggestMin(event, this, VOCAB_USED, 0, '');" autocomplete="off" onClick="return closeSearch();">
											</div>
									</div>
								</div>
								<div class="fields-row" >
									<div class="  col-lg-7 col-md-7 col-sm-12 col-xs-12" >
										<div class="input-group d-inline-block">
											<label class="input-group-addon" for="id_rub_DCR" ><img  src='../../../../images/icons/vert.png' title='Autocomplétion'> Date de création </label>
											<input class="form-control datepicker"  name='POS_VAL_RUB_DCR' id='id_rub_DCR' size='20' value="{POS_VAL_RUB_DCR}"  >
										</div>
									</div>
								</div>
								<div class="fields-row" >
									<div class="  col-lg-10 col-md-10 col-sm-12 col-xs-12" >
										<div style="margin:1%; float:right;" class="d-inline-block">
											<a href="javascript:charger_vocabulaire(document.principal.POS_TYPEDOC.value, 'CRE', 'POS_VAL_RUB_CRE')"><div class='iconvocmonolie' id='img_voc_CRE' title='Créateur'></div></a>
										</div>
										<div class="input-group d-inline-block">
											<label class="input-group-addon" for="id_rub_CRE" ><img  src='../../../../images/icons/vert.png' title='Autocomplétion'> Créateur</label>
											<input class="form-control"  name='POS_VAL_RUB_CRE' id='id_rub_CRE' size='20' value="{POS_VAL_RUB_CRE}"  onBlur="javascript:maximum(this,'119')"
											onKeyDown='return autoCompleteKeyDown(event);' onkeyup="return searchSuggestMin(event, this, VOCAB_USED, 0, '');" autocomplete="off" onClick="return closeSearch();">
										</div>
									</div>
								</div>
                                <div class="fields-row" >
									<div class="  col-lg-7 col-md-7 col-sm-12 col-xs-12" >
										<div class="input-group d-inline-block">
											<label class="input-group-addon" for="id_rub_DAE" ><img  src='../../../../images/icons/vert.png' title='Autocomplétion'> Date Edition Listing </label>
											<input class="form-control datepicker"  name='POS_VAL_RUB_DAE' id='id_rub_DAE' size='20' value="{POS_VAL_RUB_DAE}"  >
										</div>
									</div>
								</div>
							</fieldset>
						</div>
					 
						<div class="ts-service-info" >
							<fieldset class="side-by-side panel panel-primary">
								<legend class="legend-fieldset center-block" style="">
									<h5> Suivi Logiciel</h5>	
								</legend>
								
								<div class="fields-row" >
									<div class="  col-lg-10 col-md-10 col-sm-12 col-xs-12" >
											<div class="input-group d-inline-block">
												<label class="input-group-addon" for="id_rub_NUD" > N° Poseidon </label>
												<input class="form-control"  name='POS_VAL_RUB_NUD' id='id_rub_NUD' size='20' value="{POS_VAL_RUB_NUD}"  onBlur="javascript:maximum(this,'119')"
												onKeyDown='return autoCompleteKeyDown(event);' onkeyup="return searchSuggestMin(event, this, VOCAB_USED, 0, '');" autocomplete="off" onClick="return closeSearch();">
											</div>
									</div>
								</div>
								<div class="fields-row" >
									<div class="  col-lg-10 col-md-10 col-sm-12 col-xs-12" >
											<div class="input-group d-inline-block">
												<label class="input-group-addon" for="id_rub_ETF" > Etat Fiche </label>
												<input class="form-control"  name='POS_VAL_RUB_ETF' id='id_rub_ETF' size='20' value="{POS_VAL_RUB_ETF}"  onBlur="javascript:maximum(this,'119')"
												onKeyDown='return autoCompleteKeyDown(event);' onkeyup="return searchSuggestMin(event, this, VOCAB_USED, 0, '');" autocomplete="off" onClick="return closeSearch();">
											</div>
									</div>
								</div>
								 
                                 <div class="fields-row" >
                                    <div class="  col-lg-12 col-md-12 col-sm-12 col-xs-12" >
                                        <div class="input-group d-inline-block">
                                            <label for='id_rub_OBJ' class="input-group-addon">Historique des actions </label>
                                            <textarea style="resize:none; height:100px;"  class='form-control' wrap='SOFT' name='POS_VAL_RUB_HIS' rows='1' id='id_rub_HIS'>{POS_VAL_RUB_HIS}</textarea>
                                        </div>
                                    </div>
                                </div>
                                 
							</fieldset>
						</div>
					</div>
                    
                    
				</div>										
			</div>
		</div> <!--fin tab 1 : onglet Général-->
				
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
