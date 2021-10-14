<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Consultation de bulletin de paie</title>
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
	<!-- END JQUERY UI -->
	
	<style>
			
		.col_list{
			height: 7vh;
			margin: 0 70%;
			padding: 1%;
			font-family: 'Times New Roman';
			font-size: 14px;
			background-color: transparent;
			font-weight: lighter; 
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
		
		.col12_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 17px;
		}
		
		.col2_partie{
			width:100%; 
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 13px;
			padding-top: 5px;
		}	
			
		.btn{
			width: 12%;
			border: 1px solid #4a67b3;
			text-align: center;
			background: transparent;
			color: #4a67b3;
			margin: 2.5%;
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
		
	</style>
</head>
<body  class='tpl_consultation tpl_consultation_bup' onLoad='initTplConsultation();{GRISE_CHAMP};' onBeforeUnLoad="{CODE_ACTION_UNLOAD}" style="background-color: transparent;font-family: 'Times New Roman';">
  <!-- <form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'> -->

	<form name='principal' ACTION='{URL_ATTENTE}' method='POST'>
		<input type='hidden' name='URL' value='{CODE_ACTION}'>
		<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
		<input type='hidden' name='POS_TYPEDOC' value='BUP'/>
		<input type='hidden' name='MODE' value='{MODE}'>
		<input type='hidden' name='NB_ONGLETS' value='4'>
		<!-- BEGIN BLOC_OLD_VALUE -->
		<input type='hidden' name='{NAME_OLD_RUB}' value="{VALUE_OLD_RUB}">
		<!-- END BLOC_OLD_VALUE -->
		
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
						<li class="active b1" ><a role="button" class="btn btn-outline-primary" data-toggle="tab" href="#tabs-1" style="width: 100%;padding-top: -11px;">Demande</a></li>
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
							<div class="row" style="margin-top: 7%">
										<!-- 12_ 1 infos -->
								<div class="col-sm-12 mt-5" style="margin-top: -5.6%;">
									<div class="col1_partie text-center">
										<span class="title text-while">DESCRIPTION</span>
									</div>
									<div class="col12_partie" style="padding-top: 3%;">
										<!-- civilite & matricule -->
										<div class="form-group row">
											<div class="col-sm-4" style="">
												<label for="bio">Civilit&eacute;</label>
												<select id="selection" class="form-control" rows="1" style="width: 100%;">
													<option value="0">Civilit&eacute;</option>
													<option value="1">Monsieur</option>
													<option value="2">Madame</option>
													<option value="3">Mademoiselle</option>
												</select>
											</div>
											<div class="col-sm-4">
												<label for="bio">Matricule</label>
												<input type="text" placeholder="Matricule" class="form-control" style="width: 100%;">
											</div>
										</div>
										<!-- nom & prenom -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Nom</label>
												<input class="form-control" id="bio" placeholder="Nom" style="width: 100%;">
											</div>
											<div class="col-sm-5" style="margin: -0.5% 0%">
												<label for="bio">Pr&eacute;nom</label>
												<input class="form-control" id="bio" placeholder="Pr&eacute;nom" style="width: 100%;">
											</div>
										</div>
										<!-- Fonction & Catégorie & d&partement -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Fonction</label>
												<input type="text" class="form-control" placeholder="Fonction" style="width: 100%;">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Cat&#233;gorie</label>
												<input type="text" placeholder="Cat&#233;gorie" class="form-control" style="width: 100%;">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">D&#233;partement</label>
												<input type="text" placeholder="D&#233;partement" class="form-control" style="width: 100%;">
											</div>
										</div>
										<!-- Nationalité & Ancienneté & mois -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Nationalit&eacute;</label>
												<input type="text" placeholder="Nationalit&eacute;" class="form-control" style="width: 100%;">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">nature de pi&egrave;ce</label>
												<input type="text" placeholder="nature de pi&egrave;ce" class="form-control" style="width: 100%;">
											</div>
											<div class="col-sm-4" style="Mois">
												<label for="bio">nature de pi&egrave;ce</label>
												<input type="text" placeholder="Mois" class="form-control" style="width: 100%;"> 
											</div>
										</div>
										<!-- Date d'embauche & N° de sécurité social & modalité de paiement -->
										<div class="form-group row">
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Date d'embauche</label>
												<input type="date" class="form-control" style="width: 100%;">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">N&#186; de s&#233;curit&#233; sociale</label>
												<input type="text" placeholder="N&#186; de s&#233;curit&#233; sociale" class="form-control" style="width: 100%;">
											</div>
											<div class="col-sm-4" style="margin: -0.5% 0%">
												<label for="bio">Modalit&#233; de paiement</label>
												<input type="text" placeholder="Modalit&#233; de paiement" class="form-control" style="width: 100%;">
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row" style="margin-top: 5%">
								<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5">
									<div class="col1_partie text-center">
										<span class="title text-while">INFORMATIONS NGSER</span>
									</div>
									<div class="col2_partie" style="padding-top: 7%;">
										<!-- Type de contrat & durée contrat -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Type de contrat</label>
											  <select id="selection" class="form-control" rows="1">
													<option value="0">Type de contrat</option>
													<option value="1">Contrat stage</option>
													<option value="2">Contrat CDD</option>
													<option value="3">Contrat CDI</option>
												</select>
											</div>
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Dur&eacute;e de contrat</label>
												<input type="text" placeholder="Dur&eacute;e de contrat" class="form-control">
											</div>
										</div>
										<!-- departement & service -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">D&#233;partement</label>
												<input type="text" placeholder="D&#233;partement" class="form-control">
											</div>
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Service</label>
												<input type="text" placeholder="Service" class="form-control">
											</div>
										</div>
										<!-- manager -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Manager</label>
												<input type="text" placeholder="Manager" class="form-control">
											</div>
										</div>
										<!-- Poste & matricule -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Poste</label>
												<input type="text" placeholder="Poste" class="form-control">
											</div>
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Matricule</label>
												<input type="text" placeholder="Matricule" class="form-control">
											</div>
										</div>
										<!-- Cartegorie & Avantage -->
										<div class="form-group row">
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Cart&eacute;gorie</label>
												<input type="text" placeholder="Cart&eacute;gorie" class="form-control">
											</div>
											<div class="col-sm-6" style="margin: -0.5% 0%">
												<label for="bio">Avantage</label>
												<input type="text" placeholder="Avantage" class="form-control">
											</div>
										</div>
									</div>
								</div>
										<!-- 12_ 2 infos -->
								<div class="col-sm-6 mt-5">
									<div class="col1_partie text-center">
										<span class="title text-while">INFORMATIONS BANQUE</span>
									</div>
									<div class="col2_partie" style="padding-top: 60px; padding-bottom: 55px">
										<!-- Salaire Net -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%">
												<label for="bio">Salaire Net</label>
												<input type="text" placeholder="Salaire Net" class="form-control" style="width: 100%;">
											</div>
										</div>
										<!-- Banque -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%">
												<label for="bio">Banque</label>
												<input type="text" placeholder="Banque" class="form-control" style="width: 100%;">
											</div>
										</div>
										<!-- RIB -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%">
												<label for="bio">RIB</label>
												<input type="text" placeholder="RIB" class="form-control" style="width: 100%;">
											</div>
										</div>
										<!-- N° CNPS -->
										<div class="form-group row">
											<div class="col-sm-10" style="margin: -0.5% 7%" style="width: 100%;">
												<label for="bio">N&ordm; CNPS</label>
												<input type="text" placeholder="N&ordm; CNPS" class="form-control" style="width: 100%;">
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
						<div class="col2_partie text-center" style="padding-top: 5%. padding-bottom: 0;">
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
									<input type="text" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Etat Fiche -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Etat Fiche</label>
									<input type="text" placeholder="N&#176; poseidon" class="form-control" style="width: 100%">
								</div>
								<!-- Historique -->
								<div class="form-group" style="margin: 1%">
									<label for="bio">Historique</label>
									<textarea  class="form-control" id="bio" rows="5" style="width: 100%;resize: none;"></textarea>
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
								  <textarea  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%"></textarea>
								</div>
								<!-- Modification -->
								<div class="form-group">
								   <label for="bio">Modification :</label>
									<textarea  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%"></textarea>
								</div>
								<!-- Suppression -->
								<div class="form-group">
								   <label for="bio">Suppression :</label>
									<textarea  class="form-control" id="bio" rows="2" style="width: 90%;resize: none;margin-top: -1%"></textarea>
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
	<!-- endjquery  -->
	
	 <script>
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
		 
		 
		 
		    //exclusion des weekends
  function getSundayCountBetweenDates(startDate, endDate){
   var totalweeks = 0;
   for (var i = startDate; i <= endDate; i.setDate(i.getDate()+1)){
       if (i.getDay() == 0 || i.getDay() == 6) totalweeks++;
   }
   return totalweeks;
}
//fin exclusion des weekends

function timeConverter(UNIX_timestamp){
	  var a = new Date(UNIX_timestamp * 1000);
	  var months = ['Janvier','Fevrier','Mars','Avril','Mai','Juin','Juillet','Aout','Septembre','Octobre','Novembre','Décembre'];
	  var year = a.getFullYear();
	  var month = months[a.getMonth()];
	  var date = a.getDate();     
	  var hour = a.getHours();
	  var min = a.getMinutes();
	  var sec = a.getSeconds();
	  var weekday = ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'];
	  var dayGetName=weekday[a.getDay()];
	  hour1 = hour > 9 ? hour : '0' + hour;
	  min1 = min > 9 ? min : '0' + min;
	  sec1 = sec > 9 ? sec : '0' + sec;
	  var time = dayGetName + ' ' +date + ' ' + month + ' ' + year + ' \u00E0 ' + hour1 + ':' + min1 + ':' + sec1 ;
	  return time;    
	}

    var timestpdeb=0;
    var dureeheure=0;
    var dureesec=0;
    var tamp1=0;
    var tamp2=0;
    var tamp3=0;
    
    
  $('.datedeb, .timedeb').on('blur change input',function(){
  
        var date1=$('.datedeb').val();
        var time1=$('.timedeb').val();
        timestpdeb=new Date(date1+' '+time1);
        
        tamp1=timestpdeb.getTime()/1000;
        
        //convert date time into  timestamp
        // $('.res0').text("Adding hours : "+date1 +"<br/>") ;
		 $('.datedeblettre').val(timeConverter(tamp1)) ;
         
  });
	
   $('.dureedebselect').on('change blur',function(){
	   $('.dureedeb').val( $(this).val());
	});

  $('.dureedebselect,.duree , .datedeb, .timedeb').on('change blur',function(){
        
          dureeheure=$('.dureedeb').val() ;
          dureesec=$('.duree').val();
        
        var caldureesec= (dureesec*1)*24*60*60;
        
        
        var caldureeheure=(dureeheure*1)*60*60 ;
        
        
        var sommesec=(caldureesec*1)+(caldureeheure*1)
        
        var Tsommesec=new Date(sommesec);
        
        tamp2=Tsommesec.getTime();
	  
         
        
        
        
       console.log('tamp2 '+ dureeheure );
        
        
        //Calcul le nombre de weekend
			 var formattedDateStart = new Date( $('.datedeb').val()); //date de debut
			 var d = formattedDateStart.getDate();
			 var m =  formattedDateStart.getMonth();
			 m += 1;  // JavaScript months are 0-11
			 var y = formattedDateStart.getFullYear();
            var formatStart=m + "/" + d + "/" + y;
            
                  
			
			 var formattedDateEnd = new Date((tamp1+tamp2)* 1000); //date de fin
			 var d = formattedDateEnd.getDate();
			 var m =  formattedDateEnd.getMonth();
			 m += 1;  // JavaScript months are 0-11
			 var y = formattedDateEnd.getFullYear();
            var formatEnd=m + "/" + d + "/" + y;

		 var startFrom = formatStart;
		 var startDate = new Date(startFrom);
		 var endDate = new Date(formatEnd);
		  var weeksCnt = getSundayCountBetweenDates(startDate, endDate);
      
      
       var TweeksCntsec=new Date(weeksCnt*48*60*60);
        
        tamp3=TweeksCntsec.getTime();
     
      
		 
		 //Fin Calcul le nombre de weekend
        
         
        //date de retour final
        //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
		$('.res6').val(timeConverter(tamp1+tamp2) ) ;
	  
	  //console.log(tamp1+'- '+tamp2+' - '+tamp3 );
        
        
   });
		
		 $('.dureedebselect').on('change blur',function(){
				 //$('.res6').val(timeConverter(tamp1+tamp2+tamp3) ) ;
				 $('.res6').val(timeConverter(tamp1+tamp2) ) ;
	          }); 
	</script>
	
</html>


