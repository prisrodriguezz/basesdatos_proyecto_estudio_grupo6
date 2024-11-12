-- SCRIPT "Plataforma de ventas online / MateMania"
-- INSERCIÓN DEL LOTE DE DATOS

use tiendaOnline_BD;

-- ····························································
-- ············· INSERCION DE DATOS ···························
-- ····························································

-- Insertar 10 categorías 
INSERT INTO Categoria (descripcion)
VALUES 
    ('Mates de madera'),
    ('Mates de cerámica'),
    ('Mates de calabaza'),
    ('Mates de vidrio'),
    ('Mates de metal'),
    ('Mates de silicona'),
    ('Bombillas de acero inoxidable'),
    ('Bombillas de bronce'),
    ('Sets de mate y bombilla'),
    ('Accesorios para mate');


-- Insertar 6 medios de pago 
INSERT INTO MedioPago (descripcion)
VALUES 
    ('Efectivo'),
    ('Tarjeta de Crédito'),
    ('Tarjeta de Débito'),
    ('Transferencia Bancaria'),
    ('Mercado Pago'),
    ('PayPal');


-- Insertar 10 ciudades 
INSERT INTO Ciudad (descripcion)
VALUES 
    ('Buenos Aires'),
    ('Córdoba'),
    ('Rosario'),
    ('Mendoza'),
    ('La Plata'),
    ('Corrientes'),
    ('Salta'),
    ('Santa Fe'),
    ('Mar del Plata'),
    ('Neuquén');


