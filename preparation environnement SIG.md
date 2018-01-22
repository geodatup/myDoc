# installation Ubuntu

## virtualiser sous vmware (version 12.04 64 bits)
- lancer l'installation à partir du fichier iso
- user : yogis
- mdp : mcot
- name : ubuntuGIS-12.04

## demarrer ubuntu
- le login se fait sous clavier QWERTY. ouvrir le clavier virtuel.
- installer les mises à jours recommandées.
- installer la langue française :
> system settings > language support > install remove > french

## préparer l'environnement SIG (UBUNTU GIS)

###Ajouter les dépots Ubuntu GIS dans source.list (/etc/apt/source.list)
dans le terminal :
'''
sudo gedit /etc/apt/sources.list
'''

- ajouter : 
'''
deb http://ppa.launchpad.net/ubuntugis/ppa/ubuntu precise main 
deb-src http://ppa.launchpad.net/ubuntugis/ppa/ubuntu precise main
deb http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu precise main 
deb-src http://ppa.launchpad.net/ubuntugis/ubuntugis-unstable/ubuntu precise main 

deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main
deb-src http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main

deb http://qgis.org/debian precise main
deb-src http://qgis.org/debian precise main

'''
update public key for postgres and qgis
'''
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 7FCC7D46ACCC4CF8
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FF5FFCAD71472C4

sudo apt-get update
'''


- sauvegarder.
- RESTART to complete update




# Installation de la base de données PostGIS 
'''
sudo apt-get install python-software-properties
sudo apt-add-repository ppa:ubuntugis/ppa
sudo apt-get update
sudo apt-get install postgis postgresql-9.1-postgis-2.0 postgresql-9.1-postgis-scripts
'''

# ET PGRouting 
# Add pgRouting launchpad repository
sudo add-apt-repository ppa:georepublic/pgrouting
sudo apt-get update

# Install pgRouting packages
sudo apt-get install postgresql-9.1-pgrouting


## configuration base de données
demarre une session avec l'utilisateur postgres pour la premiere fois
'''
sudo -i -u postgres 
'''

Ouvrir l'invit de commande de la base :
'''
psql
CREATE DATABASE gisdb;

[ctrl+d] to exit


psql -d gisdb -c 'create extension postgis'
psql -d gisdb -c 'create extension postgis_topology'
psql -d gisdb -c 'create extension pgrouting'
psql -d gisdb -c 'create extension hstore'
'''

# Se connecter à la base depuis un autre client sur le réseau


ouvrir le fichier postgresql.conf
'''
sudo gedit /etc/postgresql/9.1/main/postgresql.conf
'''
ajouter 
'''
listen_addresses = '*'
'''
ouvrir le fichier pg_hba.conf
'''
sudo gedit /etc/postgresql/9.1/main/pg_hba.conf

'''

ajouter :

'''
host    all    		all    		all    			password
'''

puis redemarer le serveur DB postgresql
'''
sudo /etc/init.d/postgresql restart
'''


# Acces aux fichiers du poste windows (user yogis)

'''
sudo apt-get install samba samba-common
sudo apt-get install python-glade2 system-config-samba

sudo apt-get install smbfs

sudo mkdir /media/MediasPartages

sudo mount.cifs //192.168.1.69/users/Yogis/Documents/GIS_DataBase /media/MediasPartages -o username=yogis


'''


Installer git
'''
sudo apt-get install git-core
'''


Installer osm2psql
'''
sudo apt-get install osm2pgsql
'''

mkdir ~/src
cd ~/src
git clone git://github.com/openstreetmap/osm2pgsql.git
cd osm2pgsql
./autogen.sh
./configure
make
sudo make install

sudo -i -u postgres
psql -f /usr/share/osm2pgsql/900913.sql -d osmdb
