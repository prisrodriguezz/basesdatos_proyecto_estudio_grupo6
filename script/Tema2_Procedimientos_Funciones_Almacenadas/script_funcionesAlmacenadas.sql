USE tiendaOnline_BD;

-- ····························································
-- ············ FUNCIONES ALMACENADAS ·························
-- ····························································

-- -----------------------------------------------------------------------------------
-- FUNCION QUE CALCULA EL TOTAL DE LA VENTA A TRAVES DEL NRO DE FACTURA
-- Esta función recibe como parametro el número de facturación 
-- Calcula el total de la venta sumando todos los subtotales de la tabla 'VentaDetalle'
-- -----------------------------------------------------------------------------------

CREATE FUNCTION FN_CalcularTotalVenta (@nroFacturacion INT)
RETURNS FLOAT -- Retorna un valor float
AS
BEGIN
  DECLARE @totalVenta FLOAT;

  -- Busca en la tabla VentaDetalle todos los registros que corresponden al @nroFacturacion y suma los valores de la columna subTotal
  -- Asigna el resultado de la suma a la variable @totalVenta
  SELECT @totalVenta = SUM(subTotal)
  FROM VentaDetalle
  WHERE nroFacturacion = @nroFacturacion;

  RETURN @totalVenta; -- Retorna el total
END;


-- ------------------------------------------------------------
-- CASOS DE USO PARA LA FUNCION FN_CalcularTotalVenta
-- ------------------------------------------------------------

-- 1. Obtener el total de la venta para una factura específica.
SELECT nroFacturacion, fecha, dbo.FN_CalcularTotalVenta(nroFacturacion) AS TotalConFuncion
FROM Venta
WHERE nroFacturacion = 30
ORDER BY fecha DESC;

--SELECT * FROM venta WHERE nroFacturacion = 30

-- 2. Ver el total de todas las ventas con sus fechas de facturación.
SELECT nroFacturacion, fecha, dbo.FN_CalcularTotalVenta(nroFacturacion) AS Total
FROM Venta
ORDER BY Total DESC;



-- ···················································································································
-- ···················································································································

-- -----------------------------------------------------------------------------------
-- FUNCION QUE RETORNA EL PRODUCTO MAS VENDIDO
-- Esta función retorna el producto que tiene la mayor cantidad de unidades vendidas.
-- -----------------------------------------------------------------------------------

CREATE FUNCTION FN_ProductoMasVendido()
RETURNS TABLE  -- Devuelve un conjunto de resultados en formato de tabla en linea
AS
RETURN
(
    SELECT TOP 1 VD.idProducto, P.nombreProducto, P.precio, C.descripcion AS Categoria, SUM(VD.cantidad) AS 'Cant Vendida'
    FROM 
        VentaDetalle VD
    JOIN 
        Producto P ON VD.idProducto = P.idProducto
	JOIN
		Categoria C ON C.idCategoria = P.idCategoria
    GROUP BY 
        VD.idProducto, P.nombreProducto, P.precio, C.descripcion
    ORDER BY 
        SUM(VD.cantidad) DESC
);

-- ------------------------------------------------------------
-- CASOS DE USO PARA LA FUNCION FN_ProductoMasVendido
-- ------------------------------------------------------------

-- Obtener el producto más vendido.
SELECT * FROM FN_ProductoMasVendido();


--SELECT idProducto, SUM(cantidad) FROM VentaDetalle GROUP BY idProducto ORDER BY SUM(cantidad) DESC;


-- ···················································································································
-- ···················································································································

-- ------------------------------------------------------------------------------------------
-- FUNCION QUE CALCULA LA CANTIDAD DE VENTAS REALIZADAS POR UN MEDIO DE PAGO ESPECIFICO
-- Esta función recibe como parametro el identificador del medio de pago
-- Calcula la cantidad de ventas realizadas por ese medio de pago a través de la tabla Venta
-- ------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CantVentasPorMedioPago (@idMedioPago INT)
RETURNS INT 
AS
BEGIN
  DECLARE @cantVentas INT;

  -- Calcula la cantidad de ventas para el medio de pago
  SELECT @cantVentas = COUNT(nroFacturacion)
  FROM Venta
  WHERE idMedioPago = @idMedioPago;

  RETURN @cantVentas;
END;

-- ------------------------------------------------------------
-- CASOS DE USO PARA LA FUNCION FN_CantVentasPorMedioPago
-- ------------------------------------------------------------

-- 1. Obtener la cantidad de ventas realizadas con un medio de pago específico.
SELECT idMedioPago, descripcion, dbo.FN_CantVentasPorMedioPago(idMedioPago) AS CantVentas
FROM MedioPago
WHERE idMedioPago = 1
ORDER BY CantVentas DESC;

