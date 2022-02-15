<?php 

include ("../../../../../configuration_w/mabd.php");

$loadcode=trim(htmlentities($_GET['loadcode'], ENT_QUOTES, "UTF-8"));
$lib_relexterne=$_GET['lib_relexterne'];

   //  echo $loadcode;


if(!empty($lib_relexterne[0]) ){

      
     foreach ($lib_relexterne as $key => $v) {


    //insert all IDs for table:  Relations exterieures
 	$result_relextern=pg_query("SELECT id FROM public.relexterne WHERE libelle='".htmlentities($v, ENT_QUOTES, "UTF-8")."' ");

     		while ($row = pg_fetch_row($result_relextern)) {


		$resultfind=pg_query("SELECT * FROM public.pos_relexterne WHERE code='".$loadcode."' AND  relexterne_id='".$row[0]."' ");

		$find = pg_num_rows($resultfind);

	    
     			 if($find!=0){


		             //for update use delete-insert OR Update
		 			pg_query(" DELETE FROM public.pos_relexterne WHERE code='".$loadcode."'  ");

     				 /* pg_query("UPDATE public.pos_relexterne
						SET relexterne_id='".$row[0]."', code='".$loadcode."'
						WHERE code='".$loadcode."' AND WHERE relexterne_id='".$row[0]."'  ");*/

						pg_query("INSERT INTO public.pos_relexterne(
				                    relexterne_id,code)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$loadcode."'
				                     );");
     			}
     			else{
     					$query_relext="INSERT INTO public.pos_relexterne(
				                    relexterne_id,code)
				                    VALUES (  
				                           '".$row[0]."',
				                            '".$loadcode."'
				                     );";
                		pg_query($query_relext) or die("Error while insert");
     			} 
     			 
				 
     		}
     	 
     }

  }

?>