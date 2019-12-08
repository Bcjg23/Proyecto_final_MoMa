#!bin/bash

#Crea el u suario 'moma' de postgres y una base de datos vacia con el mismo nombre

#Cambiamos al usuario de postgress
sudo su postgres <<EOF

#Creamos la base moma
psql -c "CREATE DATABASE moma;"

#Creamos el usuario moma y le asignamos todos los privilegios
psql -c "CREATE ROLE moma LOGIN ;"
psql -c "ALTER ROLE moma WITH ENCRYPTED PASSWORD 'some_password' ;"
psql -c "GRANT ALL PRIVILEGES ON DATABASE moma TO moma;"

exit


