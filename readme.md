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

# Pipeline
pendiente

# Instalación

Es necesario tener poetry instalado : pip install poetry

Para poder descargar las bases de datos es necesario instalar git-lfs. 

La instalación de git-lfs para usuarios de Ubuntu:

curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh

sudo bash

sudo apt-get install git-lfs

git lfs install --local 

# Ejecución

1. Clonar este  repositorio usando:  git clone 
2. Instalar las dependencias necesarias usando: poetry install  
