 <?php 
header('Content-Type:application/json');
include ('../../../../../configuration_w/mabd.php');
 

$retour=array();

 
 try{

     $retour["success"]=200;
     $retour["message"]='GET ALL PROFILS';
     $retour["author"]='By Ibson';
     $query_="
            SELECT
                id,libelle
            FROM 
                public.mis_profils
         ";
      $content_ = pg_query($conn,$query_)or die('Query failed: ' . pg_last_error());
       while ($rowcontent = pg_fetch_row($content_)) {
              $retour["profils"][] = array(
                        'id'=> $rowcontent[0],
                       'valeur'=> $rowcontent[1]
            );
       }
     echo json_encode($retour, TRUE ); 

 }catch(Exception $e){
     $retour["error"]=400;
     $retour["message"]='Bad connexion '.$e;

 }