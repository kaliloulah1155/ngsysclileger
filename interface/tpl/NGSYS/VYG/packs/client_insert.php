<?php

    include ('../../../../../configuration_w/mabd.php');

     $client=trim($_GET['client']);


    $result = pg_query("SELECT * FROM public.client WHERE libelle='".htmlentities($client, ENT_QUOTES, "UTF-8")."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
 
    }else{

        if($client !='' AND $client !='0'){

        	 $query2="INSERT INTO public.client(libelle) VALUES ('". htmlentities($client, ENT_QUOTES, "UTF-8")."');";
    		pg_query($query2) or die("Error while insert");

    		 $flag=1;
         }
    }

    echo $flag;



?>   