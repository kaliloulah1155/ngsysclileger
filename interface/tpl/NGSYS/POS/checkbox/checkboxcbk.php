<?php 
    

     include ("../../../../../configuration_w/mabd.php");


     $rank=$_GET['rank'];
     $statuscbk=$_GET['statuscbk'];
     $numposeidon=$_GET['numposeidon'];
          
          
          echo $rank.' '.$statuscbk.' '.$numposeidon;

          if($rank==1){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"E1\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

          if($rank==2){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"E2\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

          if($rank==3){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"E3\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

          if($rank==4){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"E4\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

           if($rank==5){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"EX3\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }
          if($rank==6){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"EX4\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }
          if($rank==7){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"EX5\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }
          if($rank==8){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"EX6\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }
          if($rank==9){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"FC1\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }
          if($rank==10){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"FC2\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }
          if($rank==11){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"FC3\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

           if($rank==12){

          	   pg_query("UPDATE public.pos_tab_index_pos
						SET \"FC4\"='".$statuscbk."'
						WHERE \"NUD\"='".$numposeidon."'   ");

          }

   

?>
