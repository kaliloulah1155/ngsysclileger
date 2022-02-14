<?php 
include ("../../../../../configuration_w/mabd.php");
header('Access-Control-Allow-Origin:*');   // On peut changer * par le lien du site web autorisé
header("Access-Control-Allow-Headers: Authorization,Origin, X-Requested-With, Content-Type,Accept");
header('Content-Type:application/json');

$retour=array();

try {

    $destination=$_POST['destination'] ;
    $profil=$_POST['profil'];
    $qte=$_POST['qte'];



    $id_rq=0;
     //retrouvez les données à partir de l'id
     $frs_id=pg_query("SELECT
        \"COD\"
        FROM 
        public.pos_tab_index_frs WHERE  \"LOG\"='".$profil."' AND \"DTN\"='".$destination."'  ");
        
        while ($rowID = pg_fetch_row($frs_id)) {
            $id_rq=$rowID[0];
        }

        $retour["code"]=$id_rq;

        $k=1;
        $somme=0;

        $result = pg_query("SELECT * FROM public.mis_tab_besoins WHERE code_key='".$id_rq."' ");
        $find = pg_num_rows($result);

        if ($find!=0){

            $rq = pg_query("SELECT id, id_besoins, pu,code_key FROM public.mis_tab_besoins WHERE code_key='".$id_rq."' ");

            /////FIN AUTRES BESOIN /////////
            while ($row = pg_fetch_row($rq)) {
                 //besoins 

                 $rqtitle = pg_query($conn,"
                        SELECT DISTINCT id , libelle
                        FROM public.mis_besoins
                        WHERE id='".$row[1]."'
                   ");

                   while ($rowtitle = pg_fetch_row($rqtitle)) {
                        

                    $rqcontent = pg_query($conn,"
                                    SELECT id, libelle  
                                    FROM public.mis_besoins  WHERE id='". $row[1]."'
                                    ");
                                
                                while ($rowcontent = pg_fetch_row($rqcontent)) {
                                
                                    $retour['data'][]=[
                                        'id'=> intval($rowcontent[0]),
                                        'lib'=> ucwords($rowcontent[1]),
                                        'pu'=>intval($row[2]),
                                        'qte'=>1,
                                        'xof'=>intval($row[2])*1
                                    ];

                                    $somme+=intval($row[2])*1;
                                        $k++;
                                }


                }



            }

            /////FIN AUTRES BESOIN /////////

            ///BESOIN OBLIGATOIRE


            $frs_obl=pg_query("SELECT
            \"L1A\",\"L1B\",\"L1C\",\"L1D\",\"L1E\",\"K9\"
            FROM 
            public.pos_tab_index_frs WHERE  \"COD\"='".$id_rq."'   ");
        
        while ($rowobg = pg_fetch_row($frs_obl)) {
            $hotel= intval($rowobg[0]);
            $nourriture= intval($rowobg[1]);
            $depl_urb= intval($rowobg[2]);
            $assurance= intval($rowobg[3]);
            $transport= intval($rowobg[4]);

            $tot_pu= intval($rowobg[5]);
        }

            $retour['data'][]=[
                'id'=> $k,
                'lib'=>ucwords('hotel'),
                'pu'=>intval($hotel),
                'qte'=>intval($qte)-1,
                'xof'=>intval($hotel)*intval(intval($qte)-1)
            ];

            $somme+=intval($hotel)*intval(intval($qte)-1);

            $retour['data'][]=[
                'id'=> $k+1,
                'lib'=>ucwords('nourriture'),
                'pu'=>intval($nourriture),
                'qte'=>intval($qte),
                'xof'=>intval($nourriture)*intval($qte)
            ];
            $somme+=intval($nourriture)*intval($qte);

            $retour['data'][]=[
                'id'=> $k+2,
                'lib'=>ucwords('deplacement urbain'),
                'pu'=>intval($depl_urb),
                'qte'=>intval($qte),
                'xof'=>intval($depl_urb)*intval($qte)
            ];
            $somme+=intval($depl_urb)*intval($qte);

            $retour['data'][]=[
                'id'=> $k+3,
                'lib'=>ucwords('assurance'),
                'pu'=>intval($assurance),
                'qte'=>1,
                'xof'=>intval($assurance)*intval(1)
            ];
            $somme+=intval($assurance)*intval(1);

            $retour['data'][]=[
                'id'=> $k+4,
                'lib'=>ucwords('transport'),
                'pu'=>intval($transport),
                'qte'=>1,
                'xof'=>intval($transport)*intval(1)
            ];
            $somme+=intval($transport)*intval(1);
            

            $retour['tot_pu']= $tot_pu;
            $retour['tot_xof']=$somme;

            //////////////////////

        }else{
            $retour["error"]='not found';
        }

        echo json_encode($retour, TRUE );

}catch(Exception $e){
    $retour["error"]=400;
    $retour["message"]='Bad connexion '.$e;
}
