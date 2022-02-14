<?php

    include ('../../../../../../configuration_w/mabd.php');

     $level=trim($_GET['level']);




    $result = pg_query("SELECT * FROM public.cot_level WHERE libelle='".$level."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	

    }else{

    	//echo "insertion";

    	 $query2="INSERT INTO public.cot_level(libelle) VALUES ('".$level."');";
		pg_query($query2) or die("Error while insert");

		 $flag=1;
    }

    echo $flag;



?>   