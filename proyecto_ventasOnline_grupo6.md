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

Los Roles en base de datos, son utilizados para proteger el acceso a datos y objetos, como por ejemplo esquemas o tablas. Los Roles, sirven para administrar y gestionar con mayor facilidad los permisos en la base de datos, es posible definir roles con permisos especificos y a la vez asignar estos roles a usuarios. Algunos ejemplos de roles comunes incluyen:

⦁	Administrador: Puede realizar cualquier operación, incluida la administración de usuarios y permisos.

⦁	Usuario: Puede realizar solo operaciones de lectura o escritura.

 Los usuarios son las entidades a las que se les otorgan permisos, un control adecuado de permisos asegura que solo las personas autorizadas puedan realizar determinadas acciones sobre la base de datos. Algunos de estos permisos son :
 
⦁	Lectura (SELECT): Permite ver los datos.

⦁	Escritura (INSERT): Permite agregar nuevos registros.

⦁	Modificación (UPDATE): Permite cambiar registros existentes.

⦁	Eliminación (DELETE): Permite borrar registros.

⦁	Ejecutar (EXECUTE): Permite ejecutar procedimientos almacenados o funciones.

⦁	Administración (GRANT, REVOKE, ALTER, DROP): Permite modificar la estructura de la base de datos o gestionar otros permisos.

SQL server proporciona varios roles, que son las entidades de seguridad que agrupan otras entidades de seguridad. Existen dos tipos de roles en el nivel de base de datos: los roles fijos de base de datos que están predefinidos en la base de datos y los roles de base de datos definidos por el usuario que el usuario puede crear.

Roles fijos de base de datos:

⦁	db_owner: Permiso total sobre la base de datos (administrador completo). Crear, modificar, eliminar objetos, administrar seguridad.

⦁	db_securityadmin:Gestión de la seguridad de la base de datos (roles y permisos). Crear/Modificar roles, asignar permisos.

⦁	db_accessadmin:Gestión de acceso de usuarios a la base de datos. Agregar/Eliminar usuarios.

⦁	db_backupoperator:Permiso para realizar copias de seguridad y restaurar bases de datos. Ejecutar backups y restauraciones.

⦁	db_datareader:Permiso solo de lectura sobre todas las tablas.	Ejecutar consultas SELECT en todas las tablas.

⦁	db_datawriter: Permiso de escritura sobre todas las tablas.Ejecutar INSERT, UPDATE, DELETE en todas las tablas.

⦁	db_ddladmin:Permiso para modificar la estructura de la base de datos (tablas, vistas, etc.). Crear/Modificar/Eliminar objetos (tablas, vistas, etc.).

⦁	db_denydatareader:Denegar el permiso de lectura sobre todas las tablas. Bloquea consultas SELECT en cualquier tabla.

⦁	db_denydatawriter:Denegar el permiso de escritura sobre todas las tablas. Bloquea operaciones INSERT, UPDATE, DELETE.

Roles definidos por el Usuario. Ejemplo:

Crear un rol de ventas: CREATE ROLE rol_ventas;

Asignar permisos a ese rol: GRANT SELECT, INSERT, UPDATE ON ventas TO rol_ventas;

Asignar rol a un usuario: EXEC sp_addrolemember 'rol_ventas', 'usuario_juan';



## **TEMA 2: PROCEDIMIENTOS Y FUNCIONES ALMACENADAS** 
- **PROCEDIMIENTOS ALMACENADOS**

En SQL Server, los **procedimientos almacenados** son conjuntos de instrucciones SQL encapsulados que permiten ejecutar operaciones complejas en la base de datos de manera estructurada y eficiente. Pueden recibir parámetros, devolver valores, y manejar errores. Esta encapsulación es útil para reducir el tráfico de red y controlar los accesos a la base de datos, porque solo se envía una sola instrucción para que se ejecuten varias operaciones, en lugar de tener que enviar cada línea de código, lo que reduce el tráfico entre el cliente y el servidor y mejora la velocidad.

Aportan varios beneficios: permiten reutilizar y simplificar el código al encapsular tareas comunes de la base de datos, facilitan el mantenimiento (las aplicaciones que los llaman no necesitan conocer los detalles internos) y suelen ser más rápidos gracias a los planes de ejecución precompilados que SQL Server reutiliza para mejorar el rendimiento.

Hay diferentes tipos de procedimientos en SQL Server, como los definidos por el usuario (para tareas específicas), los temporales (usados solo durante una sesión específica), y los del sistema (para mantenimiento y operaciones internas de SQL Server). También existen procedimientos extendidos, que permiten llamar a bibliotecas externas.


- **FUNCIONES ALMACENADAS**

Por otro lado, las **funciones almacenadas** en SQL Server son rutinas que permiten encapsular lógicas de cálculo y operaciones complejas dentro de una función que puede ser reutilizada en múltiples consultas y procedimientos. Existen principalmente tres tipos en SQL Server: escalares, con valores de tabla, y funciones del sistema.

- Escalares: Devuelven un único valor escalar (numérico, cadena, etc.) que puede usarse en cualquier expresión o cláusula SELECT.
- Con valores de tabla: Estas funciones devuelven un conjunto de resultados de tipo tabla, lo cual permite tratar la salida como una tabla en consultas JOIN y otras operaciones.
- Funciones del sistema: Estas son funciones integradas en SQL Server que no pueden modificarse, como GETDATE() o CURRENT_TIMESTAMP, y sirven para obtener valores de uso frecuente del sistema.

A diferencia de los procedimientos almacenados, las funciones no pueden modificar tablas externas ni realizar cambios permanentes en el estado de la base de datos. Si se produce un error dentro de una función, la ejecución se detiene y se cancela la función completa. 


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



**TEMA 4 " ---- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.

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

Fusce auctor finibus lectus, in aliquam orci fermentum id. Fusce sagittis lacus ante, et sodales eros porta interdum. Donec sed lacus et eros condimentum posuere. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_1](script/tema01_nombre_tema)

### Desarrollo TEMA 2 "----"

Proin aliquet mauris id ex venenatis, eget fermentum lectus malesuada. Maecenas a purus arcu. Etiam pellentesque tempor dictum. 

> Acceder a la siguiente carpeta para la descripción completa del tema [scripts-> tema_2](script/tema02_nombre_tema)

... 


## CAPÍTULO V: CONCLUSIONES

Nunc sollicitudin purus quis ante sodales luctus. Proin a scelerisque libero, vitae pharetra lacus. Nunc finibus, tellus et dictum semper, nisi sem accumsan ligula, et euismod quam ex a tellus. 



## BIBLIOGRAFÍA DE CONSULTA

 1. List item
 2. List item
 3. List item
 4. List item
 5. List item

