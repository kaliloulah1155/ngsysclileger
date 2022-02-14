<?php 

include ("../../../../../configuration_w/mabd.php");

$loadcode=trim(htmlentities($_GET['loadcode'], ENT_QUOTES, "UTF-8"));
$lib_depart=$_GET['lib_depart'];
$lib_service=$_GET['lib_service'];


//var_dump($lib_service[1]);
    // echo $loadcode;

$array_depart = array() ;
$array_service = array() ;

for ($p=0; $p < count($lib_service) ; $p++) { 
	      
	      if($lib_service[$p]==''){
	      	   array_push($array_service,'0');
	      }else{


             //get IDs from service
   		 $result_service=pg_query("SELECT \"NUD\" FROM public.pos_tab_index_src WHERE \"LIB\"='".htmlentities($lib_service[$p], ENT_QUOTES, "UTF-8")."' ");

					   		 while ($row_service = pg_fetch_row($result_service)) {
					              array_push($array_service,$row_service[0]);

					   		 }

	      }
}

//print_r($array_service);

if(!empty($lib_depart[0])  ){

   
   foreach ($lib_depart as $k => $v) {

    		 		   //get IDs from departement
   		 		$result_depart=pg_query("SELECT \"NUD\" FROM public.pos_tab_index_dpt WHERE \"LIB\"='".htmlentities($v, ENT_QUOTES, "UTF-8")."' ");


   		 		  while ($row_depart = pg_fetch_row($result_depart)) {

                  
                     	array_push($array_depart,$row_depart[0]);
 
   		      }

   }

   
    for ($i=0; $i < count($array_depart) ; $i++) { 

    	      /*
    	      	   echo ' code : '.$loadcode ;
    	      	   echo ' departement : '.$array_depart[$i] ;
    	      	    echo ' service : '.$array_service[$i];
    	      	     echo '<br/>';

    	     */

    	     $resultfind=pg_query("SELECT * FROM public.pos_relinterne WHERE code='".$loadcode."'
    	      AND  departement_id='".$array_depart[$i]."' AND  service_id='".$array_service[$i]."'     ");

						$find = pg_num_rows($resultfind);
              
             echo $find;
 						if($find!=0){

 							      //for update use delete-insert OR Update
		 								pg_query(" DELETE FROM public.pos_relinterne WHERE code='".$loadcode."'  ");

		 								pg_query("INSERT INTO public.pos_relinterne(
				                    departement_id,service_id,code)
				                    VALUES (  
				                    				'".$array_depart[$i]."',
				                           '".$array_service[$i]."',
				                            '".$loadcode."'
				                     );");

						}else{

							    pg_query("INSERT INTO public.pos_relinterne(
				                    departement_id,service_id,code)
				                    VALUES (  
				                    				'".$array_depart[$i]."',
				                           '".$array_service[$i]."',
				                            '".$loadcode."'
				                     );");

						}
 
    	 
    } 




}
    


?>