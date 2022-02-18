<?php

//NB : Veuillez configurer CURL au prealable dans apache avant son utilisation (voir documentat apache)
//Veuillez configurer également le htaccess dans apache

include('endpoint.php');

class LibCurl{

    public $datas; 

   //POST METHOD
    function postlibCurl(string $url,array $dataString):?array{
        $myip=new Ipconfig;
        $adresseip=$myip->apiAdress();
        $curl=curl_init($adresseip."{$url}");
        curl_setopt($curl,CURLOPT_SSL_VERIFYPEER,false);
        curl_setopt($curl,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl,CURLOPT_TIMEOUT,1000);
        curl_setopt($curl,CURLOPT_HTTPHEADER,[
            'cache-control: no-cache',
            'Content-Type: application/json'
        ]);

        curl_setopt($curl, CURLOPT_POST,1);
        curl_setopt($curl, CURLOPT_POSTFIELDS, json_encode($dataString));
        curl_setopt($curl, CURLINFO_HEADER_OUT, true);
        curl_setopt($curl, CURLOPT_VERBOSE, 1);
        $data=curl_exec($curl);
        $result=[];

        if($data==false){
            var_dump(curl_error($curl));
        }else{
            $data=json_decode($data,true);
            $result=$data;
        }
        curl_close($curl);
       return  $result;
    }


//fin
}