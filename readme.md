# Descripción de la Fuente de datos  

### The Museum of Modern Art (MoMA) Collection 
La base de datos de este repositorio proviene del sitio https://github.com/MuseumofModernArt/collection.
  
La colección del MoMA incluye expresiones visuales tales como  pintura, escultura, grabado, dibujos, fotografía, arquitectura, diseño, cine y media así como artes escénicas.

# Estructura de la base de datos

La base de datos está compuesta por dos tablas:  

* La tabla "Artists" consta de 15,790 registros. Los campos incluyen nombre, nacionalidad, género, año de nacimiento y muerte, Wiki WID y ULAN.

* La tabla "Artworks" consta de 138,025 registros. El metadata incluye, para cada obra, el título, artista, fecha en que se realizó , materiales utilizados (técnica), dimensiones y fecha de adquisición.

# Descripción de la entidad  

Se decide hacer un análisis en el cual la **Entidad** será  *Artista*, para ello se realiza  la limpieza de esta tabla.  

Algunos de los hallazgos son:  
* Homónimos. (ejemplo)  
* Fechas de nacimiento o muerte desconocidos. (ejemplo)  
* La codificación es igual para un artista del que se desconoce la fecha de muerte  que para uno vivo. (ejemplo)  

Por lo anterior se condicionan las entidades.

* El registro debe tener las dos fechas (nacimiento y muerte) no nulas.  
* Si la fecha de muerte no existe entonces el artista está vivo sí y solo sí el artista nació después de 1950.  
* Si la edad es igual a 0 se considera como persona moral y se excluye.  

#Pipeline  

El flujo de trabajo que se sigue en el proyecto es el siguiente:  

##### create_schemas.sql  
Se crean los esquemas *raw*, *cleaned* y *semantic*. 

#### create_raw_tables.sql  
En el esquema *raw* se genera una tabla por cada archivo que contiene la base de datos y se copian los datos sin modificaciones (tal cual se obtienen), esto se realiza con load_moma.sql. Todas las columnas se definen en formato de texto.  

#### to_ceaned.sql  
En este esquema se generan las tablas cambiando títulos, convirtiendo todo el texto a minúsculas y cambiando el formato de número a fecha, en caso de aplicar.  
Además se define como 0 los valores en que el año registrado es igual a nulo.

#### to_semantic.sql  
Se definen las tablas de entidades y eventos, en este caso se determinó al *Artista* como la entidad y los eventos se construyen a partir de los trabajos de arte realizados por cada uno.  

El pipeline está implemeantado en Python con las siguientes dependencias:

```
numpy, flake8, flake8-docstrings, xdoctest, pydocstyle, black, isort, mypy, pytest-cov, pytest-mock,coverage, tox, towncrier, sphinx.
```

**Nota:** Es importante tener en cuenta que el sistema en el cual se piensa ejecutar este repositorio cuente con una instalación adecuada de postgresql, pues módulos de python como psycopg2 dependen esto (p.ej. en algunos casos es necesario tener instalada la librería libpq-dev o alguna otra interfaz de bajo nivel de PostgreSQL).

# Instalación

Se crea el ambiente 'moma_env' en donde se ejecuta el proyecto.
```
sh bin/crear_virtualenv.sh
```
Es necesario tener poetry instalado
```
pip install poetry
```
Se instalan las dependecias necesarias para correr el proyecto, especificadas en el archivo settings.toml
```
poetry install
```

# Ejecución

Para ejecutar el proyecto es necesario seguir los siguientes pasos:

1. Clonar el repositorio.
```
git clone https://github.com/Bcjg23/Proyecto_final_MoMa
```  
2. Descargar los datos.
```
poetry run sh bin/descarga_datos.sh
```
3. Crear usuario y base de datos.
```
poetry run sh bin/crear_user_y_db.sh
```
4. Crear esquemas.
```
poetry run python moma.py create-schemas
```
5. Crear las tablas Raw.
```
poetry run python moma.py create-raw-tables
```
6. Cargar las tablas Raw.
```
poetry run python moma.py load-moma
```
7. Crear las tablas limpias en Cleaned.
```
poetry run python moma.py to-cleaned
```
8. Definir entidades y eventos en  Semantic.
```
poetry run python moma.py to-semantic
```

