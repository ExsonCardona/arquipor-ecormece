<?php

include_once '../../init.php';

class Imagen{
    public $extensions = [
        'image/png' => 'png',
        'image/jpeg' => 'jpeg',
        'image/jpg' => 'jpg'
    ];

    public $path = '../../media/producto/';
    public $max_size = 5 * 1024 * 1024;

    public function allowedFormat($format){
        if(in_array($format, $this->extensions)) return true;
        else return false;
    }

    public function allowedSize($size){
        if($size > $this->max_size) return false;
        else return true;
    }
}