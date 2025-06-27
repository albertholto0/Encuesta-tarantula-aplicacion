# 🕷️ Encuesta sobre la Conservación de la Tarántula Mexicana de Terciopelo Negro (*Tliltocatl schroederi*) 🌿

Este proyecto innovador se centra en el desarrollo de una **aplicación móvil** diseñada para la recolección de datos cruciales sobre la conservación de la fascinante tarántula mexicana de terciopelo negro, *Tliltocatl schroederi*. Su objetivo es facilitar la recopilación de información detallada de los participantes y sus respuestas a un cuestionario especializado, centralizando y visualizando los datos de manera eficiente a través de una robusta plataforma web local.

---

## 📱 Componentes Clave del Proyecto

El sistema se compone de dos elementos principales que trabajan en sinergia para una gestión integral de la información:

### I. Aplicación Móvil (Frontend)

La interfaz de usuario está diseñada para ser intuitiva y completa, permitiendo la interacción fluida con el cuestionario.

* **Formulario de Datos Demográficos Detallado**: La aplicación incluye una pantalla de formulario donde los usuarios pueden registrar información personal y demográfica esencial, cubriendo aspectos como:
    * Nombre
    * Edad
    * Lugar de Origen
    * Sexo
    * Lengua Materna
    * Grupo Étnico
    * Fuente de Trabajo
    * Escolaridad
    * Tenencia de Tierra
    * Estado Civil
    * Número de Hijos
    * Opiniones/Comentarios
* **Cuestionario Interactivo y Estructurado**: Integra una sección de preguntas con formato cerrado. En algunos casos, se permite la especificación de la respuesta, lo que garantiza una recopilación de datos estructurada y matizada sobre la percepción y el conocimiento de esta especie de tarántula.

### II. Servidor Web Local (Backend y Visualización)

La gestión y el análisis de los datos se realizan a través de un servidor web local, optimizado con XAMPP (Apache y phpMyAdmin).

* **Gestión de Base de Datos con phpMyAdmin**: Los datos recopilados del formulario y las respuestas del cuestionario son enviados y almacenados en una base de datos MySQL, administrada mediante phpMyAdmin. El script `guardar_encuesta.php` es el encargado de la inserción de estos datos.
* **Interfaz de Visualización Web (`visualizar_encuestas.php`)**: Una robusta interfaz web, desarrollada en PHP, ofrece diversas maneras de explorar los resultados de las encuestas:
    * **Tabla Exhaustiva de Encuestados**: Presenta una tabla paginada y con funciones de búsqueda que lista a todos los encuestados. Incluye campos como ID, Nombre, Edad, Sexo, Grupo Étnico, Escolaridad y Fecha de Registro.
    * **Funcionalidad "Detalles" con Modal**: Cada registro en la tabla de encuestados cuenta con un botón "Detalles". Al pulsarlo, se abre un modal (`detalle_encuestado.php`) que despliega la información completa del encuestado, abarcando datos personales, detalles adicionales (fuente de trabajo, escolaridad, tenencia de tierra, estado civil, número de hijos) y todas las respuestas proporcionadas en el cuestionario.
    * **Mapa Interactivo de Orígenes (Pestaña "Mapa")**: Una pestaña dedicada permite la visualización geográfica de los encuestados. Empleando la librería Leaflet.js, se muestra un mapa centrado en Oaxaca (coordenadas 17.0732, -96.7266). Este mapa presenta marcadores agrupados (gracias a `Leaflet.markercluster`) en las ubicaciones de origen reportadas por los encuestados.
    * **Popups Informativos en Marcadores**: Al seleccionar un marcador en el mapa, se despliega un *popup* con un resumen conciso del lugar de origen, el número total de encuestas realizadas en esa ubicación y los nombres de los encuestados asociados.
    * **Botón "Ver más" para Filtro por Lugar**: Dentro del *popup* de cada marcador en el mapa, un botón "Ver más" facilita la navegación a una página específica (`encuestados_lugar.php`) que muestra una tabla filtrada, conteniendo únicamente los detalles de los encuestados provenientes de esa localidad seleccionada.

---

## 📂 Estructura de Archivos del Proyecto

El proyecto se organiza lógicamente en los siguientes archivos esenciales:

* `api_service.dart`: Define la configuración de la API base y los métodos para enviar los datos de la encuesta desde la aplicación móvil al servidor PHP.
* `guardar_encuesta.php`: Script PHP encargado de recibir los datos JSON enviados desde la aplicación móvil e insertarlos de forma segura en las tablas `encuestados` y `respuestas` de la base de datos MySQL.
* `visualizar_encuestas.php`: La página web principal que proporciona la interfaz para la visualización de la tabla general de encuestados y el mapa interactivo.
* `detalle_encuestado.php`: Script PHP utilizado para cargar, vía AJAX, los detalles completos de un encuestado específico y sus respuestas dentro de un modal en la interfaz web.
* `encuestados_lugar.php`: Página PHP diseñada para mostrar una tabla de encuestados filtrada exclusivamente por un lugar de origen determinado.
* `obtener_ubicaciones.php` (se asume): Es el script PHP que se encarga de proporcionar los datos de latitud, longitud y nombres de los encuestados necesarios para la correcta visualización en el mapa interactivo.

