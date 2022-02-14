<?php
if (!defined("DEBUG_INC"))
{
	define("DEBUG_INC",1);

	/*
	 * Affichage de l'erreur retournée par le serveur Poseidon
	 * dans une fenetre pop-up
	 */
	function debug ($jeton)
	{
	    echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">";
		echo "<script language=javascript>function effaceMenu(){}";
		//session perdue
		if (strlen($_SESSION["sess_application"]) == 0)
		{
		    include ("../../../../configuration/label_".CST_LANG.".conf");
            if (!$_COOKIE["PHPSESSID"])
			     echo "alert (\"".CST_ERR_SESSION_COOKIE."\")";
			else
			     echo "alert (\"".CST_ERR_SESSION_PERDUE_SERVEUR."\")";
		}
		else
		{
			$trans = array("\n" => "\\n", "\r\n" => "\\r\\n", "\"" => "\\\"");
			$msg = get_erreur_poseidon($jeton);
    		$msg = strtr($msg, $trans);

			if(strlen($msg) == 0)
			{
                echo "alert (\"".CST_ERR_SESSION_AUTRE."\")";
			}
			else 
			{
                echo "if (parent.posMessageBoxWarning) \n";
				echo "parent.posMessageBoxWarning (\"$msg\");\n";
                echo "else if (parent.parent.posMessageBoxWarning)\n";
                echo "parent.parent.posMessageBoxWarning (\"$msg\");";
                echo "else\n";
				echo "alert (\"$msg\");";
			}
		}
		echo "</SCRIPT>";
	}
	
	/*
	 * Affichage de la concaténation d'une liste de messages d'erreur
	 * dans une fenetre pop-up
	 */
	function debug_code($tabInfoDebug)
	{
	    // gestion des apostrophes : qu'elles soient déjà "escapé" ou pas
	    $trans = array("'" => "\'", "\\'" => "\'","\n" => "\\n");
	    echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">";
		echo "<script language=javascript>";
		echo "parent.posMessageBoxWarning('";
		for ($a=0; $a< count($tabInfoDebug); $a++)
		{
			echo strtr($tabInfoDebug[$a], $trans)."\\n";
		}
		echo "')";
		echo "</script>";
	}
    function debug_code_fichier($tabInfoDebug)
	{
	    // gestion des apostrophes : qu'elles soient déjà "escapé" ou pas
	    $trans = array("'" => "\'", "\\'" => "\'","\n" => "\\n");
	    echo "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">";
		echo "<script language=javascript>";
		echo "parent.parent.posMessageBoxWarning('";
		for ($a=0; $a< count($tabInfoDebug); $a++)
		{
			echo strtr($tabInfoDebug[$a], $trans)."\\n";
		}
		echo "')";
		echo "</script>";
	}

	/*
	 * Affichage de la concaténation d'un message d'erreur
	 * dans une page HTML
	 */
	function afficheMsg($msg)
	{
		echo "<HTML><HEAD><TITLE>Informations</TITLE>";
		echo "<LINK REL='stylesheet' TYPE='text/css' HREF='../../../../include/style/style.css'>";
		echo "</HEAD><BODY>";
		echo "<TABLE WIDTH=\"100%\"><TR><TD class=\"labelChamp\">";
		echo "<BR>".$msg;
		echo "</TD></TR></TABLE>";
		echo "</BODY></HTML>";
	}
}
?>