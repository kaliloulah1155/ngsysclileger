<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Corbeille des taches</title>
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
	<link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET'/>

	<link href="/{NOM_APPLICATION}/include/style/tableau_de_bord/mdb.css" rel="stylesheet">
	<link href="/{NOM_APPLICATION}/include/style/tableau_de_bord/owl.css" rel="stylesheet">
	<link href="/{NOM_APPLICATION}/include/style/tableau_de_bord/style.css" rel="stylesheet">

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

</head>

<style type="text/css">


	#hero{
		position: absolute;
		margin: 0;
		padding: 0;
	   top: 17%;
	   left: 0;
	   width: 100%;
	   height: 100vh;
	   list-style: none;
	   background: transparent;
	   z-index: 900;
	   display: flex;
	   flex-direction: column;
	   justify-content: center;
	   opacity: 1;
	   transform: scale(1);
	   transition: all 650ms;
	}

	.nav-list.open{
	   opacity: 1;
	   transform: scale(1);
	}


	#container_bd{
		width: 100%;
		height: 80vh;
		border: 1px solid;
		margin: 50px auto;
	}

	.owl-item > div:after {
		font-family: sans-serif;
		font-size: 24px;
		font-weight: bold;
	}

	.active.center {
		transform: scale(1);
		-webkit-filter: grayscale(0); 
		filter: grayscale(0);
	}

	.faqheadertext{
		position: relative;
		top: 40%;
		color: white !important;
		font-size: 15px !important;
		text-align: center;
		margin-top: 0px !important;
	}

	.faqheadertextActive{
		background: #8c97d1 !important;
	}

	.owl-prev, .owl-next{
		position: relative;
		width: 40px;
		top: -60px;
		font-size: 30px;
		text-align: center;
		color: #fff !important;
	}

	.owl-prev:hover, .owl-next:hover{
		background: #8c97d1 !important;
	}

	.owl-left{
		margin-right: 10px
	}

	.accordion-body{
		background: rgb(255 255 255 / 90%);
		font-family: 'Open Sans', sans-serif;
		font-size: 14px
	}

	.accordion-body p{
		font-size: 14px !important;
	}

	.faqItem{
		position: relative;
		margin: auto;
		width: 100%;
		height: 50px; 
		background: #4a67b3;
		border-right: 1px solid  white;
		border-radius: 5px;
		z-index: 999;
	}

</style>


<script type="text/javascript">
    $(document).ready(function(){
     
        $('#userprofile').click(function(){
           $('.profile').toggleClass('drop-down--active');
        });
         
        $('#piecefournir').click(function(){
           $('.ddfaq').removeClass('drop-down--active');
           $('.ddpf').toggleClass('drop-down--active');
        });
         
        $('#faq').click(function(){
           
           $('.ddpf').removeClass('drop-down--active');
           $('.ddfaq').toggleClass('drop-down--active');
        });
     
    });
</script>

