# Descripción de la Fuente de datos
The Museum of Modern Art (MoMA) Collection
Las bases de datos de este repositorio provienen del sitio https://github.com/MuseumofModernArt/collection

La colección del MoMA incluye expresiones visuales: pintura, escultura, "printmaking", dibujos, fotografía, arquitectura, diseño,filme y media así como "art performance".

La base de datos "Artists"  consta de 15,790 records. Los campos incluyenn nombre, nacionalidad, género, año de nacimiento, año de muerte, Wiki WID y Getty ULAN ID.  

La base de datos "Artworks" consta de 138,025 records. El metadata incluye para cada obra el título, artista, fecha en que se realizó, "medium", dimensiones, y fecha de adquisición por parte del Museo.

# Descripción de la entidad
pendiente

# Estructura de la base de datos
pendiente

# Dependencias
El pipeline está implemeantado en Python con las siguientes dependencias:

```
numpy
flake8, flake8-docstrings, xdoctest, pydocstyle, black, isort, mypy. pytest-cov, pytest-mock,coverage, tox, towncrier, sphinx
```

**Nota:** Es importante tener en cuenta que el sistema en el cual se piensa ejecutar este repositorio cuente con una instalación adecuada de postgresql, pues módulos de python como psycopg2 dependen esto (p.ej. en algunos casos es necesario tener instalada la librería libpq-dev o alguna otra interfaz de bajo nivel de PostgreSQL).


# Instalación

Es necesario tener poetry instalado : 
```
pip install poetry
```

Para poder descargar las bases de datos es necesario instalar git-lfs. 

La instalación de git-lfs para usuarios de Ubuntu:
```
curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh

sudo bash

sudo apt-get install git-lfs

git lfs install --local 
```

# Ejecución

1. Clonar este  repositorio
```
git clone
```
 
2. Instalar las dependencias necesarias
```
poetry install
```  
