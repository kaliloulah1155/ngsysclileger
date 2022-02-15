<?php 
    

     include ("../../../../../configuration_w/mabd.php");


     $rank=$_POST['rank'];
     $statuscbk=$_POST['statuscbk'];
     $numposeidon=$_POST['numposeidon'];
          
          
          //echo $rank.' '.$statuscbk.' '.$numposeidon;

          if($rank==1){

          	   pg_query("UPDATE public.pos_tab_index_dfm
						SET \"E1\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

          if($rank==2){

          	   pg_query("UPDATE public.pos_tab_index_dfm
						SET \"E2\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

          

   

?>
