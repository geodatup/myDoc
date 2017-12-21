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


