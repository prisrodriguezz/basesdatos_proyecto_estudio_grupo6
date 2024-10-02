-- SCRIPT "Plataforma de ventas online / MateMania"
-- INSERCIÓN DEL LOTE DE DATOS


-- INSERSIONES DE DATOS

-- INSERT TABLA Categoria
INSERT INTO Categoria (idCategoria, descripcion) VALUES (1, 'Mates');
INSERT INTO Categoria (idCategoria, descripcion) VALUES (2, 'Accesorios');
INSERT INTO Categoria (idCategoria, descripcion) VALUES (3, 'Bombilla');

-- INSERT TABLA MedioPago

INSERT INTO MedioPago (idMedioPago, descripcion) VALUES (1, 'Tarjeta de Crédito');
INSERT INTO MedioPago (idMedioPago, descripcion) VALUES (2, 'Tarjeta de Débito');
INSERT INTO MedioPago (idMedioPago, descripcion) VALUES (3, 'Transferencia Bancaria');


-- INSERT TABLA Producto 

INSERT INTO Producto (idProducto, nombreProducto, descripcion, precio, idCategoria) 
VALUES (1, 'Termo', 'Termo de acero inoxidable', 2500, 1);

INSERT INTO Producto (idProducto, nombreProducto, descripcion, precio, idCategoria) 
VALUES (2, 'Porongo', 'Porongo de calabaza', 1200, 1);

INSERT INTO Producto (idProducto, nombreProducto, descripcion, precio, idCategoria) 
VALUES (3, 'Bombilla', 'Bombilla de acero inoxidable', 800, 2);

--INSERT TABLA Ciudad

INSERT INTO Ciudad (idCiudad, descripcion) VALUES (1, 'Buenos Aires');
INSERT INTO Ciudad (idCiudad, descripcion) VALUES (2, 'Córdoba');
INSERT INTO Ciudad (idCiudad, descripcion) VALUES (3, 'Rosario');

--INSERT TABLE Usuario

INSERT INTO Usuario (idUsuario, nombre, apellido, dni, email, domicilio, telefono, idCiudad) 
VALUES (1, 'Juan', 'Pérez', '12345678', 'juan.perez@gmail.com', 'Calle Falsa 123', '1122334455', 1);

INSERT INTO Usuario (idUsuario, nombre, apellido, dni, email, domicilio, telefono, idCiudad) 
VALUES (2, 'María', 'Gómez', '87654321', 'maria.gomez@yahoo.com', 'Avenida Siempre Viva 456', '1198765432', 2);

INSERT INTO Usuario (idUsuario, nombre, apellido, dni, email, domicilio, telefono, idCiudad) 
VALUES (3, 'Carlos', 'Rodríguez', '56781234', 'carlos.rodriguez@hotmail.com', 'Calle Ejemplo 789', '1166543210', 3);


--INSERT TABLA Consulta

INSERT INTO Consulta (idConsulta, asunto, mensaje, idUsuario)
VALUES (1, 'Problema con la facturación', 'Tengo un problema con la facturación de mi última compra.', 1);

INSERT INTO Consulta (idConsulta, asunto, mensaje, idUsuario)
VALUES (2, 'Producto defectuoso', 'Recibí un termo con una tapa rota, ¿cómo lo puedo cambiar?', 2);

INSERT INTO Consulta (idConsulta, asunto, mensaje, idUsuario)
VALUES (3, 'Consulta sobre envío', 'Quisiera saber cuándo llegará mi pedido.', 3);


--INSERT TABLA Venta

INSERT INTO Venta (nroFacturacion, fecha, total, idUsuario, idMedioPago) 
VALUES (1, getdate(), 2500, 1, 1);

INSERT INTO Venta (nroFacturacion, fecha, total, idUsuario, idMedioPago) 
VALUES (2, getdate(), 2000, 2, 2);

INSERT INTO Venta (nroFacturacion, fecha, total, idUsuario, idMedioPago) 
VALUES (3, getdate(), 3500, 3, 3);

--INSERT TABLA VentDetalle

INSERT INTO VentaDetalle (cantidad, subTotal, idProducto, nroFacturacion) 
VALUES (1, 2500, 1, 1);

INSERT INTO VentaDetalle (cantidad, subTotal, idProducto, nroFacturacion) 
VALUES (1, 1200, 2, 2);

INSERT INTO VentaDetalle (cantidad, subTotal, idProducto, nroFacturacion) 
VALUES (1, 800, 3, 3);
