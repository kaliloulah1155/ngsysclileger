<?php 

include ("../../../../../configuration_w/mabd.php");

$loadcode=trim(htmlentities($_GET['loadcode'], ENT_QUOTES, "UTF-8"));
$lib_pactivite=$_GET['lib_pactivite'];
$lib_ptitre=$_GET['lib_ptitre'];
        

//var_dump($lib_service[1]);
    // echo $loadcode;

$array_pactivite = array() ;
$array_ptitre = array() ;

for ($p=0; $p < count($lib_ptitre) ; $p++) { 
	      
	      if($lib_ptitre[$p]==''){
	      	   array_push($array_ptitre,'0');
	      }else{


             //get IDs from service
   		 $result_ptitre=pg_query("SELECT id FROM public.ptitre WHERE libelle='".htmlentities($lib_ptitre[$p], ENT_QUOTES, "UTF-8")."' ");

					   		 while ($row_ptitre = pg_fetch_row($result_ptitre)) {
					              array_push($array_ptitre,$row_ptitre[0]);

					   		 }

	      }
}

 
if(!empty($lib_pactivite[0])  ){

   
   foreach ($lib_pactivite as $k => $v) {

    		 		   //get IDs from departement
   		 		$result_pactivite=pg_query("SELECT id FROM public.pactivite WHERE libelle='".htmlentities($v, ENT_QUOTES, "UTF-8")."' ");


   		 		  while ($row_pactivite = pg_fetch_row($result_pactivite)) {

                  
                     	array_push($array_pactivite,$row_pactivite[0]);
 
   		      }

   }

   
    for ($i=0; $i < count($array_pactivite) ; $i++) { 

    	      /*
    	      	   echo ' code : '.$loadcode ;
    	      	   echo ' departement : '.$array_pactivite[$i] ;
    	      	    echo ' service : '.$array_ptitre[$i];
    	      	     echo '<br/>';

    	     */

    	     $resultfind=pg_query("SELECT * FROM public.pos_activite WHERE code='".$loadcode."'
    	      AND  activite_id='".$array_pactivite[$i]."' AND  titre_id='".$array_ptitre[$i]."'     ");

						$find = pg_num_rows($resultfind);
              
             //echo $find;
 						if($find!=0){

 							      //for update use delete-insert OR Update
		 								pg_query(" DELETE FROM public.pos_activite WHERE code='".$loadcode."'  ");

		 								pg_query("INSERT INTO public.pos_activite(
				                    activite_id,titre_id,code)
				                    VALUES (  
				                    				'".$array_pactivite[$i]."',
				                           '".$array_ptitre[$i]."',
				                            '".$loadcode."'
				                     );");

						}else{

							    pg_query("INSERT INTO public.pos_activite(
				                     activite_id,titre_id,code)
				                    VALUES (  
				                    				'".$array_pactivite[$i]."',
				                           '".$array_ptitre[$i]."',
				                            '".$loadcode."'
				                     );");

						}
 
    	 
    } 




}
    


?>