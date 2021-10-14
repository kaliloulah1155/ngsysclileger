
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <script type='text/javascript' src="../../../../../include/script/association.js"></script> 
    <script type='text/javascript' src="../../../../../include/script/vocabulaire.js"></script>
    <script type='text/javascript' src="../../../../../include/script/fermeture.js"></script>
    <script type='text/javascript' src="../../../../../include/script/saisie.js"></script>
    <script type='text/javascript' src="../../../../../include/script/calendrier.js"></script>
    <script type='text/javascript' src="../../../../../include/script/attente_fichier.js"></script>
    <script type='text/javascript' src="../../../../../include/script/recupcontrolsaisie.js"></script>
    <script type='text/javascript' src="../../../../../include/script/navigation.js"></script>
    <script type='text/javascript' src="../../../../../include/script/action_tableau.js"></script>
    <script type='text/javascript' src="../../../../../include/script/ajax_search.js"></script>
    <script language='javascript' src="../../../../../include/script/ajax_recup_listhier.js"></script>
    <script language='javascript' src="../../../../../include/script/ajax_recup_arbo_dossier.js"></script>
    <script language='javascript' src="../../../../../include/script/action_accueil.js"></script>

    <SCRIPT language="javascript" src="../../../../../configuration/constantes.js"></SCRIPT>



    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../../../../include/bootstrap-4.0.0/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../../../../../include/data_tableau/styles/jquery.dataTables.min.css">
    <!-- <link rel="stylesheet" href="../../../../../include/data_tableau/styles/jquery.dataTables.min.css"> -->
    <link href='https://use.fontawesome.com/releases/v5.0.8/css/all.css' type='text/css' rel='STYLESHEET'/>

    <!-- script -->
    <script type='text/javascript' src='../../../../../include/script/script_data/jquery-3.5.1.js'></script>
    <script type='text/javascript' src='../../../../../include/data_tableau/scripts/jquery.dataTables.min.js'></script>
    <script type='text/javascript' src='../../../../../include/script/data_tables/datatable_language.js'></script>
    <!-- <script language='javascript' src='/{NOM_APPLICATION}/include/script/data_tables/datatable_language.js'></script> -->
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet"/>
    <link href="https://raw.githack.com/ttskch/select2-bootstrap4-theme/master/dist/select2-bootstrap4.css" rel="stylesheet"/>
</head>
<style type="text/css">
    body{
        background: transparent;
    }

    .btn_search{
        /*position: absolute;*/
        width: 30px;
        height: 30px;
        float: right;
        color: #fff;
        background: #4a67b3;
        margin-top: -3.5%;
    }

    .icon_btn{
        position: absolute;
       /* margin-top: -1.5%;*/
        margin-left: 1%;
    }
</style>
<body class="fluid">

    <div class="title mt-2 mb-1 text-center">
        <span>Page de r&#233;sultat</span>
    </div>

        
    <input type="hidden" class="appli" value="<?php echo $_GET['APPLI'] ?>" />
    <input type="hidden" class="user_email" value="<?php echo strtoupper($_GET['USER']) ?>" />
    <input type="hidden" class="profil" value="<?php echo strtoupper($_GET['PROFIL']) ?>" />   
       
    <div class="card mb-1" >
        <div class="card-header">
            <div class="row">
                <div class="col-md-3">
                    <label>D&#233;partement</label>
                    <!-- <input type="text" class="form-control departement selectDeps" placeholder="D&#233;partement" style="width: 80%;height:35px;padding: 2%;border-radius:3px;background:transparent">-->
                    <select id="depart"  class="form-control selectDeps" style="width: 100%;">
                        <option value="">Veuillez s&#233;lectionner</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label>Service</label>
                    <select id="service"   class="form-control selectServs service" style="width: 100%;">
                        <option value="">Veuillez s&#233;lectionner</option>
                    </select>
                </div>
                <div class="col-md-3">
                    <label>Nom & pr&#233;noms</label>
                      <select id="personnel"   class="form-control selectPers personnel" style="width: 100%;">
                        <option value="">Veuillez s&#233;lectionner</option>
                    </select>
                </div>
                <div class="col-md-2">
                    <label>Date</label>
                    <input type="date" class="form-control date_search"   placeholder="Date" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                </div>
            </div>
            <button class="btn btn_search">
                <i class="fa fa-search" style="margin: auto;"></i>
           </button>
        </div>
    </div>

    <table id="min-data" class="test table"> <!--   id="languages" un element important display -->
        <thead class="table-sm table-hover text-white" style="background: #4a67b3;">
            <tr>
                <th style="min-width: 30px;text-align: left;">#</th>
                <th style="min-width: 100px;text-align: left;">Nom</th>
                <th style="min-width: 100px;text-align: left;">Pr&#233;noms</th>
                <th style="min-width: 100px;text-align: left;">Fonction</th>
                <th style="min-width: 100px;text-align: left;">Semaine</th>
                <th style="min-width: 100px;text-align: left;">Date</th>
                <th style="min-width: 100px;text-align: left;">Actions</th>
            </tr>
        </thead>
        <tbody class="list_timesheet" >


           

        </tbody>
    </table>
    <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/TMS/liste/listeAjax/load_liste_TMS.js"></script>

     <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/TMS/mysearch/search_tms.js"></script>

     <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/TMS/liste/departement/depart_service.js"></script>
     

     <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>



    <script>
        
        $(document).on('click','.modifier',function(){

            var numposeidon=$(this).data('num');

            //alert(numposeidon);

          window.location.href='/<?php echo $_GET["APPLI"] ?>/interface/session/principal/consultation/consulter_index.php?MODE=MODIFICATION&POS_NUM_DOC='+numposeidon+'&POS_TYPEDOC=TMS&POS_NUM_FICHE=0';

        });


        $(document).on('click','.supprimer',function(e){
           

                var num_poseidon=$(this).data('numsup');
                var usr_email=$(this).data('usremail');
                var reg_date=$(this).data('regdate');

                var link_url_del="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/TMS/liste/listeAjax/delete_TMS.php";


                 if(confirm('Voulez-vous supprimer ce timesheet ?')){
                    //alert('good');


                    $.ajax({
                        url: link_url_del,
                        type: "GET",
                        data: {
                            usr_email: usr_email,
                            num_poseidon:num_poseidon,
                            reg_date:reg_date
                        },
                        success: function(response) {


                             //console.log(response);
                           
                        },
                        error: function(err) {
                            console.log(err);
                        },
                    });

                   // console.log(num_poseidon,usr_email,reg_date);

                    location.reload();
                 }else{

                   // alert('nok');
                 }
                  
            
                  e.preventDefault();
        });



            // select2 
            $('.selectDeps,.selectServs,.selectPers').select2({
                theme:'bootstrap4',
                tags:true,
                allowClear: true
            });

    </script>
</body>
</html>