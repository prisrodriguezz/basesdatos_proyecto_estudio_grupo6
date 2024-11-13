USE tiendaOnline_BD;

-- ····························································
-- ········· PROCEDIMIENTOS ALMACENADOS ·······················
-- ····························································


-- ------------------------------------------------------------------
-- PROCEDIMIENTO PARA INSERTAR UN NUEVO PRODUCTO
-- Este procedimiento inserta un nuevo producto en la tabla Producto.
-- Recibe parámetros como nombre, descripción, precio y la categoría.
-- Si el producto ya existe, se genera un mensaje de error.
-- ------------------------------------------------------------------

CREATE PROCEDURE SP_InsertarProducto
  @nombreProducto VARCHAR(50),
  @descripcion VARCHAR(100),
  @precio FLOAT,
  @idCategoria INT
AS
BEGIN
  BEGIN TRY
	-- Verifica que no exista el producto que se quiere insertar
	IF NOT EXISTS (SELECT 1 FROM Producto WHERE nombreProducto = @nombreProducto AND descripcion = @descripcion AND idCategoria = @idCategoria)
		BEGIN
			-- Insercion del producto
			INSERT INTO Producto (nombreProducto, descripcion, precio, idCategoria)
			VALUES (@nombreProducto, @descripcion, @precio, @idCategoria);

			-- Mensaje de exito
			PRINT 'Producto insertado correctamente';
		END
	ELSE
		BEGIN
			-- Mensaje de error si el producto ya existe
			PRINT 'El producto que se desea insertar ya existe';
		END
  END TRY

  BEGIN CATCH
    -- Si ocurre un error en el bloque TRY, captura el error y muestra el mensaje
    PRINT 'Error al insertar el producto: ' + ERROR_MESSAGE();
  END CATCH
END;

-- ------------------------------------------------------------
-- CASOS DE USO PARA EL PROCEDIMIENTO SP_InsertarProducto
-- ------------------------------------------------------------

-- 1. Ejemplo de inserción exitosa de un nuevo producto:
-- Si el producto no existe, debería insertarse correctamente.
EXEC SP_InsertarProducto 'Mate de acero', 'Facil de limpiar', 850.00, 1;

-- 2. Intento de insertar un producto que ya existe:
-- Este producto ya existe en la base de datos, por lo que debería devolver un mensaje de error.
EXEC SP_InsertarProducto 'Mate de acero inoxidable', 'Facil de limpiar', 500.00, 1;
-- Mensaje esperado: 'El producto que se desea insertar ya existe'

-- 3. Intento de insertar un producto con un ID de categoría que no existe:
-- Se simula un ID de categoría que no existe en la base de datos.
EXEC SP_InsertarProducto 'Mate de Madera', 'Mate tradicional pintado', 1000.00, 20; 
-- Como ocurre un error en el bloque TRY, se espera que devuelva el mensaje de error del bloque CATCH


SELECT * FROM Producto;

--INSERT INTO Producto(nombreProducto, descripcion, precio, idCategoria)
--VALUES('Bombilla de acero', 'Sin descripcion', 2500.00, 7);


-- ···················································································································
-- ···················································································································


-- ---------------------------------------------------------------------------
-- PROCEDIMIENTO PARA MODIFICAR UN PRODUCTO
-- Este procedimiento modifica un producto de la tabla Producto.
-- Recibe parámetros: idProducto, nombre, descripción, precio y la categoría.
-- Si el producto no existe, se genera un mensaje de error.
-- ---------------------------------------------------------------------------

CREATE PROCEDURE SP_ModificarProducto 
  @idProducto INT,
  @nombreProducto VARCHAR(50),
  @descripcion VARCHAR(100),
  @precio FLOAT,
  @idCategoria INT
AS
BEGIN
  BEGIN TRY
    -- Verifica si el producto existe antes de la actualización
    IF EXISTS (SELECT 1 FROM Producto WHERE idProducto = @idProducto)
    BEGIN
        -- Actualización del producto
        UPDATE Producto
        SET nombreProducto = @nombreProducto,
            descripcion = @descripcion,
            precio = @precio,
            idCategoria = @idCategoria
        WHERE idProducto = @idProducto; 

        -- Mensaje de éxito si la actualización fue realizada
        PRINT 'Producto modificado correctamente';
    END
    ELSE
    BEGIN
        -- Mensaje de error si el producto no existe
        PRINT 'El producto con el ID especificado no existe';
    END
  END TRY

  BEGIN CATCH
    -- Si ocurre un error en el bloque TRY, captura el error y muestra el mensaje
    PRINT 'Error al modificar el producto: ' + ERROR_MESSAGE();
  END CATCH
END;

-- ------------------------------------------------------------
-- CASOS DE USO PARA EL PROCEDIMIENTO SP_ModificarProducto
-- ------------------------------------------------------------

-- 1. Ejemplo de modificación exitosa de un producto:
-- Modificar un producto existente con ID = 1
EXEC SP_ModificarProducto 1, 'Nuevo Mate de Algarrobo', 'Descripción del mate de algarrobo nuevo', 250.00, 1;
-- Mensaje esperado: 'Producto modificado correctamente'

