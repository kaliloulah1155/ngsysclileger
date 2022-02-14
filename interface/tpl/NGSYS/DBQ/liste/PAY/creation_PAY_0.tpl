<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche de paye</title>
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
	<style>
		.jumbotron{
			font-size: 15px;
			width: 30%;
			border: 1px solid #4a67b3;
			padding: 10px;
		}

		#petSelect{
			width: 100px;
			padding: 5px;
			margin-bottom: 10px;
			border: none;
			border-radius: 3px;
		}

		#petInput{
			width: 100px;
			padding: 4px;
			margin: 0 0 0 10px;
			border: none;
			border-radius: 3px;
		}
		
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_pay' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='ABS'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

					  <!-- nom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_NOM'  value="{USER_PRS_NOM}" id='input_nom' >
				<!--prénom de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_PRE'  value="{USER_PRS_PRE}" id='input_pre'>
				<!--fonction de l'utilisateur-->
				<input  class="form-control" type="hidden" name='POS_VAL_RUB_FON'  value="{USER_PRS_FON}" id='input_fon' >
				<!--departement de l'utilisateur-->
				<input class="form-control" type="hidden" name='POS_VAL_RUB_DPT' size='15' value="{USER_PRS_DPT}" >
        </div>
		<!-- <div class="col_list text-center jumbotron px-3"> -->
			<!-- <i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i> -->
            <!-- <a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_ABS_MyDMD&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');"> -->
				<!-- <span style="color:#4a67b3;">Cliquez pour consulter la liste</span> -->
            <!-- </a> -->
		<!-- </div> -->
		
		<nav class="container-fluid">
			<div class="row">
				<div class="col-sm-4">
					<label></label>
				</div>
				<div class="col-sm-6 jumbotron text-center">
					<span>Salaire du mois de <strong>mars 2018</strong></span>
				</div>
			</div>
			<div class="row" id="zoneRechs" style="margin-bottom: 1%">
				<div class="col-sm-3">
					<label></label>
				</div>
				<div class="col-sm-2 zoneMois">
					<select name="pets" id="petSelect">
					    <option value="0">Mois</option>
					    <option value="1">Janvier</option>
					    <option value="2">Fevrier</option>
					    <option value="3">Mars</option>
					    <option value="4">Avril</option>
					    <option value="5">Mais</option>
					    <option value="6">Juin</option>
					    <option value="7">Juillet</option>
					    <option value="8">Ao&#251;t</option>
					    <option value="9">Septembre</option>
					    <option value="10">Octobre</option>
					    <option value="11">Novembre</option>
					    <option value="12">D&#233;cembre</option>
					</select>
				</div>
				<div class="col-sm-2">
					<input type="type" placeholder="Ann&#233;e" size="25" id="petInput">
				</div>
				<div class="col-sm-1" style="width: 10%;">
					<a href="#" class="btn"  style="width:100%;color: #fff;background:#4a67b3;padding: 3px;">
						<i class="fa fa-search"></i>
					</a>
				</div>
			</div>
			<table class="table table-bordered table-hover">
				<thead>
				  <tr class="table table-striped" style="background: rgb(230, 230, 245);border-top: 0.2rem solid">
					<th>Matricule</th>
					<th>Code</th>
					<th>Nom & Pr&#233;nom</th>
					<th>Service</th>
					<th>Salaire net</th>
					<th>Assurance</th>
					<th>Pr&#234;t</th>
					<th>Avance</th>
					<th>Autres</th>
					<th>T. de reduction</th>
					<th>S. net paye</th>
					<th>Rib</th>
					<th>Banque</th>
				  </tr>
				</thead>
				<tbody>
				  <tr class="table text-center">
					<td>2021Ngsys</td>
					<td>1</td>
					<td>Ngser ngsys</td>
					<td>Commercial</td>
					<td>000000</td>
					<td>000000</td>
					<td>000000</td>
					<td>000000</td>
					<td>000000</td>
					<td>000000</td>
					<td>000000</td>
					<td>000000</td>
					<td>000000</td>
					<td style="background: rgb(221, 218, 220);">
						<a href="#" class="btn_1" style="">
							<img src="/{NOM_APPLICATION}/images/icons/lr_consulter_ligne.png">
						</a>
					</td>
				  </tr>
				  <tr class="table text-center" style="border-bottom: 0.2rem solid;background: rgb(230, 230, 245)">
					<td>##</td>
					<td>##</td>
					<td>TOTAL</td>
					<td>#</td>
					<td>0</td>
					<td>0</td>
					<td>#</td>
					<td>#</td>
					<td>#</td>
					<td>0</td>
					<td>0</td>
					<td>#</td>
					<td>#</td>
				  </tr>
				</tbody>
			 </table>

			<!-- button -->
			<div class="row col_btn" style="display: none;">
				<!-- <div type="submit" class="btn col-sm-2" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%">FERMER</div> -->
				<input type="resset" class="btn col-sm-2" value="FERMER" onclick="{CODE_ACTION_FERMER}" style="font-size: 12px;margin-left: 36%;background:transparent">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;background:transparent" />
			</div>  
		</nav>
			
	</form>
</body>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	<!-- END JQUERY  -->
	 <script>
		 
	</script>
	
</html>