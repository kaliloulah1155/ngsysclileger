<?php
header('Content-Type:application/json');
include ('../../../../../configuration_w/mabd.php');

    $poste=$_POST['poste'];

    $retour=array();

try{

    $retour["success"]=200;
    $retour["message"]='GET ALL ACTIVITIES FROM OCCUPATION';
    $retour["author"]='By Ibson';
       

    //COMMERCIAL   ANALYSTE PROGRAMMEUR
   // $poste='ANALYSTE PROGRAMMEUR';   //passage de la valeur du poste

    $retour["poste"]=$poste; 

       $query_="
            SELECT
                \"COD\" as code
            FROM 
                public.pos_tab_index_pos
            WHERE \"IPO\"='".$poste."'
         ";

            $contests_= pg_query($query_) or die('Query failed: ' . pg_last_error());
            while ($row = pg_fetch_array($contests_)) {
                  $code = $row['code'];
            }

        $retour["loacode"]=$code; 


        $rqtitle = pg_query($conn,"
                SELECT DISTINCT ptt.id as id, ptt.libelle as titres
                FROM public.pos_activite posact
                LEFT JOIN public.ptitre ptt
                ON  ptt.id=posact.titre_id
                WHERE code='".$code."'
        ")or die('Query failed: ' . pg_last_error());


        while ($rowtitle = pg_fetch_row($rqtitle)) {

                       $rqcontent = pg_query($conn,"
                              SELECT pact.id, pact.libelle as activites
                              FROM public.pos_activite posact
                              LEFT JOIN public.pactivite pact
                              ON  pact.id=posact.activite_id 
                              LEFT JOIN public.ptitre ptt
                              ON  ptt.id=posact.titre_id
                              WHERE code='".$code."' AND   posact.titre_id='".$rowtitle[0]."'
                      ");
  
                       while ($rowcontent = pg_fetch_row($rqcontent)) {
  
 
                              $retour["activites"][] = array(
                                        'id'=> $rowcontent[0],
                                       'valeur'=> $rowcontent[1]
                            );
                  
                       }
                    
       }

    echo json_encode($retour, TRUE ); 
   
}catch(Exception $e){
    $retour["error"]=400;
    $retour["message"]='Bad connexion '.$e;
}

?>



