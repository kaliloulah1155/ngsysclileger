<?php 

 include('factory_email.php');
 header('Content-Type:application/json');
 ini_set('display_errors', 1);



$respfactory=new FactoryMail;
$emailput=$_POST['sendemail'];  // email du destinataire
// $destinataire=$_POST['destinataire'] ; // nom &prenoms du destinataire
$destinateur=$_POST['destinateur'] ; // nom &prenoms du destinateur
$lien=$_POST['lien'] ;  // lien du site web 
$objet=$_POST['objet']; // demande d'absence
$numero=$_POST['numero'];  
$banque=$_POST['banque'];  
$rib=$_POST['rib'];  
$nomPrenomEmploye=$_POST['nomPrenomEmploye'];
 // email du receveur
$contentTitre=$objet.' de '.$nomPrenomEmploye; // Objet du mail


$output ="
 
<div style='font-size:20px'>
   Bonjour <b> $destinateur </b> ,<br/><br/>
   <b> $nomPrenomEmploye </b>  porte à votre connaissance sa nouvelle domiciliation bancaire qui est
   <b> $banque </b> et mon nouveau RIB <b> $rib </b>  Veuillez vous connecter sur <b> $lien </b> pour 
   la transmission de ces nouvelles informations bancaires. <br/> 
   Numéro demande : $numero <br/> 
   Cordialement.
</div>
";


/* 
   la fonction factmail prend en parametre le mail du receveur , l'ojet et le contenu 
*/
$final_response=$respfactory->factmail($emailput,$contentTitre,$output); 
echo json_encode($final_response);

 