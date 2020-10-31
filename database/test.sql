insert into productos values(null, 'example', 'descripton example', 'image.jpg', 0, 0, 0, 0, curdate(), now());
insert into productos values(null, 'example', 'descripton example', 'image.jpg', 0, 0, 0, 0, curdate(), now());
insert into productos values(null, 'example', 'descripton example', 'image.jpg', 0, 0, 0, 0, curdate(), now());
insert into productos values(null, 'example', 'descripton example', 'image.jpg', 0, 0, 0, 0, curdate(), now());
insert into productos values(null, 'example', 'descripton example', 'image.jpg', 0, 0, 0, 0, curdate(), now());

insert into categorias values(null, 'Columna', curdate(), now());
insert into categorias values(null, 'Techo', curdate(), now());
insert into categorias values(null, 'Pared', curdate(), now());
insert into categorias values(null, 'Ventana', curdate(), now());
insert into categorias values(null, 'Puerta', curdate(), now());

insert into categoria_producto values(null, 4, 11, curdate(), now());
insert into categoria_producto values(null, 4, 12, curdate(), now());
insert into categoria_producto values(null, 5, 13, curdate(), now());
insert into categoria_producto values(null, 5, 14, curdate(), now());
insert into categoria_producto values(null, 5, 10, curdate(), now());

SELECT p.id, p.nombre, p.descripcion, p.imagen, p.precio_base, p.precio_venta, p.cantidad, p.cantidad_minima, p.creado, p.actualizado, c.nombre as categoria_nombre FROM productos p
INNER JOIN categoria_producto c_p ON c_p.producto_id = p.id
INNER JOIN categorias c ON c.id = c_p.categoria_id
WHERE c.nombre = 'Columna' ORDER BY p.actualizado DESC LIMIT 1, 15;

SELECT COUNT(*) AS cantidad FROM productos p INNER JOIN categoria_producto c_p ON c_p.producto_id = p.id
INNER JOIN categorias c ON c.id = c_p.categoria_id WHERE c.nombre = 'Columna';