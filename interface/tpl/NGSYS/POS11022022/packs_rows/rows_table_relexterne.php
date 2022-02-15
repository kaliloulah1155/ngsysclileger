<?php 

	 include ('../../../../../configuration_w/mabd.php');

	 $loadcode=$_GET['loadcode'];

	 $result = pg_query("SELECT * FROM public.pos_relexterne WHERE  code='".$loadcode."'");
	 $find = pg_num_rows($result);

	 $output='';     

	  if($find!=0){

     
	  	    $rq = pg_query($conn,"
           			SELECT relexterne.libelle
					FROM public.pos_relexterne prelext
					INNER JOIN public.relexterne relexterne
					ON  relexterne.id=prelext.relexterne_id
					WHERE code='".$loadcode."'
           	");


           	$query_relextern = "SELECT  libelle  FROM public.relexterne ORDER BY libelle ASC";
   			$contests_relextern = pg_query($query_relextern) or die('Query failed: ' . pg_last_error());

   			 $array_relextern = array() ;
		    while ($row_relextern = pg_fetch_row($contests_relextern)) {
		        $array_relextern[] = $row_relextern;
		    }


		    while ($row = pg_fetch_row($rq)) {

		    		 $output .="
             		 		<tr>
								<td>
									<select  name='lib_relexterne[]'  class='form-control selectExts relexterne' style='width: 100%;'> ";

									 $output .="<option value=''>S&#233;lectionner le libell&#233;</option>";

									for ($i=0; $i <count($array_relextern) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 										 $output .= '<option value="'.$array_relextern[$i][0].'"  '.($array_relextern[$i][0]==$row[0] ? 'selected': '').'    >'.$array_relextern[$i][0].'</option>';
 									}

 					$output .="
 									</select>
					            </td>
				            </tr>";
		    }

		     echo  $output;  

           	


	  }

?>