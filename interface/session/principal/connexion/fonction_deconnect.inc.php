<?php

function actionOnDeconnexion() {

    $retour = connexion(/*pref*/$jeton);
    
    if ($retour)
    {
    	$retour = libere_tous_docs($jeton);
    	// Deconnexion.
    	pos_disconnect_serveur($jeton, 1);
    }
    // suppression des fichiers temporaires
    delRepTmpSession(session_id());
    delRepDavSession(session_id());
    
    //session_destroy();
    foreach($_SESSION as $key => $val)
    {
        if(strcmp($key,"sess_crypt_key")!= 0) {
    	   //session_unregister($key);
    	   unset($_SESSION[$key]);
        }
    }
    return $retour;
}
?>