<?php
//25.07.2007 PL les variables issues de GET et POST sont recuperees par $_REQUEST
//les tableaux superglobaux sont nomm�s en conformit� avec register_global=Off
session_start();
?>
<HTML>
<HEAD>
	<TITLE>...</TITLE>
<?php
include ("../../../../configuration_w/constantesPHP.conf.php");
include ("../../../../configuration/label_".$_SESSION["sess_langue"].".conf");
include ("../../../../configuration/url.conf.php");
include ("../include/form_values.inc.php");
echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"".URL_SITE."/include/style/style.css\">";
$sUrlSubmit = (substr($_REQUEST['URL'], 0, 4 ) === "URL_") ? constant($_REQUEST['URL']) : $_REQUEST['URL'];
?>
	<SCRIPT language="javascript">
	function lancer_traitement()
	{
		document.principal.action= "<?php echo $sUrlSubmit ?>";
		document.principal.submit();
	}      
	function effaceMenu()
    {
        // on ne fait rien le menu n'existe pas.
        // utilis� par les rub tableaux
    }
	</SCRIPT>
</HEAD>
<BODY onLoad="lancer_traitement()">
<CENTER>

<?php
function is_associative_array($var) 
{
	return is_array($var) && !is_numeric( implode( array_keys( $var ) ) );
}
echo "<FORM name=\"principal\" method=\"".$_SERVER['REQUEST_METHOD']."\">";
$szHttpVar = "_".$_SERVER['REQUEST_METHOD'];
foreach($$szHttpVar as $key => $val)
{
	if (is_array($val)) 
	{
		if (is_associative_array($val)) 
		{
			while(list($key1,$val1) = each($val))
                echo "<INPUT TYPE=HIDDEN NAME=".$key."[".$key1."] VALUE=\"".htmlentities_currentcharset($val1, ENT_QUOTES)."\">\n";
		}
		else 
	    {	    
	        $value = "";
		    for($i=0; $i < count($val); $i++)
		        $value .= htmlentities_currentcharset($val[$i], ENT_QUOTES) . ";";
	        echo "<INPUT TYPE=HIDDEN NAME=".$key." VALUE=\"".$value."\">\n";
		}
	}
	else
	{
		if (strcmp($key, "URL") != 0)
		echo "<INPUT TYPE=HIDDEN NAME=".$key." VALUE=\"".htmlentities_currentcharset($val, ENT_QUOTES)."\">\n";
	}
}
if(!isset($_REQUEST['DECONNECT']))
	echo "<IMG src=\"".URL_SITE."/images/icons/attente.gif\">&nbsp;&nbsp;<br><br><b>".CST_LIBELLE_ATTENTE."</b>";
else
	echo "<IMG src=\"".URL_SITE."/images/icons/attente.gif\">&nbsp;&nbsp;<br><br><b>".CST_LIBELLE_DECONNECT."</b>";

?>
</CENTER>
</FORM>
</BODY>
</HTML>