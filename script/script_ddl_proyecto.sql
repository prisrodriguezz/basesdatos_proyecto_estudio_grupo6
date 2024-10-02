-- SCRIPT TEMA "Plataforma de ventas online / MateMania"
-- DEFINNICIÓN DEL MODELO DE DATOS

create database proyecto_DB_v3

use proyecto_DB_v3


CREATE TABLE Categoria
(
  idCategoria INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  constraint PK_Categoria_id PRIMARY KEY (idCategoria)
);

CREATE TABLE MedioPago
(
  idMedioPago INT NOT NULL,
  descripcion VARCHAR(100) NOT NULL,
  constraint PK_MedioPago_id PRIMARY KEY (idMedioPago)
);

CREATE TABLE Ciudad
(
  idCiudad INT NOT NULL,
  descripcion VARCHAR(30) NOT NULL,
  constraint PK_Ciudad_id PRIMARY KEY (idCiudad)
);

CREATE TABLE Producto
(
  idProducto INT NOT NULL,
  nombreProducto VARCHAR(50) NOT NULL,
  descripcion VARCHAR(100),
  precio FLOAT NOT NULL,
  idCategoria INT NOT NULL,
  constraint PK_Producto_id PRIMARY KEY (idProducto),
  constraint FK_Categoria_id FOREIGN KEY (idCategoria) REFERENCES Categoria(idCategoria)
);

CREATE TABLE Usuario
(
  idUsuario INT NOT NULL,
  nombre VARCHAR(20) NOT NULL,
  apellido VARCHAR(20) NOT NULL,
  dni VARCHAR(8) NOT NULL,
  email VARCHAR(250) NOT NULL,
  domicilio VARCHAR(100) NOT NULL,
  telefono VARCHAR(12),
  idCiudad INT NOT NULL,
  constraint PK_Usuario_id PRIMARY KEY (idUsuario),
  constraint FK_Ciudad_id FOREIGN KEY (idCiudad) REFERENCES Ciudad(idCiudad),
  constraint UQ_Usuario_dni UNIQUE (dni),
  constraint UQ_Usuario_email UNIQUE (email),
  constraint UQ_Usuario_telefono UNIQUE (telefono)
);

CREATE TABLE Consulta
(
  idConsulta INT NOT NULL,
  asunto VARCHAR(50) NOT NULL,
  mensaje VARCHAR(200) NOT NULL,
  idUsuario INT NOT NULL,
  constraint PK_Consulta_id PRIMARY KEY (idConsulta),
  constraint FK_Usuario_id FOREIGN KEY (idUsuario) REFERENCES Usuario(idUsuario)
);

CREATE TABLE Venta
(
  nroFacturacion INT NOT NULL,
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
  cantidad INT NOT NULL,
  subTotal FLOAT NOT NULL,
  idProducto INT NOT NULL,
  nroFacturacion INT NOT NULL,
  constraint PK_Producto_Facturacion_id PRIMARY KEY (idProducto, nroFacturacion),
  constraint FK_Producto_id FOREIGN KEY (idProducto) REFERENCES Producto(idProducto),
  constraint FK_Venta_nroFacturacion FOREIGN KEY (nroFacturacion) REFERENCES Venta(nroFacturacion)
);


-- RESTRICCIONES 

alter table Usuario
add constraint CK_Usuario_dni check(LEN(dni) <= 8);

alter table Venta 
add constraint DF_Venta_fecha default getdate() for fecha;

alter table Producto
add constraint CK_Producto_precio check(precio > 0);




