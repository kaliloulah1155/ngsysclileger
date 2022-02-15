<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fiche d&#146;identification</title>
    <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- <link href="/{NOM_APPLICATION}/include/alert/sweetalert.css" rel="stylesheet"> -->
     <!-- <link href="/{NOM_APPLICATION}/include/style/jquery-ui.css" rel="stylesheet"> -->
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
	<link href="http://code.jquery.com/ui/1.10.4/themes/smoothness/jquery-ui.css" rel="Stylesheet" type="text/css" />
	<script language='javascript' src='/NGSYSTEST/include/script/action_accueil.js'></script>

	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>

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
			font-size: 15px;
			font-weight: lighter;
			background: #4a67b3;
			color: #fff; 
			padding: 5px; 
			border-top-right-radius: 6px;
			border-top-left-radius: 6px;
		}
		
		.col12_partie{
			width:100%;
			border: 1px solid #4a67b3; 
			margin: -1% 0%; 
			padding: 17px;
		}

		label{
			font-size: 15px;
			font-weight: 100;
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
		span.text:after {
		content: "*";
		color: red;
		font-size: 13px;
		font-weight: 700;
		}
		
	</style>
</head>
<body  class='tpl_creation tpl_creation_prs' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' id="formperso" class="cform" ACTION='{URL_ATTENTE}'  method='POST' onSubmit='return validerCreation();' data-parsley-validate>	
	     		<input type='hidden' name='URL' value='{CODE_ACTION}'>
				<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
				<input type='hidden' name='POS_TYPEDOC' value='PRS'>
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

		<nav class="container-fluid">
			<div class="row" >
				<div class="col-sm-3 col_list">
					<i class="fa fa-eye fa-1x" style="color:#4a67b3;"></i>
					<a style="display:none" href="javascript:void lanceBibBal('/{NOM_APPLICATION}/interface/session/principal/resultat/rechercher_db.php&TYPE_RECHERCHE=RECHERCHE_BAL&POS_QUEST_NOM=Bal_PRS_Encours&POS_QUEST_PUBLIC=1', 'QUESTION_BAL');">
						 <span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
					<a href="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/liste/liste_PRS_1.php?APPLI={NOM_APPLICATION}">
						 <span style="color:#4a67b3;">Cliquez pour consulter la liste</span>
					</a>
				</div>
			</div>
			<div class="row" style="margin-top: 7%;">
				<div class="col-sm-12 mt-5" style="margin-top: -5.6%;">
					<div class="col1_partie text-center">
						<span class="title text-while">FICHE D&#145;IDENTIFICATION</span>
					</div>

					<div class="col12_partie" style="padding-top: 6px;">
						<div class="row" style="margin: 0.5% 0%">
							<div class="col-sm-12 text-center">
								<label style="font-weight: 100; font-size: 13px;">Les champs avec (<span class='text'></span>) sont obligatoires</label>
							</div>
							<div class="col-sm-4" style="margin-top: 5px;">
								<label>Matricule</label>
								<input type="text" name='POS_VAL_RUB_MAT' value="{POS_VAL_RUB_MAT}" placeholder="Matricule"  class="form-control matricul" />
							</div>
							 
							<input type="hidden" name='POS_VAL_RUB_COD' value="{POS_VAL_RUB_COD}" placeholder="Code"  class="form-control codef"  />
							 
						</div>
						<!-- civilite & Nom de l'epoux -->
						<div class="form-group row" style="margin: 0.5% 0%">  
							<div class="col-sm-4" style="margin-top: 5px">
								<label>Civilit&eacute;<span class='text'></span> :</label>
								<select id="selection" name='POS_VAL_RUB_CIV' class="form-control civilite" style="width: 100%;" required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup">
									<option value="" selected>Veuillez s&#233;lectionner</option>
									<option value="M">Monsieur</option>
									<option value="MME">Madame</option>
									<option value="MLLE">Mademoiselle</option>
								</select>      
								<input type="hidden" class="selectCivilite" name='POS_VAL_CTRL_CIV' id='POS_VAL_CTRL_CIV'  value='{POS_VAL_RUB_CIV}'>
							</div>
							<div class="col-sm-4" style="margin-top: 5px">
								<label>Nom de l&#146;&#233;poux :</label>
								<input type="text" id="epoux"  placeholder="Nom de l&#146;&#233;poux" value="{POS_VAL_RUB_NEP}" name='POS_VAL_RUB_NEP' disabled data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" class="form-control" style="width: 100%;"/>

							</div>
							<div class="col-sm-4" style="margin-top: 5px">
								<label>Nom<span class='text'></span> :</label>
								<input type="text" class="form-control nom" placeholder="Nom" name='POS_VAL_RUB_NOM' required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" value="{POS_VAL_RUB_NOM}" style="width: 100%;"/>
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Pr&eacute;noms<span class='text'></span> :</label>
								<input type="text" class="form-control prenom" placeholder="Pr&eacute;noms" name='POS_VAL_RUB_PRE' value="{POS_VAL_RUB_PRE}" required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%;"/>
							</div>
						<!-- </div> -->
						<!-- Deuxieme ligne -->
						<!-- <div class="form-group row" style="margin: 0.5% 0%"> -->
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Contact 1<span class='text'></span> :</label>
							  	<input type="text" placeholder="Contact 1" name='POS_VAL_RUB_TPH' value="{POS_VAL_RUB_TPH}" class="form-control contact1" required="true" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" class="form-control" style="width: 100%;"/>
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Contact 2 :</label>
							  	<input type="text" name='POS_VAL_RUB_TPM' value="{POS_VAL_RUB_TPM}" placeholder="Contact 2" class="form-control" data-parsley-trigger="keyup" data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" style="width: 100%;"/>
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Date de naissance<span class='text'></span> :</label>
								<input type="text" id="date1" name="POS_VAL_RUB_DNS" value="{POS_VAL_RUB_DNS}" class="form-control naissance" required="true" style="width: 100%;" placeholder="jj/mm/aaaa">
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Lieu de naissance<span class='text'></span> :</label>
								<input type="text" name='POS_VAL_RUB_LNS' value="{POS_VAL_RUB_LNS}" placeholder="Lieu de naissance" class="form-control lieuNais" required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" class="form-control" style="width: 100%;"/>
							</div>
						<!-- </div> -->
						
						<!-- troisième ligne -->
						<!-- <div class="row" style="margin: 0.5% 0%"> -->
							<div class="col-sm-4" style="margin-top: 12px">
								<label>E-mail<span class='text'></span> :</label>
								<input type="email" placeholder="E-mail" class="form-control email" name='POS_VAL_RUB_MEL' required="true" value="{POS_VAL_RUB_MEL}" data-parsley-pattern="/^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/" style="width: 100%;"/>
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Bo&#238;te postale :</label>
								<input type="text" placeholder="Bo&#238;te postale" name='POS_VAL_RUB_BP' value="{POS_VAL_RUB_BP}" class="form-control" style="width: 100%;">
							</div>
							<div class="col-sm-4" style="margin-top: 12px" style="width: 100%;">
								<label>Nature de pi&egrave;ce<span class='text'></span> :</label>
								<select id="selection" name='POS_VAL_RUB_NTP' rows="1" required="true" class="form-control naturePiece" rows="1">
									<option value="" selected>Veuillez s&#233;lectionner</option>
									 <option value="ATTESTATION">Atttestation d'identit&eacute; </option>
									 <option value="CNI">CNI </option>
									 <option value="PERMIS DE CONDUIRE">Permis de conduire </option>
									 <option value="PASSEPORT">Passeport </option>
									 <option value="CARTE CONSULAIRE">Carte consulaire </option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_NTP' id='POS_VAL_CTRL_NTP' value='{POS_VAL_RUB_NTP}'>
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Num&eacute;ro de pi&egrave;ce<span class='text'></span> :</label>
								<input type="text" required="true" name='POS_VAL_RUB_NPI' value="{POS_VAL_RUB_NPI}" equired="true" data-parsley-trigger="keyup" data-parsley-pattern="^[A-Z0-9 ]*$" placeholder="Num&eacute;ro de pi&egrave;ce" class="form-control numP" style="width: 100%;"/>
							</div>
						<!-- </div> -->
						
						<!-- Quatrième ligne -->
						<!-- <div class="row" style="margin: 0.5% 0%"> -->
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Nationalit&eacute;<span class='text'></span> :</label>
							  <select id="nationalite" name='POS_VAL_RUB_NAT' class="form-control nationalite" rows="1" required="true" >
								     <option value="" >Selectionner</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_NAT' id='POS_VAL_CTRL_NAT' value='{POS_VAL_RUB_NAT}'>
							</div>

							<div class="col-sm-4" style="margin-top: 12px">
								<label>Lieu de domicile<span class='text'></span> :</label>
								<input type="text" name='POS_VAL_RUB_CNE'value="{POS_VAL_RUB_CNE}" placeholder="Lieu de domicile" class="form-control lieu" required="true" data-parsley-trigger="keyup" data-parsley-pattern="^[a-zA-Z'_ ]*$">
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Expatri&#233;(e)<span class='text'></span> :</label>
								<select id="selection" class="form-control" rows="1" style="width: 100%;"required="true"> 
									<option value="" selected>Veuillez s&#233;lectionner</option>
									<option value="NON">Non</option>
									<option value="OUI">Oui</option>
								</select>
								<input type="hidden" name='expatrie'value="expatrie">
							</div>
							
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Situation matrimoniale<span class='text'></span> :</label>
								<select id="selection" rows="1" name='POS_VAL_RUB_SIF' class="form-control matrimoniale" required="true" style="width: 100%;">
									<option value="" >Selectionner</option>
								</select>    
								<input type="hidden" name='POS_VAL_CTRL_SIF' id='POS_VAL_CTRL_SIF'  value='{POS_VAL_RUB_SIF}'>
							</div>
						<!-- </div> -->
						
						<!-- Cinquième ligne -->
						<!-- <div class="row" style="margin: 0.5% 0%"> -->
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Nombre d&#146;enfants<span class='text'></span> :</label>
								<input type="Number" name='POS_VAL_RUB_NEF' required="true" value="{POS_VAL_RUB_NEF}" placeholder="Nombre d&#146;enfant" min="0"max="50" class="form-control" style="width: 100%;"/>
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Banque :</label>
								<select id="selection"  name='POS_VAL_RUB_BQE' class="form-control" rows="1" style="margin: 0% 0%" rows="1" style="width: 100%;">
									<option value="" selected>Veuillez s&#233;lectionner</option>
									<option value="Afrilan First Bank">Afrilan First Bank</option>
									<option value="Bank Of Africa">Bank Of Africa</option>
									<option value="Banque Atlantique">Banque Atlantique</option>
									<option value="BDA">BDA</option>
									<option value="Banque Populaire">Banque Populaire</option>
									<option value="BSIC">BSIC</option>
									<option value="BDU-CI">BDU-CI</option>
									<option value="BGFIBank">BGFIBank</option>
									<option value="BHCI">BHCI</option>
									<option value="BICICI">BICICI</option>
									<option value="BMS-CI">BMS-CI</option>
									<option value="BNI">BNI</option>
									<option value="Bridge Bank Group">Bridge Bank Group</option>
									<option value="CITI">CITI</option>
									<option value="Coris Bank">Coris Bank</option>
									<option value="Diamond">Diamond</option>
									<option value="Ecobank">Ecobank</option>
									<option value="GTBank">GTBank</option>
									<option value="NSIA">NSIA</option>
									<option value="Orabank">Orabank</option>
									<option value="Orange Banque">Orange Banque</option>
									<option value="Société Ivoirienne de Banque">Soci&#233;t&#233; Ivoirienne de Banque</option>
									<option value="SGBCI">SGBCI</option>
									<option value="Stanbic Bank">Stanbic Bank</option>
									<option value="Standard Chartered">Standard Chartered</option>
									<option value="UBA">UBA</option>
									<option value="Versus Bank">Versus Bank</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_BQE' id='POS_VAL_CTRL_BQE' value="{POS_VAL_RUB_BQE}" placeholder="Banque" />

							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>RIB :</label>
								<input type="text" name='POS_VAL_RUB_RIB' id='POS_VAL_CTRL_RIB' value="{POS_VAL_RUB_RIB}" placeholder="RIB" class="form-control" style="width: 100%;"/>
							</div>
							<div class="col-sm-4" style="margin-top: 12px">
								<label>Date d&apos;entr&#233;e<span class='text'></span> :</label>
								<input type="text" id="date2" name='POS_VAL_RUB_DAE' value="{POS_VAL_RUB_DAE}" required="true" placeholder="Date d&apos;entr&#233;e" class="form-control dateEntre" data-parsley-trigger="keyup"  style="width: 100%;"/>
							</div>
						</div>

						<!-- Fiche de poste  -->
						<label for="bio" style="margin-top: 3%; font-size: 19px">Fiche de poste</label>
							<div class="row">
								<div class="col-sm-4">
									<label>Poste<span class='text'></span> :</label>
									<select id="selection" name='POS_VAL_RUB_NTP' rows="1" required="true" class="form-control naturePiece" rows="1">
										<option value="" selected>Veuillez s&#233;lectionner</option>
										 <option value="1">Analyste programmeur</option>
										 <option value="2">Commercial</option>
										 <option value="3">Comptable</option>
									</select>
									<input type="hidden" value=" " class="form-control" data-parsley-trigger="keyup"/>
								</div>
								<div class="col-sm-4">
									<label for="bio">Niveau de formation<span class='text'></span> :</label>
									<select name="POS_VAL_RUB_DIP" required="true" class="form-control selectForms diplome" style="width: 100%;">
									    <option value="">Veuillez s&#233;lectionner</option>
									</select>
									<input type="hidden"  class="interselectdiplome" name='POS_VAL_CTRL_DIP' id='POS_VAL_CTRL_DIP' value='{POS_VAL_RUB_DIP}'>
								</div>
								<div class="col-sm-4">
									<label for="bio">Exp&#233;rience professionnelle<span class='text'></span> :</label>
									<input type="text" name="POS_VAL_RUB_EXP"  onkeypress="return testNum(event, this, 2);" class="form-control" min="0" placeholder="Exp&#233;rience professionnelle" style="width: 100%;">
								</div>
								<div class="col-sm-12" style="margin-top: 12px">
									<label for="bio">Exigences particuli&#232;res :</label>
									<textarea name="POS_VAL_RUB_EXG" class="form-control" style="width: 100%;resize: none" rows="2" data-parsley-required="true" data-parsley-trigger="keyup"></textarea>
								</div>
							</div>

						
						<!-- En cas d'urgence  -->
						<label for="bio" style="margin-top: 3%; font-size: 19px">En cas d&#146;urgence</label>
						
						<div class="row">
							<div class="col-sm-3">
								<label for="bio">Nom<span class='text'></span> :</label>
								<input type="text" placeholder="Nom" name='POS_VAL_RUB_PAC' value="{POS_VAL_RUB_PAC}"  class="form-control nomurg" required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%;"/>
							</div>
							<div class="col-sm-3">
								<label for="bio">Pr&eacute;noms<span class='text'></span> :</label>
								<input type="text" placeholder="Pr&eacute;noms" value="{POS_VAL_RUB_PRM}" name='POS_VAL_RUB_PRM' class="form-control prenomurg" required="true" data-parsley-pattern="^[a-zA-Z'_ ]*$" data-parsley-trigger="keyup" style="width: 100%;"/>
							</div>
							<div class="col-sm-3">
								<label for="bio">Contact<span class='text'></span> :</label>
								<input type="text" placeholder="Contact" name='POS_VAL_RUB_NTC' value="{POS_VAL_RUB_NTC}" class="form-control contacturg" required="true" data-parsley-trigger="keyup"  data-parsley-pattern="^\+?\d*$" data-parsley-maxlength="15" style="width: 100%;"/>
							</div>
							<div class="col-sm-3">
								<label for="bio">Filiation<span class='text'></span> :</label>
								<select id="selection"  name='POS_VAL_RUB_FLN' class="form-control filiationurg" rows="1" required="true" style="margin: 0% 0%" rows="1" style="width: 100%;">
									<option value="" selected>Veuillez s&#233;lectionner</option>
									<option value="Pere">P&#232;re</option>
									<option value="Mere">M&#232;re</option>
									<option value="Grand-pere">Grand-p&#232;re</option>
									<option value="Grand-mere">Grand-m&#232;re</option>
									<option value="Oncle">Oncle</option>
									<option value="Tante">Tante</option>
									<option value="Cousin">Cousin</option>
									<option value="Cousine">Cousine</option>
									<option value="Neveu">Neveu</option>
									<option value="Niece">Ni&#232;ce</option>
									<option value="Grand-frere">Grand-fr&#232;re</option>
									<option value="Grand-Soeur">Grand-Soeur</option>
								</select>
								<input type="hidden" name='POS_VAL_CTRL_FLN' id='POS_VAL_CTRL_FLN' value='{POS_VAL_RUB_FLN}'>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- button -->
			<div class="row col_btn">
				<input type="resset" class="btn col-sm-2 btn_ferme" value="FERMER" style="font-size: 12px;margin-left: 36%;">
				<input class="btn col-sm-2" type="submit" value="ENREGISTRER" id="app" style="font-size: 12px;margin-left: 5%;" />
			</div>
		</nav>
			
	</form>
	<div style="display:none;">
        <div id = "dialog-2" title = "Dialog Title goes here...">Votre op&#233;ration s&#146;est d&#233;roul&#233;e avec succ&#232;s !</div>
    </div>
</body>   
    
	 <!-- JQUERY  -->
		<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
	    <script language='javascript' src="../../../../include/bootstrap-3.3.7/dist/js/bootstrap.min.js"></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseley.js'></script>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/jQuery/parseleyfr.js'></script>
		<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>
		<!-- <script language='javascript' src="/{NOM_APPLICATION}/include/alert/sweetalert.js"></script> -->
		<!-- <script language='javascript' src="/{NOM_APPLICATION}/include/script/jquery-ui.js"></script> -->

		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/departement/phppromise.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/nationalite/nat.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/code/code.js"></script>
		<script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/PRS/matricule/mat.js"></script>



	<!-- END JQUERY  -->
	<script>

		// select2 
        $('.selectTits,.selectInts,.selectForms').select2({
            theme:'bootstrap4',
            tags:true,
            allowClear: true
        });

	  $('#formperso').parsley();

	     var prof_util = "{PROFIL_UTILISATEUR}";	 
	 
			switch (prof_util) {
			 case "ADMIN" :
				   $('.rhdmdprs').show();
		           $('.mydmdprs').hide();
					
					break;
			 case "RH":
				   $('.rhdmdprs').show();
		           $('.mydmdprs').hide();
					
					break;
			default:
			 $('.mydmdprs').show();
			
		}
		$(document).ready(function (){

			//script du bouton fermer
			$('.btn_ferme').on('click',function(){
				 if (confirm("Voulez-vous fermer le formulaire ?.Vos donn\u00e9s seront annul\u00e9es ." ) ) {
							{CODE_ACTION_FERMER}
				}
			});


			//script du bouton enregistrer 
	        $('#formperso').submit(function(event){
				event.preventDefault();

				if (confirm(" Confirmez-vous le traitement de cette action?" ) ) {
			        	alert("VOTRE OPERATION S'EST DEROULEE AVEC SUCCES");
			          	event.currentTarget.submit();
			        }else{
			    	return false;
			    }
	        });


			$('#date1, #date2').datepicker({
				altField: "#datepicker",
				closeText: 'Fermer',
				prevText: 'Précédent',
				nextText: 'Suivant',
				currentText: 'Aujourd\'hui',
				monthNames: ['Janvier', 'F&#233;vrier', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet', 'Août', 'Septembre', 'Octobre', 'Novembre', 'D&#233;cembre'],
				monthNamesShort: ['Janv.', 'Févr.', 'Mars', 'Avril', 'Mai', 'Juin', 'Juil.', 'Ao&#251;t', 'Sept.', 'Oct.', 'Nov.', 'Déc.'],
				dayNames: ['Dimanche', 'Lundi', 'Mardi', 'Mercredi', 'Jeudi', 'Vendredi', 'Samedi'],
				dayNamesShort: ['Dim.', 'Lun.', 'Mar.', 'Mer.', 'Jeu.', 'Ven.', 'Sam.'],
				dayNamesMin: ['D', 'L', 'M', 'M', 'J', 'V', 'S'],
				weekHeader: 'Sem.',
				dateFormat: 'dd/mm/yy'
			});
		});
		

		$('.civilite').on('change',function(){
            
			var selectCivilite=$.trim($(this).val());

			console.log(selectCivilite);
			if(selectCivilite == 'MME'){
				$('#epoux').prop("disabled",false);	
			}
			else{
				$('#epoux').val('');
				$('#epoux').prop("disabled",true);	


			}

		});



			let  selectmat ="";
		
		$(".civilite").on("change", function() {
			let situation = $(this).val();
			

		         $('.matrimoniale').empty();


			if (situation != "") {

				  
				 switch (situation) {
		 
						 case 'MME':
						 				

							selectmat="<option value='MARIEE'> Mari&eacute;e</option>";
							jQuery(".matrimoniale").prop("disabled", false);


							$(".matrimoniale").append(selectmat);

							

				  break;
				
					case 'M':
							selectmat="<option value='' selected>Veuillez s&#233;lectionner</option>"+
							"<option value='CELIBATAIRE'> C&eacute;libataire</option>"+
				             "<option value='MARIE'> Mari&eacute;</option>"+
				             "<option value='VEUF'> Veuf</option>";
							 jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);


				  break;
				case 'MLLE':
							selectmat="<option value='' selected>Veuillez s&#233;lectionner</option>"+
							"<option value='CELIBATAIRE'> C&eacute;libataire</option>"+
				             "<option value='VEUVE'> Veuve</option>";
							 jQuery(".matrimoniale").prop("disabled", false);
							$(".matrimoniale").append(selectmat);


				  break;
				  default :  jQuery(".matrimoniale").prop("disabled", true);

			    

			}

			}		
			 
	});



			
	</script>
	
</html>
