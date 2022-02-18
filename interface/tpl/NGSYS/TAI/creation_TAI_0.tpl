<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Salaire mensuel</title>
	<link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET' />
	<link rel="stylesheet" type="text/css" href="../../../../include/data_tableau/styles/jquery.dataTables.min.css">

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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script language='javascript' src='/NGSYS/include/script/action_accueil.js'></script>

	
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
		
		input.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			color: #4a67b3;
			margin: 2.5%;
			background:transparent
		}

		.ui-datepicker-calendar {
	        display: none;
	    }

	    .table_2{

	    }

		label{
			font-size: 15px;
			font-weight: 100;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_tai' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='TAI'>
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

			 
        </div>  
		<div class="col_list">
			<div class="col_list_01 pull-right">
				<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
				<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_TAI_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
					<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
				</a>
			</div>
		</div>

		<nav class="container-fluid">
			
			<div class="card mb-1" >
		        <div class="card-header">
		            <div class="row">
						<div class="col-sm-4">
							<label></label>
						</div>
						<div class="col-sm-6 jumbotron text-center">
							<span>Salaire du mois de <br> <strong class="lib_mois">mars 2018</strong></span>
						</div>
					</div>
		        </div>

		        <div class="card-body">
		        	<div class="row" style="margin-bottom: 3%">

		        		<div class="col-sm-2" style="margin-top: 13px;"> </div>

		        	<div class="col-sm-3" style="margin-top: 13px;">
							<label>Type de contrat :</label>
							<select class="form-control select contrat" name='POS_VAL_RUB_C2' style="width: 100%;">
								<option value="">Veuillez s&#233;lectionner</option>
								<option value="Stage-ecole">Stage-&#233;cole</option>
								<option value="Stage professionnel">Stage professionnel</option>
								<option value="CDD avec essai">CDD avec essai</option>
								<option value="CDD lie au projet">CDD li&#233; au projet</option>
								<option value="CDD standard">CDD standard</option>
								<option value="CDI avec essai">CDI avec essai</option>
								<option value="CDI standard">CDI standard</option>
								<option value="Consultant interne">Consultant interne</option>
								<option value="Consultant externe">Consultant externe</option>
							</select>
						<input type="hidden"  class="interselectcontrat" name='POS_VAL_CTRL_C2' id='POS_VAL_CTRL_C2' value='{POS_VAL_RUB_C2}' required="true">

						</div>

						<div class="col-sm-1" style="margin-top: 13px;"> </div>

						<div class="col-sm-3" style="margin-top: 13px;">
							<label for="bio">Mois & Ann&#233;e :</label>
							<input type="text" name='POS_VAL_RUB_A1' placeholder="MM/AAAA" class="form-control datefin1" style="width: 100%;" required="true">

								<input type="hidden"  name='POS_VAL_RUB_DAE' class="date_edit" />
							
						</div>

						<!-- <div class="col-sm-1" style="margin-top: 13px;"> </div> -->

						<div class="col-sm-1" style="margin-top: 17px;">
							<label for="bio" style="visibility: hidden;">Recherche</label>
							<button class="btn bg-primary reg_btn" title="Faire des recherches sur le champ date"><i class="fa fa-search"></i></button>
						</div>
					</div>
		        </div>
		    </div>



			<!-- table -->
			<div class="row">

				<!-- SALARIE -->
				<div class="col-sm-12" id="salarie" style="display:none">
			        <div class="Salaire">
			        	<table id="min-data" class="table table_1">

				        	<thead class="table-sm text-white" style="background: #4a67b3;">
								 <tr>
					                <th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">MATRICULE</th>
									<th>ENTREPRISE</th>
									<th>NOM & PR&#201;NOMS</th>
									<th>SALARIE NET</th>
									<th>ASSURANCE</th>
									<th>SALARIE NET PAY&#201;</th>
									<th>RIB</th>
					                <th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">BANQUE</th>
					            </tr>
					        </thead>
					        <tbody class="tr_salarie">
					            
					        </tbody>
					    </table>
			        </div>
			    </div>

			    <!-- CONSULTANT -->
			    <div class="col-sm-12" id="consultant" style="display:none">
			        <!--  -->
			        <div class="consultant">
			        	<table id="min-data2" class="table_2">
				        	<thead class="table-sm text-white" style="background: #4a67b3;">
					            <tr>
					                <th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">MATRICULE</th>
									<th>ENTREPRISE</th>
									<th>NOM & PR&#201;NOMS</th>
									<th>HONORAIRE NET</th>
									<th>ASSURANCE</th>
									<th>HONORAIRE NET PAY&#201;</th>
									<th>RIB</th>
					                <th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">BANQUE</th>
					            </tr>
					        </thead>
					        <tbody  class="tr_consultant">
					            
					        </tbody>
					    </table>
			        </div>
			    </div>

			    <!-- STAGIAIRE -->
			    <div class="col-sm-12" id="stagiaire" style="display:none">
			        <!--  -->
			        <div class="consultant">
			        	<table id="min-data3" class="table_3">
				        	<thead class="table-sm text-white" style="background: #4a67b3;">
					           <tr>
					                <th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">MATRICULE</th>
									<th>ENTREPRISE</th>
									<th>NOM & PR&#201;NOMS</th>
									<th>SALARIE NET</th>
									<th>ASSURANCE</th>
									<th>SALARIE NET PAY&#201;</th>
									<th>RIB</th>
					                <th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">BANQUE</th>
					            </tr>
					        </thead>
					        <tbody  class="tr_stagiaire">
					           
					        </tbody>
					    </table>
			        </div>
			    </div>

			</div>
			

			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2" type="submit" id="btnEnretgiste" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
			</div>  
		</nav>
			
	</form>
</body>
	<!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
		<script type='text/javascript' src='../../../../include/data_tableau/scripts/jquery.dataTables.min.js'></script>
    	<script type='text/javascript' src='../../../../include/script/data_tables/datatable_language.js'></script>
	<!-- END JQUERY  -->
	 <script>

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

	 	//script du bouton fermer
		$('.btn_ferme').on('click',function(){
			 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
						{CODE_ACTION_FERMER}
			}
		});


	 	//initialisation du calendrier datepicker
			//initialisation du calendrier datepicker
			$.datepicker.regional['fr'] = {
			
				},
				
			$('.datefin1').datepicker({
				changeMonth: true,
				changeYear: true,
			 	showButtonPanel: true,
				monthNames: ['Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Ao\u00fbt', 'Septembre', 'Octobre', 'Novembre', 'D\u00e9cembre'],
				monthNamesShort: ['Janv.', 'F&#233;vr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'D&#233;c.'],
				dateFormat: 'MM yy',
				closeText: "OK",
				currentText: "Aujourd'hui",
				onClose: function(dateText, inst) { 
					var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
					var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();

					//console.log(` in : mois : ${mois} , year : ${year}`);
					$(this).datepicker('setDate', new Date(year, month, 1));
				},
				onSelect: function() {
				 
					var tab_date= ($(this).val()).split(' ');
				  	var mois= tab_date[0];  // mois
				  	var year= tab_date[1]; // année 
					var map_date = new Map();
					map_date.set('Janvier', '01'); 
					map_date.set('Fevrier', '02');
					map_date.set('Mars', '03'); 
					map_date.set('Avril', '04');
					map_date.set('Mai', '05');
					map_date.set('Juin', '06'); 
					map_date.set('Juillet', '07'); 
					map_date.set('Ao\u00fbt', '08'); 
					map_date.set('Septembre', '09');
					map_date.set('Octobre', '10'); 
					map_date.set('Novembre', '11');
					map_date.set('D\u00e9cembre', '12'); 
					
					//var dt_edit=`01/${map_date.get(mois)}/${year}`;
					//console.log(`01/${map_date.get(mois)}/${year}`);
					
				}
			});
			$.datepicker.setDefaults($.datepicker.regional['fr']);
	    // Fin calendrier
     

        // Affichage de tableau selon le type choisit !!!!!!!!!!!!!
        $('#salarie,#consultant,#stagiaire').hide();
        $('#btnEnretgiste').prop("disabled",true);

       
        // Le bouton de formatage de d'impresion
        	$('.btn_format').prop("disabled",true);
        	$("select.format").change(function(){
		   		var frms = $(this).children("option:selected").val();

		 		if (frms == "Xls") {$('.btn_format').prop("disabled",false);}
		 		if (frms == "Xlsx") {$('.btn_format').prop("disabled",false);}
		 		if (frms == "Csv") {$('.btn_format').prop("disabled",false);}
		 	});
	</script>
	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TAI/traitement/register.js"></script>
	
</html>
