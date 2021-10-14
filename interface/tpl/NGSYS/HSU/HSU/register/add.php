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

if(!empty($date_crea[0])  ){
    $i=0;
    foreach ($date_crea as $k => $v) {


        //for update use delete-insert OR Update
     

       $resultfind=pg_query("SELECT * FROM public.tab_hsu WHERE code='".$loadcode[0]."' ");

      $find = pg_num_rows($resultfind);

    //  echo $motif[$k];

      if($find!=0){
       // pg_query("DELETE FROM public.tab_hsu WHERE code='".$loadcode[0]."' AND  date_crea='".$date_crea[$k]."'  ");
       pg_query("DELETE FROM public.tab_hsu WHERE code='".$loadcode[0]."' AND  date_crea='".$date_crea[$k]."'  ");
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

      }else{

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

       // echo $find.' *******';

       // $i++;
    }

}
 
//echo $i;

?>