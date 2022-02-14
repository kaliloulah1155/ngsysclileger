<?php
/*
 * DESCRIPTION : Module de connexion au serveur Poseidon
 *
 * AUTEUR : Sebastien Fleury / Gabrielle Guy
 * DATE de CREATION : 19/06/2001
 *
 * Donnees en entree : 
 *
 * MODIFICATIONS
 * 
 */

include ("../../../../configuration_w/constantesPHP.conf.php");
include("../include/md5.inc.php");
include("../include/fonction_cryptage.php");

if (!defined("CONNECT"))
{
	define("CONNECT", 1);
	
	define("DEBUG", 0);
	function connexion(&$jeton, $connexion_serveur=0, $szNvMdp = "")
	{
		static $bConnect = false;
		$retour = true;
		if (!$bConnect || ($connexion_serveur == 1))
		{	
			// compilation PHP en static : pas de chargement
			if (!function_exists ("pos_dllstartup"))
			{
				if (CST_UNIX)
					dl('php_vulcain.so');
				else
					dl('php_vulcain.dll');
			}
				
       		$retour = pos_dllstartup(/*pref*/$jeton);
	        
			//connexion a poseidon
			if ($retour)
			{
                $sessIdConnexion = ($connexion_serveur == 1) ? 0 : $_SESSION["sess_id_connexion"];  
                     
				$retour = pos_login($jeton, $_SESSION["sess_user_name"], decrypt_text($_SESSION["sess_passwd"], $_SESSION["sess_crypt_key"]), 
						$_SESSION["sess_application"], $_SESSION["sess_serveur"], $_SESSION["sess_port"], false, $_SESSION["sess_profil"], 
                         $_SERVER["REMOTE_ADDR"],
                         strlen($szNvMdp) == 0 ? 0 : 1,
                         strlen($szNvMdp) == 0 ? "" : decrypt_text($szNvMdp, $_SESSION["sess_crypt_key"]),
                         /*pref*/$sessIdConnexion);
				
				if ($retour)
				{
					$_SESSION["sess_id_connexion"] = $sessIdConnexion;
				    //$_SESSION["sess_user_name"] = $user_name;
					$bConnect = true;
                    if (defined('TIME_OUT_SESSION'))
                    {
                        if(!isset($_SESSION['decotime']))
                            $_SESSION['decotime'] = time();                  
                        if(time() > ($_SESSION['decotime'] + TIME_OUT_SESSION))
                        {
                            $_SESSION['deco_timeout_auto'] = 1;
                            pos_disconnect_serveur($jeton, 1);
                            $retour = false;
                        } 
                        else 
                            $_SESSION['decotime'] = time();            
                    }
                }
			}
		}
		
      return $retour;
	}
	
	function pos_connect_serveur_change_pwd(&$jeton, $szNvMdp)
	{
		$retour = connexion(/*pref*/$jeton, 1, $szNvMdp);
		return $retour;
	}
	
	function pos_connect_serveur(&$jeton)
	{
		$retour =  connexion(/*pref*/$jeton, 1);
		return $retour;
	}
   
	function pos_disconnect($jeton)
	{
		pos_disconnect_serveur($jeton, 0);
	}
	
	function pos_disconnect_serveur($jeton, $bDeconnexionFinale)
	{
		$retour = pos_logout($jeton, $bDeconnexionFinale);
		pos_dllcleanup($jeton);
	}

	function echec_connexion()
	{
        $urlDeconnexion = "../../../../interface/session/principal/attente/attente.php?URL=URL_DECONNECT&DECONNECT=1";
        echo "<SCRIPT>\n";
        echo "if (parent.isEcranPrincipal)\n";
        echo "{\n";
		echo "parent.location.href=\"$urlDeconnexion\";\n";
        echo "}\n";
        echo "else if (window.dialogArguments && window.dialogArguments.parent && window.dialogArguments.parent.isEcranPrincipal)\n";
		echo "{\n";
        echo "window.dialogArguments.parent.location.href=\"$urlDeconnexion\";\n";
        echo "close();\n";
        echo "}\n";
        echo "else if (opener.parent.isEcranPrincipal)\n";
		echo "{\n";
        echo "opener.parent.location.href=\"$urlDeconnexion\";\n";
        echo "close();\n";
        echo "}\n";
        echo "else\n";
        echo "alert(\"Veuillez vous déconnecter\");\n";
		echo "</SCRIPT>\n";
	}
    
    function get_erreur_poseidon($jeton)
	{
        if (isset($_SESSION['deco_timeout_auto']) && $_SESSION['deco_timeout_auto'] == 1)
        {
            include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
		    $msg = CST_TIME_OUT_SESSION;
        }
        else
        {
    	    pos_geterreur($jeton, /*pref*/$tabErreur);
    		$msg = $tabErreur["msg2"];
    		if (strlen($msg) == 0)
    			$msg = $tabErreur["msg1"];
        }
		return $msg;
	}
	
	function getmicrotime()
	{
	     list($usec, $sec) = explode(" ",microtime());
		  return ((float)$usec + (float)$sec);
	}
}
   
?>
