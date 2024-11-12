USE tiendaOnline_BD;
--Tarea
-----------------------------------------------------------------------------------
--Manejo de Permisos a Nivel de Usuarios
-----------------------------------------------------------------------------------

--Crea un usuario 
--Creacion de inicio de sesion a nivel de servidor
CREATE LOGIN usuarioBd WITH PASSWORD = 'usuario_password';
--Esta instrucción crea un usuario en una base de datos específica. 
--El usuario es una entidad dentro de una base de datos que tiene permisos y roles asociados. 
--El usuario se asocia a un login, lo que le permite acceder a una base de datos.
CREATE USER usuarioBd FOR LOGIN usuarioBd;
--ALTER ROLE: modificar rol
--ADD MEMBER: adiere el usuario a su rol
-- Asignar permisos de solo lectura (db_datareader, rol fijo de base de datos)
ALTER ROLE db_datareader ADD MEMBER usuarioBd;
--El usuarioBd puede leer los datos de las tablas
SELECT * FROM MedioPago;
--El usuarioBd no puede realizar otras operaciones. Ejemplo INSERT
INSERT INTO MedioPago(descripcion) VALUES ('Nueva medio de pago');

--Crea un usuario administrador
CREATE LOGIN usuarioAdmin WITH PASSWORD = 'administrador_password';
CREATE USER usuarioAdmin FOR LOGIN usuarioAdmin;
--Asigna permisos de administrador (db_owner, rol fijo de base de datos)
ALTER ROLE db_owner ADD MEMBER usuarioAdmin;


--CREATE PROCEDURE: instruccion para crear un procedimiento almacenado
CREATE PROCEDURE InsertarMedioPago
    @descripcion VARCHAR(100)
AS
--BEGIN y END para definir el bloque de código que se ejecutará 
--cuando se invoque el procedimiento almacenado.
BEGIN
    INSERT INTO MedioPago (descripcion) VALUES (@descripcion);
END;
--insertar una nueva categoria
--EXEC invoca al procedimiento almacenado
EXEC InsertarMedioPago @descripcion = 'Tarjeta prepago';
SELECT * FROM MedioPago;

--GRANT EXCUTE: otorga permiso de ejecucion sobre el procedimiento al usuario de lectura
GRANT EXECUTE ON InsertarMedioPago TO usuarioBd;
-- Realizar un INSERT directamente sobre la tabla(error de permisos)
INSERT INTO MedioPago(descripcion) VALUES ('Efectivo');
-- Realizar un INSERT directamente con usuarioAdmin(correcto)
INSERT INTO MedioPago(descripcion) VALUES ('Tarjeta Prepago');
-- Realizar un INSERT a través del procedimiento almacenado con el
--usuarioBd (se le otorga el permiso de ejecutar ese procedimiento - GRANT EXCUTE)
EXEC InsertarCiudad 'Codigo qr';
-- Realizar un INSERT a través del procedimiento almacenado con el usuarioAdmin
EXEC InsertarCiudad 'Billeteras digitales';

------------------------------------------------------------------------------------
--Permisos a nivel de roles de base de datos
------------------------------------------------------------------------------------

--creacion de un rol que solo permita lectura
CREATE ROLE RolLectura;
--GRANT SELECT: otorga permiso de lectura de la tabla
GRANT SELECT ON MedioPago TO RolLectura;

-- Creacion de un usuario y asignacion de permiso lectura
CREATE LOGIN usuarioBd2 WITH PASSWORD = 'usuario_password_2';
CREATE USER usuarioBd2 FOR LOGIN usuarioBd2;
-- Asignar permisos de solo lectura (RolLectura, rol personalizado)
ALTER ROLE RolLectura ADD MEMBER usuarioBd2;

-- Creacion de un usuario administrador
CREATE LOGIN usuarioAdmin2 WITH PASSWORD = 'administrador_password_2';
CREATE USER usuarioAdmin2 FOR LOGIN usuarioAdmin2;
ALTER ROLE db_owner ADD MEMBER usuarioAdmin2;

--comprobar los roles
--uso de procedimiento almacenado en base de datos
EXEC sp_helpuser;

--Resultado: ejecutar el select correctamente (usuarioBd2 solamente con ese permiso)
SELECT * FROM MedioPago;
-- Insertar un nuevo registro en la tabla (usuarioBd2 no tiene permiso - Error)
INSERT INTO MedioPago(descripcion) VALUES ('Nueva medio de pago');



--Conclusiones

--El desarrollo de los temas presentados en cada tarea correspodiente a 
--el manejo de permisos y roles en base de datos, se encuentran funcionando efectivamente
--a la vez que se pudo profundizar en comandos de SQL Server, como lo son los CREATE y ALTER que en el desarrollo del tema 
--pudimos implementar en la creacion de usuarios, roles y permisos, estos mismos son de total importancia a la hora de 
--hablar de seguridad y administracion en base de datos. Tambien el conocimiento y la ejecucion de roles fijos, personalizados,
--,autenticacion mixta y procedimientos almacenados.
