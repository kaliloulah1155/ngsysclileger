<?php

    include ('../../../../../configuration_w/mabd.php');

     $nature=trim($_GET['nature']);




    $result = pg_query("SELECT * FROM public.san_nature WHERE libelle='".htmlentities($nature, ENT_QUOTES, "UTF-8")."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

        if($nature !='' AND $nature !='0'){

        	 $query2="INSERT INTO public.san_nature(libelle) VALUES ('". htmlentities($nature, ENT_QUOTES, "UTF-8")."');";
    		pg_query($query2) or die("Error while insert");

    		 $flag=1;
         }
    }

    echo $flag;



?>   