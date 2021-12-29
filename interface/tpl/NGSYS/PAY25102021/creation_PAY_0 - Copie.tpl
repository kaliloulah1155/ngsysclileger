<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche de paye</title>
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
			font-size: 14px;
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
			margin: -1% 0%; 
			padding: 17px;
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
				
				<input type='hidden' class='appName' value="{NOM_APPLICATION}">

				<!-- important pour lancer la boite aux lettres  -->
				<input type="hidden" name="URL_ATTENTE" value="{URL_ATTENTE}"> 
				<input type="hidden" name="URL_RESULTAT" value="{URL_RESULTAT}">
				<input type="hidden" name="URL_OBTENIR_NB_REP" value="{URL_OBTENIR_NB_REP}">
				<input type="hidden" name="URL_CHANGER_PROFIL" value="{URL_CHANGER_PROFIL}">
				<input type="hidden" id="nb-profils" value="{NB_PROFILS_UTIL}">
				<!-- end important pour lancer la boite aux lettres  -->

					
        </div>

            <!-- </a> -->
		<!-- </div> -->
		<div class="col_list">
			<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
			<a href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_REG_MyDMD&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
				<span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
			</a>
		</div>
		
		<nav class="container-fluid">

			<div class="row" style="margin-top: 1%">
				<div class="col-sm-12" style="margin-top: 2%;">
					<div class="col1_partie text-center">
						<span class="title text-while">GENERALITE</span>
					</div>
					<div class="col2_partie">
						<div class="row">

							  <!-- nom de l'utilisateur-->
				<input  class="form-control nom" type="text" name='POS_VAL_RUB_NOM' value="{POS_VAL_RUB_NOM}" placeholder="nom"  >
 				<input  class="form-control prenoms" type="text" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" placeholder="prenoms"  >
 				<input  class="form-control matricule" placeholder="matricule" type="text" name='POS_VAL_RUB_MAT'  value="{POS_VAL_RUB_MAT}"  >
 
							<div class="col-sm-6" style="margin-top: 13px">
								<label>Nom & pr&#233;mons :</label>
								<select name="POS_VAL_RUB_MEL" class="form-control selectNom personnel" style="width: 100%;">
								    <option value="">Veuillez s&#233;lectionner</option>
								</select>
								<input type="hidden"  class="interselectperso" name='POS_VAL_CTRL_MEL' id='POS_VAL_CTRL_MEL' value='{POS_VAL_RUB_MEL}'>
							</div>
							<div class="col-sm-6" style="margin-top: 13px">
								<label>Statut employ&#233; :</label>
								<select name="category" class="form-control selectEntres" id="selectStatus" style="width: 100%;">
								    <option value="">Veuillez s&#233;lectionner</option>
								    <option value="SALAIRE EMPLOYE">Salaire employ&#233;</option>
								    <option value="SALAIRE STAGIAIRE">Salaire stagiaire</option>
								    <option value="SALAIRE CONSULTANT">Salaire consultant</option>
								</select>
							</div>
						</div>
					</div>
				</div>
			</div>

		
			<div class="row" style="margin-top: 1%">
				<div class="col-sm-12 deuxieme_col" style="margin-top: 2%;">
					<div class="col1_partie text-center">
						<span class="title text-while">SPECIFIQUE</span>
					</div>
					<div class="col2_partie">
						<div class="row">

							<div class="col-sm-4 sursalaire" style="margin-top: 13px;display: none;">
								<label>Sursalaire :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" style="width: 100%">
							</div> 

							<div class="col-sm-4 transportImpos" style="margin-top: 13px;display: none;">
								<label>Transport imposable :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 rendement" style="margin-top: 13px;display: none;">
								<label>Rendement :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 representation" style="margin-top: 13px;display: none;">
								<label>Representation :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 assurances" style="margin-top: 13px;display: none;">
								<label>Assurance :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" style="width: 100%">
							</div>

							<div class="col-sm-4 avances" style="margin-top: 13px;display: none;">
								<label>Avance :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" style="width: 100%">
							</div>


							<div class="col-sm-4 autres" style="margin-top: 13px;display: none;">
								<label>Autres :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" style="width: 100%">
							</div>

							<!-- Les champs soit grisé ou masqué -->
							<div class="col-sm-4 pret" style="margin-top: 13px;display: none;">
								<label>Pr&#234;t :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 level" style="margin-top: 13px;display: none;">
								<label>Level :</label>
								<input type="text" class="form-control" placeholder="Level" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 entreprise" style="margin-top: 13px;display: none;">
								<label>Entreprise :</label>
								<input type="text" class="form-control" placeholder="Entreprise" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 is" style="margin-top: 13px;display: none;">
								<label>IS :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 cn" style="margin-top: 13px;display: none;">
								<label>CN :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 igr" style="margin-top: 13px;display: none;">
								<label>IGR :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 cnps" style="margin-top: 13px">
								<label>CNPS :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 ancinnete" style="margin-top: 13px;display: none;">
								<label>Anciennet&#233; :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 astreinte" style="margin-top: 13px;display: none;">
								<label>Astreinte :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 heureSup" style="margin-top: 13px;display: none;">
								<label>Heure suplementaire :</label> 
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 transport" style="margin-top: 13px;display: none;">
								<label>Transport :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 salaireBase" style="margin-top: 13px;display: none;">
								<label>Salaire de base :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 salaireBrute" style="margin-top: 13px;display: none;">
								<label>Salaire brute imposable :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 salaireNet" style="margin-top: 13px;display: none;">
								<label>Salaire net :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 salaireNetPaye" style="margin-top: 13px;display: none;">
								<label>Salaire net pay&#233; :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 honoraireNet" style="margin-top: 13px;display: none;">
								<label>Honoraire net :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

							<div class="col-sm-4 honoraireNetPaye" style="margin-top: 13px;display: none;">
								<label>Honoraire net pay&#233; :</label>
								<input type="text" onkeypress="return testNum(event, this, 2);" min="0" class="form-control" placeholder="0" readonly="true" style="width: 100%">
							</div>

						</div>

					</div>
				</div>
			</div>

			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" style="font-size: 12px;margin-left: 5%;" />
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

		$(document).ready(function(){
		 	//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});

			// select2 
            $('.selectNom').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });


            $('.deuxieme_col,.sursalaire,.transportImpos,.rendement,.representation,.assurances,.avances,.autres,.pret,.level,.entreprise,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye,.honoraireNet,.honoraireNetPaye').css('display','none');
            $("select#selectStatus").change(function(){
		        var status = $(this).children("option:selected").val();

		        if(status == "SALAIRE STAGIAIRE"){
		        	$('.deuxieme_col,.avances,.level,.salaireNet,.salaireNetPaye').css('display', 'block');
		        	$('.sursalaire,.transportImpos,.rendement,.representation,.assurances,.autres,.pret,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.entreprise,.honoraireNet,.honoraireNetPaye').css('display', 'none');
		        }

		        if(status == "SALAIRE CONSULTANT"){
		        	$('.deuxieme_col,.assurances,.avances,.autres,.pret,.entreprise,.honoraireNet,.honoraireNetPaye').css('display', 'block');
		        	$('.sursalaire,.transportImpos,.rendement,.representation,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye').css('display', 'none');
		        }

		        if(status == "SALAIRE EMPLOYE"){
		        	$('.deuxieme_col,.sursalaire,.transportImpos,.rendement,.representation,.assurances,.avances,.autres,.pret,.is,.cn,.igr,.cnps,.ancinnete,.heureSup,.transport,.salaireBase,.salaireBrute,.salaireNet,.salaireNetPaye').css('display', 'block');
		        	$('.deuxieme_col,.avances,.level,.entreprise,.honoraireNet,.honoraireNetPaye').css('display', 'block');
		        }

		    });

		});
	</script>

	 <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PAY/personnel/personnel.js"></script>
	
</html>