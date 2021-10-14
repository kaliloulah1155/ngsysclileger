<?php
//25.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
//les tableaux superglobaux sont nommés en conformité avec register_global=Off
session_start();
?>
<HTML>
<HEAD>
	<TITLE>...</TITLE>
<?php
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../include/form_values.inc.php");
echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
?>
	<SCRIPT language="javascript">

	function lancer_traitement()
	{
	    //if(document.principal.POS_TYPEDOC.value == "RAD")
	    //    numOnglet = 3;
	    //else if(document.principal.POS_TYPEDOC.value == "RAP")
	    //    numOnglet = 4;
	    //else if(document.principal.POS_TYPEDOC.value == "DEL")
	    //    numOnglet = 1;
	    //else
	    numOnglet = 2;
	    
		document.principal.action=document.principal.URL.value+"#ONGLET_"+numOnglet;
		document.principal.submit();
	}

	function effaceMenu()
    {
        // on ne fait rien le menu n'existe pas.
        // utilisé par les rub tableaux
    }

	</SCRIPT>
</HEAD>

<BODY onLoad="lancer_traitement()">

<CENTER>

<?php

echo "<FORM name=\"principal\" method=\"".$_SERVER['REQUEST_METHOD']."\">";

$szHttpVar = "_".$_SERVER['REQUEST_METHOD'];

while(list($key,$val) = each($$szHttpVar))
{
	if (is_array($val))
    {	    
	    for($i=0; $i < count($val); $i++)
            echo "<INPUT TYPE=HIDDEN NAME=".$key."[] VALUE=\"".htmlentities_currentcharset(stripslashes($val[$i]),ENT_QUOTES)."\">\n";
	}
	else
		echo "<INPUT TYPE=HIDDEN NAME=".$key." VALUE=\"".htmlentities_currentcharset(stripslashes($val),ENT_QUOTES)."\">\n";
	    
}
echo "<IMG src=\"".URL_SITE."/images/icons/attente.gif\">&nbsp;&nbsp;<br><br><b>".CST_LIBELLE_ATTENTE."</b>";
?>
</CENTER>
</FORM>
</BODY>
</HTML>