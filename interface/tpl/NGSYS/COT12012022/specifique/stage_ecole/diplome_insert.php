<?php

    include ('../../../../../../configuration_w/mabd.php');

     $diplome=trim(htmlentities($_GET['diplome'], ENT_QUOTES, "UTF-8"));




    $result = pg_query("SELECT * FROM public.cot_diplome WHERE libelle='".$diplome."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

    	 $query2="INSERT INTO public.cot_diplome(libelle) VALUES ('".$diplome."');";
		pg_query($query2) or die("Error while insert");

		 $flag=1;
    }

    echo $flag;



?>   