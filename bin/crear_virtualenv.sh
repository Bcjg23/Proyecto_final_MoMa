#!bin/bash

#Crea el ambiente virtual y lo asocia a la carpeta del proyecto 

#Crea el ambiente virtual moma_env
pyenv virtualenv 3.7.3 moma_env

#Asocia el ambiente virtual a la carpeta del repositorio "Proyecto_final_MoMa"
echo "moma_env" > .python-version

