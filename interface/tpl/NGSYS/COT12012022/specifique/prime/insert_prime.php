<?php 

	 include ('../../../../../../configuration_w/mabd.php');

     $lib_prime=trim(htmlentities($_GET['lib_prime'], ENT_QUOTES, "UTF-8"));




    $result = pg_query("SELECT * FROM public.prime WHERE libelle='".$lib_prime."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

    	 $query2="INSERT INTO public.prime(libelle) VALUES ('".$lib_prime."');";
		pg_query($query2) or die("Error while insert");

		 $flag=1;
    }

    echo $flag;


?>