<?php
include_once '../../database/Connection.php';

class Categoria{
    public function categorias(){
        $connection = new Connection();
        $conn = $connection->connect();
        $sql = "SELECT nombre FROM categorias";
        $retorno = mysqli_query($conn, $sql);
        // if(!$retorno_query) echo mysqli_error($con);
		mysqli_close($conn);
		return $retorno;
    }
}