-- Insertar 60 productos con sus respectivas categorías
INSERT INTO Producto (nombreProducto, descripcion, precio, idCategoria)
VALUES 
    -- Mates de madera
    ('Mate de Algarrobo', 'Mate de madera de algarrobo tallado artesanalmente', 15.99, 1),
    ('Mate de Palo Santo', 'Mate de madera de palo santo con borde reforzado', 18.50, 1),
    ('Mate Torneado', 'Mate de madera torneada con decoración artesanal', 12.75, 1),
    ('Mate de Cedro', 'Mate de cedro, liviano y resistente', 14.00, 1),
    ('Mate con Virola de Plata', 'Mate de madera de alta calidad con virola de plata', 25.99, 1),
    
    -- Mates de cerámica
    ('Mate Cerámico Esmaltado', 'Mate de cerámica con esmaltado colorido', 8.50, 2),
    ('Mate Cerámico Rústico', 'Mate de cerámica con diseño rústico', 7.99, 2),
    ('Mate Cerámico con Pintura a Mano', 'Mate de cerámica pintado a mano', 9.99, 2),
    ('Mate Cerámico Moderno', 'Mate de cerámica con diseño minimalista', 10.99, 2),
    ('Mate Cerámico con Boquilla de Acero', 'Mate cerámico con borde de acero inoxidable', 11.50, 2),
    
    -- Mates de calabaza
    ('Mate de Calabaza Clásico', 'Mate de calabaza tradicional, sin decoración', 6.00, 3),
    ('Mate Calabaza Forrado en Cuero', 'Mate de calabaza con forrado de cuero', 8.00, 3),
    ('Mate Calabaza Pintado', 'Mate de calabaza con diseño pintado a mano', 9.50, 3),
    ('Mate Calabaza con Virola', 'Mate de calabaza con virola decorativa', 10.00, 3),
    ('Mate Calabaza Estilo Criollo', 'Mate de calabaza de estilo criollo', 7.75, 3),
    
    -- Mates de vidrio
    ('Mate de Vidrio con Funda', 'Mate de vidrio con funda de cuero', 12.50, 4),
    ('Mate Vidrio con Borde Metálico', 'Mate de vidrio con borde metálico', 13.99, 4),
    ('Mate de Vidrio Termo-resistente', 'Mate de vidrio resistente al calor', 15.50, 4),
    ('Mate Vidrio Color Ámbar', 'Mate de vidrio color ámbar', 14.00, 4),
    ('Mate Vidrio con Estampado', 'Mate de vidrio con diseño estampado', 13.25, 4),
    
    -- Mates de metal
    ('Mate de Acero Inoxidable', 'Mate de acero inoxidable, fácil de limpiar', 20.00, 5),
    ('Mate de Aluminio Colorido', 'Mate de aluminio pintado en colores vivos', 15.00, 5),
    ('Mate Metálico con Mango de Cuero', 'Mate metálico con funda de cuero', 18.50, 5),
    ('Mate de Metal Pulido', 'Mate de metal con acabado pulido', 17.25, 5),
    ('Mate de Acero con Diseño Grabado', 'Mate de acero con diseño grabado', 21.99, 5),
    
    -- Mates de silicona
    ('Mate de Silicona Flexible', 'Mate de silicona en varios colores', 10.50, 6),
    ('Mate de Silicona Antideslizante', 'Mate de silicona con base antideslizante', 11.00, 6),
    ('Mate de Silicona para Viaje', 'Mate de silicona, ideal para transportar', 9.75, 6),
    ('Mate de Silicona Infantil', 'Mate de silicona para niños, sin bordes filosos', 8.50, 6),
    ('Mate de Silicona con Cuchara Bombilla', 'Mate de silicona con bombilla de cuchara', 10.99, 6),
    
    -- Bombillas de acero inoxidable
    ('Bombilla de Acero Clásica', 'Bombilla de acero inoxidable de diseño clásico', 5.99, 7),
    ('Bombilla Acero con Filtro Desmontable', 'Bombilla de acero con filtro desmontable', 6.50, 7),
    ('Bombilla de Acero Extra Larga', 'Bombilla de acero inoxidable larga', 6.75, 7),
    ('Bombilla de Acero con Diseño Calado', 'Bombilla de acero con calados decorativos', 7.00, 7),
    ('Bombilla de Acero con Pincel de Limpieza', 'Bombilla de acero inoxidable con pincel', 7.25, 7),
    
    -- Bombillas de bronce
    ('Bombilla de Bronce Tradicional', 'Bombilla de bronce, diseño criollo', 5.50, 8),
    ('Bombilla Bronce con Virola de Plata', 'Bombilla de bronce con detalles en plata', 8.25, 8),
    ('Bombilla de Bronce Calada', 'Bombilla de bronce con diseño calado', 6.99, 8),
    ('Bombilla de Bronce con Filtro', 'Bombilla de bronce con filtro interno', 7.50, 8),
    ('Bombilla Bronce Maciza', 'Bombilla de bronce de gran durabilidad', 9.00, 8),
    
    -- Sets de mate y bombilla
    ('Set de Madera y Bombilla Acero', 'Set con mate de madera y bombilla de acero', 22.99, 9),
    ('Set de Cerámica y Bombilla de Acero', 'Set con mate cerámico y bombilla de acero', 19.99, 9),
    ('Set de Calabaza con Bombilla de Bronce', 'Set con mate de calabaza y bombilla de bronce', 25.50, 9),
    ('Set de Metal y Bombilla Acero', 'Set con mate metálico y bombilla de acero', 23.50, 9),
    ('Set Vidrio con Bombilla Acero', 'Set de mate de vidrio y bombilla', 24.75, 9),
    
    -- Accesorios para mate
    ('Pincel para Bombilla', 'Pincel para limpiar bombillas', 2.99, 10),
    ('Porta Mate de Cuero', 'Porta mate de cuero artesanal', 8.99, 10),
    ('Termo para Agua Caliente', 'Termo de acero para agua caliente', 15.99, 10),
    ('Caja para Yerba y Azúcar', 'Caja doble para yerba y azúcar', 10.50, 10),
    ('Cepillo de Limpieza para Mate', 'Cepillo pequeño para limpiar mates', 3.50, 10),

    -- Más productos variados para completar el total de 60 productos
    ('Mate con Terminaciones en Oro', 'Mate exclusivo con detalles en oro', 45.99, 1),
    ('Mate Cerámico Esmaltado', 'Mate esmaltado en blanco y azul', 9.99, 2),
    ('Mate Calabaza con Pie de Metal', 'Mate de calabaza con soporte de metal', 11.99, 3),
    ('Mate Vidrio Transparente', 'Mate de vidrio sin diseño', 12.00, 4),
    ('Mate Acero con Soporte de Cuero', 'Mate de acero y soporte de cuero', 19.99, 5),
    ('Mate Silicona Edición Especial', 'Mate de silicona en colores exclusivos', 12.99, 6),
    ('Bombilla Acero Color Oro', 'Bombilla dorada de acero inoxidable', 8.99, 7),
    ('Bombilla Bronce Extra Fina', 'Bombilla de bronce de diseño fino', 7.99, 8),
    ('Set Madera Tallada', 'Set de mate y bombilla con tallado artesanal', 29.99, 9),
    ('Porta Yerba', 'Porta yerba de cuero', 7.50, 10);


-- Carga masiva en tabla 'USUARIO'
DECLARE @i INT = 1;
DECLARE @total INT = 1000000; -- Número de registros a insertar
DECLARE @fechaNacimiento DATE;
DECLARE @nombre NVARCHAR(50);
DECLARE @apellido NVARCHAR(50);
DECLARE @dni NVARCHAR(15);
DECLARE @email NVARCHAR(100);
DECLARE @domicilio NVARCHAR(100);
DECLARE @telefono NVARCHAR(15);
DECLARE @idCiudad INT;

