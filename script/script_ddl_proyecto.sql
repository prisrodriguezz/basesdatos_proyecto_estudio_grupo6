-- SCRIPT TEMA "Plataforma de ventas online / MateMania"
-- DEFINNICIÓN DEL MODELO DE DATOS

CREATE DATABASE tiendaOnline_BD;

USE tiendaOnline_BD;

-- ····························································
-- ······· ESTRUCTURA DE LA BASE DE DATOS ·····················
-- ····························································

CREATE TABLE Categoria
(
  idCategoria INT IDENTITY(1,1),
  descripcion VARCHAR(100) NOT NULL,
  constraint PK_Categoria_id PRIMARY KEY (idCategoria)
);

CREATE TABLE MedioPago
(
  idMedioPago INT IDENTITY(1,1),
  descripcion VARCHAR(100) NOT NULL,
  constraint PK_MedioPago_id PRIMARY KEY (idMedioPago)
);

CREATE TABLE Ciudad
(
  idCiudad INT IDENTITY(1,1),
  descripcion VARCHAR(30) NOT NULL,
  constraint PK_Ciudad_id PRIMARY KEY (idCiudad)
);


CREATE TABLE Producto
(
  idProducto INT IDENTITY(1,1),
  nombreProducto VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100),
  precio FLOAT NOT NULL,
  idCategoria INT NOT NULL,
  constraint PK_Producto_id PRIMARY KEY (idProducto),
  constraint FK_Categoria_id FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);


CREATE TABLE Usuario
(
  idUsuario INT IDENTITY(1,1),
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  dni VARCHAR(8) NOT NULL,
  email VARCHAR(250) NOT NULL,
  domicilio VARCHAR(100) NOT NULL,
  telefono VARCHAR(12),
  idCiudad INT NOT NULL,
  fechaNacimiento DATE NOT NULL,
  constraint PK_Usuario_id PRIMARY KEY (idUsuario),
  constraint FK_Ciudad_id FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad)
);


CREATE TABLE Consulta
(
  idConsulta INT IDENTITY(1,1),
  asunto VARCHAR(50) NOT NULL,
  mensaje VARCHAR(200) NOT NULL,
  idUsuario INT NOT NULL,
  constraint PK_Consulta_id PRIMARY KEY (idConsulta),
  constraint FK_Usuario_id FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);


CREATE TABLE Venta
(
  nroFacturacion INT IDENTITY(1,1),
  fecha DATE NOT NULL,
  total FLOAT NOT NULL,
  idUsuario INT NOT NULL,
  idMedioPago INT NOT NULL,
  constraint PK_nroFacturacion PRIMARY KEY (nroFacturacion),
  constraint FK_Venta_Usuario_id FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario),
  constraint FK_MedioPago_id FOREIGN KEY (idMedioPago) REFERENCES MedioPago(idMedioPago)
);


CREATE TABLE VentaDetalle
(
  idProducto INT NOT NULL,
  nroFacturacion INT NOT NULL,
  cantidad INT NOT NULL,
  subTotal FLOAT NOT NULL,
  constraint PK_Producto_Facturacion_id PRIMARY KEY (idProducto, nroFacturacion),
  constraint FK_Producto_id FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
  constraint FK_Venta_nroFacturacion FOREIGN KEY (nroFacturacion) REFERENCES Venta(nroFacturacion)
);




