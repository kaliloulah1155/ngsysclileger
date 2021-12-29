<?php
header('Content-Type:application/json');
include ("../../../../../configuration_w/mabd.php");

$contrat = $_POST['contrat'];
$mois = $_POST['month'];
$year = $_POST['year'];
     
$retour=array();

if(!empty($contrat) AND  !empty($mois) AND  !empty($year)){
      //  echo $contrat.' '.$mois.' '.$year;
        try{

            $retour["success"]=200;
            $retour["message"]='GET ALL PAYMENT';
            $retour["author"]='By Ibson';
            $query_="
            SELECT 
            pay.\"NUD\",
            prs.\"MAT\",
            pay.\"ENT\" ,
            CONCAT(prs.\"NOM\",' ', prs.\"PRE\") AS \"Nom prenoms\",
            pay.\"SLN\" ,
            pay.\"HNE\" ,
            pay.\"ASN\",
            pay.\"SAL\",
            pay.\"HNP\" ,
            prs.\"RIB\",
            prs.\"BQE\",
            pay.\"C2\" --type de contrat--
         FROM public.pos_tab_index_pay pay
         INNER JOIN public.pos_tab_index_prs prs
         ON pay.\"MEL\"=prs.\"MEL\"
         WHERE pay.\"C2\"='".$contrat."' AND EXTRACT(MONTH FROM pay.\"DAE\")='".$mois."' AND EXTRACT(YEAR FROM pay.\"DAE\")='".$year."' AND pay.\"MEL\" IS NOT NULL;
         
                ";
            $content_ = pg_query($conn,$query_)or die('Query failed: ' . pg_last_error());
            while ($rowcontent = pg_fetch_row($content_)) {
                    $retour["paies"][] = array(
                            'num'=> $rowcontent[0],
                            'matricule'=> $rowcontent[1] ?? '',
                            'entreprise'=> $rowcontent[2] ?? '',
                            'nom_complet'=> $rowcontent[3] ?? '',
                            'sal_net'=> $rowcontent[4] ?? 0,
                            'hono_net'=> $rowcontent[5] ?? 0,
                            'assurance'=> $rowcontent[6] ?? 0,
                            'sal_net_pay'=> $rowcontent[7] ?? 0,
                            'hono_net_pay'=> $rowcontent[8] ?? 0,
                            'rib'=> $rowcontent[9] ?? '',
                            'banque'=> $rowcontent[10] ?? '',
                            'contrat'=> $rowcontent[11] ?? ''
                    );
            }
            echo json_encode($retour, TRUE ); 

        }catch(Exception $e){
            $retour["error"]=400;
            $retour["message"]='Bad connexion '.$e;

        }
}