WHILE @i <= @total
BEGIN
    SET @nombre = (SELECT TOP 1 nombre FROM (VALUES ('Mateo'), ('Lucas'), ('Valentina'), ('Martina'), ('Santiago'), ('Sofía'), ('Agustín'), ('Emilia'), ('Mateo'), ('Lucía')) AS Names(nombre) ORDER BY NEWID());
    SET @apellido = (SELECT TOP 1 apellido FROM (VALUES ('González'), ('Rodríguez'), ('López'), ('Martínez'), ('Gómez'), ('Fernández'), ('Díaz'), ('Pérez'), ('Romero'), ('Sosa')) AS Surnames(apellido) ORDER BY NEWID());

    -- Generar DNI aleatorio asegurando la longitud adecuada
    SET @dni = RIGHT('00000000' + CAST(CAST(10000000 + RAND() * 10000000 AS BIGINT) AS NVARCHAR(15)), 8); -- Limita a 8 caracteres

    -- Generar email aleatorio
    SET @email = LOWER(@nombre + '.' + @apellido + CAST(CAST(RAND() * 100 AS INT) AS NVARCHAR(3)) + '@mail.com');

    -- Generar domicilio aleatorio
    SET @domicilio = 'Calle ' + CAST(FLOOR(RAND() * 1000) AS NVARCHAR(3));

    -- Generar teléfono aleatorio
    SET @telefono = '11' + RIGHT('00000000' + CAST(CAST(FLOOR(RAND() * 100000000) AS INT) AS NVARCHAR(8)), 8);

    -- Seleccionar idCiudad aleatorio
    SET @idCiudad = (SELECT TOP 1 idCiudad FROM Ciudad ORDER BY NEWID());

    -- Generar fecha de nacimiento aleatoria
    SET @fechaNacimiento = DATEADD(DAY, (RAND() * (DATEDIFF(DAY, '1950-01-01', '2000-12-31'))), '1950-01-01');

    -- Insertar en la tabla Usuario
    INSERT INTO Usuario (nombre, apellido, dni, email, domicilio, telefono, idCiudad, fechaNacimiento)
    VALUES (@nombre, @apellido, @dni, @email, @domicilio, @telefono, @idCiudad, @fechaNacimiento);

    SET @i = @i + 1;
END;
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
select * from usuario


-- Inserción de 30 consultas
INSERT INTO Consulta (asunto, mensaje, idUsuario) VALUES
    ('Problema de acceso', 'No puedo acceder a mi cuenta. Me sale un error de autenticación.', 1),
    ('Duda sobre el plan de entrenamiento', 'Quisiera saber más sobre el plan de entrenamiento que se recomienda para principiantes.', 2),
    ('Consulta sobre el pago', 'Me gustaría saber si el pago mensual cubre todas las actividades o hay un costo adicional.', 3),
    ('Pregunta sobre horarios', '¿Cuál es el horario disponible para clases de yoga?', 4),
    ('Solicitud de cancelación', 'Deseo cancelar mi membresía debido a motivos personales. ¿Qué pasos debo seguir?', 5),
    ('Consulta sobre el estado de mi pago', '¿Pueden confirmar si mi pago fue procesado correctamente? No veo el recibo en mi cuenta.', 6),
    ('Recomendación de ejercicios', '¿Podrían recomendarme un plan de ejercicios para mejorar mi resistencia cardiovascular?', 7),
    ('Problema con la tarjeta de pago', 'Intenté hacer un pago con mi tarjeta, pero la transacción no fue exitosa. ¿Qué puedo hacer?', 8),
    ('Preguntar por nuevos productos', '¿Tienen nuevos equipos de entrenamiento disponibles para la venta?', 9),
    ('Petición de clase personalizada', 'Me gustaría contratar una clase personalizada con un entrenador. ¿Cómo puedo agendarla?', 10),
    ('Duda sobre la duración de la membresía', '¿La membresía anual incluye acceso ilimitado o hay restricciones?', 11),
    ('Sugerencia para la aplicación', 'La aplicación móvil podría mejorar en cuanto a la velocidad y la interfaz de usuario. Espero que lo consideren.', 12),
    ('Consulta sobre clases de natación', '¿Cuándo comenzarán las clases de natación en el gimnasio?', 13),
    ('Solicitud de comprobante de pago', '¿Podrían enviarme el comprobante de mi pago realizado el mes pasado?', 14),
    ('Información sobre los entrenadores', '¿Cómo puedo saber más sobre los entrenadores disponibles y sus especialidades?', 15),
    ('Problema con el acceso a las clases online', 'No logro acceder a las clases online. Me aparece un mensaje de error cada vez que intento ingresar.', 16),
    ('Duda sobre promociones', '¿Tienen alguna promoción vigente para nuevos miembros?', 17),
    ('Consulta sobre el uso de suplementos', '¿El gimnasio ofrece recomendaciones sobre el uso de suplementos alimenticios?', 18),
    ('Reclamo sobre una clase cancelada', 'Me dijeron que la clase de spinning estaba programada, pero no se llevó a cabo. ¿Podrían ofrecerme una solución?', 19),
    ('Sugerencia de actividad grupal', 'Sería genial tener más actividades grupales, como bailes o retos de fitness en equipo.', 20),
    ('Problema con el sistema de reservas', 'Estoy teniendo dificultades para reservar mis clases en línea, no puedo seleccionar las fechas disponibles.', 21),
    ('Consulta sobre los precios', '¿Pueden indicarme los precios actuales para la membresía trimestral?', 22),
    ('Requerimiento de cambio de entrenador', 'Me gustaría cambiar de entrenador para mis clases de personal training. ¿Es posible hacerlo?', 23),
    ('Duda sobre las restricciones de la membresía', '¿Existen limitaciones en la cantidad de visitas al gimnasio durante el mes con la membresía mensual?', 24),
    ('Preguntar por el acceso a la piscina', '¿La membresía incluye acceso a la piscina del gimnasio?', 25),
    ('Solicitud de más clases de Pilates', 'Me encantaría ver más clases de Pilates en el horario de las tardes.', 26),
    ('Consulta sobre el servicio de masajes', '¿El gimnasio ofrece servicios de masajes después de las clases?', 27),
    ('Inconvenientes con el vestuario', 'Los vestuarios no están limpios. Es algo que me gustaría que mejoraran.', 28),
    ('Recomendación para aumentar la fuerza', 'Estoy buscando ejercicios para mejorar mi fuerza en piernas, ¿me podrían ayudar con un plan específico?', 29),
    ('Consulta sobre el seguimiento de progreso', '¿Hay alguna manera de hacer seguimiento de mi progreso físico mediante la aplicación o el gimnasio?', 30);


