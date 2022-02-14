<?php
/*
 * jQuery File Upload Plugin PHP Class 8.1.0
 * https://github.com/blueimp/jQuery-File-Upload
 *
 * Copyright 2010, Sebastian Tschan
 * https://blueimp.net
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/MIT
 */

class UploadHandler
{

    protected $options;
    protected $uploadDir;
    protected $jeton;
    protected $iNumDoc = null;
    protected $iIndConf;
    protected $iNivConf;
    protected $sCloison;
    protected $choixFichier;
    protected $nature;
    protected $iNbFilesInserted = 0;
    
    protected $uploadedFiles;
    protected $debug = 0;
    protected $tabLstNat = null;
    
    
    // PHP File Upload error message codes:
    // http://php.net/manual/en/features.file-upload.errors.php
    protected $error_messages = array(
        1 => 'The uploaded file exceeds the upload_max_filesize directive in php.ini',
        2 => 'The uploaded file exceeds the MAX_FILE_SIZE directive that was specified in the HTML form',
        3 => 'The uploaded file was only partially uploaded',
        4 => 'No file was uploaded',
        6 => 'Missing a temporary folder',
        7 => 'Failed to write file to disk',
        8 => 'A PHP extension stopped the file upload',
        'post_max_size' => 'The uploaded file(s) exceeds the post_max_size directive in php.ini',
        'max_file_size' => 'File is too big',
        'min_file_size' => 'File is too small',
        'accept_file_types' => 'Filetype not allowed',
        'abort' => 'File upload aborted'
    );

    function __construct($jeton, $uploadDir, $options = null) {
        $this->options = array(
            'param_name' => 'files',
            'access_control_allow_origin' => '*',
            'access_control_allow_credentials' => false,
            'access_control_allow_methods' => array('POST'),
            'access_control_allow_headers' => array(
                'Content-Type',
                'Content-Range',
                'Content-Disposition'
            ),
            // Defines which files (based on their names) are accepted for upload:
            'accept_file_types' => '/.+$/i',
            // The php.ini settings upload_max_filesize and post_max_size
            // take precedence over the following max_file_size setting:
            'max_file_size' => null,
            'min_file_size' => 1,
            // Set the following option to false to enable resumable uploads:
            'discard_aborted_uploads' => true
        );
        if ($options) {
            $this->options = $options + $this->options;
        }
        $this->uploadDir = $uploadDir;
        $this->jeton = $jeton;
        $uploadedFiles = array();
        $this->start();
    }
    
    protected function debug($msg) {
        if ($this->debug)
            error_log($msg);
    }

    protected function start() {
        if ($this->get_server_var('REQUEST_METHOD') == 'POST')
            $this->post();
        else
            $this->header('HTTP/1.1 405 Method Not Allowed');
    }

    protected function get_upload_path($file_name = null) {
        $file_name = $file_name ? $file_name : '';
        return $this->uploadDir.$file_name;
    }

    // Fix for overflowing signed 32 bit integers,
    // works for sizes up to 2^32-1 bytes (4 GiB - 1):
    protected function fix_integer_overflow($size) {
        if ($size < 0) {
            $size += 2.0 * (PHP_INT_MAX + 1);
        }
        return $size;
    }

    protected function get_file_size($file_path, $clear_stat_cache = false) {
        if ($clear_stat_cache) {
            if (version_compare(PHP_VERSION, '5.3.0') >= 0) {
                clearstatcache(true, $file_path);
            } else {
                clearstatcache();
            }
        }
        return $this->fix_integer_overflow(filesize($file_path));
    }

    protected function get_error_message($error) {
        return array_key_exists($error, $this->error_messages) ?
            $this->error_messages[$error] : $error;
    }

    function get_config_bytes($val) {
        $val = trim($val);
        $last = strtolower($val[strlen($val)-1]);
        switch($last) {
            case 'g':
                $val *= 1024;
            case 'm':
                $val *= 1024;
            case 'k':
                $val *= 1024;
        }
        return $this->fix_integer_overflow($val);
    }

