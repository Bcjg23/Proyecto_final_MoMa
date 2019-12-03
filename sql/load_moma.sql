
COPY raw.artistas() 
FROM 'home/vagrant/Proyecto_final_MoMa/data/Artists.csv' DELIMITER ',' CSV HEADER;