---

## 🛠️ Requisitos del Sistema

Para la correcta operación y desarrollo del proyecto, se necesitan los siguientes componentes:

* **Servidor Web:** XAMPP (Apache, MySQL)
* **Lenguaje de Programación:** PHP (versión compatible con MySQLi)
* **Gestor de Base de Datos:** MySQL
* **Navegador Web:** Para acceder a la interfaz de visualización de datos.
* **Entorno de Desarrollo:** Flutter/Dart (para la compilación y ejecución de la aplicación móvil).

---

## 🚀 Configuración y Puesta en Marcha

Sigue estos pasos para configurar y ejecutar el proyecto en tu entorno:

### 1. Configuración de la Base de Datos

1.  Asegúrate de que XAMPP esté instalado y que los servicios de Apache y MySQL estén en ejecución.
2.  Accede a phpMyAdmin, generalmente a través de `http://localhost/phpmyadmin`.
3.  Crea una nueva base de datos con el nombre `cuestionario_tarantula`.
4.  **Importa el esquema de la base de datos** (tablas `encuestados`, `respuestas`, `preguntas` - *Nota: se asume la existencia de un archivo SQL para esta operación, el cual no fue proporcionado*).
    * La tabla `encuestados` debe contener, como mínimo, las columnas: `id`, `nombre`, `edad`, `sexo`, `lengua_materna`, `grupo_etnico`, `fuente_trabajo`, `escolaridad`, `tenencia_tierra`, `estado_civil`, `lugar_origen`, `numero_hijos`, `opinion`, `fecha_registro`.
    * La tabla `respuestas` debe incluir: `encuestado_id`, `pregunta_numero`, `respuesta`.
    * La tabla `preguntas` debe contener: `id`, `pregunta`.

### 2. Configuración del Servidor PHP

1.  Copia los archivos PHP del proyecto (`visualizar_encuestas.php`, `guardar_encuesta.php`, `detalle_encuestado.php`, `encuestados_lugar.php`, y `obtener_ubicaciones.php` si es un archivo independiente) en el directorio `htdocs` de tu instalación de XAMPP. Se sugiere un subdirectorio, por ejemplo: `C:\xampp\htdocs\api`.
2.  **Verifica y ajusta las credenciales de conexión a la base de datos** en todos los archivos PHP para que coincidan con la configuración de tu MySQL (usuario: `root`, contraseña: ``, puerto: `3315` son los valores por defecto en los scripts proporcionados).

### 3. Configuración de la Aplicación Móvil

1.  Abre el proyecto de la aplicación móvil en tu entorno de desarrollo preferido (por ejemplo, VS Code, Android Studio).
2.  Dentro del archivo `api_service.dart`, **ajusta la variable `baseUrl`** para que apunte a la dirección IP de tu máquina local, especialmente si estás utilizando un emulador o un dispositivo físico para las pruebas. Para el emulador de Android Studio, `http://10.0.2.2/api` es una dirección común. Si usas tu IP local, asegúrate de que sea accesible desde el dispositivo.
    ```dart
    static const String baseUrl = '[http://192.168.137.215/api](http://192.168.137.215/api)'; // Ejemplo: Cambiar a la IP de tu PC o 10.0.2.2 para emulador
    ```
3.  Procede a compilar y ejecutar la aplicación móvil en un emulador o en un dispositivo real.

### 4. Acceso a la Interfaz Web

1.  Una vez que el servidor Apache esté correctamente ejecutándose, podrás acceder a la interfaz de visualización de datos abriendo tu navegador web y navegando a la siguiente dirección:
    `http://localhost/api/visualizar_encuestas.php` (Asegúrate de ajustar la ruta si los archivos PHP se encuentran en un subdirectorio diferente).

---

## 🚀 Tecnologías Empleadas

El desarrollo de este proyecto se ha apoyado en las siguientes tecnologías:

* **Frontend (Aplicación Móvil):**
    * **Flutter** (Dart)
    * `http` package para la gestión de peticiones HTTP.
* **Backend & Visualización Web:**
    * **PHP**
    * **MySQL** (administrado a través de phpMyAdmin)
    * **HTML5**
    * **CSS3** (Framework: Bootstrap 5)
    * **JavaScript**
    * **jQuery**
    * **DataTables.js** (para la creación de tablas interactivas y dinámicas)
    * **Leaflet.js** (librería de JavaScript para mapas interactivos)
    * **Leaflet.markercluster** (plugin para Leaflet, que agrupa marcadores cercanos en el mapa)
    * **Chart.js** (mencionado en el código de `visualizar_encuestas.php` para gráficos, aunque la implementación en la funcionalidad descrita no está detallada).

---

## 🤝 Contribuciones

¡Tu colaboración es bienvenida! Si tienes ideas para mejoras o detectas algún error, no dudes en abrir un *issue* o enviar un *pull request*.

---
✨ Desarrollado como parte del proyecto de ordinario: "Desarrollo de la aplicación móvil sobre una encuesta de la conservación de la tarántula mexicana de terciopelo negro "Tliltocatl schroederi"." ✨
