<?php 
include ('../../../../../configuration_w/mabd.php');
 
$profil=$_POST['profil'];
$destination=$_POST['destination'];

$retour=array();

$rq_profil = pg_query("SELECT id, libelle FROM public.mis_profils WHERE id='".$profil."' ");
$rq_destination = pg_query("SELECT id, libelle FROM public.mis_destinations WHERE id='".$destination."' ");

while($row_profil =pg_fetch_row($rq_profil)){
    $retour["data"][]=[
        'profil'=>utf8_encode($row_profil[1])
   ];
}
while($row_destination =pg_fetch_row($rq_destination)){
    $retour["data"][]=[
        'destination'=>utf8_encode($row_destination[1])
   ];
}


echo json_encode($retour, TRUE ); 



    