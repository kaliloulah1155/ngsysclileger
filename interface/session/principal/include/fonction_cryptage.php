<?php

if (!defined("CRYPTAGE"))
{
	define("CRYPTAGE",1);


function decrypt_text($text,$password)
{
	
  $data = array();
  $key = array();
  $hash = array();

  $data = base64_decode_crypt($text);
 
  for ($i=0;$i<8;$i++)
  {
    $key[$i] = $data[$i];
  }

  for ($j=0;$j<strlen($password);$j++) 
  	$key[$i+$j] = ord(substr($password, $j, 1));

  $hash = calcmd5($key,0);

  $data = mc4($data,$hash);

  $resultat = "";
  
  for ($i=8;$i<count($data);$i++) {
  	
  	$resultat.=chr($data[$i]);
  }
  return $resultat;
}

function base64_decode_crypt($text)
{
  $j=0;
  $data = array();
  $text = base64_filter($text);
  for ($i=0;$i<strlen($text);$i+=4)
  {
    $car0 = let2num(ord(substr($text, $i, 1))); 
    $car1 = let2num(ord(substr($text, $i+1, 1))); 
    $car2 = let2num(ord(substr($text, $i+2, 1))); 
    $car3 = let2num(ord(substr($text, $i+3, 1))); 
    if (($car0 > -1) && ($car1>-1)) $data[$j++] = ($car0 << 2) | ($car1 >> 4);
    if (($car1 > -1) && ($car2>-1)) $data[$j++] = (($car1 & 15) << 4) | ($car2 >> 2);
    if (($car2 > -1) && ($car3>-1)) $data[$j++] = (($car2 & 3) << 6) | ($car3);
  }
  
  return $data;
}

function mc4($data,$key)
{
  $tab1 = array();
  $tab2 = array();
  $resultat = array();
  for ($i=0;$i<256;$i++)
  {
    $tab1[$i] = $i;
    $tab2[$i] = $key[$i%(count($key))];
  }
  $j=0;
  for ($i=0;$i<256;$i++)
  {
    $j= ($j+ $tab1[$i] + $tab2[$j])%256;
    $temp = $tab1[$i];
    $tab1[$i] = $tab1[$j];
    $tab1[$j] = $temp;
  }
  $i=0;$j=0;
  for ($k=0;$k<count($data);$k++)
  {
    $i = ($i+1)%256;
    $j = ($j+$tab1[$i])%256;
    $temp = $tab1[$i];
    $tab1[$i] = $tab1[$j];
    $tab1[$j] = $temp;
    $resultat[$k] = $data[$k] ^ $tab1[($tab1[$i] + $tab1[$j])%256];
  }
  return $resultat;
}

function base64_filter($text)
{
  $resultat = "";
  for ($i=0;$i<strlen($text);$i++)
  {
  	
    $ordinal = ord(substr($text, $i, 1)); 
    if ((($ordinal>47) && ($ordinal<58)) || (($ordinal>64) && ($ordinal<91)) || (($ordinal>96) && ($ordinal<123)) || ($ordinal==43) || ($ordinal==47) || ($ordinal==61))
    {
      $resultat .= substr($text, $i, 1);
    }
  }
  
  return $resultat;
}

function let2num($let)
{
  $ordinal = $let;
  if (($ordinal>47) && ($ordinal<58)) return ($ordinal +4);
  if (($ordinal>64) && ($ordinal<91)) return ($ordinal-65);
  if (($ordinal>96) && ($ordinal<123)) return ($ordinal-71);
  if ($ordinal==43) return 62;
  if ($ordinal==47) return 63;
  if ($ordinal==61) return -1;
  return -1;
}

}

?>