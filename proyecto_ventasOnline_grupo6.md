# Proyecto de Estudio!
    
**Estructura del documento principal:**

# PRESENTACIÓN PLATAFORMA DE VENTAS ONLINE MATEMANIA

**Asignatura**: Bases de Datos I (FaCENA-UNNE)

**Integrantes**:
 - Ayala, Yago Alberto
 - Colaneri, Ezequiel Marcelo
 - Delgado, Ludmila Itati
 - Rodriguez, Priscila Oriana

**Año**: 2024

## CAPÍTULO I: INTRODUCCIÓN

### Caso de estudio

Un emprendimiento de mates artesanales, conocido por sus productos personalizados y de alta calidad, quiere llevar su negocio al siguiente nivel creando una tienda online. Con esta plataforma, los clientes podrán ver los productos, hacer compras de forma fácil y rápida. A medida que el negocio crece, necesitan una forma más eficiente de manejar las ventas, pedidos y consultas de los clientes.

### Definición o Planteamiento del Problema

El negocio ha estado creciendo y, con más pedidos y consultas de los clientes, la gestión manual se ha vuelto complicada. Les cuesta mantener el control del stock, responder a las preguntas a tiempo y llevar un registro claro de las ventas. Esto ha empezado a afectar la experiencia del cliente y el manejo interno del negocio.

Por eso, necesitan desarrollar una tienda online que haga todo más simple. Esta plataforma debe permitir organizar los productos por categorías, gestionar las ventas, aceptar diferentes formas de pago y ofrecer un espacio para que los clientes hagan consultas. Además, deberá distinguir entre los usuarios regulares y los administradores, permitiendo a cada uno acceder a las funciones según su rol. La idea es que todo fluya mejor, tanto para el negocio como para los clientes.


## CAPITULO II: MARCO CONCEPTUAL O REFERENCIAL

## **TEMA 1: MANEJOS DE PERMISOS A NIVEL DE USUARIOS DE BASE DE DATOS** 

Los **Roles** en base de datos, son utilizados para proteger el acceso a datos y objetos, como por ejemplo esquemas o tablas. Los Roles, sirven para administrar y gestionar con mayor facilidad los permisos en la base de datos, es posible definir roles con permisos especificos y a la vez asignar estos roles a usuarios. Algunos ejemplos de roles comunes incluyen:

⦁	Administrador: Puede realizar cualquier operación, incluida la administración de usuarios y permisos.

⦁	Usuario: Puede realizar solo operaciones de lectura o escritura.

 Los usuarios son las entidades a las que se les otorgan **permisos**, un control adecuado de permisos asegura que solo las personas autorizadas puedan realizar determinadas acciones sobre la base de datos. Algunos de estos permisos son :
 
⦁	Lectura (SELECT): Permite ver los datos.

⦁	Escritura (INSERT): Permite agregar nuevos registros.

⦁	Modificación (UPDATE): Permite cambiar registros existentes.

⦁	Eliminación (DELETE): Permite borrar registros.

⦁	Ejecutar (EXECUTE): Permite ejecutar procedimientos almacenados o funciones.

⦁	Administración (GRANT, REVOKE, ALTER, DROP): Permite modificar la estructura de la base de datos o gestionar otros permisos.

SQL server proporciona varios roles, que son las entidades de seguridad que agrupan otras entidades de seguridad. Existen dos tipos de roles en el nivel de base de datos: los roles fijos de base de datos que están predefinidos en la base de datos y los roles de base de datos definidos por el usuario que el usuario puede crear.

- **ROLES FIJOS DE BASE DE DATOS:**

⦁	db_owner: Permiso total sobre la base de datos (administrador completo). Crear, modificar, eliminar objetos, administrar seguridad.

⦁	db_securityadmin:Gestión de la seguridad de la base de datos (roles y permisos). Crear/Modificar roles, asignar permisos.

⦁	db_accessadmin:Gestión de acceso de usuarios a la base de datos. Agregar/Eliminar usuarios.

