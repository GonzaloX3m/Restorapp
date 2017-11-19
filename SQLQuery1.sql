/*Base de datos MS SQLServer*/
USE master;
DROP DATABASE db_restoapp;
CREATE DATABASE db_restoapp;
--DROP DATABASE db_restoapp;
GO
USE db_restoapp;
GO
CREATE TABLE tbl_mesa
(
	id INT PRIMARY KEY
)

INSERT INTO tbl_mesa(id) VALUES(1),(2),(3),(4),(5),(6),(7),(8),(9),(10),(11),(12);

CREATE TABLE tbl_mesero
(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(100)
);

INSERT INTO tbl_mesero VALUES
('Carolina Herrera'),
('Francisco Chila'),
('Gonzalo Zúñiga');

CREATE TABLE tbl_menu
(
	id INT PRIMARY KEY IDENTITY(1,1),
	nombre VARCHAR(30),
	valor INT
);

INSERT INTO tbl_menu VALUES
('Guatitas A La Jardinera',6000),
('Chunchules con tallarines',4500),
('Merluza frita con agregado',5000);

CREATE TABLE tbl_tipoUsuario
(
	id INT PRIMARY KEY IDENTITY(1,1),
	descripcion VARCHAR(10) NOT NULL
);

INSERT INTO tbl_tipoUsuario
VALUES('ADMIN'),
	('commonUser');

CREATE TABLE tbl_usuario
(
	id INT PRIMARY KEY IDENTITY(1,1),
	username VARCHAR(50),
	pass VARCHAR(30),
	fk_tipoUsu INT FOREIGN KEY REFERENCES tbl_tipoUsuario(id)
);

INSERT INTO tbl_usuario VALUES('gzuniga4','arbustoDeCera',1);

CREATE TABLE tbl_pedido
(
	id INT PRIMARY KEY IDENTITY(1,1),
	fk_mesero INT,
	fk_mesa INT,
	fk_plato INT,
	fecha DATETIME DEFAULT GETDATE(),
	FOREIGN KEY(fk_mesero) REFERENCES tbl_mesero(id),
	FOREIGN KEY(fk_mesa) REFERENCES tbl_mesa(id),
	FOREIGN KEY(fk_plato) REFERENCES tbl_menu(id)
);
INSERT INTO tbl_pedido VALUES(2,1,2,DEFAULT);
DELETE FROM tbl_pedido WHERE id = 2;
GO

CREATE TABLE tbl_historialDespachado
(
	id INT PRIMARY KEY IDENTITY(1,1),
	idPedido INT,
	nomMesero VARCHAR(100),
	numMesa INT,
	nomPlato VARCHAR(30),
	fechaPedido DATETIME,
	fechaDespachado DATETIME DEFAULT GETDATE()
);

SELECT * FROM tbl_historialDespachado;

GO
--CREATE TRIGGER tgr_Pedido ON tbl_pedido
--FOR DELETE AS
--BEGIN
--INSERT INTO tbl_historialDespachado(idPedido,nomMesero,numMesa,nomPlato,fechaPedido) 
--(SELECT deleted.id, tbl_mesero.nombre, tbl_mesa.id,	tbl_menu.nombre, deleted.fecha
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

GO

--Revisar mas tarde
--¿Cómo encriptar campos de datos?
--CREATE TRIGGER tgr_Encriptar ON tbl_usuario
--FOR INSERT 
--INSTEAD OF INSERT
--BEGIN
--	INSERT INTO tbl_usuario (SELECT inserted.id,inserted.username,SHA_2(inserted.pass,256));
--END

/*// {F849CD0B-418B-4990-A45A-FAFB6EC74CF2}
static const GUID <<nombre>> = 
{ 0xf849cd0b, 0x418b, 0x4990, { 0xa4, 0x5a, 0xfa, 0xfb, 0x6e, 0xc7, 0x4c, 0xf2 } };

FA335457-142E-4C56-B864-0032C06576E7
*/
--GO
