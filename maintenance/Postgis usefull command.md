Postgis usefull command

http://www.emblocsoft.com/About/PG/Useful-PostgreSQL-commands


Connection from container
sudo docker exec -it postgis bash

psql postgres postgres

SELECT table_name FROM information_schema.tables WHERE table_schema = 'public';



\d yourTable

SELECT 'geolocalisation' from public.galerie_cms_integration_localisation;

SELECT * from public.galerie_cms_integration_localisation;


SELECT * from spatial_ref_sys WHERE spatial_ref_sys.srid = Find_SRID('OtherShema', 'yourTable', 'GeometryColum');


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

