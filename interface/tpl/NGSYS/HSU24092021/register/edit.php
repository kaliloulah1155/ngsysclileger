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

if(!empty($date_crea[0])){
    $i=0;

    //UPDATE DATA FOR HSU (BEST METHOD)
    pg_query("DELETE FROM public.tab_hsu WHERE code='".$loadcode[0]."'  ");

    foreach ($date_crea as $k => $v) { 
        pg_query("INSERT INTO public.tab_hsu(
            code,date_crea,hdeb,hfin,nbrehreal,motif,montant,ferie)
            VALUES (  
                  '".$loadcode[0]."',
                  '".$date_crea[$k]."',
                  '".$hdeb[$k]."',
                  '".$hfin[$k]."',
                  '".$nbrehreal[$k]."',
                  '".htmlentities($motif[$k], ENT_QUOTES, "UTF-8")."',
                  '".$montant[$k]."',
                  '".$ferie[$k]."'
            );");

    }

}
 
?>