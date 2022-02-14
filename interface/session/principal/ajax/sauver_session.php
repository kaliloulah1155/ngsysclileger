<?php
// connexion pour ne pas perdre la session php ni poseidon
session_start();
include ("../include/connexion.inc.php");
$retour = connexion($jeton);
if ($retour)
{ 
	pos_disconnect($jeton);
}
?>
 
