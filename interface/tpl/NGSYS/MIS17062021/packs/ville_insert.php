<?php

    include ('../../../../../configuration_w/mabd.php');

     $ville=trim($_GET['ville']);


    $result = pg_query("SELECT * FROM public.ville WHERE libelle='".htmlentities($ville, ENT_QUOTES, "UTF-8")."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
 
    }else{

        if($ville !='' AND $ville !='0'){

        	 $query2="INSERT INTO public.ville(libelle) VALUES ('". htmlentities($ville, ENT_QUOTES, "UTF-8")."');";
    		pg_query($query2) or die("Error while insert");

    		 $flag=1;
         }
    }

    echo $flag;



?>   