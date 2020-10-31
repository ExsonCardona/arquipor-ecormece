<?php

include 'Producto.php';
include '../imagen/Imagen.php';

$Producto = new Producto();
$Imagen = new Imagen();

$productos = $Producto->index();
$pagina = '';
$categoria = '';
?>
<!DOCTYPE html>
<html>
<head>
	<title>Productos index</title>
</head>
<body>
	<a href="create.php">Registrar producto</a>
	<br>
	<?= 'cantidad de registros: ' . $productos['cantidad']['cantidad'] . '<br>' ?>
	<?php foreach($productos['registros'] as $producto){ ?>
		<?= $producto['id'] . '<br>' ?>
		<?= $producto['nombre'] . '<br>' ?>
		<?= $producto['descripcion'] . '<br>' ?>
		<?= $producto['precio_base'] . '<br>' ?>
		<?= $producto['precio_venta'] . '<br>' ?>
		<?= $producto['cantidad'] . '<br>' ?>
		<?= $producto['cantidad_minima'] . '<br>' ?>
		<img src="<?= $Imagen->path . $producto['imagen'] ?>" alt="imagen del producto <?= $producto['nombre'] ?>" width="100" height="100">
		<br>
		<form method="GET" action="edit.php">
			<input type="hidden" name="id" value="<?= $producto['id'] ?>">
			<input type="submit" name="submit" value="Editar">
		</form>
		<!-- <a href="edit.php?id=<?= $producto['id'] ?>">Editar</a> -->
		<form method="POST" action="delete.php">
			<input type="hidden" name="id" value="<?= $producto['id'] ?>">
			<input type="submit" name="submit" value="Eliminar">
		</form>
		<p>--------------------------------------------------------------------------</p>
	<?php } ?>
</body>
</html>