<?php

// ini_set('display_errors', 1);
// ini_set('display_startup_errors', 1);
// error_reporting(E_ALL);

class Connection{
	public function connect(){
		$connection = mysqli_connect('localhost', 'luis', 'luis', 'ecommerce');
		if($connection){
			// echo 'Conexion exitosa';
		}
		else {
			echo 'Error al conectar: ' . mysqli_error($conecction);
		}
		return $connection;
	}

}

// $Connection = new Connection();
// $connection = $Connection->connect();