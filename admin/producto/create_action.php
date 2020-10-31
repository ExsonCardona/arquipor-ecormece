<?php

include 'Producto.php';
include '../imagen/Imagen.php';

if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $producto = new Producto();
    $imagen = new Imagen();
    $parametros = [];

    if(isset($_POST['nombre'])) array_push($parametros, $_POST['nombre']);
    if(isset($_POST['descripcion'])) array_push($parametros, $_POST['descripcion']);
    if(isset($_FILES['imagen'])) array_push($parametros, '');
    if(isset($_POST['precio_base'])) array_push($parametros, $_POST['precio_base']);
    if(isset($_POST['precio_venta'])) array_push($parametros, $_POST['precio_venta']);
    if(isset($_POST['cantidad'])) array_push($parametros, $_POST['cantidad']);
    if(isset($_POST['cantidad_minima'])) array_push($parametros, $_POST['cantidad_minima']);

    $image_name = '';
    if(isset($_FILES['imagen'])){
        if($imagen->allowedFormat(pathinfo($_FILES['imagen']['name'], PATHINFO_EXTENSION)) && $imagen->allowedSize($_FILES['imagen']['size'])){
            // $image_name = time() . '.' . $imagen->extensiones[$_FILES['imagen']['type']];
            $image_name = time() . '.' . pathinfo($_FILES['imagen']['name'], PATHINFO_EXTENSION);
            if(!file_exists($imagen->path . $image_name)){
                if(move_uploaded_file($_FILES['imagen']['tmp_name'], $imagen->path . $image_name)){
                    $parametros[2] = $image_name;
                    $resultado = $producto->create($parametros);
                    if($resultado[0]) header('location:edit.php?id=' . $resultado[1]);
                    else echo 'Error al guardar el registro';
                }
                else echo 'error al cargar la imagen';
            }
            else echo 'La imagen que intenta subir ya ha sido cargada previamente';
        }
        else echo 'Formato de imagen no valido o tamaño superior a 5mb, seleccione una imagen del tipo: .png, .jpeg o .jpg<br>';
    }
}