    protected function validate($uploaded_file, $file, $error, $index) {
    
        if ($error) {
            $file->error = $this->get_error_message($error);
            return false;
        }
        $content_length = $this->fix_integer_overflow(intval(
            $this->get_server_var('CONTENT_LENGTH')
        ));
        $post_max_size = $this->get_config_bytes(ini_get('post_max_size'));
        if ($post_max_size && ($content_length > $post_max_size)) {
            $file->error = $this->get_error_message('post_max_size'); 
            return false;
        }
        if (!preg_match($this->options['accept_file_types'], $file->name)) {
            $file->error = $this->get_error_message('accept_file_types');
            return false;
        }
        if ($uploaded_file && is_uploaded_file($uploaded_file)) {
            $file_size = $this->get_file_size($uploaded_file);
        } else {
            $file_size = $content_length;
        }
        if ($this->options['max_file_size'] && (
                $file_size > $this->options['max_file_size'] ||
                $file->size > $this->options['max_file_size'])
            ) {
            $file->error = $this->get_error_message('max_file_size');
            return false;
        }
        if ($this->options['min_file_size'] &&
            $file_size < $this->options['min_file_size']) {
            $file->error = $this->get_error_message('min_file_size');
            return false;
        }
        
        return true;
    }

    protected function upcount_name_callback($matches) {
        $index = isset($matches[1]) ? intval($matches[1]) + 1 : 1;
        $ext = isset($matches[2]) ? $matches[2] : '';
        return ' ('.$index.')'.$ext;
    }

    protected function upcount_name($name) {
        return preg_replace_callback(
            '/(?:(?: \(([\d]+)\))?(\.[^.]+))?$/',
            array($this, 'upcount_name_callback'),
            $name,
            1
        );
    }

    protected function get_unique_filename($file_path, $name, $size, $type, $error,
            $index, $content_range) {
        while(is_dir($this->get_upload_path($name))) {
            $name = $this->upcount_name($name);
        }
        // Keep an existing filename if this is part of a chunked upload:
        $uploaded_bytes = $this->fix_integer_overflow(intval($content_range[1]));
        while(is_file($this->get_upload_path($name))) {
            if ($uploaded_bytes === $this->get_file_size(
                    $this->get_upload_path($name))) {
                break;
            }
            $name = $this->upcount_name($name);
        }
        return $name;
    }

    protected function fix_file_extension($file_path, $name, $size, $type, $error,
            $index, $content_range) {
        // Add missing file extension for known image types:
        if (strpos($name, '.') === false &&
                preg_match('/^image\/(gif|jpe?g|png)/', $type, $matches)) {
            $name .= '.'.$matches[1];
        }
        
        return $name;
    }

    protected function trim_file_name($file_path, $name, $size, $type, $error,
            $index, $content_range) {
        // Remove path information and dots around the filename, to prevent uploading
        // into different directories or replacing hidden system files.
        // Also remove control characters and spaces (\x00..\x20) around the filename:
        $name = trim(basename(stripslashes($name)), ".\x00..\x20");
        // Use a timestamp for empty filenames:
        if (!$name) {
            $name = str_replace('.', '-', microtime(true));
        }
        return $name;
    }

    protected function get_file_name($file_path, $name, $size, $type, $error,
            $index, $content_range) {
        $name = $this->trim_file_name($file_path, $name, $size, $type, $error,
            $index, $content_range);
        return $this->get_unique_filename(
            $file_path,
            $this->fix_file_extension($file_path, $name, $size, $type, $error,
                $index, $content_range),
            $size,
            $type,
            $error,
            $index,
            $content_range
        );
    }

    protected function handle_form_data($file, $index) {
    
        $this->debug("handle_form_data");
        $this->debug(print_r($_REQUEST, true));
        $this->iNumDoc = $_REQUEST["POS_NUM_DOC"];
        
        $this->iIndConf = isset($_REQUEST["POS_CONF_HAB"]) ? $_REQUEST["POS_CONF_HAB"] : 0;
        $this->iNivConf = isset($_REQUEST["POS_CONF_NIV"]) ? $_REQUEST["POS_CONF_NIV"] : 0;
        $this->sCloison = isset($_REQUEST["POS_CLOISON"]) ? $_REQUEST["POS_CLOISON"] : "";
        $this->choixFichier = isset($_REQUEST["choixFichier"]) ? $_REQUEST["choixFichier"] : "";
        $this->nature = isset($_REQUEST["nature"]) ? $_REQUEST["nature"] : "";
         
        // Handle form data, e.g. $_REQUEST['description'][$index]
    }
    
