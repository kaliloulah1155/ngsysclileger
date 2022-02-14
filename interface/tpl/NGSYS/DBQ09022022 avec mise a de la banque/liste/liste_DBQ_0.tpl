
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
</head>
<style type="text/css">
    body{
        background: transparent;
    }

    .btn_search{
        position: absolute;
        width: 30px;
        height: 30px;
        color: #fff;
        background: #4a67b3;
        margin-top: 40%;
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
                <div class="col-md-3">
                    <label>Date fin</label>
                    <input type="date" class="form-control departement" placeholder="D&#233;partement" style="width: 100%;height:35px;padding: 2%;border-radius:3px;background:transparent">
                </div>
                <div class="col-md-4">
                    <label>Banque</label>
                     <select class="form-control typeDemande" style="width: 100%">
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
                </div>

                <div class="col-md-1 offset-1">
                    <button class="btn btn_search">
                        <i class="fa fa-search" title="Bouton pour des recherches"></i>
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

        <div class="col-md-2 mt-2">
            <button class="btn" title="cliquez pour t&#233;l&#233;charger vos document en format pdf">Format pdf</button>
        </div>
    </div>

    <table id="min-data" class="test table"> <!--   id="languages" un element important display -->
        <thead class="table-sm table-hover text-white" style="background: #4a67b3;">
            <tr>
                <th style="min-width: 30px;text-align: center;border-top-left-radius: 5px;">#</th>
                <th style="min-width: 100px;text-align: center;">Banque</th>
                <th style="min-width: 100px;text-align: center;">RIB</th>
               <!--  -->
                <th style="min-width: 100px;text-align: center;">Date de cr&#233;ation</th>
                <th style="min-width: 100px;text-align: center;border-top-right-radius: 5px;">Actions</th>
            </tr>
        </thead>
        <tbody>

            <tr>
                <th>1</th>
                <th>BNI</th>
                <th>061b</th>
               <!--  -->
                <th>12/06/2018</th>
                <th>
                    <a href="#" style="padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-eye'></i></a>
                    <a href="#" style="padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-print'></i></a>
                    <a href="#" style="padding: 3px;border: 1px solid black;cursor: pointer;"><i class='fa fa-archive'></i></i></a>
                </th>
            </tr>

        </tbody>
    </table>
</body>
</html>