<body class='tpl_creation tpl_creation_tbd' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">

	<form name='principal' id="formlicenc" ACTION='{URL_ATTENTE}' class="cform" method='POST' onSubmit='return validerCreation();' data-parsley-validate>
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
				<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='TBD'>
				<input type='hidden' name='MODE' value='{MODE}'>
				<input type='hidden' name='NB_ONGLETS' value='2'>
				
				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<input type='hidden' class='appName' value="{NOM_APPLICATION}">	 

				<input type="hidden" class="profils" value="{PROFIL_UTILISATEUR}">
        </div>


        <section id="hero" class="d-flex flex-column justify-content-center faq" style="">
	         <div class="container aos-init aos-animate" data-aos="zoom-in" data-aos-delay="100">
	            
	            <div class="row">
	               <div class="col-lg-12" style="border-radius: 5px;margin-top: -5%;">
	                  <div class="owl-carousel owl-loaded owl-drag" style="position: fixed; top: -15%;">
	                     <div class="owl-stage-outer">
	                        
	                        <div class="owl-stage" style="transition: all 0s ease 0s; width: 2677px; transform: translate3d(-486px, 0px, 0px);">
	                           <div class="owl-item cloned" style="width: 243.333px;">
	                              <div class="faqItem ">
	                                 <p class="faqheadertext">ADMINISTRATION</p>
	                              </div>
	                           </div>

	                           <div class="owl-item cloned" style="width: 243.333px;">
	                              <div class="faqItem">
	                                 <p class="faqheadertext">FINANCE ET COMPTABILITE</p>
	                              </div>
	                           </div>

	                           <div class="owl-item active center" style="width: 243.333px;">
	                              <div class="faqItem">
	                                 <p class="faqheadertext">MARKETING</p>
	                              </div>
	                           </div>

	                           <div class="owl-item active" style="width: 243.333px;">
	                              <div class="faqItem">
	                                 <p class="faqheadertext">COMMERCIAL</p>
	                              </div>
	                           </div>

	                           <div class="owl-item" style="width: 243.333px;">
	                              <div class="faqItem">
	                                 <p class="faqheadertext">GESTION DE PROJETS</p>
	                              </div>
	                           </div>

	                           <div class="owl-item" style="width: 243.333px;">
	                              <div class="faqItem">
	                                 <p class="faqheadertext">TECHNIQUE INFORMATIQUE</p>
	                              </div>
	                           </div>

	                           <div class="owl-item" style="width: 243.333px;">
	                              <div class="faqItem">
	                                 <p class="faqheadertext">TECHNIQUE TELECOM</p>
	                              </div>
	                           </div>

	                           <div class="owl-item cloned" style="width: 243.333px;">
	                              <div class="faqItem faqheadertextActive">
	                                 <p class="faqheadertext">RESSOURCES HUMAINES</p>
	                              </div>
	                           </div>
	                        </div>

	                     </div>

	                     <div class="owl-nav">
	                        <button type="button" role="presentation" class="owl-prev" style="display:none;"></button>
	                        <span aria-label="Previous"></span>
	                        
	                        <button type="button" role="presentation" class="owl-next" style="display:none;"></button>
	                        <span aria-label="Next"></span>  
	                     </div>
	                  </div>
	               </div>
				  
	            </div>

	           <div class="row"> 
			      
	               <div class="col-lg-12" style="height: 50%;border-radius: 5px;position: absolute;top: -10px;">
	                   
				   		 <a href="/{NOM_APPLICATION}/interface/session/principal/question/afficher_question.php" class="btn" style="opacity:1; background: white"title="Afficher la corbeille native" >...</a>
				          <br/> &nbsp;
		               <div class="accordion" id="RessourcesHumaines" >
		                    <div class="accordion-item abs" style="display:none">
		                        <h2 class="accordion-header" id="headingOne" style="background:#d4d9f6">
		                           <button style="font-size: 17px;" class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneRH" aria-expanded="false" aria-controls="collapseOneRH">
		                           . Absence
		                           </button>
		                        </h2>
		                        <div id="collapseOneRH" class="accordion-collapse collapse " aria-labelledby="headingOne" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
			                                <!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li class="att_abs_admin" style="display:none">
											   <a  href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_ABS_nv&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
											        En attente (<span class="attente_abs"></span>)
											   </a>
											</li>  
											 <li class="att_abs_manager" style="display:none">
											   <a  href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=BABS_own_attente&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
											        En attente (<span class="attente_abs_mng"></span>)
											   </a>
											</li>  
											<li class="encours_abs_entete" style="display:none">
											    <!--Pour employe-->
											    <a  href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=BABS_own_encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
											    	 En cours (<span class="encours_abs"></span>)
												 </a>
											</li>  
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item tms" style="display:none">
		                        <h2 class="accordion-header" id="headingTwo" style="background:#eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoRH" aria-expanded="false" aria-controls="collapseTwoRH" style="font-size: 17px;">
		                           .Timesheet
		                           </button>
		                        </h2>
		                        <div id="collapseTwoRH" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
			                                <!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item dfm" style="display:none">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeRH" aria-expanded="false" aria-controls="collapseThreeRH" style="font-size: 17px;">
		                              .Demande de formation
		                           </button>
		                        </h2>
		                        <div id="collapseThreeRH" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item pay" style="display:none">
		                        <h2 class="accordion-header" id="headingFour" style="background:#eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourRH" aria-expanded="true" aria-controls="collapseFourRH" style="font-size: 17px;">
		                              .Fiche de paie
		                           </button>
		                        </h2>
		                        <div id="collapseFourRH" class="accordion-collapse collapse " aria-labelledby="headingOne" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item hsu" style="display:none">
		                        <h2 class="accordion-header" id="headingFive" style="background:#eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveRH" aria-expanded="false" aria-controls="collapseFiveRH" style="font-size: 17px;">
		                              .Heure suppl&#233;mentaire
		                           </button>
		                        </h2>
		                        <div id="collapseFiveRH" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		                    <div class="accordion-item mis" style="display:none">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixRH" aria-expanded="false" aria-controls="collapseSixRH" style="font-size: 17px;">
		                           .Mission
		                           </button>
		                        </h2>
		                        <div id="collapseSixRH" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		                    <div class="accordion-item prt" style="display:none">
		                        <h2 class="accordion-header" id="headingSeven" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSevenRH" aria-expanded="false" aria-controls="collapseSevenRH" style="font-size: 17px;">
		                           .Demande de pr&#234;t
		                           </button>
		                        </h2>
		                        <div id="collapseSevenRH" class="accordion-collapse collapse" aria-labelledby="headingSeven" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		                    <div class="accordion-item cot" style="display:none">
		                        <h2 class="accordion-header" id="headingEight" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseEightRH" aria-expanded="false" aria-controls="collapseEightRH" style="font-size: 17px;">
		                           .Contrat
		                           </button>
		                        </h2>
		                        <div id="collapseEightRH" class="accordion-collapse collapse" aria-labelledby="headingEight" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		                    <div class="accordion-item dbq" style="display:none">
		                        <h2 class="accordion-header" id="headingNine" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseNineRH" aria-expanded="false" aria-controls="collapseNineRH" style="font-size: 17px;">
		                           .Domiciliation bancaire
		                           </button>
		                        </h2>
		                        <div id="collapseNineRH" class="accordion-collapse collapse" aria-labelledby="headingNine" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
											  <li class="att_dbq_admin" style="display:none">
											   <a  href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=BDBQ_RH_attente&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
											        En attente (<span class="attente_dbq"></span>)
											   </a>
											</li>  
											<li class="att_dbq_rh" style="display:none">
											   <a  href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=BDBQ_RH_attente&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
											        En attente (<span class="attente_dbq_rh"></span>)
											   </a>
											</li>  
											<li class="att_dbq_dga" style="display:none">
											   <a  href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=BDBQ_DGA_attente&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
											        En attente (<span class="attente_dbq_dga"></span>)
											   </a>
											</li>
											<li class="att_dbq_dg" style="display:none">
											   <a  href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=BDBQ_DG_attente&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
											        En attente (<span class="attente_dbq_dg"></span>)
											   </a>
											</li>    
			                                <li class="encours_dbq_entete" style="display:none"> 
												<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=BDBQ_own_encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
												   En cours (<span class="encours_dbq"></span>)
											   </a>
											</li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		                    <div class="accordion-item san" style="display:none">
		                        <h2 class="accordion-header" id="headingTen" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTenRH" aria-expanded="false" aria-controls="collapseTenRH" style="font-size: 17px;">
		                           .Sanction
		                           </button>
		                        </h2>
		                        <div id="collapseTenRH" class="accordion-collapse collapse" aria-labelledby="headingTen" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		                    <div class="accordion-item dem" style="display:none">
		                        <h2 class="accordion-header" id="headingEleven" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseElevenRH" aria-expanded="false" aria-controls="collapseElevenRH" style="font-size: 17px;">
		                           .D&#233;mission
		                           </button>
		                        </h2>
		                        <div id="collapseElevenRH" class="accordion-collapse collapse" aria-labelledby="headingEleven" data-mdb-parent="#RessourcesHumaines">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>
		                  	<!-- FIN RH -->

		               <div class="accordion" id="FinanceCompta" style="display: none">
		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingOne" style="background:#d4d9f6">
		                           <button style="font-size: 17px;" class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneFC" aria-expanded="false" aria-controls="collapseOneFC">
		                           1.Comptabilite1
		                           </button>
		                        </h2>
		                        <div id="collapseOneFC" class="accordion-collapse collapse " aria-labelledby="headingOne" data-mdb-parent="#FinanceCompta">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
			                                <!-- <li><a href="#">En attente (0)</a></li> -->
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingTwo" style="background:#eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoFC" aria-expanded="false" aria-controls="collapseTwoFC" style="font-size: 17px;">
		                           2.Comptabilite2
		                           </button>
		                        </h2>
		                        <div id="collapseTwoFC" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#FinanceCompta">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
			                                <li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeFC" aria-expanded="false" aria-controls="collapseThreeFC" style="font-size: 17px;">
		                              3.Comptabilite3
		                           </button>
		                        </h2>
		                        <div id="collapseThreeFC" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#FinanceCompta">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFour" style="background:#eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourFC" aria-expanded="true" aria-controls="collapseFourFC" style="font-size: 17px;">
		                              4.Comptabilite4
		                           </button>
		                        </h2>
		                        <div id="collapseFourFC" class="accordion-collapse collapse " aria-labelledby="headingFour" data-mdb-parent="#FinanceCompta">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFive" style="background:#eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveFC" aria-expanded="false" aria-controls="collapseFiveFC" style="font-size: 17px;">
		                              5.Comptabilite5
		                           </button>
		                        </h2>
		                        <div id="collapseFiveFC" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#FinanceCompta">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixFC" aria-expanded="false" aria-controls="collapseSixFC" style="font-size: 17px;">
		                           6.Comptabilite6
		                           </button>
		                        </h2>
		                        <div id="collapseSixFC" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#FinanceCompta">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>
		                  	<!-- 3 -->

		               <div class="accordion" id="Marketing" style="display: none">
		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingOne" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneM" aria-expanded="false" aria-controls="collapseOneM" style="font-size: 17px;">
		                           1.Marketing1
		                           </button>
		                        </h2>
		                        <div id="collapseOneM" class="accordion-collapse collapse" aria-labelledby="headingOne" data-mdb-parent="#Marketing">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingTwo" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoM" aria-expanded="false" aria-controls="collapseTwoM" style="font-size: 17px;">
		                           2.Marketing2
		                           </button>
		                        </h2>
		                        <div id="collapseTwoM" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#Marketing">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeM" aria-expanded="false" aria-controls="collapseThreeM" style="font-size: 17px;">
		                           3.Marketing3
		                           </button>
		                        </h2>
		                        <div id="collapseThreeM" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#Marketing">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFour" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourM" aria-expanded="false" aria-controls="collapseFour" style="font-size: 17px;">
		                           4.Marketing4
		                           </button>
		                        </h2>
		                        <div id="collapseFourM" class="accordion-collapse collapse" aria-labelledby="headingFour" data-mdb-parent="#Marketing">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFive" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveM" aria-expanded="false" aria-controls="collapseFiveM" style="font-size: 17px;">
		                           5.Marketing5
		                           </button>
		                        </h2>
		                        <div id="collapseFiveM" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#Marketing">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixM" aria-expanded="false" aria-controls="collapseSixM" style="font-size: 17px;">
		                           6.Marketing6
		                           </button>
		                        </h2>
		                        <div id="collapseSixM" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#Marketing">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>
		               		<!-- 4 -->

		               <div class="accordion" id="Commercial" style="display: none;">
		                	<div class="accordion-item">
		                        <h2 class="accordion-header" id="headingOne" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneC" aria-expanded="false" aria-controls="collapseOneC" style="font-size: 17px;">
		                           1.Commercial1
		                           </button>
		                        </h2>
		                        <div id="collapseOneC" class="accordion-collapse collapse" aria-labelledby="headingOne" data-mdb-parent="#Commercial">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingTwo" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoC" aria-expanded="false" aria-controls="collapseTwoC" style="font-size: 17px;">
		                           2.Commercial2
		                           </button>
		                        </h2>
		                        <div id="collapseTwoC" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#Commercial">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeC" aria-expanded="false" aria-controls="collapseThreeC" style="font-size: 17px;">
		                           3.Commercial3
		                           </button>
		                        </h2>
		                        <div id="collapseThreeC" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#Commercial">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFour" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourC" aria-expanded="false" aria-controls="collapseFourC" style="font-size: 17px;">
		                           4.Commercial4
		                           </button>
		                        </h2>
		                        <div id="collapseFourC" class="accordion-collapse collapse" aria-labelledby="headingFour" data-mdb-parent="#Commercial">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFive" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveC" aria-expanded="false" aria-controls="collapseFiveC" style="font-size: 17px;">
		                           5.Commercial5
		                           </button>
		                        </h2>
		                        <div id="collapseFiveC" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#Commercial">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixC" aria-expanded="false" aria-controls="collapseSix" style="font-size: 17px;">
		                           6.Commercial6
		                           </button>
		                        </h2>
		                        <div id="collapseSixC" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#Commercial">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>
		                	<!-- 5 -->

		               <div class="accordion" id="GestionProjets" style="display: none;">
		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingOne" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneGP" aria-expanded="false" aria-controls="collapseOneGP" style="font-size: 17px;">
		                           1.Gestion projet1
		                           </button>
		                        </h2>
		                        <div id="collapseOneGP" class="accordion-collapse collapse" aria-labelledby="headingOne" data-mdb-parent="#GestionProjets">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingTwo" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoGP" aria-expanded="false" aria-controls="collapseTwoGP" style="font-size: 17px;">
		                           2.Gestion projet2
		                           </button>
		                        </h2>
		                        <div id="collapseTwoGP" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#GestionProjets">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeGP" aria-expanded="false" aria-controls="collapseThreeGP" style="font-size: 17px;">
		                           3.Gestion projet3
		                           </button>
		                        </h2>
		                        <div id="collapseThreeGP" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#GestionProjets">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFour" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourGP" aria-expanded="false" aria-controls="collapseFourGP" style="font-size: 17px;">
		                           4.Gestion projet4
		                           </button>
		                        </h2>
		                        <div id="collapseFourGP" class="accordion-collapse collapse" aria-labelledby="headingFour" data-mdb-parent="#GestionProjets">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFive" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveGP" aria-expanded="false" aria-controls="collapseFiveGP" style="font-size: 17px;">
		                           5.Gestion projet5
		                           </button>
		                        </h2>
		                        <div id="collapseFiveGP" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#GestionProjets">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixGP" aria-expanded="false" aria-controls="collapseSixGP" style="font-size: 17px;">
		                           6.Gestion projet6
		                           </button>
		                        </h2>
		                        <div id="collapseSixGP" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#GestionProjets">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>
		                	<!-- 6 -->

		               <div class="accordion" id="TechniqueInformatiques" style="display: none;">
		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingOne" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneTI" aria-expanded="false" aria-controls="collapseOneTI" style="font-size: 17px;">
		                           1.Technique informatique1
		                           </button>
		                        </h2>
		                        <div id="collapseOneTI" class="accordion-collapse collapse" aria-labelledby="headingOne" data-mdb-parent="#TechniqueInformatiques">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingTwo" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoTI" aria-expanded="false" aria-controls="collapseTwoTI" style="font-size: 17px;">
		                           2.Technique informatique2
		                           </button>
		                        </h2>
		                        <div id="collapseTwoTI" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#TechniqueInformatiques">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeTI" aria-expanded="false" aria-controls="collapseThreeTI" style="font-size: 17px;">
		                           3.Technique informatique3
		                           </button>
		                        </h2>
		                        <div id="collapseThreeTI" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#TechniqueInformatiques">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFour" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourTI" aria-expanded="false" aria-controls="collapseFourTI" style="font-size: 17px;">
		                           4.Technique informatique4
		                           </button>
		                        </h2>
		                        <div id="collapseFourTI" class="accordion-collapse collapse" aria-labelledby="headingFour" data-mdb-parent="#TechniqueInformatiques">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFive" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveTI" aria-expanded="false" aria-controls="collapseFiveTI" style="font-size: 17px;">
		                           5.Technique informatique5
		                           </button>
		                        </h2>
		                        <div id="collapseFiveTI" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#TechniqueInformatiques">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixTI" aria-expanded="false" aria-controls="collapseSixTI" style="font-size: 17px;">
		                           6.Technique informatique6
		                           </button>
		                        </h2>
		                        <div id="collapseSixTI" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#TechniqueInformatiques">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>
		                	<!-- 7 -->

		               <div class="accordion" id="Telecom" style="display: none;">
		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingOne" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneTL" aria-expanded="false" aria-controls="collapseOneTL" style="font-size: 17px;">
		                           1.Telecom1
		                           </button>
		                        </h2>
		                        <div id="collapseOneTL" class="accordion-collapse collapse" aria-labelledby="headingOne" data-mdb-parent="#Telecom">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingTwo" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoTL" aria-expanded="false" aria-controls="collapseTwoTL" style="font-size: 17px;">
		                           2.Telecom2
		                           </button>
		                        </h2>
		                        <div id="collapseTwoTL" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#Telecom">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeTL" aria-expanded="false" aria-controls="collapseThreeTL" style="font-size: 17px;">
		                           3.Telecom3
		                           </button>
		                        </h2>
		                        <div id="collapseThreeTL" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#Telecom">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFour" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourTL" aria-expanded="false" aria-controls="collapseFourTL" style="font-size: 17px;">
		                           4.Telecom4
		                           </button>
		                        </h2>
		                        <div id="collapseFourTL" class="accordion-collapse collapse" aria-labelledby="headingFour" data-mdb-parent="#Telecom">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFive" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveTL" aria-expanded="false" aria-controls="collapseFiveTL" style="font-size: 17px;">
		                           5.Telecom5
		                           </button>
		                        </h2>
		                        <div id="collapseFiveTL" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#Telecom">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixTL" aria-expanded="false" aria-controls="collapseSixTL" style="font-size: 17px;">
		                           6.Telecom6
		                           </button>
		                        </h2>
		                        <div id="collapseSixTL" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#Telecom">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>
		                	<!-- 8 -->

		               <div class="accordion" id="Administration" style="display: none;">
		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingOne" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseOneAd" aria-expanded="false" aria-controls="collapseOneAd" style="font-size: 17px;">
		                           1.Admin1
		                           </button>
		                        </h2>
		                        <div id="collapseOneAd" class="accordion-collapse collapse" aria-labelledby="headingOne" data-mdb-parent="#Administration">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingTwo" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseTwoAd" aria-expanded="false" aria-controls="collapseTwoAd" style="font-size: 17px;">
		                           2.Admin2
		                           </button>
		                        </h2>
		                        <div id="collapseTwoAd" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-mdb-parent="#Administration">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingThree" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseThreeAd" aria-expanded="false" aria-controls="collapseThreeAd" style="font-size: 17px;">
		                           3.Admin3
		                           </button>
		                        </h2>
		                        <div id="collapseThreeAd" class="accordion-collapse collapse" aria-labelledby="headingThree" data-mdb-parent="#Administration">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFour" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFourAd" aria-expanded="false" aria-controls="collapseFourAd" style="font-size: 17px;">
		                           4.Admin4
		                           </button>
		                        </h2>
		                        <div id="collapseFourAd" class="accordion-collapse collapse" aria-labelledby="headingFour" data-mdb-parent="#Administration">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingFive" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseFiveAd" aria-expanded="false" aria-controls="collapseFiveAd" style="font-size: 17px;">
		                           5.Admin5
		                           </button>
		                        </h2>
		                        <div id="collapseFiveAd" class="accordion-collapse collapse" aria-labelledby="headingFive" data-mdb-parent="#Administration">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>

		                    <div class="accordion-item">
		                        <h2 class="accordion-header" id="headingSix" style="background: #eef0ff">
		                           <button class="accordion-button collapsed" type="button" data-mdb-toggle="collapse" data-mdb-target="#collapseSixAd" aria-expanded="false" aria-controls="collapseSixAd" style="font-size: 17px;">
		                           6.Admin6
		                           </button>
		                        </h2>
		                        <div id="collapseSixAd" class="accordion-collapse collapse" aria-labelledby="headingSix" data-mdb-parent="#Administration">
		                           <div class="accordion-body" style="background: rgb(255 255 255 / 90%);font-family: 'Open Sans', sans-serif;font-size: 14px">
		                              	<ul>
		                                 	<li><a href="#">En attente (0)</a></li>
			                                <li><a href="#">En cours (0)</a></li>
			                                <li><a href="#">Valider (0)</a></li>
			                                <li><a href="#">Refuser (0)</a></li>
		                              	</ul>
		                           </div>
		                        </div>
		                    </div>
		               </div>

	               </div>
	           </div> 
	         </div>
	    </section>

    </form>


    <script src="https://code.jquery.com/jquery-3.1.0.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
	<script type='text/javascript' src="/{NOM_APPLICATION}/include/style/tableau_de_bord/script.js"></script>
	<script type='text/javascript' src="/{NOM_APPLICATION}/include/style/tableau_de_bord/mdb.js"></script>
	<script type='text/javascript' src="/{NOM_APPLICATION}/include/style/tableau_de_bord/cloudflare_jquery3.js"></script>
		<script type='text/javascript' src="/{NOM_APPLICATION}/include/style/tableau_de_bord/owl.js"></script>


	<script type="text/javascript"> 

		$('.owl-carousel').owlCarousel({
         //   autoplay: false,
           center: true,
           loop: true,
           nav: true,
        });


         $('.accordion-header').on('click', function(){
          $(this).css('background','#d4d9f6');
          $(this).find('button').css('font-weight','bold');
          $(this).parent().siblings().find('h2').css('background','#eef0ff');
          $(this).parent().siblings().find('button').css('font-weight','normal');
         
         });
         
          $('.faqItem').on('click', function(){
            console.log($(this).find('p').html());
         
            var selectedFaq = $(this).find('p').html();
            $(this).parent().siblings().find('.faqItem').removeClass("faqheadertextActive");
            $(this).addClass('faqheadertextActive');
         
	         // Informations générales
	         // Autres informations
	         // Faire une demande
	         // Prendre un RDV
	         // Comment nous contacter
	         // Autres Sujets

            if(selectedFaq =='RESSOURCES HUMAINES'){
              $('.accordion').css('display','none');
              $('#RessourcesHumaines').css('display','block');
            }
         
            if(selectedFaq =='FINANCE ET COMPTABILITE'){
              $('.accordion').css('display','none');
              $('#FinanceCompta').css('display','block');
            }
         
            if(selectedFaq =='MARKETING'){
              $('.accordion').css('display','none');
              $('#Marketing').css('display','block');
            }
         
            if(selectedFaq =='COMMERCIAL'){
              $('.accordion').css('display','none');
              $('#Commercial').css('display','block');
            }
         
            if(selectedFaq =='GESTION DE PROJETS'){
              $('.accordion').css('display','none');
              $('#GestionProjets').css('display','block');
            }
         
            if(selectedFaq =='TECHNIQUE INFORMATIQUE'){
              $('.accordion').css('display','none');
              $('#TechniqueInformatiques').css('display','block');
            }

            if(selectedFaq =='TECHNIQUE TELECOM'){
              $('.accordion').css('display','none');
              $('#Telecom').css('display','block');
            }

            if(selectedFaq =='ADMINISTRATION'){
              $('.accordion').css('display','none');
              $('#Administration').css('display','block');
            }
        })
         
    </script>
	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/TBD/corbeille.js"></script>

</body>
</html>