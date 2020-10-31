<!DOCTYPE html>
<html>
<head>
	<title>Registrar producto</title>
</head>
<body>
	<form method="POST" action="create_action.php" enctype="multipart/form-data">
		<label for="nombre">
			Nombre:
			<input type="text" name="nombre" id="nombre" maxlength="45" required>
		</label>
		<br>
		<label for="descripcion">
			Descripcion:
			<input type="text" name="descripcion" id="descripcion" maxlength="250" requiered>
		</label>
		<br>
		<label for="imagen">
			Imagen:
			<input type="file" name="imagen" id="imagen" requiered>
		</label>
		<br>
		<label for="precio_base">
			Precio base:
			<input type="number" step="any" name="precio_base" id="precio_base" required>
		</label>
		<br>
		<label for="precio_venta">
			Precio venta:
			<input type="number" step="any" name="precio_venta" id="precio_venta" requiered>
		</label>
		<br>
		<label for="precio_base">
			Cantidad:
			<input type="number" name="cantidad" id="cantidad" required>
		</label>
		<br>
		<label for="precio_base">
			Cantidad minima:
			<input type="number" name="cantidad_minima" id="cantidad_minima" requiered>
		</label>
		<br>
		<button>Guardar</button>
	</form>
</body>
</html>