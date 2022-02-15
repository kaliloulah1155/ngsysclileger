<?php 

	 include ("../../../../../configuration_w/mabd.php");

    
     $lib_qualdom=trim(htmlentities($_GET['lib_qualdom'], ENT_QUOTES, "UTF-8"));


 
    $result = pg_query("SELECT * FROM public.qualdominante WHERE libelle='".$lib_qualdom."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

        
         if($lib_qualdom !='' AND $lib_qualdom !='0'){

             $query2="INSERT INTO public.qualdominante(libelle) VALUES ('".$lib_qualdom."');";
            pg_query($query2) or die("Error while insert");

             $flag=1;

        }

    	
    }

    echo $flag;


?>