    protected function validateNature($filename, $file) {
    
        // extension du fichier
        $file->extension = null; 
        $pos = strrpos($filename, ".");
        if ($pos !== false) { 
            $file->extension = strtoupper(substr(strrchr($filename,'.'),1));
        }
        
        // deduction extension du fichier
        $file->nature = null;
        if ($file->extension != null) {
            $fileNature = "../../../../configuration_w/natures.conf";
            if (file_exists($fileNature)) {         				
    	       include $fileNature;
                // construction d'un tableau associant une extension à une nature 
                // dans le fichier, une nature peut être associé à plusieurs extensions
                $tabExtension = array();
                while(list($key,$value) = each($tabNatures))
                {
                    for($i=0; $i< count($value); $i++)
                        $tabExtension[$value[$i]] = $key;
                }
                if (isset($tabExtension[$file->extension]))
                    $file->nature = $tabExtension[$file->extension];
    
            }
        }
        
        if ($file->nature == null) {
            $file->error = "Nature inconnue";
            return false;   
        }
        else {
            if ($this->tabLstNat == null) {
                $this->tabLstNat = array();
                $retour = pos_getlistnatures($this->jeton, /*pref*/$this->tabLstNat);
            }
            if( !array_key_exists($file->nature, $this->tabLstNat)) {
                $file->error =  "La nature n'existe plus dans la base";
                return false; 
            } 
        }
        return true;
    }  
    
    protected function handle_file_upload($uploaded_file, $name, $size, $type, $error,
            $index = null, $content_range = null) {
            
        $file = new \stdClass();
        $file->name = $this->get_file_name($uploaded_file, $name, $size, $type, $error,
            $index, $content_range);
        $file->size = $this->fix_integer_overflow(intval($size));
        $file->type = $type;
        
        if ($this->validate($uploaded_file, $file, $error, $index)) {
        
            $this->handle_form_data($file, $index);
            $file_path = $this->get_upload_path($file->name);
            $append_file = $content_range && is_file($file_path) &&
                $file->size > $this->get_file_size($file_path);
            if ($uploaded_file && is_uploaded_file($uploaded_file)) {
                // multipart/formdata uploads (POST method uploads)
                if ($append_file) {
                    file_put_contents(
                        $file_path,
                        fopen($uploaded_file, 'r'),
                        FILE_APPEND
                    );
                } else {
                    move_uploaded_file($uploaded_file, $file_path);
                }
            } 
            $file_size = $this->get_file_size($file_path, $append_file);
            if ($file_size === $file->size) {
                if (strlen($this->nature) != 0 || $this->validateNature($file_path, $file))
                {
                    if ($this->iNumDoc != null) {
                    
                        $natureFile = (strlen($this->nature) != 0) ? $this->nature : $file->nature;
                        
                        if (strlen($this->choixFichier) != 0) {
                            list($iNumPage, $iNumSsPage) = sscanf($this->choixFichier, "%d.%d");
                            if ($iNumSsPage != 0)
                                $iNumSsPage += $this->iNbFilesInserted;
                            else
                                $iNumPage += $this->iNbFilesInserted;
                        }
                        else {
                            $iNumPage = 1;
                            $iNumSsPage = 0;
                            if(defined('UPLOAD_DND_ADD_IN_LAST_POSITION') && strcmp(UPLOAD_DND_ADD_IN_LAST_POSITION, "1") == 0) {
                                $retour = pos_getinfonumdoc($this->jeton, $this->iNumDoc, /*pref*/$objInfoNumDoc);
                            	if ($retour)
                            	    $iNumPage = $objInfoNumDoc->nb_pagereelle + 1;
                            }
                        }
                        
                        $this->debug($this->iNumDoc."::".$file_path);
                        $this->debug($this->iIndConf."::".$this->iNivConf."::".$this->sCloison);
                        $this->debug("nature:".$natureFile);
                        $retour = pos_ajoutepagenumdoc($this->jeton, $this->iNumDoc, $iNumPage, $iNumSsPage, 
                                        $this->iIndConf, $this->iNivConf, $this->sCloison, 
                                        $natureFile, "", utf8_decode($file->name), $file_path);
    					//error($jeton);
                        if ($retour) {
                            $file->bStatus = 1;
                            $this->iNbFilesInserted ++;
                        }
                        else {
                            $file->error = get_erreur_poseidon($this->jeton);
                        } 
                    }
                }
                unlink($file_path);
            } else {
                $file->size = $file_size;
                if (!$content_range && $this->options['discard_aborted_uploads']) {
                    unlink($file_path);
                    $file->error = $this->get_error_message('abort');
                }
            }
        }
        return $file;
    }

    protected function body($str) {
        echo $str;
    }
    
    protected function header($str) {
        header($str);
    }

    protected function get_server_var($id) {
        return isset($_SERVER[$id]) ? $_SERVER[$id] : '';
    }

