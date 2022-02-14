<?php
include ('../../../../../configuration_w/mabd.php');
   header('Content-Type:application/json');

   //initiator_bq,banque,rib
  // ini_set('display_errors', 1);

   $demandeur= strtolower($_POST['demandeur'])  ;
   $banque=$_POST['banque'] ;
   $rib=$_POST['rib'] ;


   

$data=[];

 try{

   $data["success"]=201;
   $data["update"]='banque';


    pg_query("UPDATE public.pos_tab_index_prs
              SET 
                \"BQE\"='$banque',
                \"RIB\"='$rib'
             WHERE 
                \"MEL\"='$demandeur'
       ")or die('Query failed: ' . pg_last_error());
    
   echo json_encode($data);

 }catch(Exception $e){
    $data["error"]=400;
    $data["message"]='Bad connexion '.$e;
}
  




