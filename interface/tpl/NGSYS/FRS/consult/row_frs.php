<?php

include ('../../../../../configuration_w/mabd.php');
$code_key= $_POST['code_key'];
 
 
$result = pg_query("SELECT * FROM public.mis_tab_besoins WHERE code_key='".$code_key."' ");
$find = pg_num_rows($result);


$output='';

if ($find!=0){

    $rq = pg_query("SELECT id, id_besoins, pu,code_key FROM public.mis_tab_besoins WHERE code_key='".$code_key."' ");



    ini_set('display_errors', 1);

while ($row = pg_fetch_row($rq)) {

    $output .="
    <tr>   ";

        $output .="

             <td style='width: 200px;border:none;'>
            
             <select  name='besoins[]' class='form-control besoin select2' style='width: 95%'>

                     <option >Veuillez s&#233;lectionner</option> ";

                    //besoins 

                    $rqtitle = pg_query($conn,"
                            SELECT DISTINCT id , libelle
                            FROM public.mis_besoins
                            WHERE id='".$row[1]."'
                    ");

                    while ($rowtitle = pg_fetch_row($rqtitle)) {
                        

                        $rqcontent = pg_query($conn,"
                                                    SELECT id, libelle  
                                                    FROM public.mis_besoins
                                                   ");
                                              
                                             while ($rowcontent = pg_fetch_row($rqcontent)) {
                                                
                                                    $output .="<option value='".$rowcontent[0]."'    ".(
                                                    strcmp($rowcontent[0], $row[1])==0 ? 'selected': '')."   >".$rowcontent[1]."</option>";

                                             }


                    }

                    /////////////////////

         
$output .=" 
                </select>   
                </td>
                <td style='width: 70px;border:none;'>
                    <input type='text' name='pu[]'  value=".$row[2]." placeholder='Prix unitaire' class='form-control pu'>
                </td>

        </tr>";


    }
    echo  $output;  

}

 