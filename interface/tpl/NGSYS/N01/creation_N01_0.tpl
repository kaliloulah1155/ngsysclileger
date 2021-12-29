<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CV en ligne</title>
	 
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
	<script language='javascript' src='/{NOM_APPLICATION}/include/script/action_accueil.js'></script>

	
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
	            
	        	<h4 class="text-center mt-2">Liste des candidatures</h4>

                <div class="card mb-1" >
                    <div class="card-header p-5">
                        <div class="row">
                             <div class="col-md-2">
                                <label class="mb-2">Nom :</label>
                                <input type="text" class="form-control nom" placeholder="Nom" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                            </div>
                             <div class="col-md-2">
                                <label class="mb-2">pr&#233;noms :</label>
                                <input type="text" class="form-control prenoms" placeholder="Pr&#233;noms" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                            </div>

                            <div class="col-md-4">
                                <label class="mb-2">Domaine de comp&#233;tence :</label>
                                <input type="text" class="form-control dom_comp" placeholder="Domaine de comp&#233;tence" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                            </div>

                            <div class="col-md-3">
                                <label class="mb-2">Poste convoit&#233; :</label>
                                <!-- <input type="text" class="form-control" placeholder="Poste convoité" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent"> -->
                                <select class="form-control poste_conv" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                                    <option value=""  selected>S&eacute;lectionner</option>
                                    <option value="Analyste programmeur">Analyste programmeur</option>
                                        <option value="Business Developer">Business Developer</option>
                                        <option value="Chef produit">Chef produit</option>
                                        <option value="Chef projet">Chef projet</option>
                                        <option value="Comptable">Comptable</option>
                                        <option value="Controleur de gestion">Controleur de gestion</option>
                                        <option value="Ingenieur support et maintenance">Ingenieur support et maintenance</option>
                                        <option value="Ingenieur SI">Ingenieur SI</option>
                                         <option value="Kitting and Tool">Kitting and Tool</option>
                                         <option value="Manager RH">Manager RH</option>
                                         <option value="Responsable Moyen Généraux">Responsable Moyen G&#233;n&#233;raux</option>
                                          <option value="Senior Manager Achats">Senior Manager Achats</option>
                                         <option value="Senior Manager Admin">Senior Manager Admin</option>
                                        <option value="Senior Manager DTI">Senior Manager DTI</option>
                                        <option value="Senior Manager Finance">Senior Manager Finance</option>
                                        <option value="Senior Manager Projet">Senior Manager Projet</option>
                                        <option value="Technicien de surface">Technicien de surface</option>
                                        <option value="Team lead recherche et developpement">Team lead recherche et developpement</option>
                                        <option value="Team lead support et maintenance">Team lead support et maintenance</option>
                                        <option value="Team lead SI">Team lead SI</option>
                                        <option value="Tresorier">Tresorier</option>
                                        <option value="UX Designer">UX Designer</option>
                                        <option value="Web Designer">Web Designer</option>
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
                            <th style="min-width: 100px;text-align: left;">Sexe</th>
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

                    </tbody>
                </table>
	        </div>
	    </section>
	<script language='javascript' src="../../../../include/jQuery/jquery.3.3.1.js" charset="utf-8"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.js" rel="stylesheet" crossorigin="anonymous">
	<script language='javascript' src="/{NOM_APPLICATION}/include/jQuery/jquery-ui.js"></script>
	<script type='text/javascript' src='../../../../include/data_tableau/scripts/jquery.dataTables.min.js'></script>
	<script type='text/javascript' src='../../../../include/script/data_tables/datatable_language.js'></script>


     <script type="text/javascript">


      function calldata(responseNew){
            var t = $('.table').DataTable();
             t.clear();

              for (let i = 0; i < responseNew.length; i++) {

                 t.row.add(
                    [
                        responseNew[i]['nom'],
                        responseNew[i]['prenoms'],
                        responseNew[i]['sexe'],
                        responseNew[i]['email'],
                        responseNew[i]['telephone'],
                        responseNew[i]['pos_conv'],
                        "<a href="+responseNew[i]['vitae']+" target='_blank'><i class='fa fa-copy fa-2x text-dark'></i></a>",
                        "<a href="+responseNew[i]['let_motiv']+" target='_blank'><i class='fa fa-copy fa-2x text-dark'></i></a>"
                    ]
                ); 
            }
            t.draw(); 
      }

        //chargement de la liste 
        function ajaxListecv() {
            var searchinput=0;
            $.ajax({
                url: "/api_search_cv/cv_liste",
                type: "POST",
                data: {
                    nom: $('.nom').val(),
                    prenoms: $('.prenoms').val(),
                    dom_comp: $('.dom_comp').val(),
                    poste_conv: $('.poste_conv').val(),
                    search:searchinput
                },
                success: function(response) {
                    var responses =JSON.parse(response) ;
                     // console.log( responses.data );
                     var responseNew =responses.data ;
                       calldata(responseNew);

                },
                error: function(err) {
                    console.log(err);
                },
            });
        }
        ajaxListecv();
        //Recherche de formulaire

        $(document).on('click','.btn_search',function(){
            var searchinput=1;
            $.ajax({
                url: "/api_search_cv/cv_liste",
                type: "POST",
                 data: {
                    nom: $('.nom').val(),
                    prenoms: $('.prenoms').val(),
                    dom_comp: $('.dom_comp').val(),
                    poste_conv: $('.poste_conv').val(),
                    search:searchinput
                },
                success: function(response) {
                     var responses =JSON.parse(response) ;
                    var responseNew =responses.data;
                    calldata(responseNew);
                    searchinput=0;
                },
                error: function(err) {
                    console.log(err);
                },
            });

        });



        </script>

</body>
</html>
