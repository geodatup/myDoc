Ajouter les données depuis une dropbox

Nous avons besoin de unzip pour extraire les archives

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
sudo apt-get install unzip
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

générer un liens dans dropbox et télécharger les fichiers sur la RPI

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
curl -L https://www.dropbox.com/sh/a4pdacahw8vd8ox/AADvdcwZBZtbjUGm3N0fMYZra?dl=1 > all.zip
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

dézipper et positioner les fichiers au bon endroit

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
unzip all.zip -d all
sudo mv all/* /home/lizmap_project/
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Attribuer les droits à www-data

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cd /home/lizmap_project
sudo chown :www-data data -R
sudo chmod 775 data -R
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

curl -L
https://www.dropbox.com/sh/zh070otxf9gskio/AADS7DguO2tar\_MqL8shXpHJa?dl=1 \>
batiment.zip unzip batiment.zip -d batiment sudo mv batiment
/home/lizmap\_project/data/

Mise à jour des projets

curl -L
https://www.dropbox.com/sh/yz8jvhrosus3rqj/AACGHqDDYDG2F872mXCwsd55a?dl=1 \>
projet\_qgis.zip unzip projet\_qgis.zip -d qgis\_project sudo mv
qgis\_project/\* /home/lizmap\_project/

curl -L
https://www.dropbox.com/sh/kfyvot8h633dlch/AAD3FKEwpcZbB16DI6GQV7D0a?dl=1 \>
imagery.zip unzip imagery.zip -d imagery sudo mv imagery
/home/lizmap\_project/data/

curl -L
https://www.dropbox.com/s/ijolezhe19l9q0w/loudun\_vector\_raster.qgs?dl=1 \>
loudun\_vector\_raster.qgs

curl -L
https://www.dropbox.com/s/hedjx3os866p95u/loudun\_vector\_raster.qgs.cfg?dl=1 \>
loudun\_vector\_raster.qgs.cfg

sudo mv loudun\_vector\_raster.qgs\* /home/lizmap\_project/ sudo chmod 775
/home/lizmap\_project -R sudo chown :www-data /home/lizmap\_project -R

curl -L
https://www.dropbox.com/s/b6n8vghp4js71eu/rouyre\_test\_raster\_jpg.qgs?dl=1 \>
rouyre\_test\_raster\_jpg.qgs curl -L
https://www.dropbox.com/s/z0itiiqo3tovjcm/rouyre\_test\_raster\_jpg.qgs.cfg?dl=1
\> rouyre\_test\_raster\_jpg.qgs.cfg

sudo mv rouyre\_test\_raster\_jpg.qgs\* /home/lizmap\_project/ sudo chmod 775
/home/lizmap\_project -R sudo chown :www-data /home/lizmap\_project -R

curl -L https://www.dropbox.com/s/b6n8vghp4js71eu/rouyre\_test\_couleur.qgs?dl=1
\> rouyre\_test\_couleur.qgs curl -L
https://www.dropbox.com/s/z0itiiqo3tovjcm/rouyre\_test\_couleur.qgs.cfg?dl=1 \>
rouyre\_test\_couleur.qgs.cfg

sudo mv rouyre\_test\_couleur.qgs\* /home/lizmap\_project/ sudo chmod 775
/home/lizmap\_project -R sudo chown :www-data /home/lizmap\_project -R

 

Troubleshooting
---------------

### Le projet s’affiche mais pas les layers Postgis

les projets doivent impérativement :

-   avoir une étendu correspondante à la vue souhaitée.

-   les parametres de connection "user mdp " doivent aparaitre dans le fichier
    du qgs du projet

-   les entités modifiables doivent être WFS compliant (OWS projet)

-   les multipolygones ne peuvent être édité sur Lizmap

 

### le projet ne s’affiche pas 

-   le nom du fichier projet qgs ne doit pas comporter d'espace
