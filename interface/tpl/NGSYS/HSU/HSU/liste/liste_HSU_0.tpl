
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
    <input type="hidden" class="user_email" value="<?php echo strtoupper($_GET['USER']) ?>" />
    <input type="hidden" class="profil" value="<?php echo strtoupper($_GET['PROFIL']) ?>" />

    <div class="card mb-1" >
        <div class="card-header">
            <div class="row">
                <div class="col-md-3">
                    <label>Date d&#233;but</label>
                    <input type="date" class="form-control departement" placeholder="D&#233;partement" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                </div>
                <div class="col-md-3 offset-3">
                    <label>Date fin</label>
                    <input type="date" class="form-control departement" placeholder="D&#233;partement" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                </div>
                <!-- <div class="col-md-3 offset-1">
                    <label>Nom & pr&#233;noms</label>
                     <select class="form-control" style="width: 100%">
                        <option value="" selected>Veuillez s&#233;lectionner</option>
                    </select>
                </div> -->

                <div class="col-md-1  offset-2 mt-5">
                    <button class="btn btn_search" title="Bouton pour des recherches">
                        <i class="fa fa-search"></i>
                   </button>
                </div>
            </div>
            
        </div>
    </div>

    <div class="row mb-3">
        <div class="col-md-2 mt-2 offset-6">
            <select class="form-control typeDemande" style="width: 100%">
                <option value="Xls">Xls</option>
                <option value="Xlsx">Xlsx</option>
                <option value="Csv">Csv</option>
            </select>
        </div>
        <div class="col-md-2 mt-2">
            <button class="btn" title="cliquez pour exporter vos documents en format s&#233;lectionner">Exporter</button>
        </div>

        <div class="col-md-2 mt-2" style="float: right;">
            <button class="btn" title="cliquez pour t&#233;l&#233;charger vos document en format pdf">Format pdf</button>
        </div>
    </div>

    <table id="min-data" class="test table"> <!--   id="languages" un element important display -->
        <thead class="table-sm table-hover text-white" style="background: #4a67b3;">
            <tr>
                <th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">#</th>
                <th style="min-width: 100px;text-align: center;">Motifs</th>
                <th style="min-width: 100px;text-align: center;">Nombre d'heures</th>
                <!-- <th style="min-width: 100px;text-align: left;">Date de r&#233;alisation</th> -->
                <!-- <th style="min-width: 100px;text-align: left;">Anciennet&#233;</th> -->
                <th style="min-width: 100px;text-align: center;">Date de r&#233;alisation</th>
                <th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">Actions</th>
            </tr>
        </thead>
        <tbody>

            <tr>
                <th>1</th>
                <th>Kobenan</th>
                <th>Marcel</th>
                <!-- <th>Dev</th> -->
                <!-- <th>2</th> -->
                <th>12/06/2013</th>
                <th>
                    <a href="#" class="btn" style="width: 30px;height: 30px;padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-eye'></i></a>
                    <a href="#" class="btn" style="width: 30px;height: 30px;padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-print'></i></a>
                    <a href="#" class="btn" style="width: 30px;height: 30px;padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-archive'></i></i></a>
                </th>
            </tr>

        </tbody>
    </table>
</body>
</html>