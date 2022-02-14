<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes attestations et certificats</title>
	<!-- <link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet"> -->
   <link href="/{NOM_APPLICATION}/include/bootstrap-3.3.7/dist/css/bootstrap.min.css" rel="stylesheet"> 
	<link href="/{NOM_APPLICATION}/include/style/stylesdata/rowGroup.dataTables.min.css" rel="stylesheet">
	<link href="/{NOM_APPLICATION}/include/style/stylesdata/jquery.dataTables.min.css" rel="stylesheet">
	<!-- <link href='https://cdn.datatables.net/1.10.24/css/jquery.dataTables.min.css' rel="stylesheet"> -->
	<!-- <link href='https://cdn.datatables.net/rowgroup/1.1.2/css/rowGroup.dataTables.min.css' rel="stylesheet"> -->
	
	<!-- <script type='text/javascript' src='/{NOM_APPLICATION}/include/script/association.js'></script>  -->
	<script type='text/javascript' src='/{NOM_APPLICATION}/include/script/vocabulaire.js'></script>
	<!-- script -->
    <!-- <script type='text/javascript' src='https://code.jquery.com/jquery-3.5.1.js'></script> -->
	<!-- <script type='text/javascript' src='https://cdn.datatables.net/1.10.24/js/jquery.dataTables.min.js'></script> -->
	<!-- <script type='text/javascript' src='https://cdn.datatables.net/rowgroup/1.1.2/js/dataTables.rowGroup.min.js'></script> -->
	<style>
		a .img-fluid{
			border: 1px solid black;
			font-size: 11px;
			margin-right: 21%;
		}
		
		.content_hover1::before{
			content: "Consulter!";
			display: none;
			position: absolute;
			width: 100px;
			text-align: center;
			background: rgb(126, 64, 64);
			border-radius: 50px;
			color: #fff;
			margin: 2.5% -4%;
			padding: 0.3%;
			cursor: pointer;
			z-index: 1;
		}

		.content_hover1:hover::before{
			display: block;
		}
		.content_hover2::before{
			content: "Imprimer!";
			display: none;
			position: absolute;
			width: 100px;
			text-align: center;
			background: rgb(54, 92, 62);
			border-radius: 50px;
			color: #fff;
			padding: 0.3%;
			cursor: pointer;
			z-index: 1;
		}

		.content_hover2:hover::before{
			display: block;
		}
	</style>
</head>
<body  class='tpl_creation tpl_creation_abs' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
	<form name='principal' ACTION='{URL_ATTENTE}' method='POST' onSubmit='return validerCreation();'>

	<input type='hidden' class='appName' value="{NOM_APPLICATION}">
	<input type='hidden' class='userinfo' value="{NOM_UTILISATEUR}">    
	
		<header class="info_selector" style="margin-top: 3%;margin-bottom: 1%;margin-left: 21%">
			<div clas="row">
				 
				<div class="col-sm-4">
					<label>Fiche</label>
					<select class="form-control select_fiche" style="width: 80%;height:35px;padding: 2%;border-radius:3px;">
						<option value=""  selected="selected">Veuillez s&eacute;lectionner</option>
						<option value="ATTESTATION DE CONGE">Attestation de cong&#233;</option>
						<option value="ATTESTATION DE STAGE">Attestation de stage</option>
						<option value="ATTESTATION DE TRAVAIL">Attestation de travail</option>
						<option value="CERTIFICAT DE TRAVAIL">Certificat de travail</option>
					
					</select>
				</div>
				<div class="col-sm-4">
					<label>Matricule</label>
					<input type="text" name='POS_VAL_RUB_MAT' class="form-control matricule"  oninput="this.value = this.value.toUpperCase()" placeholder="Matricule" style="width: 80%;height:35px;padding: 2%;border-radius:3px;" value="{POS_VAL_RUB_MAT}" />
				</div>
				 
				 
			</div>
		</header>


		<!-- Datatables n°1  CERTIFICAT DE TRAVAIL -->
		<table class="tab_ table" style="width:80%;margin-top: 5% ; ">
			<thead  class="htab_cert">
				<tr>
					<th style="min-width: 550px;text-align: left;">Titre</th>
					<th style="min-width: 200px;text-align: left;">Date</th>
					<th style="min-width: 100px;text-align: left;">Action</th>
				</tr>
			</thead>
                 
			<tbody class="btab_cert" >
			 

			</tbody>

		</table>
 




	</form>
	    <script language='javascript' src='/{NOM_APPLICATION}/include/script/script_data/jquery-3.5.1.js'></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/script/script_data/dataTables.rowGroup.min.js'></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/script/script_data/jquery.dataTables.min.js'></script>
		<script language='javascript' src='/{NOM_APPLICATION}/include/script/data_tables/datatable_language.js'></script>

	    <script language='javascript' src="/{NOM_APPLICATION}/interface/tpl/{NOM_APPLICATION}/ATT/treatment_att/traitment_att.js"></script>

 
</body>	
</html>