⦁	db_backupoperator:Permiso para realizar copias de seguridad y restaurar bases de datos. Ejecutar backups y restauraciones.

⦁	db_datareader:Permiso solo de lectura sobre todas las tablas.	Ejecutar consultas SELECT en todas las tablas.

⦁	db_datawriter: Permiso de escritura sobre todas las tablas.Ejecutar INSERT, UPDATE, DELETE en todas las tablas.

⦁	db_ddladmin:Permiso para modificar la estructura de la base de datos (tablas, vistas, etc.). Crear/Modificar/Eliminar objetos (tablas, vistas, etc.).

⦁	db_denydatareader:Denegar el permiso de lectura sobre todas las tablas. Bloquea consultas SELECT en cualquier tabla.

⦁	db_denydatawriter:Denegar el permiso de escritura sobre todas las tablas. Bloquea operaciones INSERT, UPDATE, DELETE.

- **ROLES DEFINIDOS POR EL USUARIO.** Ejemplo:

Crear un rol de ventas: CREATE ROLE rol_ventas;

Asignar permisos a ese rol: GRANT SELECT, INSERT, UPDATE ON ventas TO rol_ventas;

Asignar rol a un usuario: EXEC sp_addrolemember 'rol_ventas', 'usuario_juan';



## **TEMA 2: PROCEDIMIENTOS Y FUNCIONES ALMACENADAS** 
- **PROCEDIMIENTOS ALMACENADOS**

En SQL Server, los **procedimientos almacenados** son conjuntos de instrucciones SQL encapsulados que permiten ejecutar operaciones complejas en la base de datos de manera estructurada y eficiente. Pueden recibir parámetros, devolver valores, y manejar errores. Esta encapsulación es útil para reducir el tráfico de red y controlar los accesos a la base de datos, porque solo se envía una sola instrucción para que se ejecuten varias operaciones, en lugar de tener que enviar cada línea de código, lo que reduce el tráfico entre el cliente y el servidor y mejora la velocidad.

Aportan varios beneficios: permiten reutilizar y simplificar el código al encapsular tareas comunes de la base de datos, facilitan el mantenimiento (las aplicaciones que los llaman no necesitan conocer los detalles internos) y suelen ser más rápidos gracias a los planes de ejecución precompilados que SQL Server reutiliza para mejorar el rendimiento.

Hay diferentes tipos de procedimientos en SQL Server:

- **Los definidos por el usuario:** son creados por el usuario para realizar tareas especificas. Pueden recibir o no parametros. <br>
En el siguiente ejemplo, el procedimiento 'ObtenerClientesActivos' devuelve una lista de clientes activos.<br>
```
CREATE PROCEDURE ObtenerClientesActivos
AS
BEGIN
	SELECT ClienteID, Nombre, Ciudad FROM Clientes WHERE Activo = 1;
END;
```

- **Los temporales:** se almacenan en la base de datos **tempdb**. Existen procedimientos temporales locales (solo visibles en la sesión actual, se elimina cuando se cierra la conexión) y globales (visibles en todas las sesiones, se elimina cuando la última conexión que lo usa se cierra). <br>

El siguiente ejemplo devuelve todas las columnas de los primeros 10 registros de la tabla 'Productos'. <br>
```
CREATE PROCEDURE #ProcedimientoTemporalLocal
AS
BEGIN
	SELECT TOP 10 * FROM Productos;
END;
```
*Una vez que la conexión que creó el procedimiento se cierra, este procedimiento se elimina automáticamente. Este tipo de procedimiento es útil para operaciones que se necesitan realizar solo de forma transitoria en la sesión actual.* <br>

El siguiente ejemplo devuelve todas las columnas de la tabla 'Ordenes' donde la columna 'FechaOrden' cumple con la restriccion de fecha.<br>
```
CREATE PROCEDURE ##ProcedimientoTemporalGlobal
AS
BEGIN
	SELECT * FROM Ordenes WHERE FechaOrden > GETDATE() - 30;
END;
```
*Se elimina automáticamente cuando la última sesión que lo esté usando se cierra. Este tipo de procedimiento es útil cuando se necesita compartir temporalmente una consulta específica entre diferentes sesiones.*<br>

