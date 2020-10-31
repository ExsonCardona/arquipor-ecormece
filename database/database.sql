create database ecommerce;
use ecommerce;

/*
create table usuarios(
    id int not null auto_increment primary key,
    user_name varchar(45) not null,
    user_password varchar(250) not null,
	nombre varchar(50) not null,
	nit varchar(15) not null unique,
    creado date null,
    actualizado datetime null
);

-- Los registros y asignacion de perfiles de clientes pueden ser realizados por la empresa, quien definira asi el username & pass
create table clientes(
	id int not null auto_increment primary key,
	nombre varchar(50) not null,
	nit varchar(15) not null unique,
	creado date null,
	actualizado datetime null
);
*/

create table departamentos(
	id int not null auto_increment primary key,
	nombre varchar(45)
);

create table municipios(
	id int not null auto_increment primary key,
	nombre varchar(45),
	departamento_id int not null,
	foreign key(departamento_id) references departamentos(id)
);

create table usuarios(
	id int not null auto_increment primary key,
	nombre varchar(50),
	direccion varchar(75),
	username varchar(45) unique,
	password varchar(250),
	departamento_id int not null,
	municipio_id int not null,
	rol enum('admin', 'cliente'),
	foreign key(departamento_id) references departamentos(id),
	foreign key(municipio_id) references municipios(id),
	creado date null,
	actualizado datetime null
);

create table categorias(
	id int not null auto_increment primary key,
	nombre varchar(45),
	creado date null,
	actualizado datetime null
);

create table productos(
	id int not null auto_increment primary key,
	nombre varchar(45) not null,
	descripcion varchar(250) not null,
	imagen varchar(20) not null,
	precio_base float(11, 2) not null,
	precio_venta float(11, 2) not null,
	cantidad int not null,
	cantidad_minima int not null,
	creado date null,
	actualizado datetime null
);

create table categoria_producto(
	id int not null auto_increment primary key,
	categoria_id int not null,
	producto_id int not null,
	foreign key(categoria_id) references categorias(id),
	foreign key(producto_id) references productos(id),
	creado date null,
	actualizado datetime null
);

create table imagenes(
	id int not null auto_increment primary key,
	imagen varchar(20) not null,
	seleccionado boolean not null default 0,
	producto_id int not null,
	foreign key(producto_id) references productos(id),
	creado date null,
	actualizado datetime null
);

create table dimensiones(
	id int not null auto_increment primary key,
	dimension varchar(25),
	producto_id int not null,
	foreign key(producto_id) references productos(id),
	creado date null,
	actualizado datetime null
);

create table facturas(
	id int not null auto_increment primary key,
	condiciones varchar(45) null,
	cliente_id int not null,
	foreign key(cliente_id) references usuarios(id),
	creado date null,
	actualizado datetime null
);

create table detalle_factura(
	id int not null auto_increment primary key,
	factuar_id int not null,
	foreign key(factuar_id) references facturas(id),
	producto_id int not null,
	foreign key(producto_id) references productos(id),
	creado date null,
	actualizado datetime null
);