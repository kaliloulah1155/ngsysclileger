<?php

    include ('../../../../../../configuration_w/mabd.php');

     $entreprise=trim($_GET['entreprise']);




    $result = pg_query("SELECT * FROM public.cot_entreprise WHERE libelle='".$entreprise."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	

    }else{

    	//echo "insertion";

    	 $query2="INSERT INTO public.cot_entreprise(libelle) VALUES ('".$entreprise."');";
		pg_query($query2) or die("Error while insert");

		 $flag=1;
    }

    echo $flag;



?>   