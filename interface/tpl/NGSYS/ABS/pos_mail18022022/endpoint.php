<?php
class Ipconfig{
   public $ip ='';
   public function apiAdress(){
    $this->ip='http://ngservasgateway.com:4200/push/';   //api pilotant le push mail 
   	    return $this->ip;
   }
}