- **Los del sistema:** SQL Server incluye procedimientos del sistema (que inician con sp_) para ayudar en el mantenimiento y las operaciones internas. Estos están almacenados en la base de datos master.<br>
El siguiente ejemplo muestra la estructura de la tabla 'Clientes'.<br>
```EXEC **sp_**help 'Clientes';```
<br>
 
- **Procedimientos extendidos:** los procedimientos extendidos (xp_) permiten a SQL Server ejecutar funciones externas en el sistema operativo, como interactuar con archivos y sistemas. Estos se utilizan con precaución, ya que acceden a recursos externos.<br>
El sguiente ejemplo ejecuta el comando dir para mostrar el contenido de la carpeta 'C:\Archivos'.<br>
```EXEC **xp_**cmdshell 'dir C:\Archivos';```<br>
*'xp_cmdshell' permite ejecutar comandos del sistema operativo desde SQL Server (es necesario habilitar este procedimiento primero).* <br>

En SQL Server, se pueden manejar errores dentro de un procedimiento almacenado utilizando las instrucciones **TRY...CATCH**. Esto permite capturar y gestionar errores que ocurran durante la ejecución de las instrucciones dentro del bloque TRY.

Ejemplo de uso: <br>
```
CREATE PROCEDURE NombreProcedimiento
AS
BEGIN
	BEGIN TRY
            -- Código que puede causar error
            DELETE FROM Clientes WHERE ClienteID = 100;<br>
        END TRY
        BEGIN CATCH
            -- Si ocurre un error en el bloque TRY, se ejecutan las instrucciones del bloque CATCH<br>
            PRINT 'Error: ' + ERROR_MESSAGE();<br>
        END CATCH;
END;
```

- **FUNCIONES ALMACENADAS**

Por otro lado, las **funciones almacenadas** en SQL Server son rutinas que permiten encapsular lógicas de cálculo y operaciones complejas dentro de una función que puede ser reutilizada en múltiples consultas y procedimientos. **SQL Server** proporciona funciones integradas pero ademas permite crear funciones definidas por el usuario.

- **Funciones integradas (del sistema):**
- Funciones de agregado --> SUM, AVG, COUNT, MAX, MIN
- Funciones de fecha y hora --> GETDATE, DAY, MONTH, YEAR, DATEADD, DATEDIF, ISDATE
- Funciones matematicas --> ABD, RAND, LOG10, SQRT, POWER, TAN, PI, RADIANS<br>

- **Funciones definidas por el usuario:** devuelven un solo valor de tipo escalar, como un número, texto, fecha u otro tipo de dato único. Pueden aceptar uno o varios parámetros de entrada y usarse en cualquier parte de una consulta donde sea válido un valor, como en la lista de selección de una instrucción **SELECT**, o en condiciones **WHERE** o **ORDER BY**. Son útiles cuando se necesita encapsular lógica o cálculos repetitivos en un único lugar para simplificar el código y facilitar la reutilización.

A diferencia de los procedimientos almacenados, las funciones no pueden modificar tablas externas ni realizar cambios permanentes en el estado de la base de datos. Si se produce un error dentro de una función, la ejecución se detiene y se cancela la función completa.<br>

Sintaxis para la creacion de una funcion:<br>
```
CREATE FUNCTION nombreFuncion (@parametro1 tipo, @parametro2 tipo, ...)
RETURNS tipoDeDato_queRetorna
AS
BEGIN
    -- Declaración de variables locales
    DECLARE @variable_local tipo_de_dato;

    -- Cuerpo de la función (cálculos, operaciones, etc.)

    -- Devolver el resultado de la función
    RETURN @variable_local;
END;
```




## TEMA 3 " : OPTIMIZACIÓN DE CONSULTAS A TRAVES DE ÍNDICES 

### MANEJOS DE INDICES EN SQL:

