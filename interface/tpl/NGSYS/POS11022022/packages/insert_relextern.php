<?php 

	 include ("../../../../../configuration_w/mabd.php");


     $lib_relextern=trim(htmlentities($_GET['lib_relextern'], ENT_QUOTES, "UTF-8"));


 
    $result = pg_query("SELECT * FROM public.relexterne WHERE libelle='".$lib_relextern."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

        
         if($lib_relextern !='' AND $lib_relextern !='0'){

             $query2="INSERT INTO public.relexterne(libelle) VALUES ('".$lib_relextern."');";
            pg_query($query2) or die("Error while insert");

             $flag=1;

        }

    	
    }

    echo $flag;


?>