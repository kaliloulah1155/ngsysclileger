<?php 

include ("../../../../../configuration_w/mabd.php");

$loadcode=trim(htmlentities($_GET['loadcode'], ENT_QUOTES, "UTF-8"));
$lib_indperforma=$_GET['lib_indperforma'];

   //  echo $loadcode;

     
if(!empty($lib_indperforma[0]) ){

      
     foreach ($lib_indperforma as $key => $v) {


    //insert all IDs for table:  indicateurs performances
 	$result_indperforma=pg_query("SELECT id FROM public.indperforma WHERE libelle='".htmlentities($v, ENT_QUOTES, "UTF-8")."' ");

     		while ($row = pg_fetch_row($result_indperforma)) {


		$resultfind=pg_query("SELECT * FROM public.pos_indperforma WHERE code='".$loadcode."' AND  indperforma_id='".$row[0]."' ");

		$find = pg_num_rows($resultfind);

	    
     			 if($find!=0){


		             //for update use delete-insert OR Update
		 			pg_query(" DELETE FROM public.pos_indperforma WHERE code='".$loadcode."'  ");
     
     				 /* pg_query("UPDATE public.pos_relexterne
						SET relexterne_id='".$row[0]."', code='".$loadcode."'
						WHERE code='".$loadcode."' AND WHERE relexterne_id='".$row[0]."'  ");*/

						pg_query("INSERT INTO public.pos_indperforma(
				                    indperforma_id,code)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$loadcode."'
				                     );");
     			}
     			else{
     					$query_indperf="INSERT INTO public.pos_indperforma(
				                    indperforma_id,code)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$loadcode."'
				                     );";
                		pg_query($query_indperf) or die("Error while insert");
     			} 
     			 
				 
     		}
     	 
     }

  }

?>