<?php

    include ('../../../../../configuration_w/mabd.php');

    $compagnie=trim($_GET['compagnie']);

    $result = pg_query("SELECT * FROM public.compagnie WHERE libelle='".htmlentities($compagnie, ENT_QUOTES, "UTF-8")."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
 
    }else{

        if($compagnie !='' AND $compagnie !='0'){

        	 $query2="INSERT INTO public.compagnie(libelle) VALUES ('". htmlentities($compagnie, ENT_QUOTES, "UTF-8")."');";
    		pg_query($query2) or die("Error while insert");

    		 $flag=1;
         }
    }

    echo $flag;



?>   