<?php

if (!defined("FONCTION_FICHIERS"))
{
    define("FONCTION_FICHIERS",1);
    
    function return_bytes($val) {
        
        $val = trim($val);
        $last = strtolower($val[strlen($val)-1]);
        $val = substr($val, 0, (strlen($val)-1));
        switch($last) {
            // Le modifieur 'G' est disponible depuis PHP 5.1.0
            case 'g':
                $val *= 1024;
            case 'm':
                $val *= 1024;
            case 'k':
                $val *= 1024;
        }
        return $val;
    }
}
?>
