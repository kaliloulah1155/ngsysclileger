
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

                <div class="col-md-1 offset-5">
                    <button class="btn btn_search" title="Bouton pour des recherches">
                        <i class="fa fa-search"></i>
                   </button>
                </div>
            </div>
            
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-2 mt-2 offset-6">
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
                <th style="min-width: 100px;text-align: center;">Code</th>
                <th style="min-width: 100px;text-align: center;">Date de cr&#233;ation</th>
                <th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">Actions</th>
            </tr>
        </thead>
        <tbody  class="list_consoassur">

        </tbody>
    </table>

    <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/CAS/liste/listeAjaxCAS/load_liste_CAS.js"></script>
    <script language='javascript' src="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/CAS/excelcas/consoassurexcel.js"></script>
         <script>
        //bouton oeil
        $(document).on('click','.modifier',function(){
            var numposeidon=$(this).data('num');
            //alert(numposeidon);
         window.location.href='/<?php echo $_GET["APPLI"] ?>/interface/session/principal/consultation/consulter_index.php?MODE=MODIFICATION&POS_NUM_DOC='+numposeidon+'&POS_TYPEDOC=CAS&POS_NUM_FICHE=0';

        });
     
        
        $(document).on('click','.supprimer',function(e){
           

                var num_poseidon=$(this).data('numsup');

                
                var link_url_del="/<?php echo $_GET['APPLI'] ?>/interface/tpl/<?php echo $_GET['APPLI'] ?>/CAS/liste/listeAjaxCAS/delete_CAS.php";


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