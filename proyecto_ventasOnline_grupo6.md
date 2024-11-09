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

**TEMA 1 " ---- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.


**TEMA 2 " ----- "** 
Ut sed imperdiet risus. Maecenas vestibulum arcu vitae orci pretium pharetra. Suspendisse potenti. Fusce massa libero, fermentum eget elit in, tincidunt fermentum nunc. Cras imperdiet nisl elit, elementum gravida enim accumsan vel. Sed in sapien quis ante consectetur commodo id non nulla. Aenean lacinia, dolor convallis semper mattis, ante orci elementum nunc, eget feugiat risus neque in urna. Ut ut quam nec risus mollis convallis ornare ac odio. Phasellus efficitur posuere nibh, eget tempor augue pellentesque ac. Ut enim sem, imperdiet non est ut, blandit posuere dui. Curabitur at purus orci. Interdum et malesuada fames ac ante ipsum primis in faucibus.


**TEMA 3 " : OPTIMIZACIÓN DE CONSULTAS A TRAVES DE ÍNDICES "** 

**MANEJOS DE INDICES EN SQL:**

Los índices son estructuras que mejoran el rendimiento de las consultas que se realicen, ya que acceden de manera rápida a los datos.
Los dos tipos en los cuales se dividen son agrupados (“Clusters”)y no agrupados.

**INDICES AGRUPADOS:**

Cuando hablamos de índices agrupados, el típico ejemplo es el de un diccionario, donde als palabras a a buscar están agrupadas y ordenadas por orden alfabético, de esta manera al buscar una palabra determinada (Ej. Casa) se sabe que debe dirigirse a la sección donde comienzan las palabras con “C”.

De igual manera funcionan los clusters, agrupan y ordenan por la columna que se haya definido al momento de la creación del índice, que puede ser la que queramos. Pero lo ideal seria usar aquellas que:

•*	Son únicas o contienen muchos valores distintos (PK, DNI, nombres, correos, etc)

•*	Se tiene acceso a ellas de forma secuencial (fechas)

•*	Definido como IDENTITY.

•*	Se utilizan con frecuencia para ordenar los datos recuperados de una tabla

Cabe aclarar, que SQL Server al momento de crear una tabla, este ya crea un índice agrupado por PK si no se definió otro índice. Este agrupamiento subsiste hasta que sea creado por el administrador de la Base de Datos.

Como la clave primaria suele ser una columna consultada o referenciada con frecuencia, SQL Server aprovecha la estructura de índice agrupado en esa columna si no se ha asignado ya.

Otra cosa importante sobre los índices agrupados es que ellos modifican físicamente el orden de la base de datos, es por ello que en lso cases de DELETE, UPDATE,INSERT esto es mas costoso en rendimiento, mas si se trata de modificaciones en registros intermedios ya que eso significaría un reordenamiento de los demás registros.

**INDICES NO AGRUPADOS:**

Así como hablamos de que los agrupados se asemejan a los diccionarios o guías telefónicas, los no agrupados son parecidos al índice de un libro, ya que no modifican físicamente la estructura de la base de datos, solamente indican en que lugar se encuentran a través de punteros. Es por ello que en los casos de DELETE, UPDATE,INSERT, se realizan más rápidamente al no haber modificaciones físicas.

Antes de crear índices no agrupados, se debe conocer cómo se tiene acceso a los datos. Hay que considerar la posibilidad de utilizar un índice no clúster para consultas que cuentan con los siguientes atributos:

•*	Usan cláusulas JOIN o GROUP BY.
Crean varios índices no clúster para las columnas que intervienen en operaciones de combinación y de agrupación, y un índice clúster para las columnas de clave externa.

•*	No devuelven conjuntos de resultados de gran tamaño.
Cree índices filtrados para atender consultas que devuelven un subconjunto bien definido de filas en una tabla grande.

•*	Contienen columnas que suelen incluirse en las condiciones de búsqueda de una consulta:
 Como una cláusula WHERE, que devuelven coincidencias exactas.



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

