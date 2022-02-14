<?php
include ('../../../../../configuration_w/mabd.php');

$loadcode= $_POST['codegenerator'] ;


$resultfind=pg_query("SELECT * FROM public.tab_hsu WHERE code='".$loadcode."' ");

      $find = pg_num_rows($resultfind);

     
      if($find!=0){
      	echo 1;
      }else{
         echo 0;
      }


