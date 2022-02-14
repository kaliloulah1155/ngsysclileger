<?php
if (!defined("UTIL_HTML_INC"))
{
	define("UTIL_HTML_INC",1);
	function openHtml($title)
	{
		echo "<HTML>\n<HEAD>\n";
		echo "<LINK REL=\"stylesheet\" TYPE=\"text/css\" HREF=\"../../../../include/style/style.css\">\n";
		echo "<TITLE>$title</TITLE>\n";
		echo "</HEAD>\n<BODY>\n";
	}

	function closeHtml()
	{
		echo "</BODY>\n<HTML>\n";
	}
}
?>