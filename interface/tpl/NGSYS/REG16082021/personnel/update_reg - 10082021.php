<?php

    include ('../../../../../configuration_w/mabd.php');

 

    $personnel=$_POST["personnel"];
    $autreindemn=$_POST["autreindemn"]??0;
    $horaire=$_POST["horaire"]??0;
    $remun_cg=$_POST["remun_cg"]??0;
    $caution=$_POST["caution"];
    $nourriture=$_POST["nourriture"];
    $logement=$_POST["logement"];

    $maxid=0;
    //get max id     

    $rq=pg_query("

           SELECT max(\"NUD\") FROM public.pos_tab_index_reg WHERE \"MEL\"='".strtoupper($personnel)."';
        ");

    while($row=pg_fetch_row($rq)){
        $maxid=$row[0];
    }

    $flag=0;

    // echo strtoupper($personnel);

     if($maxid!=0 AND !empty($maxid)){

        $flag=1;

        pg_query("UPDATE public.pos_tab_index_reg
                SET 
                    \"ATI\"=".$autreindemn.",
                    \"HOR\"=".$horaire.",
                    \"REN\"=".$remun_cg.",
                    \"CAU\"='".$caution."',
                    \"NRR\"='".$nourriture."',
                    \"LOG\"='".$logement."'
                WHERE 
                     \"MEL\"='".strtoupper($personnel)."' 
                AND 
                      \"NUD\" =".$maxid."

                "); 

     }
     
      echo $flag;

?>