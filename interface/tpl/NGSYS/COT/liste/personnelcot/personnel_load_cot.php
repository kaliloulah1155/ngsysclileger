<?php

    include ('../../../../../../configuration_w/mabd.php');


    $email=trim($_POST['email']);
    $profil=trim($_POST['profil']);

    if($profil=='ADMIN' OR $profil=='RH' OR $profil=='MANAGER_ADM'OR $profil=='DGA' OR $profil=='DG'){

            $query = "SELECT  \"NOM\", \"PRE\" , \"MAT\", \"MEL\" ,\"CIV\" FROM public.pos_tab_index_prs ORDER BY \"NOM\" ASC";
            $contests = pg_query($query) or die('Query failed: ' . pg_last_error());
            while ($row = pg_fetch_row($contests)) {
                echo '<option value="'.$row[3].'"   '.($row[3]==$init_email ? 'selected': '').'      >'.$row[0].' '.$row[1].'</option>';
            }
    }else{
        $query = "SELECT  \"NOM\", \"PRE\" , \"MAT\", \"MEL\" ,\"CIV\" FROM public.pos_tab_index_prs WHERE \"MEL\"='".strtolower($email)."'  ORDER BY \"NOM\" ASC";
        $contests = pg_query($query) or die('Query failed: ' . pg_last_error());
        while ($row = pg_fetch_row($contests)) {
            echo '<option value="'.$row[3].'"   '.($row[3]==strtolower($email) ? 'selected': '').'      >'.$row[0].' '.$row[1].'</option>';
        }
    }

?>