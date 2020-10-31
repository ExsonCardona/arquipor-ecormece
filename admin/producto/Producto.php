<?php

include_once '../../init.php';
include_once '../../database/Connection.php';

class Producto{

    // INDEX
	public function index($pagina=0, $categoria=''){
		$connection = new Connection();
        $con = $connection->connect();
        $sql_datos = '';
        $sql_cantidad = '';
        if(empty($categoria)) {
            $sql_datos = "SELECT * FROM productos ORDER BY actualizado DESC LIMIT $pagina, 15";
            $sql_cantidad = "SELECT COUNT(*) AS cantidad from productos";
        }
        else {
            $sql_datos = $sql_datos = "SELECT p.id, p.nombre, p.descripcion, p.imagen, p.precio_base, p.precio_venta, p.cantidad, p.cantidad_minima, p.creado, p.actualizado, c.nombre FROM productos p INNER JOIN categoria_producto c_p ON c_p.producto_id = p.id INNER JOIN categorias c ON c.id = c_p.categoria_id WHERE c.nombre = '$categoria' ORDER BY p.actualizado DESC LIMIT $pagina, 15";
            $sql_cantidad = "SELECT COUNT(*) AS cantidad FROM productos p INNER JOIN categoria_producto c_p ON c_p.producto_id = p.id INNER JOIN categorias c ON c.id = c_p.categoria_id WHERE c.nombre = '$categoria'";
        }
        $datos = mysqli_query($con, $sql_datos);
        $cantidad = mysqli_fetch_array(mysqli_query($con, $sql_cantidad));
        $retorno = [
            'registros' => $datos,
            'cantidad' => $cantidad,
        ];
		mysqli_close($con);
		return $retorno;
	}

	// CRUD
	public function create($data){
		$connection = new Connection();
        $con = $connection->connect();
        $sql = "INSERT INTO productos VALUES(NULL, '$data[0]', '$data[1]', '$data[2]', '$data[3]', '$data[4]', '$data[5]', '$data[6]', CURDATE(), NOW())";
        $retorno_query = mysqli_query($con, $sql);
        // if(!$retorno_query) echo mysqli_error($con);
        $id_registro = mysqli_insert_id($con);
        $retorno = [$retorno_query, $id_registro];
		mysqli_close($con);
		return $retorno;
	}

	public function edit($id){
		$connection = new Connection();
        $con = $connection->connect();
        $sql = "SELECT * FROM productos WHERE id='$id'";
        $retorno = mysqli_fetch_array(mysqli_query($con, $sql));
        // if(!$retorno) echo mysqli_error($con);
		mysqli_close($con);
		return $retorno;
	}

	public function update($id, $data){
		$connection = new Connection();
        $con = $connection->connect();
        $sql = "UPDATE productos SET nombre='$data[0]', descripcion='$data[1]', imagen='$data[2]', precio_base='$data[3]', precio_venta='$data[4]', cantidad='$data[5]', cantidad_minima='$data[6]', actualizado=NOW() WHERE id='$id'";
        $retorno = mysqli_query($con, $sql);
		mysqli_close($con);
		return $retorno;
	}

	public function delete($id){
		$connection = new Connection();
        $con = $connection->connect();
        $sql = "DELETE FROM productos WHERE id='$id'";
        $retorno = mysqli_query($con, $sql);
        if($retorno) return true;
        else return false;
	}
	// FINAL CRUD
}