-- 2. Intento de modificar un producto que no existe:
-- Intentamos modificar un producto con un ID que no existe (ID = 999)
EXEC SP_ModificarProducto 999, 'Mate de Acero', 'Descripción del mate de acero', 300.00, 2;
-- Mensaje esperado: 'El producto con el ID especificado no existe'


SELECT * FROM Producto;


-- ···················································································································
-- ···················································································································

-- ------------------------------------------------------------------------------------
-- PROCEDIMIENTO PARA ELIMINAR UN PRODUCTO
-- Este procedimiento elimina un producto de la tabla Producto.
-- Recibe como parámetro el 'ID' del producto que se desea eliminar.
-- Si el producto no existe o esta asociado a una venta, se genera un mensaje de error.
-- ------------------------------------------------------------------------------------

CREATE PROCEDURE SP_EliminarProducto
  @idProducto INT
AS
BEGIN
	-- Verifica si el producto está asociado a alguna Venta
    IF EXISTS (SELECT 1 FROM VentaDetalle WHERE idProducto = @idProducto)
    BEGIN
        PRINT 'No se puede eliminar el producto porque está asociado a una venta.';
        RETURN; -- Detiene la ejecución del procedimiento 
    END

    -- Verificar si el producto existe
    IF EXISTS (SELECT 1 FROM Producto WHERE idProducto = @idProducto)
		BEGIN
		  -- Si el producto existe lo elimina
		  DELETE FROM Producto WHERE idProducto = @idProducto;

		  -- Mensaje de éxito si el producto fue eliminado
		  PRINT 'Producto eliminado correctamente';
		END
    ELSE
		BEGIN
		  -- Mensaje de error si el producto no existe
		  PRINT 'El producto con el ID especificado no existe';
		END
END;


-- ------------------------------------------------------------
-- CASOS DE USO PARA EL PROCEDIMIENTO SP_EliminarProducto
-- ------------------------------------------------------------

-- 1. Ejemplo de eliminación exitosa de un producto no asociado a ventas:
-- Eliminamos un producto con ID = 10 que no está asociado a ninguna venta.
EXEC SP_EliminarProducto 60;
-- Mensaje esperado: 'Producto eliminado correctamente'

-- 2. Intento de eliminar un producto asociado a una venta:
-- Intentamos eliminar un producto con ID = 15 que está asociado a una venta.
EXEC SP_EliminarProducto 15;
-- Mensaje esperado: 'No se puede eliminar el producto porque está asociado a una venta.'

-- 3. Intento de eliminar un producto que no existe:
-- Intentamos eliminar un producto con un ID que no existe (ID = 999).
EXEC SP_EliminarProducto 999;
-- Mensaje esperado: 'El producto con el ID especificado no existe'


--SELECT * FROM Producto p LEFT JOIN VentaDetalle v ON V.idProducto = p.idProducto WHERE v.idProducto is null;



-- ···················································································································
-- ···················································································································

-- ------------------------------------------------------------------------------------
-- PROCEDIMIENTO PARA MODIFICAR EL PRECIO DE UN PRODUCTO 
-- Este procedimiento modifica el precio de un producto de la tabla Producto.
-- Recibe como parámetro el 'ID' del producto que se desea modificar el precio.
-- Si el producto no existe, se genera un mensaje de error.
-- ------------------------------------------------------------------------------------

CREATE PROCEDURE SP_ModificarPrecioProducto
  @idProducto INT,
  @precio FLOAT
AS
BEGIN
BEGIN TRY
    -- Verifica si el producto existe antes de la actualización
    IF EXISTS (SELECT 1 FROM Producto WHERE idProducto = @idProducto)
    BEGIN
        -- Actualización del precio
        UPDATE Producto
            SET precio = @precio
        WHERE idProducto = @idProducto; 

        -- Mensaje de éxito si la actualización fue realizada
        PRINT 'Precio del producto modificado correctamente';
    END
    ELSE
    BEGIN
        -- Mensaje de error si el producto no existe
        PRINT 'El producto con el ID especificado no existe';
    END
  END TRY

  BEGIN CATCH
    -- Si ocurre un error en el bloque TRY, captura el error y muestra el mensaje
    PRINT 'Error al modificar el producto: ' + ERROR_MESSAGE();
  END CATCH
END;

-- --------------------------------------------------------------
-- CASOS DE USO PARA EL PROCEDIMIENTO SP_ModificarPrecioProducto
-- --------------------------------------------------------------

-- 1. Ejemplo de modificación exitosa del precio de un producto:
-- Modificamos el precio de un producto con ID = 1 al precio 1000.00
EXEC SP_ModificarPrecioProducto 1, 1000.00;
-- Mensaje esperado: 'Precio del producto modificado correctamente'

-- 2. Intento de modificar el precio de un producto que no existe:
-- Intentamos modificar el precio de un producto con un ID que no existe (ID = 999).
EXEC SP_ModificarPrecioProducto 999, 350.00;
-- Mensaje esperado: 'El producto con el ID especificado no existe'

SELECT * FROM Producto;

