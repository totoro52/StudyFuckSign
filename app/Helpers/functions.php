<?php
/**
 * Created by PhpStorm.
 * User: admin
 * Date: 2020/3/13
 * Time: 18:00
 */
function urlHandle($url){
    //去除host
    $url = substr($url,strpos($url,'?')+1);
    $data = explode('&',$url);
    $enc = '';
    foreach ($data as $key){
        if(strstr($key,'enc')){
            $enc = substr($key,strpos($url,'='));
            break;
        }
    }
    return $enc;
}

function is_json($string) {
    json_decode($string);
    return (json_last_error() == JSON_ERROR_NONE);
}

function headerHandle($header){
    $str = '';
    foreach($header as $key){
        $str .=$key.';';
    }
    return $str;
}
?>