    protected function generate_response($content) {

        include ("../include/json/JSON.php");
        $jsonService = new Services_JSON();
        $json = $jsonService->encode($content);
        $redirect = isset($_REQUEST['redirect']) ?
            stripslashes($_REQUEST['redirect']) : null;
        if ($redirect) {
            $this->header('Location: '.sprintf($redirect, rawurlencode($json)));
            return;
        }
        $this->head();
        if ($this->get_server_var('HTTP_CONTENT_RANGE')) {
            $files = isset($content[$this->options['param_name']]) ?
                $content[$this->options['param_name']] : null;
            if ($files && is_array($files) && is_object($files[0]) && $files[0]->size) {
                $this->header('Range: 0-'.(
                    $this->fix_integer_overflow(intval($files[0]->size)) - 1
                ));
            }
        }
        $this->body($json);
        return $content;
    }

    protected function get_singular_param_name() {
        return substr($this->options['param_name'], 0, -1);
    }

    protected function get_file_name_param() {
        $name = $this->get_singular_param_name();
        return isset($_REQUEST[$name]) ? basename(stripslashes($_REQUEST[$name])) : null;
    }

    protected function send_content_type_header() {
        $this->header('Vary: Accept');
        if (strpos($this->get_server_var('HTTP_ACCEPT'), 'application/json') !== false) {
            $this->header('Content-type: application/json');
        } else {
            $this->header('Content-type: text/plain');
        }
    }

    protected function send_access_control_headers() {
        $this->header('Access-Control-Allow-Origin: '.$this->options['access_control_allow_origin']);
        $this->header('Access-Control-Allow-Credentials: '
            .($this->options['access_control_allow_credentials'] ? 'true' : 'false'));
        $this->header('Access-Control-Allow-Methods: '
            .implode(', ', $this->options['access_control_allow_methods']));
        $this->header('Access-Control-Allow-Headers: '
            .implode(', ', $this->options['access_control_allow_headers']));
    }

    public function head() {
        $this->header('Pragma: no-cache');
        $this->header('Cache-Control: no-store, no-cache, must-revalidate');
        $this->header('Content-Disposition: inline; filename="files.json"');
        // Prevent Internet Explorer from MIME-sniffing the content-type:
        $this->header('X-Content-Type-Options: nosniff');
        if ($this->options['access_control_allow_origin']) {
            $this->send_access_control_headers();
        }
        $this->send_content_type_header();
    }

    public function post() {

        $this->debug(print_r($_FILES, true));
        $upload = isset($_FILES[$this->options['param_name']]) ?
            $_FILES[$this->options['param_name']] : null;
        // Parse the Content-Disposition header, if available:
        $file_name = $this->get_server_var('HTTP_CONTENT_DISPOSITION') ?
            rawurldecode(preg_replace(
                '/(^[^"]+")|("$)/',
                '',
                $this->get_server_var('HTTP_CONTENT_DISPOSITION')
            )) : null;
        // Parse the Content-Range header, which has the following form:
        // Content-Range: bytes 0-524287/2000000
        $content_range = $this->get_server_var('HTTP_CONTENT_RANGE') ?
            preg_split('/[^0-9]+/', $this->get_server_var('HTTP_CONTENT_RANGE')) : null;
        $size =  $content_range ? $content_range[3] : null;
        $files = array();
        if ($upload && is_array($upload['tmp_name'])) {
            // param_name is an array identifier like "files[]",
            // $_FILES is a multi-dimensional array:
            foreach ($upload['tmp_name'] as $index => $value) {
                $files[] = $this->handle_file_upload(
                    $upload['tmp_name'][$index],
                    $file_name ? $file_name : $upload['name'][$index],
                    $size ? $size : $upload['size'][$index],
                    $upload['type'][$index],
                    $upload['error'][$index],
                    $index,
                    $content_range
                );
            }
        } else {
            // param_name is a single object identifier like "file",
            // $_FILES is a one-dimensional array:
            $files[] = $this->handle_file_upload(
                isset($upload['tmp_name']) ? $upload['tmp_name'] : null,
                $file_name ? $file_name : (isset($upload['name']) ?
                        $upload['name'] : null),
                $size ? $size : (isset($upload['size']) ?
                        $upload['size'] : $this->get_server_var('CONTENT_LENGTH')),
                isset($upload['type']) ?
                        $upload['type'] : $this->get_server_var('CONTENT_TYPE'),
                isset($upload['error']) ? $upload['error'] : null,
                null,
                $content_range
            );
        }
        return $this->generate_response(
            array($this->options['param_name'] => $files));
    }
}