-- 2. Ver la cantidad de ventas por cada medio de pago, ordenado de mayor a menor.
SELECT idMedioPago, descripcion, dbo.FN_CantVentasPorMedioPago(idMedioPago) AS CantVentas
FROM MedioPago
ORDER BY CantVentas DESC;


--SELECT idMedioPago, descripcion, dbo.FN_CantVentasPorMedioPago(idMedioPago) AS CantVentas
--FROM MedioPago;

--SELECT idMedioPago, COUNT(idMedioPago) AS 'Cant'
--FROM Venta GROUP BY idMedioPago;

-- ···················································································································
-- ···················································································································

-- ----------------------------------------------------------------------------------------------------------------
-- FUNCION QUE CALCULA EL TOTAL DE TODAS LAS VENTAS REALIZADAS POR UN USUARIO
-- Esta función recibe como parametro el identificador de usuario
-- Calcula la suma total de todas las ventas realizadas por ese usuario, sumando el campo 'total' de la tabla Venta
-- ----------------------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_TotalVentasUsuario (@idUsuario INT)
RETURNS FLOAT -- Retorna un valor float
AS
BEGIN
  DECLARE @totalVentas FLOAT;

  -- Calcula el total de ventas para el usuario especificado
  SELECT @totalVentas = SUM(total)
  FROM Venta
  WHERE idUsuario = @idUsuario;

  RETURN @totalVentas;
END;

-- ------------------------------------------------------------
-- CASOS DE USO PARA LA FUNCION FN_TotalVentasUsuario
-- ------------------------------------------------------------

-- 1. Obtener el total de ventas de un usuario con un ID específico.
SELECT u.idUsuario, u.nombre, u.apellido, u.dni, dbo.FN_TotalVentasUsuario(u.idUsuario) AS TotalVentas
FROM Usuario u
WHERE u.idUsuario = 24
ORDER BY TotalVentas DESC;

-- 2. Ver el total de ventas realizadas por todos los usuarios, ordenado de mayor a menor.
SELECT u.idUsuario, u.nombre, u.apellido, u.dni, dbo.FN_TotalVentasUsuario(u.idUsuario) AS TotalVentas
FROM Usuario u
INNER JOIN Venta v ON v.idUsuario = u.idUsuario
GROUP BY u.idUsuario, u.nombre, u.apellido, u.dni
ORDER BY TotalVentas DESC;


-- ···················································································································
-- ···················································································································

-- ----------------------------------------------------------------------------------------------------------------
-- FUNCION QUE CALCULA LA EDAD A PARTIR DE LA FECHA DE NACIMIENTO
-- Esta función recibe como parametro el identificador de usuario
-- Calcula la edad basándose en su fecha de nacimiento registrada en la tabla Usuario.
-- Ajusta la edad teniendo en cuenta si la persona ya ha cumplido años este año o no. 
-- ----------------------------------------------------------------------------------------------------------------

CREATE FUNCTION FN_CalcularEdad (@idUsuario INT)
RETURNS INT
AS
BEGIN
    DECLARE @fechaNacimiento DATE;
    DECLARE @edad INT;

    -- Obtener la fecha de nacimiento del usuario
    SELECT @fechaNacimiento = fechaNacimiento
    FROM Usuario
    WHERE idUsuario = @idUsuario;

    -- Calcula la edad
    SET @edad = DATEDIFF(YEAR, @fechaNacimiento, GETDATE());


	-- Verifica si el mes de nacimiento de la persona es posterior al mes actual
	-- o si el mes de nacimiento es el mismo que el mes actual y el día de nacimiento es posterior al día actual
    IF (MONTH(@fechaNacimiento) > MONTH(GETDATE()))
        OR (MONTH(@fechaNacimiento) = MONTH(GETDATE()) AND DAY(@fechaNacimiento) > DAY(GETDATE()))
    BEGIN
        SET @edad = @edad - 1;
    END

    RETURN @edad;
END;

-- ------------------------------------------------------------
-- CASOS DE USO PARA LA FUNCION FN_CalcularEdad
-- ------------------------------------------------------------

-- 1. Obtener la edad de un usuario con un ID específico.
SELECT dbo.FN_CalcularEdad(3) AS Edad;

-- 2. Ver la edad de todos los usuarios ordenados por fecha de nacimiento de mayor a menor
SELECT u.idUsuario, u.nombre, u.apellido, u.dni, u.fechaNacimiento, dbo.FN_CalcularEdad(u.idUsuario) AS Edad
FROM Usuario u
ORDER BY Edad DESC;


