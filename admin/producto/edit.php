<?php

include 'Producto.php';
include '../imagen/Imagen.php';

$productos = new Producto();
$imagen = new Imagen();
if(isset($_GET['id'])){
    $producto = $productos->edit($_GET['id']);
}



?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form method="POST" action="edit_action.php" enctype="multipart/form-data">
        <input type="hidden" name="producto_id" value="<?= $producto['id'] ?>">
		<label for="nombre">
			Nombre:
			<input type="text" name="nombre" id="nombre" value="<?= $producto['nombre'] ?>" maxlength="45" required>
		</label>
		<br>
		<label for="descripcion">
			Descripcion:
			<input type="text" name="descripcion" id="descripcion" value="<?= $producto['descripcion'] ?>" maxlength="250" requiered>
		</label>
		<br>
		<label for="imagen">
			Imagen:
			<input type="file" name="imagen" id="imagen">
		</label>
		<br>
		<label for="precio_base">
			Precio base:
			<input type="number" step="any" name="precio_base" id="precio_base" value="<?= $producto['precio_base'] ?>" required>
		</label>
		<br>
		<label for="precio_venta">
			Precio venta:
			<input type="number" step="any" name="precio_venta" id="precio_venta" value="<?= $producto['precio_venta'] ?>" requiered>
		</label>
		<label for="precio_base">
			Cantidad:
			<input type="number" name="cantidad" id="cantidad" value="<?= $producto['cantidad'] ?>" required>
		</label>
		<br>
		<label for="precio_base">
			Cantidad minima:
			<input type="number" name="cantidad_minima" id="cantidad_minima" value="<?= $producto['cantidad_minima'] ?>" requiered>
		</label>
		<br>
		<button>Actualizar</button>
	</form>
	<p>Imagen actual:</p>
	<img src="<?= $imagen->path . $producto['imagen'] ?>" alt="Imagen del producto <?= $producto['nombre'] ?>">
</body>
</html>