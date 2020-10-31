<?php

include_once '../../init.php';
include 'Producto.php';
include '../imagen/Imagen.php';
include '../categoria/Categoria.php';

$Producto = new Producto();
$Imagen = new Imagen();
$Categoria = new Categoria();

$categorias = $Categoria->categorias();

$pageno = null;
if (isset($_GET['pageno'])) $pageno = $_GET['pageno'];
else $pageno = 1;
$pagina = ($pageno-1) * 15;
$registros = null;
$categoria = '';
if(isset($_GET['categoria'])) {
	$registros = $Producto->index($pagina, $_GET['categoria']);
	$categoria = $_GET['categoria'];
}
else $registros = $Producto->index($pagina);
$paginas = ceil(intval($registros['cantidad']['cantidad']) / 15);

?>
<!DOCTYPE html>
<html>
<head>
	<title>Productos index</title>
</head>
<body>
	<?php if(isset($_GET['info'])){ ?>
		<p><?php echo $_GET['info'] ?></p>
	<?php } ?>
	<a href="create.php">Registrar producto</a>
	<br>
	<ol>
		<li><a href="?">Todos</a></li>
		<?php foreach($categorias as $item){ ?>
			<li><a href="?categoria=<?= $item['nombre'] ?>"><?= $item['nombre'] ?></a></li>
		<?php } ?>
	</ol>
	<br>
	<strong><?= 'cantidad de registros:' . $registros['cantidad']['cantidad'] . '<br>' ?></strong>
	<?php foreach($registros['registros'] as $producto){ ?>
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
		<!-- <form method="POST" id="eliminar"> -->
		<form method="POST" action="delete.php" id="eliminar">
			<input type="hidden" name="id" value="<?= $producto['id'] ?>">
			<input type="submit" name="submit" value="Eliminar" onclick="confirm('Seguro que desea elimiar este registro?')">
		</form>
		<p>--------------------------------------------------------------------------</p>
	<?php } ?>
	<ul class="pagination">
        <li class="page-item"><a href="?pageno=1&categoria=<?= $categoria ?>" class="page-link">Primero</a></li>
        <li class="<?php if($pageno <= 1){ echo 'disabled'; } ?> page-item">
            <a href="<?php if($pageno <= 1){ echo '#'; } else { echo "?pageno=" . ($pageno - 1); } ?>&categoria=<?= $categoria ?>" class="page-link" aria-label="Anterior">
	            <span aria-hidden="true">&laquo;</span>
                <span class="sr-only">Anterior</span>
            </a>
        </li>
        <li class="page-item">
        	<a href="#" class="page-link">
        		<?= $pageno ?>
        	</a>
        </li>
        <li class="<?php if($pageno >= $paginas){ echo 'disabled'; } ?> page-item">
            <a href="<?php if($pageno >= $paginas){ echo '#'; } else { echo "?pageno=" . ($pageno + 1); } ?>&categoria=<?= $categoria ?>" class="page-link" aria-label="Siguiente">
	            <span aria-hidden="true">&raquo;</span>
                <span class="sr-only">Siguiente</span>
            </a>
        </li>
        <li class="page-item"><a href="?pageno=<?= $paginas ?>&categoria=<?= $categoria ?>" class="page-link">Ultimo</a></li>
    </ul>
    <script>
    	document.getElementById('eliminar').AddEventListener('click', function(event){
    		let confirmar = confirm('Seguro que desea elimiar este registro?')
    		if(!confirmar) event.preventDefault()
    		once: true
    	})
    </script>
</body>
</html>