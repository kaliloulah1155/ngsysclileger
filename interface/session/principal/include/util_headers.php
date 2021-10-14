<?php
function writeHeadersNoCache()
{
    header("Content-Type: text/html; charset=ISO-8859-1");
    // Réglé pour expirer dans un passé lointain.
    header("Expires: Sat, 6 May 1995 12:00:00 GMT");
    // Réglage des en-têtes no-cache HTTP/1.1 standard.
    header("Cache-Control: no-store, no-cache, must-revalidate");
    // Réglage des en-têtes no-cache HTTP/1.1 étendues de IE (utilise addHeader).
    header("Cache-Control: post-check=0, pre-check=0");
    // Réglage de l'en-têtes no-cache HTTP/1.0 standard.
    header("Pragma: no-cache"); 
}
?>
