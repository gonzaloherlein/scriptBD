CREATE SCHEMA IF NOT EXISTS practicabd;
USE practicabd;

CREATE TABLE IF NOT EXISTS almacen (
	idAlmacen int primary key auto_increment not null,
	nombreAlmacen varchar(50) not null,
	dueño varchar(60) not null);

CREATE TABLE IF NOT EXISTS producto (
	idProducto int primary key auto_increment not null,
	nombreProducto varchar(50) not null,
	precioProducto decimal(7,2) not null
);

-- Material (cod_mat, descripción) --

CREATE TABLE IF NOT EXISTS material(
	cod_mat int primary key not null,
	descripcion varchar(40) not null
);
 
-- Ciudad (cod_ciu, nombre)
CREATE TABLE IF NOT EXISTS ciudad(
	cod_ciu int primary key auto_increment not null,
	nombre varchar(40)
);

-- Proveedor (cod_prov, nombre, domicilio, cod_ciu, fecha_alta)
CREATE TABLE IF NOT EXISTS proovedor(
	cod_prov int primary key auto_increment not null,
	nombre varchar(40) not null,
	domicilio varchar(40) not null,
	cod_ciu int,
	fecha_alta date,
	constraint foreign key (cod_ciu) references ciudad(cod_ciu)
);

-- Contiene (nro, cod_art)
CREATE TABLE IF NOT EXISTS contiene(
	nro int not null,
	idProducto int not null,
	constraint contiene_pk primary key (nro, idProducto),
	foreign key (nro)  references almacen(idAlmacen),
	foreign key (idProducto) references producto(idProducto)
);

-- Compuesto_por (cod_art, cod_mat) 
CREATE TABLE IF NOT EXISTS compuesto_por (
	idProducto int,
	cod_mat int,
	constraint compuesto_por_pk primary key (idProducto, cod_mat),
	foreign key (idProducto) references producto(idProducto),
	foreign key (cod_mat) references material(cod_mat)
);

INSERT INTO producto values (0,'Asilla', 105);
INSERT INTO producto values (0,'Asssssilla', 230);


INSERT INTO ciudad values (0,'San Juan');
INSERT INTO ciudad values (0,'Neuquen');
INSERT INTO ciudad values (0,'La Rioja'),
						  (0,'Buenos Aires'),
						  (0,'La Pampa');

INSERT INTO proovedor values(0,'Eduardo','Kiernan 222',1,20200101);

INSERT INTO proovedor values(0,'Ricardo','Kiernan 222',2,20200201),
							(0,'Sergio','Kiernan 222',3,20200301);


INSERT INTO material values (1,'Acero'),
							(3,'Metal'),
							(6,'Plastico'),
							(9,'PVC'),
							(10,'Aluminio'),
							(18,'Polipropileno');

INSERT INTO proovedor values(0,'Eduardo','Suipacha 222',3,20010101);
INSERT INTO proovedor values(0,'Sebastian','Suipacha 223',3,20010501);
INSERT INTO proovedor values(0,'Marcelo','Suipachaense 222',3,20010120);

SELECT idProducto, nombreProducto
FROM producto
WHERE precioProducto BETWEEN 100 AND 1000 AND nombreProducto LIKE 'A%';

SELECT cod_prov, nombre
FROM proovedor
WHERE cod_prov like 1;

SELECT *
FROM ciudad;

SELECT descripcion
FROM material
WHERE cod_mat in (1,3,6,9,18);

SELECT cod_prov, nombre
FROM proovedor
WHERE domicilio like 'Suipacha%' and fecha_alta between '20010101' and '20020101';


