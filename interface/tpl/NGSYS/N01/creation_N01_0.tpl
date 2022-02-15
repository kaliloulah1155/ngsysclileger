<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV en ligne</title>
	<link href="/{NOM_APPLICATION}/include/style_nouveau/style_accueil.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
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

		*{
		    box-sizing: border-box;
		    margin: 0;
		    padding: 0;
		    font-size: 12px;
		}

		button{
		    position: absolute;
		    width: 30px;
		    height: 30px;
		    border: 1px solid;
		    border-radius: 3px;
		    margin: 23px 20px 0px;
		    cursor: pointer;
		}

		button:hover{
		   background: rgb(245, 232, 207); 
		}
		
	</style>
</head>
<body  class='tpl_creation tpl_creation_n01' onLoad='initTplCreation();' style="background-color: transparent;font-family: 'Times New Roman';">
        <div style="display: flex; flex-direction: row; justify-content: space-around; margin-top: 1%;">
			
			<input type='hidden' name='URL' value='{CODE_ACTION}'>
			<input type='hidden' name='POS_NUM_DOC' value='{POS_NUM_DOC}'>
			<input type='hidden' name='POS_TYPEDOC' value='N01'>
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

		<section class="containet-fluid">
	        <div class="responsive-table-line" style="margin:0px auto;">
	            
	        	<h4 class="text-center mt-2">
	        		Liste des candidatures
	        		<button></button>
	        	</h4>

                <div class="card mb-1" >
                    <div class="card-header p-5">
                        <div class="row">
                            <div class="col-md-4">
                                <label class="mb-2">Nom & pr&#233;noms :</label>
                                <input type="text" class="form-control" placeholder="Nom & pr&#233;noms" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                            </div>

                            <div class="col-md-4">
                                <label class="mb-2">Domaine de comp&#233;tence :</label>
                                <input type="text" class="form-control" placeholder="Domaine de comp&#233;tence" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                            </div>

                            <div class="col-md-3">
                                <label class="mb-2">Poste convoit&#233; :</label>
                                <!-- <input type="text" class="form-control" placeholder="Poste convoité" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent"> -->
                                <select class="form-control" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                                    <option value="" disabled selected>S&eacute;lectionner</option>
                                    <option value="1">1</option>
                                    <option value="1">1</option>
                                </select>
                            </div>
            
                            <div class="col-md-1">
                                <button class="btn_search" title="Bouton de recherches">
                                    <i class="fa fa-search text-primary"></i>
                                </button>
                            </div>
                        </div>
                        
                    </div>
                </div>

                <table id="min-data" class="test table" width="100%">
                    <thead class="table-sm table-hover text-white" style="background: #4a67b3;">
                        <tr>
                            <th style="min-width: 100px;text-align: left;border-top-left-radius: 4px;">Nom</th>
                            <th style="min-width: 100px;text-align: left;">Pr&#233;noms</th>
                            <th style="min-width: 100px;text-align: left;">Genre</th>
                            <th style="min-width: 100px;text-align: left;">Email</th>
                            <th style="min-width: 100px;text-align: left;">Contact</th>
                            <th style="min-width: 100px;text-align: left;">Poste convoit&#233;</th>
                            <th style="min-width: 100px;text-align: center;">Curriculim vitae</th>
                            <th style="min-width: 100px;text-align: center;">Lettre de motivation</th>
                            <!-- <th style="min-width: 100px;text-align: center;border-top-right-radius: 4px;">Actions</th> -->
                        </tr>
                    </thead>
                    <tbody  class="list_personnel">
                        <tr>
                            <th style="min-width: 100px;text-align: left;">Agnymel</th>
                            <th style="min-width: 100px;text-align: left;">Guy Marcel</th>
                            <th style="min-width: 100px;text-align: left;">M</th>
                            <th style="min-width: 100px;text-align: left;">email@gmail.com</th>
                            <th style="min-width: 100px;text-align: left;">0120354365</th>
                            <th style="min-width: 100px;text-align: left;">Ressource Humaine</th>
                            <th style="min-width: 100px;text-align: center;">
                                <a href="#"><i class="fa fa-copy fa-2x text-dark"></i></a>
                            </th>
                            <th style="min-width: 100px;text-align: center;">
                                <a href="#"><i class="fa fa-copy fa-2x text-dark"></i></a>
                            </th>
                        </tr>
                        <tr>
                            <th style="min-width: 100px;text-align: left;">Koudou</th>
                            <th style="min-width: 100px;text-align: left;">Gabriel le pont</th>
                            <th style="min-width: 100px;text-align: left;">M</th>
                            <th style="min-width: 100px;text-align: left;">email@gmail.com</th>
                            <th style="min-width: 100px;text-align: left;">0120354365</th>
                            <th style="min-width: 100px;text-align: left;">D&#233;veloppeur</th>
                            <th style="min-width: 100px;text-align: center;">
                                <a href="#"><i class="fa fa-copy fa-2x text-dark"></i></a>
                            </th>
                            <th style="min-width: 100px;text-align: center;">
                                <a href="#"><i class="fa fa-copy fa-2x text-dark"></i></a>
                            </th>
                        </tr>

                        <tr>
                            <th style="min-width: 100px;text-align: left;">Koudou</th>
                            <th style="min-width: 100px;text-align: left;">Gabriel le pont</th>
                            <th style="min-width: 100px;text-align: left;">M</th>
                            <th style="min-width: 100px;text-align: left;">email@gmail.com</th>
                            <th style="min-width: 100px;text-align: left;">0120354365</th>
                            <th style="min-width: 100px;text-align: left;">D&#233;veloppeur</th>
                            <th style="min-width: 100px;text-align: center;">
                                <a href="#"><i class="fa fa-copy fa-2x text-dark"></i></a>
                            </th>
                            <th style="min-width: 100px;text-align: center;">
                                <a href="#"><i class="fa fa-copy fa-2x text-dark"></i></a>
                            </th>
                        </tr>

                    </tbody>
                </table>
	        </div>
	    </section>
	<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.js" rel="stylesheet" crossorigin="anonymous">
	<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
	<script type='text/javascript' src='../../../../include/data_tableau/scripts/jquery.dataTables.min.js'></script>
	<script type='text/javascript' src='../../../../include/script/data_tables/datatable_language.js'></script>
</body>
</html>
