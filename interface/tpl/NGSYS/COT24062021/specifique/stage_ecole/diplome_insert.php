<?php

    include ('../../../../../../configuration_w/mabd.php');

     $diplome=trim($_GET['diplome']);




    $result = pg_query("SELECT * FROM public.cot_diplome WHERE libelle='".$diplome."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";
        if($diplome !='' AND $diplome !='0'){
        	 $query2="INSERT INTO public.cot_diplome(libelle) VALUES ('".$diplome."');";
    		pg_query($query2) or die("Error while insert");

    		 $flag=1;
        }
    }

    echo $flag;



?>   