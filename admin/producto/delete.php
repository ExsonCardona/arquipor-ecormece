<?php

include '../../init.php';
include 'Producto.php';
include '../imagen/Imagen.php';

$Producto = new Producto();
$Imagen = new Imagen();

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
	if (isset($_POST['submit'])) {
		// drop image first
		$producto = $Producto->edit($_POST['id']);
		if(file_exists($Imagen->path . $producto['imagen'])){
			unlink($Imagen->path . $producto['imagen']);
		}
		if($Producto->delete($_POST['id'])) header('location:index.php?info=' . 'Registro eliminado');
		else echo 'todo fallo corran que va a explotar';
	}
}