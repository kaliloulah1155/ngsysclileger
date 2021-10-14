<?php 

   include ('../../../../../../configuration_w/mabd.php');


   $usr_email= $_GET['usr_email'] ;
   $num_poseidon= $_GET['num_poseidon'] ;
   $reg_date= $_GET['reg_date'] ;



    //echo $usr_email.' '.$num_poseidon.' '.$reg_date;


  // pg_query("ALTER TABLE public.pos_tab_index_tms DISABLE TRIGGER ALL ");

   pg_query(" DELETE FROM public.pos_tab_index_tms WHERE \"NUD\"='".$num_poseidon."' ");
   
    pg_query(" DELETE FROM public.tache_journalieres WHERE email='".$usr_email."' AND date_enreg='".$reg_date."'");

?>