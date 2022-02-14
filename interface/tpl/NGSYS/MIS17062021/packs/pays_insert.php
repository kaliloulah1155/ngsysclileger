<?php

    include ('../../../../../configuration_w/mabd.php');

     $pays=trim($_GET['pays']);


    $result = pg_query("SELECT * FROM public.pays WHERE libelle='".htmlentities($pays, ENT_QUOTES, "UTF-8")."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
 
    }else{

        if($pays !='' AND $pays !='0'){

        	 $query2="INSERT INTO public.pays(libelle) VALUES ('". htmlentities($pays, ENT_QUOTES, "UTF-8")."');";
    		pg_query($query2) or die("Error while insert");

    		 $flag=1;
         }
    }

    echo $flag;



?>   