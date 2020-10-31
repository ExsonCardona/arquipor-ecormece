<?php
include 'User.php';
$User = new User();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
</head>
<body>
    <form method="POST" action="register_action.php">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" id="nombre" maxlength="50" required>
        <label for="direccion">Direccion:</label>
        <input type="text" name="direccion" id="direccion" maxlength="75" required>
        <label for="rol">Rol:</label>
        <select name="rol" id="rol">
            <option disabled selected>Seleccionar</option>
            <?php foreach($User->rols as $rol) { ?>
                <option value="<?= $rol ?>"><?= $rol ?></option>
            <?php } ?>
        </select>

    </form>
</body>
</html>