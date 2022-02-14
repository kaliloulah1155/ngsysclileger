<?php
include ('../../../../../configuration_w/mabd.php');

$dateclick= $_GET['dateclick'] ;

$userinfo= $_GET['userinfo'] ;

$departement= $_GET['departement'] ;

 

    
$result = pg_query("SELECT * FROM public.pos_tab_index_tms WHERE \"CRE\"='".$userinfo."'  AND \"DXT\"='".$dateclick."' AND \"DPT\"='".$departement."' ");
$find = pg_num_rows($result);

//echo $find.' lignes';

$output='';
$i=0;  //nombre de donnees

$t_duree="00:00";  //total durée
$t_journaliere=0;  //total journalier

if ($find!=0){

   

    $rq = pg_query($conn,"SELECT \"U2\",\"Z2\",\"L2\",\"W2\",\"X2\",\"Y2\",\"T2\",\"DJ1\",\"TAC\" FROM public.pos_tab_index_tms WHERE \"CRE\"='".$userinfo."'  AND \"DXT\"='".$dateclick."' AND \"DPT\"='".$departement."'  ");

 
        
         while ($row = pg_fetch_row($rq)) {
                 
                 
                $output .="
                        <tr>
                                <td style='width: 20px;border:none;'>
                                   ";
                                 if($i==0){ 
                                    $output .= " <span class='button_plus addRow' onclick='addRow();' style='width: 100%;'><i class='fa fa-plus'></i></span>";
                                }else{
                                    $output .= "<input name='select' type='checkbox' style='width: 80%;font-size: 12px;margin-left: -1%;'>";
                                }
                 $output .="
                                </td>
                                <td style='width: 150px;border:none;'>
                                    <input type='text' name='activite[]' style='width: 100%;' class='form-control activite' value=".$row[0]."   > 
                                </td>
                                <td style='width: 300px;border:none;'>
                                    <textarea type='text' name='tache[]' style='width: 100%; resize: none' rows='1' class='form-control tache'> ".$row[2]."</textarea>
                                </td>
                                <td style='width: 80px;border:none;'>
                                    <input type='time' name='heurein[]' style='width: 100%;' rows='1' class='form-control heurein' value=".$row[3]." >
                                </td>
                                <td style='width: 80px;border:none;'>
                                    <input type='time'  name='heureout[]' style='width: 100%;' rows='1' class='form-control heureout' value=".$row[4].">
                                </td>
                                <td style='width: 80px;border:none;'>
                                    <input type='text' name='duree[]' style='width: 100%;' class='form-control duree' value=".$row[5].">
                                </td>
                                <td style='width: 80px;border:none;'>
                                    <select id='selection' name='taux[]' class='form-control taux'  rows='1'  style='width: 100%;'>
                                        <option value='0'>0</option>
                                        <option value='10'  ".($row[1]=="10" ? "selected=selected" : '') ." >10</option>
                                        <option value='20' ".($row[1]=="20" ? "selected=selected" : '') .">20</option>
                                        <option value='30'  ".($row[1]=="30" ? "selected=selected" : '') ." >30</option>
                                        <option value='40' ".($row[1]=="40" ? "selected=selected" : '') .">40</option>
                                        <option value='50'   ".($row[1]=="50" ? "selected=selected" : '') ."    >50</option>
                                        <option value='60'  ".($row[1]=="60" ? "selected=selected" : '') .">60</option>
                                        <option value='70' ".($row[1]=="70" ? "selected=selected" : '') .">70</option>
                                        <option value='80'  ".($row[1]=="80" ? "selected=selected" : '') .">80</option>
                                        <option value='90' ".($row[1]=="90" ? "selected=selected" : '') .">90</option>
                                        <option value='100' ".($row[1]=="100" ? "selected=selected" : '') .">100</option>
                                    </select>
                                    <input type='hidden'  name='POS_VAL_CTRL_Z1' id='POS_VAL_CTRL_Z1' value='{POS_VAL_RUB_Z1}'>
                                </td>
                                <td style='width: 80px;border:none;'>
                                    <input type='text' name='resultat[]' style='width: 105%;' class='form-control resultat'  id='resultat' value=".$row[6].">
                                </td>
                            </tr>
                ";

                $t_duree=$row[7];
                $t_journaliere=$row[8] ;

                ++$i;
        }

       echo "<input type='hidden' class='aj_duree' value=".$t_duree.">";
       echo "<input type='hidden' class='aj_journaliere' value=".$t_journaliere.">";
          
    
    echo  $output;  

}else {
        $output .="

            <tr>
                <td style='width: 20px;border:none;'>
                    <span class='button_plus addRow' onclick='addRow();' style='width: 100%;'><i class='fa fa-plus'></i></span>
                </td>
                <td style='width: 150px;border:none;'>
                        <input type='text' name='activite[]' style='width: 100%;' class='form-control activite'> 
                </td>
                <td style='width: 300px;border:none;'>
                    <textarea type='text' name='tache[]' style='width: 100%; resize: none' rows='1' class='form-control tache'></textarea>
                </td>
                <td style='width: 80px;border:none;'>
                    <input type='time' name='heurein[]' style='width: 100%;' rows='1' class='form-control heurein'>
                </td>
                <td style='width: 80px;border:none;'>
                    <input type='time'  name='heureout[]' style='width: 100%;' rows='1' class='form-control heureout'>
                </td>
                <td style='width: 80px;border:none;'>
                    <input type='text' name='duree[]' style='width: 100%;' class='form-control duree'>
                </td>
                <td style='width: 80px;border:none;'>
                    <select id='selection' name='taux[]' class='form-control taux'  rows='1'  style='width: 100%;'>
                        <option value='0'>0</option>
                        <option value='10'>10</option>
                        <option value='20'>20</option>
                        <option value='30'>30</option>
                        <option value='40'>40</option>
                        <option value='50'>50</option>
                        <option value='60'>60</option>
                        <option value='70'>70</option>
                        <option value='80'>80</option>
                        <option value='90'>90</option>
                        <option value='100'>100</option>
                    </select>
                    <input type='hidden'  name='POS_VAL_CTRL_Z1' id='POS_VAL_CTRL_Z1' value='{POS_VAL_RUB_Z1}'>
                </td>
                <td style='width: 80px;border:none;'>
                    <input type='text' name='resultat[]' style='width: 105%;' class='form-control resultat'  id='resultat'>
                </td>
            </tr>
        
        ";

     echo  $output;  
}