-- Carga masiva en tabla 'VENTA'
DECLARE @i INT = 1;
DECLARE @total INT = 1000000; -- Número de registros a insertar
DECLARE @fecha DATE;
DECLARE @idUsuario INT;
DECLARE @idMedioPago INT;
DECLARE @totalVenta FLOAT;

-- Ciclo para insertar un millón de registros
WHILE @i <= @total
BEGIN
    -- Generar fecha aleatoria entre 2015-01-01 y 2024-12-31
    SET @fecha = DATEADD(DAY, (RAND() * (DATEDIFF(DAY, '2015-01-01', '2024-12-31'))), '2022-01-01');
    
    -- Seleccionar usuario y medio de pago aleatorios
    SET @idUsuario = (SELECT TOP 1 idUsuario FROM Usuario ORDER BY NEWID());
    SET @idMedioPago = (SELECT TOP 1 idMedioPago FROM MedioPago ORDER BY NEWID());
    
    -- Calcular un total de venta aleatorio
    SET @totalVenta = ROUND((RAND() * (50000) + 2500), 2); -- Precio entre 2500 y 50000
    
    -- Insertar registro en la tabla Venta
    INSERT INTO Venta (fecha, total, idUsuario, idMedioPago)
    VALUES (@fecha, @totalVenta, @idUsuario, @idMedioPago);
    
    -- Incrementar el contador
    SET @i = @i + 1;
END
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
select * from venta;


-- Insercion en tabla Venta Detalle
DECLARE @MaxVentas INT = 1000000;
DECLARE @MaxProductos INT = (SELECT COUNT(*) FROM Producto);

-- Variable para controlar la cantidad de productos por venta
DECLARE @Cantidad INT;
DECLARE @SubTotal FLOAT;
DECLARE @Producto INT;
DECLARE @Venta INT;

-- Inserción de VentaDetalle
DECLARE @i INT = 1;
WHILE @i <= @MaxVentas
BEGIN
    -- Seleccionamos una venta específica
    SET @Venta = @i;

    -- Generamos un número aleatorio de productos para cada venta
    SET @Cantidad = FLOOR(RAND() * 2) + 1;  -- Cantidad de productos entre 1 y 2
    SET @Producto = (SELECT TOP 1 idProducto FROM Producto ORDER BY NEWID());  -- Producto aleatorio

    -- Obtención del precio del producto
    SET @SubTotal = (SELECT precio FROM Producto WHERE idProducto = @Producto) * @Cantidad;

    -- Insertar en VentaDetalle
    INSERT INTO VentaDetalle (idProducto, nroFacturacion, cantidad, subTotal)
    VALUES (@Producto, @Venta, @Cantidad, @SubTotal);

    SET @i = @i + 1;  -- Avanzamos al siguiente número de venta
END
-----------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------
select * from VentaDetalle;

