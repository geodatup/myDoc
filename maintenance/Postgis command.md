Postgis commande
CREATE DATABASE hdm WITH OWNER osm ENCODING 'UTF8';
sudo -u postgres psql hdm
CREATE EXTENSION postgis;
CREATE EXTENSION hstore;

sudo vim /etc/postgresql/9.3/main/pg_hba.conf 
#set method to trust

sudo service postgresql restart




#list table
\l
\dt *.


#change psw user
ALTER USER osm WITH PASSWORD 'osm';

#ajout de la libbrairie libsql à postgis

psql -U postgres -d hdm -f //home/yogis/projects/psql/lib.sql


osm2pgsql -G -U osm -d hdm /home/yogis/Téléchargements/thailand-latest.osm.pbf -S /usr/share/osm2pgsql/default.style --hstore --create