
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>


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
</head>
<style type="text/css">
    body{
        background: transparent;
        margin: 0;
        padding: 0;
    }

    .btn_search{
        width: 30px;
        height: 30px;
        float: right;
        color: #fff;
        background: #4a67b3;
    }
</style>
<body class="fluid">

    <div class="title mt-2 mb-1 text-center">
        <span>Page de r&#233;sultat</span>
    </div>

        
    <input type="hidden" class="appli" value="<?php echo $_GET['APPLI'] ?>" />

    <input type="hidden" class="profil" value="<?php echo strtoupper($_GET['PROFIL']) ?>" />  
    <input type="hidden" class="user_email" value="<?php echo strtoupper($_GET['USER']) ?>" />


    <div class="card mb-1" >
        <div class="card-header">
            <div class="row">
                <div class="col-md-3">
                    <label>Date d&#233;but</label>
                    <input type="date" class="form-control date_deb" placeholder="D&#233;partement" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                </div>
                <div class="col-md-3">
                    <label>Date fin</label>
                    <input type="date" class="form-control date_fin" placeholder="D&#233;partement" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                </div>
                <div class="col-md-3">
                    <label>Nom & pr&#233;noms</label>
                     <select class="form-control personnel" style="width: 100%">
                        
                    </select>
                </div>    

                <div class="col-md-3">
                    <label>Type de contrat</label>
                     <select class="form-control contrat" style="width: 100%">
                        <option value="" selected>Veuillez s&#233;lectionner</option>
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
                </div>

                <div class="col-md-1 mt-2 offset-11">
                    <button class="btn btn_search" title="Bouton pour des recherches">
                        <i class="fa fa-search"></i>
                   </button>
                </div>
            </div>
            
        </div>
    </div>

    <div class="row mb-3">

       <div class="col-md-2 mt-2">
                <input type="file" id="file" class="filename btn" name="fichier" />
        </div>
        <div class="col-md-2 mt-3 offset-1">
                <input type="button"  class="sendfile" value="Charger le fichier" />
        </div>

        <div class="col-md-2 mt-2 offset-1">
            <select class="form-control typeDemande choice" style="width: 100%">
                <option value="Xls">Xls</option>
                <option value="Xlsx">Xlsx</option>
                <option value="Csv">Csv</option>
            </select>
        </div>
        <div class="col-md-2 mt-2">
            <button class="btn btn_export" title="cliquez pour exporter vos documents en format s&#233;lectionner">Exporter</button>
        </div>

        <div class="col-md-2 mt-2" style="float: right;">
            <button class="btn btn_pdf" title="cliquez pour t&#233;l&#233;charger vos document en format pdf">Format pdf</button>
        </div>
    </div>

    <table id="min-data" class="test table"> <!--   id="languages" un element important display -->
        <thead class="table-sm table-hover text-white" style="background: #4a67b3;">
            <tr>
                <th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">#</th>
                <th style="min-width: 100px;text-align: center;">Nom</th>
                <th style="min-width: 100px;text-align: center;">Pr&#233;noms</th>
                <th style="min-width: 100px;text-align: left;">Type de contrat</th>
                <th style="min-width: 100px;text-align: center;">Date de signature</th>
                <th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">Actions</th>
            </tr>
        </thead>
        <tbody class="list_contrat" >

            <tr>
                <th>1</th>
                <th>Kobenan</th>
                <th>Marcel</th>
                <th>Contrat CDD</th>
                <th>12/06/2019</th>
                <th>
                    <a href="#" class="btn" style="width: 30px;height: 30px;padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-eye'></i></a>
                    <a href="#" class="btn" style="width: 30px;height: 30px;padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-print'></i></a>
                    <a href="#" class="btn" style="width: 30px;height: 30px;padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-archive'></i></i></a>
                </th>
            </tr>

        </tbody>
    </table>

    <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/COT/liste/listeAjaxCOT/load_liste_COT.js"></script>
    <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/COT/excelcot/contratexcel.js"></script>
    <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/COT/liste/importdata/transfert.js"></script>


      <script>
        //bouton oeil
        $(document).on('click','.modifier',function(){
            var numposeidon=$(this).data('num');
            //alert(numposeidon);
          window.location.href='/<?php echo $_GET["APPLI"] ?>/interface/session/principal/consultation/consulter_index.php?MODE=MODIFICATION&POS_NUM_DOC='+numposeidon+'&POS_TYPEDOC=COT&POS_NUM_FICHE=0';

        });
     
        
        $(document).on('click','.supprimer',function(e){
           

                var num_poseidon=$(this).data('numsup');

                
                var link_url_del="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/COT/liste/listeAjaxCOT/delete_COT.php";

                 if(confirm('Voulez-vous supprimer cette fiche ?')){
                    //alert('good');

                    $.ajax({
                        url: link_url_del,
                        type: "GET",
                        data: {
                            num_poseidon:num_poseidon,
                        },
                        success: function(response) {
                             //console.log(response);
                        },
                        error: function(err) {
                            console.log(err);
                        },
                    });
                    location.reload();
                 }else{

                   // alert('nok');
                 }
                  e.preventDefault();
        });

    </script>

</body>
</html>