Los índices son estructuras que mejoran el rendimiento de las consultas que se realicen, ya que acceden de manera rápida a los datos.
Los dos tipos en los cuales se dividen son agrupados (“Clusters”)y no agrupados.

**INDICES AGRUPADOS:**

Cuando hablamos de índices agrupados, el típico ejemplo es el de un diccionario, donde als palabras a a buscar están agrupadas y ordenadas por orden alfabético, de esta manera al buscar una palabra determinada (Ej. Casa) se sabe que debe dirigirse a la sección donde comienzan las palabras con “C”.

De igual manera funcionan los clusters, agrupan y ordenan por la columna que se haya definido al momento de la creación del índice, que puede ser la que queramos. Pero lo ideal seria usar aquellas que:

•	Son únicas o contienen muchos valores distintos (**PK, DNI, nombres, correos, etc**)

•	Se tiene acceso a ellas de forma secuencial (**fechas**)

•	Definido como **IDENTITY**.

•	Se utilizan con frecuencia para ordenar los datos recuperados de una tabla

Cabe aclarar, que SQL Server al momento de crear una tabla, este ya crea un índice agrupado por PK si no se definió otro índice. Este agrupamiento subsiste hasta que sea creado por el administrador de la Base de Datos.

Como la clave primaria suele ser una columna consultada o referenciada con frecuencia, SQL Server aprovecha la estructura de índice agrupado en esa columna si no se ha asignado ya.

Otra cosa importante sobre los índices agrupados es que ellos modifican físicamente el orden de la base de datos, es por ello que en lso cases de DELETE, UPDATE,INSERT esto es mas costoso en rendimiento, mas si se trata de modificaciones en registros intermedios ya que eso significaría un reordenamiento de los demás registros.

**INDICES NO AGRUPADOS:**

Así como hablamos de que los agrupados se asemejan a los diccionarios o guías telefónicas, los no agrupados son parecidos al índice de un libro, ya que no modifican físicamente la estructura de la base de datos, solamente indican en que lugar se encuentran a través de punteros. Es por ello que en los casos de DELETE, UPDATE,INSERT, se realizan más rápidamente al no haber modificaciones físicas.

Antes de crear índices no agrupados, se debe conocer cómo se tiene acceso a los datos. Hay que considerar la posibilidad de utilizar un índice no clúster para consultas que cuentan con los siguientes atributos:

•	Usan cláusulas **JOIN o GROUP BY**.
Crean varios índices no clúster para las columnas que intervienen en operaciones de combinación y de agrupación, y un índice clúster para las columnas de clave externa.

•	No devuelven conjuntos de resultados de **gran tamaño**.
Cree índices filtrados para atender consultas que devuelven un subconjunto bien definido de filas en una tabla grande.

•	Contienen columnas que suelen incluirse en las condiciones de búsqueda de una consulta:
 Como una cláusula ** WHERE**, que devuelven coincidencias exactas.



## **TEMA 4 " MANEJO DE TIPO DE DATO JSON "** 

## JSON: Java Script Object Notation 

Se usa principalmente para enviar y recibir datos puede ser para intercambios de datos entre un servidor y una página web. En bases de datos relacionales permite almacenar y manipular datos semi-estructurados en un formato de texto flexible y compatible con aplicaciones modernas. El soporte para JSON se ha convertido en una característica valiosa para trabajar con datos dinámicos o menos rígidos, especialmente en aplicaciones web y móviles que utilizan JSON 

 • JSON se vale del concepto “clave-valor”, donde para cada clave existente existe un valor asociado. 

 • Un conjunto de claves y valores conforman un objeto, que en JSON se representa mediante la apertura y cierre de llaves { }. 

Almacenamiento de Datos JSON: En SQL Server, JSON se almacena generalmente en columnas de tipo NVARCHAR, ya que JSON es esencialmente texto estructurado. Esto permite almacenar JSON como una cadena dentro de la tabla, facilitando el uso de datos semi-estructurados junto con datos tabulares tradicionales. 

