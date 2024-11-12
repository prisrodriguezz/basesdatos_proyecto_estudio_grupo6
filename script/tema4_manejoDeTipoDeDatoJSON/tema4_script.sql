
-----------------------------------------
-- OPERACIONES CRUD
-----------------------------------------


-- CREACION DE TABLA CON UNA COLUMNA JSON.

	drop table if exists jsonPrueba_Usuario
	create table jsonPrueba_Usuario(
		id int identity,
		info nvarchar(max)
	);


-- Inserción de cada registro en jsonPrueba_Usuario como JSON a partir de Usuario
	INSERT INTO jsonPrueba_Usuario (info)
	SELECT 
		(SELECT nombre, 
				apellido,
				dni, 
				telefono, 
				email,
				domicilio,
				fechaNacimiento
		 FOR JSON PATH, WITHOUT_ARRAY_WRAPPER) AS info
	FROM Usuario;


-- INSERCION DE DATOS EN LA TABLA CREADA EN FORMATO JSON.
insert into jsonPrueba_Usuario(info) values 
('{"nombre": "Emiliano","apellido": "Paz","dni": "12345678","telefono": "77777777","email": "emipaz@mail.com","domicilio": "junin 27","fechaNacimiento": "2000-01-01"}'),
('{"nombre": "Alejandro","apellido": "Carrasco","dni": "87654321","telefono": "77777776","email": "alecarras@mail.com","domicilio": "dominguez 123","fechaNacimiento": "2001-02-01"}'),
('{"nombre": "Juan","apellido": "Gomez","dni": "54321678","telefono": "77777775","email": "juango@mail.com","domicilio": "rivadavia 2","fechaNacimiento": "1988-01-01"}'),
('{"nombre": "Tomas","apellido": "Aguirre","dni": "11111111","telefono": "77777774+","email": "tomiagui@mail.com","domicilio": "peron 678","fechaNacimiento": "1998-01-01"}'),
('{"nombre": "Roberto","apellido": "Fernandez","dni": "22222222","telefono": "77777773","email": "roberfer@mail.com","domicilio": "jupiter 123","fechaNacimiento": "1993-01-01"}')



-- ACTUALIZAR UN DATO EN UNA COLUMNA TIPO JSON
update jsonPrueba_Usuario
set info = json_modify(info,'$.telefono',123456789)
where json_value(info,'$.dni') = '11111111';

select * from jsonPrueba_Usuario where JSON_VALUE(info,'$.dni') = 11111111


-- ELIMINAR REGISTRO BASADOS EN DATOS JSON
delete from jsonPrueba_Usuario
where json_value(info,'$.edad') < 25 


select * from jsonPrueba_Usuario
for json path


-------------------------------------------
-- OPERACIONES DE CONSULTAS
-------------------------------------------


-- CONSULTA DE DATOS JSON
select id,
	json_value(info,'$.nombre') as nombre,
	json_value(info,'$.apellido') as apellido,
	json_value(info,'$.dni') as dni,
	json_value(info,'$.email') as email,
	json_value(info,'$.domicilio') as domicilio,
	json_value(info,'$.telefono') as telefono,
	json_value(info,'$.fechaNacimiento') as fechaNacimiento
from jsonPrueba_Usuario


-- CONSULTA ORDENADA POR NOMBRE
select
	json_value(info,'$.nombre') as nombre,
	json_value(info,'$.apellido') as apellido,
	json_value(info,'$.dni') as dni
from jsonPrueba_Usuario
order by nombre asc;


/* CONSULTA ORDEANDA POR EDAD, CALCULANDO LA EDAD DEL USUARIO POR SU FECHA DE NACIMIENTO MAYOR A 30
(NO ES LA EDAD EXACTA YA QUE TOMAMOS SOLO LA DIFERENCIA ENTRE EL AÑO DE NACIMIENTO Y LA ACTUAL SIN TENER EN CUENTA EL MES Y DIA)
*/

select 
	json_value(info,'$.nombre') as nombre,
	JSON_VALUE(info,'$.apellido') as apellido,
	datediff(year,json_value(info,'$.fechaNacimiento'),getdate()) as edad 
from jsonPrueba_Usuario
WHERE datediff(year,json_value(info,'$.fechaNacimiento'),getdate()) < 30
order by edad asc

-------------------------------------
-- OPTIMIZACION DE CONSULTA
-------------------------------------
/*
es recomendable extraer esos datos en columnas separadas para evitar acceder al JSON cada vez.
Esto es especialmente útil para mejorar el rendimiento al realizar filtros y búsquedas en datos JSON.
*/

ALTER TABLE jsonPrueba_Usuario
ADD 
	dni AS JSON_VALUE(info, '$.dni'),
    fechaNacimiento AS TRY_CAST(JSON_VALUE(info, '$.fechaNacimiento') AS DATE);

select * from jsonPrueba_Usuario

-- Indexar las columnas calculadas para optimizar las consultas:

CREATE INDEX idx_dni ON jsonPrueba_Usuario(dni);


--Usar OPENJSON con CROSS APPLY para mapear y extraer los datos del JSON en varias columnas:
SELECT 
    j.id,
    u.nombre,
    u.apellido,
    u.dni,
    u.telefono,
    u.email
FROM jsonPrueba_Usuario AS j
CROSS APPLY OPENJSON(j.info)
WITH (
    nombre NVARCHAR(50) '$.nombre',
    apellido NVARCHAR(50) '$.apellido',
    dni NVARCHAR(20) '$.dni',
    telefono NVARCHAR(20) '$.telefono',
    email NVARCHAR(100) '$.email'
) AS u;


/*
Con OPENJSON y CROSS APPLY, SQL Server procesa todo el JSON en una sola operación,
lo que es más eficiente y optimizado en comparación con hacer múltiples llamadas a JSON_VALUE.
*/
