<?php

    include ('../../../../../configuration_w/mabd.php');

     $projet=trim($_GET['projet']);


    $result = pg_query("SELECT * FROM public.projet WHERE libelle='".htmlentities($projet, ENT_QUOTES, "UTF-8")."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
 
    }else{

        if($projet !='' AND $projet !='0'){

        	 $query2="INSERT INTO public.projet(libelle) VALUES ('". htmlentities($projet, ENT_QUOTES, "UTF-8")."');";
    		pg_query($query2) or die("Error while insert");

    		 $flag=1;
         }
    }

    echo $flag;



?>   