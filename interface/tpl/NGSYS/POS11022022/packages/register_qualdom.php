<?php 

include ("../../../../../configuration_w/mabd.php");

$loadcode=trim(htmlentities($_GET['loadcode'], ENT_QUOTES, "UTF-8"));
$lib_qualdom=$_GET['lib_qualdom'];

   //  echo $loadcode;


if(!empty($lib_qualdom[0]) ){

      
     foreach ($lib_qualdom as $key => $v) {

     
    //insert all IDs for table:  qualite  dominante
 	$result_qualdom=pg_query("SELECT id FROM public.qualdominante WHERE libelle='".htmlentities($v, ENT_QUOTES, "UTF-8")."' ");

     		while ($row = pg_fetch_row($result_qualdom)) {


		$resultfind=pg_query("SELECT * FROM public.pos_qualdominante WHERE code='".$loadcode."' AND  qualdominante_id='".$row[0]."' ");

		$find = pg_num_rows($resultfind);

	    
     			 if($find!=0){


		             //for update use delete-insert OR Update
		 			pg_query(" DELETE FROM public.pos_qualdominante WHERE code='".$loadcode."'  ");

     				 /* pg_query("UPDATE public.pos_relexterne
						SET relexterne_id='".$row[0]."', code='".$loadcode."'
						WHERE code='".$loadcode."' AND WHERE relexterne_id='".$row[0]."'  ");*/

						pg_query("INSERT INTO public.pos_qualdominante(
				                    qualdominante_id,code)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$loadcode."'
				                     );");
     			}
     			else{
     					$query_qualdom="INSERT INTO public.pos_qualdominante(
				                    qualdominante_id,code)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$loadcode."'
				                     );";
                		pg_query($query_qualdom) or die("Error while insert");
     			} 
     			 
				 
     		}
     	 
     }

  }

?>