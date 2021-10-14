<?php
include ('../../../../../configuration_w/mabd.php');

$activites= $_GET['activites'] ;

$taches= $_GET['taches'] ;

$heureins= $_GET['heureins'] ;

$heureouts= $_GET['heureouts'] ;

$durees= $_GET['durees'] ;

$taux= $_GET['taux'] ;

$resultats= $_GET['resultats'] ;

$datechck=$_GET['datechck'] ;

$userinfo=$_GET['userinfo'] ;

$nom=$_GET['nom'] ;

$prenom=$_GET['prenom'] ;

$fonction=$_GET['fonction'] ;

$departement=$_GET['departement'] ;

$dureetotale=$_GET['dureetotale'] ;


$tauxjournaliere=$_GET['tauxjournaliere'] ;



$result = pg_query("SELECT * FROM public.pos_tab_index_tms WHERE \"CRE\"='".$userinfo."' AND \"DXT\"='".$datechck."' AND \"DPT\"='".$departement."' ");
$find = pg_num_rows($result);

//echo $find . " ligne(s) retournee(s).\n";

if ($find!=0){

      
    //trouve
    if(!empty($activites[0]) AND  !empty($taches[0])  AND !empty($heureins[0])  AND !empty($heureouts[0]) AND !empty($durees[0]) AND !empty($taux[0]) AND !empty($resultats[0] ) ){ // verification si les données de la premiere ligne n'est pas vide

          pg_query("ALTER TABLE public.pos_tab_index_tms DISABLE TRIGGER ALL ");
          pg_query(" DELETE FROM public.pos_tab_index_tms WHERE \"CRE\"='".$userinfo."' AND \"DXT\"='".$datechck."' AND \"DPT\"='".$departement."' ");

       
 
       foreach ($activites as $key => $v) {

            if(!empty($v) AND !empty($taches[$key])  AND !empty($heureins[$key])  AND !empty($heureouts[$key]) AND !empty($durees[$key]) AND !empty($taux[$key]) AND !empty($resultats[$key]) ){

              /* echo 'Taux journaliere : '.$tauxjournaliere .' DUREE TOTALE : '.$dureetotale .' LOG : '.$userinfo .' Activite : '.$v .'  Tache : '.$taches[$key].'  Heure in : '.$heureins[$key].'  Heure out : '.$heureouts[$key].'  Duree : '.$durees[$key].'  Taux : '.$taux[$key].'  resultat : '.$resultats[$key].'  Date  : '.$datechck.'  nom  : '.$nom.'  prenom  : '.$prenom.'  fonction  : '.$fonction.'  departement  : '.$departement.'</br>'; */

                   $query1="INSERT INTO public.pos_tab_index_tms(
                            \"CRE\" ,
                            \"U2\" ,
                            \"L2\",
                            \"W2\",
                            \"X2\",
                            \"Y2\",
                            \"Z2\",
                            \"T2\",
                            \"DJ1\",
                            \"TAC\",
                            \"DXT\",
                            \"NOM\",
                            \"PRE\",
                            \"FON\",
                            \"DPT\"

                            ) 
                            VALUES(
                                '".$userinfo."',
                                '".$v."',
                                '".$taches[$key]."',
                                '".$heureins[$key]."',
                                '".$heureouts[$key]."',
                                '".$durees[$key]."',
                                '".$taux[$key]."',
                                '".$resultats[$key]."',
                                '".$dureetotale."',
                                '".$tauxjournaliere."',
                                '".$datechck."',
                                '".$nom."',
                                '".$prenom."',
                                '".$fonction."',
                                '".$departement."'
                            ); ";

                    pg_query($query1) or die("Error while insert"); 

           }

       }
         echo "Enregistrement effectue avec succes <br/>";
    }else{
            echo "Veuillez renseigner les taches correctements<br/>";
    }

}else{
     
     //nom trouve

    

     if(!empty($activites[0]) AND  !empty($taches[0])  AND !empty($heureins[0])  AND !empty($heureouts[0]) AND !empty($durees[0]) AND !empty($taux[0]) AND !empty($resultats[0] ) ){ // verification si les données de la premiere ligne n'est pas vide

         
 
       foreach ($activites as $key => $v) {

            if(!empty($v) AND !empty($taches[$key])  AND !empty($heureins[$key])  AND !empty($heureouts[$key]) AND !empty($durees[$key]) AND !empty($taux[$key]) AND !empty($resultats[$key]) ){

           /* echo 'Taux journaliere : '.$tauxjournaliere .' DUREE TOTALE : '.$dureetotale .' LOG : '.$userinfo .' Activite : '.$v .'  Tache : '.$taches[$key].'  Heure in : '.$heureins[$key].'  Heure out : '.$heureouts[$key].'  Duree : '.$durees[$key].'  Taux : '.$taux[$key].'  resultat : '.$resultats[$key].'  Date  : '.$datechck.'  nom  : '.$nom.'  prenom  : '.$prenom.'  fonction  : '.$fonction.'  departement  : '.$departement.'</br>';*/

                    $query2="INSERT INTO public.pos_tab_index_tms(
                            \"CRE\" ,
                            \"U2\" ,
                            \"L2\",
                            \"W2\",
                            \"X2\",
                            \"Y2\",
                            \"Z2\",
                            \"T2\",
                            \"DJ1\",
                            \"TAC\",
                            \"DXT\",
                            \"NOM\",
                            \"PRE\",
                            \"FON\",
                            \"DPT\"

                            ) 
                            VALUES(
                                '".$userinfo."',
                                '".$v."',
                                '".$taches[$key]."',
                                '".$heureins[$key]."',
                                '".$heureouts[$key]."',
                                '".$durees[$key]."',
                                    '".$taux[$key]."',
                                    '".$resultats[$key]."',
                                    '".$dureetotale."',
                                    '".$tauxjournaliere."',
                                    '".$datechck."',
                                    '".$nom."',
                                    '".$prenom."',
                                    '".$fonction."',
                                    '".$departement."'
                            ); ";

                    pg_query($query2) or die("Error while insert");

                     
         



           }

       }
         echo "Enregistrement effectue avec succes <br/>";
    }else{
            echo "Veuillez renseigner les taches correctements<br/>";
    }

      
    
}



 









