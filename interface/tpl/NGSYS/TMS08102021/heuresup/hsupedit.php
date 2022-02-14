<?php

include ('../../../../../configuration_w/mabd.php');

$loadcode= $_POST['loadcode'] ;
$date_crea= $_POST['date_crea'] ;
$hdeb= $_POST['hdeb'] ;
$hfin= $_POST['hfin'] ;
$nbrehreal= $_POST['nbrehreal'] ;
//$motif=  htmlentities($_POST['motif'], ENT_QUOTES, "UTF-8") ;
$motif=  $_POST['motif'] ;
$montant= $_POST['montant'] ;
$ferie= $_POST['ferie'] ;



//var_dump($loadcode,$date_crea,$hdeb,$hfin,$nbrehreal,$motif,$montant,$ferie);

              
if(!empty($date_crea)){
    $i=0;

    //UPDATE DATA FOR HSU (BEST METHOD)
     pg_query("DELETE FROM public.tab_hsu WHERE code='".$loadcode."'  AND   motif='".htmlentities($motif, ENT_QUOTES, "UTF-8")."' ");

    
         pg_query("INSERT INTO public.tab_hsu(
            code,date_crea,hdeb,hfin,nbrehreal,motif,montant,ferie)
            VALUES (  
                  '".$loadcode."',
                  '".$date_crea."',
                  '".$hdeb."',
                  '".$hfin."',
                  '".$nbrehreal."',
                  '".htmlentities($motif, ENT_QUOTES, "UTF-8")."',
                  '".$montant."',
                  '".$ferie."'
            );"); 

    

}
 
?>