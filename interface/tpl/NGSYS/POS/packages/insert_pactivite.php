<?php 

	 include ("../../../../../configuration_w/mabd.php");

       //resoud les problemes d'encodage
     $lib_pactivite=trim(htmlentities($_GET['lib_pactivite'], ENT_QUOTES, "UTF-8"));



 
    $result = pg_query("SELECT * FROM public.pactivite WHERE libelle='".$lib_pactivite."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

        
         if($lib_pactivite !='' AND $lib_pactivite !='0'){

             $query2="INSERT INTO public.pactivite(libelle) VALUES ('".$lib_pactivite."');";
            pg_query($query2) or die("Error while insert");

             $flag=1;

        }

    	
    }

    echo $flag;


?>