Consultas de Datos JSON:

	• SQL Server ofrece funciones como JSON_VALUE, JSON_QUERY, y OPENJSON, que permiten leer y extraer valores específicos o subconjuntos del JSON. 
 
	• JSON_VALUE: Extrae un valor escalar (como una cadena o número) de un campo JSON. 
 
	• JSON_QUERY: Devuelve una subestructura JSON, útil para extraer objetos JSON o arrays completos. 
 
	• OPENJSON: Convierte JSON en formato tabular, permitiendo acceder a cada par clave-valor y trabajar con él como si fuera una tabla. 

 Para optimizar consultas frecuentes, es posible crear columnas calculadas basadas en valores JSON (por ejemplo, extraer un ID o una fecha de un objeto JSON en una columna calculada). Estas columnas calculadas pueden ser indexadas para mejorar el rendimiento. 

Operaciones CRUD: 
• Insertar: Los datos JSON se pueden insertar como texto en columnas NVARCHAR. 

• Actualizar y Eliminar: SQL Server permite actualizar datos JSON usando funciones para modificar valores específicos sin reescribir el JSON completo.

• Consultas: Las funciones de JSON y columnas calculadas facilitan la consulta directa de propiedades JSON sin necesidad de extraer todo el objeto. 

## CAPÍTULO III: METODOLOGÍA SEGUIDA 

Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros.

 **a) Cómo se realizó el Trabajo Práctico**
Vestibulum rutrum feugiat molestie. Nunc id varius augue. Ut augue mauris, venenatis et lacus ut, mattis blandit urna. Fusce lobortis, quam non vehicula scelerisque, nisi enim ultrices diam, ac tristique libero ex nec orci.

 **b) Herramientas (Instrumentos y procedimientos)**
Donec lobortis tincidunt erat, non egestas mi volutpat in. Cras ante purus, luctus sed fringilla non, ullamcorper at eros. Integer interdum id orci id rutrum. Curabitur facilisis lorem sed metus interdum accumsan. 


## CAPÍTULO IV: DESARROLLO DEL TEMA / PRESENTACIÓN DE RESULTADOS 

Maecenas molestie lacus tincidunt, placerat dolor et, ullamcorper erat. Mauris tortor nisl, ultricies ac scelerisque nec, feugiat in nibh. Pellentesque interdum aliquam magna sit amet rutrum. 



### Diagrama relacional
![diagrama_relacional](https://github.com/prisrodriguezz/basesdatos_proyecto_estudio_grupo6/blob/main/doc/modelo_relacional.png)

### Diccionario de datos

Acceso al documento [PDF](doc/diccionario_.pdf) del diccionario de datos.


### Desarrollo TEMA 1 "----"

Este capítulo describe el proceso de desarrollo y presentación de resultados en la gestión de permisos y roles en una base de datos SQL Server. 
Explicacion de temas tecnicos trabajados y resultados:

 Creación de Usuarios y Asignación de Roles
 
En este tema se implementaron instrucciones para crear usuarios en el servidor y asignarles roles de acceso específicos a la base de datos. Se crearon usuarios con diferentes niveles de permisos: de solo lectura y de administrador. A través de los roles, se gestionó de manera eficiente qué operaciones podía realizar cada usuario.

 Asignación de Permisos
 
A continuación, se asignaron permisos de acceso a las tablas mediante la inclusión de los usuarios en roles predefinidos como db_datareader (solo lectura) y db_owner (administrador). También se asignaron permisos específicos sobre procedimientos almacenados para permitir la inserción de datos sin dar acceso directo a las tablas.

 Procedimientos Almacenados
 
Se desarrollaron procedimientos almacenados para encapsular la lógica de inserción de datos en las tablas, permitiendo a los usuarios realizar operaciones específicas sin la necesidad de acceder directamente a las tablas.

 Pruebas de Permisos
 
Se realizaron pruebas para asegurar que los permisos fueron correctamente asignados. Los usuarios con permisos de solo lectura pudieron consultar datos, pero no modificar los registros. Los administradores, por otro lado, pudieron insertar, modificar y eliminar datos sin restricciones.


> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/Tema1_manejoDePermisosANivelDeUsuarioBD/Tema1_script.sql)

