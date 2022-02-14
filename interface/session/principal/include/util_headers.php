<?php
function writeHeadersNoCache()
{
    header("Content-Type: text/html; charset=ISO-8859-1");
    // R�gl� pour expirer dans un pass� lointain.
    header("Expires: Sat, 6 May 1995 12:00:00 GMT");
    // R�glage des en-t�tes no-cache HTTP/1.1 standard.
    header("Cache-Control: no-store, no-cache, must-revalidate");
    // R�glage des en-t�tes no-cache HTTP/1.1 �tendues de IE (utilise addHeader).
    header("Cache-Control: post-check=0, pre-check=0");
    // R�glage de l'en-t�tes no-cache HTTP/1.0 standard.
    header("Pragma: no-cache"); 
}
?>
