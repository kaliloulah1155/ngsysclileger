<?php 

	 include ("../../../../../configuration_w/mabd.php");

    
     $lib_mission=trim(htmlentities($_GET['lib_mission'], ENT_QUOTES, "UTF-8"));


 
    $result = pg_query("SELECT * FROM public.mission WHERE libelle='".$lib_mission."'  ");
	$find = pg_num_rows($result);
     
   $flag=0;

    if ($find!=0){

    	 $flag=0;
    	 // pg_query(" DELETE FROM public.cot_diplome WHERE libelle='".$diplome."'  ");

    }else{

    	//echo "insertion";

        
         if($lib_mission !='' AND $lib_mission !='0'){

             $query2="INSERT INTO public.mission(libelle) VALUES ('".$lib_mission."');";
            pg_query($query2) or die("Error while insert");

             $flag=1;

        }

    	
    }

    echo $flag;


?>