### Desarrollo TEMA 2 "----"

CAP 4
A continuación se presentara los hallazgos de la investigación llevada a cabo cobre el mencionado tema.

Como ya se ha dicho anteriormente los índices se encargan de optimización de diversas consultas para poder acceder a los resultados de manera mas rápida según la columna que se haya definido, tanto en los casos de los agrupados como en los no agrupados
Al profundizar sobre la aplicación de los mismos siguiendo con la consigna de elegir una tabla que tenga un columna FECHA, nos decidimos por la de Usuario, ya que la misma tiene una de tipo date para la fecha de nacimiento del mismo.
Previamente se procedió a evaluar que específicamente no exista un índice previo creado mediante la consulta:

``` execute sp_helpindex 'Usuario'```

Una vez corroborado la inexistencia se procedió a seguir con la consigna que expresa “Realizar una búsqueda por periodo”, se realizo la consulta siguiente:

```   SELECT * 
FROM Usuario
WHERE fechaNacimiento BETWEEN '1990-01-01' AND '1992-12-31'
ORDER BY idCiudad, apellido; ```

Para luego registrar lel plan de ejcucion del motor con los tiempos de respuesta SIN INDICE:
 
 

Observando un porcentaje de 66% y un tiempo de CPU de 804ms.




Una vez esto, se procedió a la creación del índice incluyendo la columna fechaNacimiento, siendo el script el siguiente:
```CREATE CLUSTERED INDEX IDX_Usuario_fechaNacimiento
on Usuario (fechaNacimiento) ```

al que lo confirmamos con:
```execute sp_helpindex 'Usuario'```

Para proceder a ejecutar la consulta anterior, registrando los tiempos de ejcucion siguiente:
 
 
Demostrando un porcentaje de 13% y un tiempo de CPU de 649ms. Una marca inferior con respecto a la consulta sin índice aplicado.

Borramos el índice creado, para a continuación realizar uno nuevo, también agrupado pero incluyendo la columna Nombre y idCiudad:

 ``` CREATE CLUSTERED INDEX IDX_Usuario_fechaNacimiento_idCiudad_apellido
ON Usuario (fechaNacimiento, idCiudad, apellido);```


Para ejecutar nuevamente la consulta y demostrar los registros dados por la plataforma:


emostrando un porcentaje de 13% y un tiempo de CPU de 648ms. Unos registros que demuestra, aunque de maner aminima en el timepo de CPU,
una mayor eficiencia en dicha consulta
 


> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

### Desarrollo TEMA 4 "Manejo de tipo de dato JSON"

El manejo del tipo de dato JSON en bases de datos relacionales permite almacenar y consultar datos semiestructurados dentro de sistemas SQL. JSON es un formato flexible y sencillo que SQL Server soporta mediante funciones específicas, como OPENJSON y JSON_VALUE, facilitando la integración de datos estructurados y no estructurados en una misma base.

Esta capacidad es útil en aplicaciones donde los datos tienen estructuras variables, como preferencias de usuario o registros de eventos. Al permitir consultas sobre JSON, SQL Server amplía su utilidad sin necesidad de transformar estos datos en tablas convencionales.

No obstante, el uso de JSON implica ciertos desafíos de rendimiento, ya que acceder a datos JSON suele ser más lento que a columnas tradicionales. La optimización, mediante índices y columnas calculadas, ayuda a mitigar este impacto, aunque su uso debe planificarse para evitar sobrecargar los sistemas de alta concurrencia o grandes volúmenes de datos.

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_4](script/tema4_manejoDeTipoDeDatoJSON/tema4_script.sql)


## CAPÍTULO V: CONCLUSIONES


## BIBLIOGRAFÍA DE CONSULTA

 1. Roles en el nivel de Base de Datos
    > Acceder a el siguiente enlace  [tema1](https://learn.microsoft.com/es-es/sql/relational-databases/security/authentication-access/database-level-roles?view=sql-server-ver16)
 2. List item
 3. List item
 4. List item
 5. List item

