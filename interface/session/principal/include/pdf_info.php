<?php

// Classes PDFInfo et PDFInfoPages
// les informations generique et pages ne sont jamais demandé ensemble 

// Author: de77.com
// Licence: MIT
// Homepage: http://de77.com/php/extract-title-author-and-number-of-pages-from-pdf-with-php
// Version: 21.07.2010


class PDFInfo
{
	public $author;
	public $title;
	public $subject;
	public $keywords;
	
	public function load($filename)
	{
		$string = file_get_contents($filename);
		
		$start = strpos($string, "<dc:title>") + 10;
		$length = strpos(substr($string, $start), '</dc:title>');

		$this->title = '';
		if ($length) 
		{
			$this->title = strip_tags(substr($string, $start, $length));
			$this->title = $this->pdfDecTxt($this->title);
		}
		
		$start = strpos($string, "<dc:creator>") + 12;
		$length = strpos(substr($string, $start), '</dc:creator>');
		$this->author = '';
		
		if ($length) 
		{
			$this->author = strip_tags(substr($string, $start, $length));
			$this->author = $this->pdfDecTxt($this->author);
		}
		
		$start = strpos($string, "<dc:description>") + strlen("<dc:description>");
		$length = strpos(substr($string, $start), '</dc:description>');
		$this->subject = '';
		
		if ($length) 
		{
			$this->subject = strip_tags(substr($string, $start, $length));
			$this->subject = $this->pdfDecTxt($this->subject);
		}
		
		$start = strpos($string, "<pdf:Keywords>") + strlen("<pdf:Keywords>");
		$length = strpos(substr($string, $start), '</pdf:Keywords>');
		$this->keywords = '';
		if ($length) 
		{
			$this->keywords = strip_tags(substr($string, $start, $length));
			$this->keywords = $this->pdfDecTxt($this->keywords);
		}
	}
		
	private function pdfDecTxt($txt)
	{
		$len = strlen($txt);
		$out = '';
		$i = 0;
		while ($i<$len)
		{
			if ($txt[$i] == '\\')
			{
				$out .= chr(octdec(substr($txt, $i+1, 3)));
				$i += 4;			
			}
			else
			{
				$out .= $txt[$i];
				$i++;
			}
		}
		
		if ($out[0] == chr(254))
		{
			$enc = 'UTF-16';
		}
		else
		{
			$enc = mb_detect_encoding($out);
		}

		return iconv($enc, 'UTF-8', $out);
	}
}

class PDFInfoPages
{
	public $pages;
	public $version;
	public $majeure;
	public $mineure;
	
	public function load($filename)
	{
		$string = file_get_contents($filename);
		
		$start = strpos($string, "%PDF-") + 5;
		$length = strpos(substr($string, $start), '%');
		$this->version = 'undefined';
		if ($length) 
		{
			$this->version = substr($string, $start, $length);
			$dot = strpos($this->version, ".");
			$this->majeure = substr($this->version, 0, $dot);
			$this->mineure = substr($this->version, $dot+1, $length);
		}	
		
		
		$firstValue = 0;
        $secondValue = 0;
        if(preg_match("/\/N\s+([0-9]+)/", $string, $matches)) {
            $firstValue = $matches[1];
        }
		
		$pos = 0;
		while (($p = $this->getPages($string, /*pref*/$pos)) !== 'undefined') {
			$secondValue = max($secondValue, $p);
		}

        $this->pages =  (($secondValue != 0) ? $secondValue : max($firstValue, $secondValue));
	}
	
	private function getPages ($string, &$pos) {
		$position = strpos($string, '/Type/Pages', $pos);
		if ($position !== false) {
			$objectEnd = strpos($string, '>>', $position);
			$objectBegin = strrpos($string, '<<', $position - strlen($string));
			
			$countPosition = strpos($string, '/Count ', $objectBegin);
			$pos = $objectEnd + 2;
			return (int) substr($string, $countPosition + 7);
		}
		$position = strpos($string, '/Type /Pages', $pos);
		if ($position !== false) {
			$objectEnd = strpos($string, '>>', $position);
			$objectBegin = strrpos($string, '<<', $position - strlen($string));
			
			$countPosition = strpos($string, '/Count ', $objectBegin);
			$pos = $objectEnd + 2;
			return (int) substr($string, $countPosition + 7);
		}
		return 'undefined';
	}
}
