<?php 

include ("../../../../../configuration_w/mabd.php");

$loadcode=trim(htmlentities($_GET['loadcode'], ENT_QUOTES, "UTF-8"));
$lib_mission=$_GET['lib_mission'];

 
 if(!empty($lib_mission[0]) ){

        
      foreach ($lib_mission as $key => $v) {

      		$result_mission=pg_query("SELECT id FROM public.mission WHERE libelle='".htmlentities($v, ENT_QUOTES, "UTF-8")."' ");

      		while ($row = pg_fetch_row($result_mission)) {


					$resultfind=pg_query("SELECT * FROM public.pos_mission WHERE code='".$loadcode."' AND  mission_id='".$row[0]."' ");

						$find = pg_num_rows($resultfind);


						if($find!=0){


					             //for update use delete-insert OR Update
					 			pg_query(" DELETE FROM public.pos_mission WHERE code='".$loadcode."'  ");

			     				  

									pg_query("INSERT INTO public.pos_mission(
							                    mission_id,code)
							                    VALUES (  
							                           '".$row[0]."',
							                            '".$loadcode."'
							                     );");
			     			}
			     			else{
			     					$query_tabmiss="INSERT INTO public.pos_mission(
							                    mission_id,code)
							                    VALUES (  
							                           '".$row[0]."',
							                            '".$loadcode."'
							                     );";
			                		pg_query($query_tabmiss) or die("Error while insert");
			     			}  

				}

      }


 }

      

?>