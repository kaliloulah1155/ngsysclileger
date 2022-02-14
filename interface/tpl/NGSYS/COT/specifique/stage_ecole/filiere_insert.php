<?php

    include ('../../../../../../configuration_w/mabd.php');

     $filiere=trim(htmlentities($_GET['filiere'], ENT_QUOTES, "UTF-8"));




    $result = pg_query("SELECT * FROM public.cot_filiere WHERE libelle='".$filiere."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 

    }else{

    	//echo "insertion";

    	 $query2="INSERT INTO public.cot_filiere(libelle) VALUES ('".$filiere."');";
		pg_query($query2) or die("Error while insert");

		 $flag=1;
    }

    echo $flag;



?>   