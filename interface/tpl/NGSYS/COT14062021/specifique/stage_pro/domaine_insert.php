<?php 
   
    include ('../../../../../../configuration_w/mabd.php');

     $domaine=trim($_GET['domaine']);




    $result = pg_query("SELECT * FROM public.cot_domaine WHERE libelle='".$domaine."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){
    	 $flag=0;
    }else{

    	 $query2="INSERT INTO public.cot_domaine(libelle) VALUES ('".$domaine."');";
		pg_query($query2) or die("Error while insert");

		 $flag=1;
    }

    echo $flag;


?>