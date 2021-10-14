<?php 

	 include ('../../../../../configuration_w/mabd.php');

	 $loadcode=$_GET['loadcode'];

	 $result = pg_query("SELECT * FROM public.pos_mission WHERE  code='".$loadcode."'");
	 $find = pg_num_rows($result);

	 $output='';
    
	  if($find!=0){


	  	    $rq = pg_query($conn,"
           			SELECT mission.libelle
					FROM public.pos_mission posmis
					INNER JOIN public.mission mission
					ON  mission.id=posmis.mission_id
					WHERE code='".$loadcode."'
           	");


           	$query_mission = "SELECT  libelle  FROM public.mission ORDER BY libelle ASC";
   			$contests_mission = pg_query($query_mission) or die('Query failed: ' . pg_last_error());

   			 $array_mission = array() ;
		    while ($row_mission = pg_fetch_row($contests_mission)) {
		        $array_mission[] = $row_mission;
		    }


		    while ($row = pg_fetch_row($rq)) {

		    		 $output .="
             		 		<tr>
								<td>
									<select  name='lib_mission[]'  class='form-control selectMission lib_mission' style='width: 100%;margin-top: -1%'> ";

									 $output .="<option value=''>S&#233;lectionner le libell&#233;</option>";

									for ($i=0; $i <count($array_mission) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_mission[$i][0].'"  '.($array_mission[$i][0]==$row[0] ? 'selected': '').'    >'.$array_mission[$i][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>
				            </tr>";
		    }

		     echo  $output;  

           	


	  }

?>