<?php 

	 include ("../../../../../configuration_w/mabd.php");


     $lib_ptitre=trim(htmlentities($_GET['lib_ptitre'], ENT_QUOTES, "UTF-8"));


 
    $result = pg_query("SELECT * FROM public.ptitre WHERE libelle='".$lib_ptitre."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

        
         if($lib_ptitre !='' AND $lib_ptitre !='0'){

             $query2="INSERT INTO public.ptitre(libelle) VALUES ('".$lib_ptitre."');";
            pg_query($query2) or die("Error while insert");

             $flag=1;

        }

    	
    }

    echo $flag;


?>