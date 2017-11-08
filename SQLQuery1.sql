create database restorapp;

use restoapp;

create table mesa(
 id int primary key identity(1,1),
)
create table mesero(
 id int primary key identity(1,1),
 nombre varchar(100),
);

CREATE TABLE menu(
	 id int primary key identity(1,1),
	 nombre VARCHAR(30),
	 PRECIO INT
);

CReate TABLE tipoUsuario(
	id int primary key identity(1,1),
	nombre varchar(100)
);
create table usuario(
	id int primary key identity(1,1),
	username varchar(100),
	pass varchar(100),
	fk_tipoUsu int,
	foreign key(fk_tipoUsu) references tipoUsuario(id)
);

create table pedido(
	id int primary key identity(1,1),
	fk_mesero INT,
	fk_plato INT,
	fecha DATETIME DEFAULT GETDATE()
	foreign key(fk_mesero) references mesero(id),
	foreign key(fk_plato) references menu(id)
);




