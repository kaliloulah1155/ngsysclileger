<?php 
    include ('../../../../../../configuration_w/mabd.php');

 ini_set('display_errors', 1);
 
 if(!empty($_FILES)){
     $file_name=$_FILES['file']['name'];
    $file_extension=strrchr($file_name,".");

    $file_tmp_name=$_FILES['file']['tmp_name'];
     $file_dest='D:/users/NGSYSTEST/importdonnees/contrat/'.basename($file_name);

    $extensions_autorisees=array('.csv','.CSV');
    if(in_array($file_extension,$extensions_autorisees)){

         if(move_uploaded_file($file_tmp_name,$file_dest)){

                  //DELETE BEFORE INSERT

          $result = pg_query("SELECT file_url FROM public.uploadfile WHERE file_url='".$file_dest."'  ");
          $find = pg_num_rows($result);

              if($find!=0){
                  pg_query("DELETE FROM public.uploadfile WHERE file_url='".$file_dest."' ");
              }
               /////////////INSERT DATA INTO UPLOADFILE //////////
              
               $query2="INSERT INTO public.uploadfile(
                  name, file_url)
                  VALUES (  
                         '".$file_name."',
                          '".$file_dest."' 
                            );
                            "; 
                  pg_query($query2) or die("Error while insert");
 
                  //'Fichier envoyé avec succès';
             echo 1;
         }else{
             // "Une erreur est survenue lors de l'envoi du fichier ";
             echo 0;
         }
      
    }else{
        //'Seuls les fichiers CSV sont autorisés';
        echo 2;
    }

 }