<?php
include ('../../../../../configuration_w/mabd.php');

$dateEnreg= $_GET['dateEnreg'] ;

$user_email= $_GET['user_email'] ;

$loadcode= $_GET['loadcode'] ;


        
      

$result = pg_query("SELECT * FROM public.tache_journalieres WHERE email='".$user_email."' AND date_enreg='".$dateEnreg."'");
$find = pg_num_rows($result);


$output='';
$i=0; 

 //nombre de donnees

 


if ($find!=0){


         $rq = pg_query($conn,"SELECT email, activites, taches, heurein, heureout, duree,taux, resultat, departement, service,hs,ferie FROM public.tache_journalieres WHERE email='".$user_email."'  AND date_enreg='".$dateEnreg."'");

             $output .="
                        <tr>   ";
        
         while ($row = pg_fetch_row($rq)) {

                  $output .="

                        <td style='width: 200px;border:none;'>
                                <select class='form-control select2 activite' name='activite[]'  style='width: 100%;'>

                                    <option >Veuillez s&#233;lectionner</option> ";

                            //debut activites
                             $rqtitle = pg_query($conn,"
                                        SELECT DISTINCT ptt.id as id, ptt.libelle as titres
                                        FROM public.pos_activite posact
                                        LEFT JOIN public.ptitre ptt
                                        ON  ptt.id=posact.titre_id
                                        WHERE code='".$loadcode."'
                                ");

                              while ($rowtitle = pg_fetch_row($rqtitle)) {
                                             $rqcontent = pg_query($conn,"
                                                    SELECT pact.id, pact.libelle as activites
                                                    FROM public.pos_activite posact
                                                    LEFT JOIN public.pactivite pact
                                                    ON  pact.id=posact.activite_id 
                                                    LEFT JOIN public.ptitre ptt
                                                    ON  ptt.id=posact.titre_id
                                                    WHERE code='".$loadcode."' AND   posact.titre_id='".$rowtitle[0]."'
                                            ");
                                              
                                             while ($rowcontent = pg_fetch_row($rqcontent)) {

                                                
        $output .="<option value='".$rowcontent[0]."'    ".(
        strcmp($rowcontent[0], $row[1])==0 ? 'selected': '')."   >".$rowcontent[1]."</option>";

                                             }
    
                             }

                             //fin activites
                                                        

                         $output .="

                                </select>
                             
                        </td>

                        <td style='width: 500px;border:none;'>
                            <textarea type='text' name='tache[]' style='width: 100%; resize: none' rows='1' class='form-control tache'>".$row[2]."</textarea>
                        </td>

                        <td style='width: 100px;border:none;'>
                            <input type='time' name='heurein[]' value=".$row[3]." style='width: 100%;height: 35px' class='form-control heurein'>
                        </td>

                        <td style='width: 100px;border:none;'>
                            <input type='time'  name='heureout[]'  value=".$row[4]." style='width: 100%;height: 35px' class='form-control heureout'>
                        </td>

                        <td style='width: 100px;border:none;'>
                            <input type='text' name='duree[]'  value=".$row[5]." style='width: 100%;height: 35px' class='form-control duree'>
                        </td>

                        <td style='width: 100px;border:none;'>
                            <input type='text' step='1' min='1' name='taux[]'  value='".$row[6]."' max='100' style='width: 100%;height: 35px' class='form-control taux'  id='taux'>
                        </td>

                        <td style='width: 200px;border:none;'>
                            <input type='text' name='resultat[]'  value=".$row[7]." style='width: 100%;height: 35px' class='form-control resultat'  id='resultat'>
                        </td>

                       <td>
                              <input type='checkbox' ";

                                    if($row[10]=='true'){
                                      $output .=" checked='true' ";
                                    }else{
     
                                    }
                                    
                                 
                                $output .="style='margin-left:50%' name='hsu[]' class='hsu' > 
                        </td>
                        <td>
                              <input type='checkbox' 
                                 ";

                                    if($row[11]=='true'){
                                      $output .=" checked='true' ";
                                    }else{

                                    }
                                    
                                 
                                $output .="
                                name='ferie[]' class='ferie' style=';margin-left:50%'> 
                        </td>
                    </tr>


                ";

                $i++;


         }

         

      echo  $output;  

} 



