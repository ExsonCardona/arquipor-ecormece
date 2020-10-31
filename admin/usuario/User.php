<?php
include '../../database/Connection.php';

class User{
    public $rols = ['admin', 'cliente'];

    public function operation($sql){
        $connection = new Conexion();
        $conn = $connection->conectar();
        $statements = [len($sql)];
        for($i = 0; $i < len($sql); $i++){
            $operation = mysqli_query($con, $sql[i]);
            if($operation) $statements[i] = $operation;
            else $statements[i] = mysqli_errors($conn);
        }
        mysqli_close($conn);
        return $statements;
    }

    public function verify($username){
        $sql = "SELECT username FROM usuarios WHERE username = '$username' LIMIT 1";
        $operation = $this->operation($username);
        $operation = $operation[0];
        if($operation['username'] == $username) return true;
        else return false;
    }

    public function index($page){}

    public function create($data){
        // $conexion = new Conexion();
        // $con = $conexion->conectar();
        // $sql = "INSERT INTO productos VALUES(NULL, '$data[0]', '$data[1]', '$data[2]', '$data[3]', '$data[4]', '$data[5]', '$data[6]', CURDATE(), NOW())";
        // $retorno_query = mysqli_query($con, $sql);
        // // if(!$retorno_query) echo mysqli_error($con);
        // $id_registro = mysqli_insert_id($con);
        // $retorno = [$retorno_query, $id_registro];
		// mysqli_close($con);
        // return $retorno;
        $sql = "INSERT INTO usuarios VALUES(null, '$data[0]', '$data[1]', '$data[2]', '$data[3]', '$data[4]', '$data[5]', '$data[6]', CURDATE(), NOW())";
    }

    public function edit(){}

    public function update(){}

    public function delete(){}
}