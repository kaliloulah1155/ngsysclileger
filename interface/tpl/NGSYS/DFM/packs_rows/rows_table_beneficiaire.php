<?php 
    
	 include ('../../../../../configuration_w/mabd.php');
 
	 $loadcode=$_POST['loadcode_reg'];

	 $result = pg_query("SELECT * FROM public.beneficaire WHERE  code='".$loadcode."'");
	 $find = pg_num_rows($result);


    ini_set('display_errors', 1);
	 $output='';

	  if($find!=0){

 
	  	    $rq = pg_query($conn,"
           			SELECT id, code, email, genre, datenaiss, nationalite, fonction, categorie, anneeembauche, cnps, posit
					FROM public.beneficaire WHERE code='".$loadcode."'
           	");


           	$query_personnel = "SELECT \"MEL\",\"NOM\",\"PRE\" FROM public.pos_tab_index_prs ";
   			$contests_personnel = pg_query($query_personnel) or die('Query failed: ' . pg_last_error());

   			 $array_personnel = array() ;
		    while ($row_personnel = pg_fetch_row($contests_personnel)) {
		        $array_personnel[] = $row_personnel;
		    }

		    

		   
		    while ($row = pg_fetch_row($rq)) {

		    		 $output .="
             		 		<tr>
								<td style='width: 30px; border: 1px solid'>
									<select  name='personnel[]'  class='form-control selectLibPost lib_personnel' style='width: 100%;'> ";

									 $output .="<option value=''>Veuillez selectionner </option>";

									for ($i=0; $i <count($array_personnel) ; $i++) { 
 										// echo $myarrayprm[$i][0] .'<br/>';
 $output .= '<option value="'.$array_personnel[$i][0].'"  '.($array_personnel[$i][0]==$row[2] ? 'selected': '').'  title="'.$array_personnel[$i][1].' '.$array_personnel[$i][2].'"   >'.$array_personnel[$i][1].' '.$array_personnel[$i][2].'</option>';
 									}

 					$output .="
 									</select>
					            </td>";
				   $output .="

				   			<td style='width: 45px; border: 1px solid'>
								<input name='civilite[]' type='text' class='form-control civilite'  value='".$row[3]."' style='width: 100%;background: transparent;'>
							</td>

							<td style='width: 45px; border: 1px solid'>
								<input name='datenaiss[]' type='text' class='form-control datenaiss'  value='".$row[4]."' style='width: 100%;background: transparent;'>
							</td>
							<td style='width: 45px; border: 1px solid'>
								<input name='nationalite[]' type='text' class='form-control nationalite'  value='".$row[5]."' style='width: 100%;background: transparent;'>
							</td>
							<td style='width: 45px; border: 1px solid'>
								<input name='fonction[]' type='text' class='form-control fonction'  value='".$row[6]."' style='width: 100%;background: transparent;'>
							</td>
							<td style='width: 45px; border: 1px solid'>
								<input name='categorie[]' type='text' class='form-control categorie'  value='".$row[7]."' style='width: 100%;background: transparent;'>
							</td>

							<td style='width: 45px; border: 1px solid'>
								<input name='dtembauche[]' type='text' class='form-control dtembauche'  value='".$row[8]."' style='width: 100%;background: transparent;'>
							</td>
							<td style='width: 45px; border: 1px solid'>
								<input name='cnps[]' type='text' class='form-control cnps'  value='".$row[9]."' style='width: 100%;background: transparent;'>
							</td>
							<td style='width: 45px; border: 1px solid'>
								<input name='position[]' type='text' class='form-control position'  value='".$row[10]."' style='width: 100%;background: transparent;'>
							</td>

							

							"; 

				  $output .="</tr>";
		    }

		   
		     echo  $output;  

           	


	  }

?>