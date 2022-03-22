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
   Je voudrais porter à votre connaissance ma nouvelle domicialiation bancaire
   qui est <b> $banque </b> et mon nouveau RIB <b> $rib </b> . <br/> 
   Lien du site : <b> $lien </b> <br/>  
   Numéro demande : $numero <br/> 
   Cordialement.
</div>
";


/* 
   la fonction factmail prend en parametre le mail du receveur , l'ojet et le contenu 
*/
$final_response=$respfactory->factmail($emailput,$contentTitre,$output); 
echo json_encode($final_response);

 