/*Base de datos MS SQLServer*/
--USE master;
--go
--DROP DATABASE db_restoapp;
--go
CREATE DATABASE db_restoapp;
--DROP DATABASE db_restoapp;
GO
USE db_restoapp;
GO
CREATE TABLE tbl_mesa
(
	id INT PRIMARY KEY,
	disponible BIT DEFAULT 1
);--DROP TABLE tbl_mesa

INSERT INTO tbl_mesa(id) VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);



CREATE TABLE tbl_menu
(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(30),
	valor INT
);

INSERT INTO tbl_menu VALUES
('Guatitas A La Jardinera',6000),
('Chunchules con tallarines',4500),
('Merluza frita con agregado',5000),
('Papas fritas',1000),
('Bebida',1100),
('Té',500);

--DROP TABLE tbl_menu;

CREATE TABLE tbl_tipoUsuario
(
	id INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(10) NOT NULL
);--DROP TABLE tbl_tipoUsuario

INSERT INTO tbl_tipoUsuario
VALUES('ADMIN'),
	('Cajero'),
	('Mesero');

CREATE TABLE tbl_usuario
(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(50),
	disponible BIT DEFAULT 1,
	username VARCHAR(50),
	pass VARCHAR(30),
	fk_tipoUsu INT FOREIGN KEY REFERENCES tbl_tipoUsuario(id)
);--DROP TABLE tbl_usuario;

INSERT INTO tbl_usuario VALUES('Gonzalo Zuniga',DEFAULT,'gzuniga4','11-1',1);
INSERT INTO tbl_usuario VALUES('Sebastian Zuniga',DEFAULT,'szuniga5','22-2',2);
INSERT INTO tbl_usuario VALUES('José Zuniga',DEFAULT,'jzuniga4','33-3',3);

CREATE TABLE tbl_pedido
(
	id INT PRIMARY KEY IDENTITY(1,1),
	fk_usuario INT FOREIGN KEY REFERENCES tbl_usuario(id),
	fk_mesa INT FOREIGN KEY REFERENCES tbl_mesa(id),
	fk_plato INT FOREIGN KEY REFERENCES tbl_menu(id),
	fecha DATETIME DEFAULT GETDATE()
);--DROP TABLE tbl_pedido
INSERT INTO tbl_pedido VALUES(2,1,2,DEFAULT);
INSERT INTO tbl_pedido VALUES(1,2,1,DEFAULT);
SELECT * FROM tbl_pedido;
--DELETE FROM tbl_pedido WHERE id = 2;
--GO

--CREATE TABLE tbl_historialDespachado
--(
--	id INT PRIMARY KEY IDENTITY(1,1),
--	idPedido INT,
--	numMesa INT,
--	nomMesero VARCHAR(100),
--	total INT,
--	fechaPedido DATETIME,
--	fechaDespachado DATETIME DEFAULT GETDATE()
--);

----SELECT * FROM tbl_historialDespachado;

--GO
--CREATE TRIGGER tgr_Pedido ON tbl_pedido
--FOR DELETE AS
--BEGIN
--INSERT INTO tbl_historialDespachado(idPedido,numMesa,nomMesero,nomPlato,total,fechaPedido) 
--(SELECT deleted.id, tbl_usuario.nombre, tbl_mesa.id, tbl_menu.nombre, deleted.fecha
--FROM tbl_mesero, tbl_mesa, tbl_menu, deleted, tbl_pedido
--WHERE tbl_mesero.id = deleted.fk_mesero AND
--	tbl_mesa.id= deleted.fk_mesa AND
--	tbl_menu.id = deleted.fk_plato)
--END
--GO
--DROP TRIGGER tgr_Pedido;

--CONSULTA DE LA TABLA PEDIDO
--SELECT tbl_pedido.id,tbl_mesero.nombre AS Mesero,tbl_mesa.id AS Mesa, 
--tbl_menu.nombre AS Plato, tbl_menu.valor AS Precio,tbl_pedido.fecha AS [Fecha Pedido]
--FROM tbl_mesero,tbl_mesa,tbl_menu,tbl_pedido
--WHERE tbl_mesero.id = tbl_pedido.fk_mesero AND
--tbl_mesa.id = tbl_pedido.fk_mesa AND
--tbl_menu.id = tbl_pedido.fk_plato
--ORDER BY tbl_pedido.fecha ASC

--Consulta de la tabla pedido agrupados por mesas
--SELECT tbl_mesero.nombre AS Mesero,tbl_mesa.id AS Mesa, tbl_menu.nombre AS Plato,
--SUM(tbl_menu.valor) AS Total,tbl_pedido.fecha AS [Fecha Pedido]
--FROM tbl_mesero,tbl_mesa,tbl_menu,tbl_pedido
--WHERE tbl_mesero.id = tbl_pedido.fk_mesero AND
--tbl_mesa.id = tbl_pedido.fk_mesa AND
--tbl_menu.id = tbl_pedido.fk_plato
--GROUP BY tbl_mesa.id,tbl_mesero.nombre
--ORDER BY tbl_pedido.fecha ASC

--SELECT * FROM tbl_mesa;

--GO
/*
--Revisar mas tarde
--¿Cómo encriptar campos de datos?
--CREATE TRIGGER tgr_Encriptar ON tbl_usuario
--FOR INSERT 
--INSTEAD OF INSERT
--BEGIN
--	INSERT INTO tbl_usuario (SELECT inserted.id,inserted.username,SHA_2(inserted.pass,256));
--END35457-142E-4C56-B864-0032C06576E7
*/
--GO

--SELECT tbl_usuario

--go

--DROP TABLE tbl_mesero

SELECT tbl_pedido.id,tbl_usuario.nombre AS Mesero,
tbl_mesa.id AS Mesa, tbl_menu.nombre AS Plato,SUM(tbl_menu.valor)
AS Precio, tbl_pedido.fecha AS[Fecha Pedido] 
FROM tbl_usuario,tbl_mesa, tbl_menu, tbl_pedido 
WHERE tbl_usuario.id = tbl_pedido.fk_usuario AND 
tbl_mesa.id = tbl_pedido.fk_mesa 
AND tbl_menu.id = tbl_pedido.fk_plato 
group by tbl_pedido.fk_mesa,tbl_pedido.id,tbl_usuario.nombre,tbl_mesa.id,tbl_menu.nombre,tbl_pedido.fecha
ORDER BY tbl_pedido.fecha ASC