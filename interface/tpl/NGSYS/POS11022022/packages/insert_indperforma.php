<?php 

	 include ("../../../../../configuration_w/mabd.php");

    
     $lib_indperforma=trim(htmlentities($_GET['lib_indperforma'], ENT_QUOTES, "UTF-8"));



        

 
    $result = pg_query("SELECT * FROM public.indperforma WHERE libelle='".$lib_indperforma."'  ");
	$find = pg_num_rows($result);

   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

        
         if($lib_indperforma !='' AND $lib_indperforma !='0'){

             $query2="INSERT INTO public.indperforma(libelle) VALUES ('".$lib_indperforma."');";
            pg_query($query2) or die("Error while insert");

             $flag=1;

        }

    	
    }

    echo $flag;


?>