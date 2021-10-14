    <?php
include ('../../../../../configuration_w/mabd.php');

       $annee= $_GET['annee'] ;
       $createur= $_GET['createur'] ;

    $query ="SELECT  count(*)  
             FROM public.pos_tab_index_abs 
             WHERE \"ANN\"='".$annee."' 
               AND \"CRE\"='".strtoupper($createur)."' AND \"AUN\"='ABSENCE'";
    $contests = pg_query($query) or die('Query failed: ' . pg_last_error());
   
    while ($row = pg_fetch_row($contests)) {
    		
    		 
    			echo $row[0];
    	 
    }

?>