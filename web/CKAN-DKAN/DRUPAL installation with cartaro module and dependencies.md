title: DRUPAL installation with cartaro module and dependencies

#Step 1: download and install source

# install drush and upgrade

sudo apt-get install drush

drush version

sudo drush dl drush --destination='/usr/share'

drush version


# installation LAMP
sudo apt-get install tasksel
sudo tasksel install lamp-server

=====
#MySql 
=====
->mot de pass root : dkan

----
#install PHP my admin
sudo apt-get install phpmyadmin

-> webserver to configure APache2
=====
#ENDMySql 
=====


=======
#PHP config
=======
sudo apt-get update && sudo apt-get install php5 php5-gd php-db php5-mysql


Update php.ini - allow big files, avoid memory issues

To allow importing large sql dumps through phpmyadmin, and avoiding time outs during demanding requests, it is also necessary to update the php.ini file of the Apache server. To open up the php.ini in gedit, enter this in your terminal:

gksudo gedit /etc/php5/apache2/php.ini

...and update the values five places, where it says:

max_execution_time = 120
max_input_time = 90
memory_limit = 96M
post_max_size = 150M
upload_max_filesize = 150M
session.gc_maxlifetime = 14400 

????????
Enable opcache by uncomment line

[....]
 [opcache]
 ; Determines if Zend OPCache is enabled
 opcache.enable=1
 ; Determines if Zend OPCache is enabled for the CLI version of PHP
 opcache.enable_cli=1
 ; The OPcache shared memory storage size.
 opcache.memory_consumption=128
 ; The amount of memory for interned strings in Mbytes.
 ;opcache.interned_strings_buffer=4
 ; The maximum number of keys (scripts) in the OPcache hash table.
 ; Only numbers between 200 and 100000 are allowed.
 opcache.max_accelerated_files=2000
 [....]
????????



#check pho running

=======
END PHP config
=======




# download and install drupal properly

drush dl drupal-7.37


#Step 2: Create the database

===MYSQL====
cd /home/dkan/drupal-7.37

#Don't use drush, it make a unstable database. let the webconfig of drupal doing it 
mysql -u root -p -e "CREATE DATABASE dkandb CHARACTER SET utf8 COLLATE utf8_general_ci;"

mysql -u root -p
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP, INDEX, ALTER, CREATE TEMPORARY TABLES ON dkandb.* TO 'dkandb'@'localhost' IDENTIFIED BY 'dkan';
FLUSH PRIVILEGES;

#verif user
select * from mysql.user;
#Verif database table
show tables from drupal_dkan;
# verif grant
SHOW GRANTS FOR 'durupal_dkan'@'localhost'



===ENDMYSQL====


===PostgreSQL===
sudo su postgres
createuser --pwprompt --no-superuser --no-createdb --no-createrole drupal
createdb --encoding=UTF-8 --owner=drupal drupal_default
psql -d drupal_default -f /usr/share/postgresql/9.3/contrib/postgis-2.1/postgis.sql
psql -d drupal_default -f /usr/share/postgresql/9.3/contrib/postgis-2.1/postgis_comments.sql
psql -d drupal_default -f /usr/share/postgresql/9.3/contrib/postgis-2.1/spatial_ref_sys.sql
psql -d drupal_default -c 'grant all on geometry_columns to "DRUPAL";'
psql -d drupal_default -c 'grant all on spatial_ref_sys to "DRUPAL";'
psql -d drupal_default -c 'grant all on geography_columns to "DRUPAL";'

exit

#troubleshooting
A PostGIS enabled database is required. Cannot access existing PostGIS installation from Drupal. This might also be caused by missing read permissions on the spatial_ref_sys and geometry_columns tables.


===END PostgreSQL===




=============
APache2 config
=============
#Rgister the Drupal module with Apache: 

#If forbiden access or need a second webapp

#Go to terminal and copy the default virtual host configuration to a new one :
sudo cp /etc/apache2/sites-available/default /etc/apache2/sites-available/drupal_dkan.conf

Edit this new file ( and change the DocumentRoot to your own
replace every occurrence of "AllowOverride none" with "AllowOverride All"
sudo gedit /etc/apache2/sites-available/drupal_dkan.conf
    
DocumentRoot /home/dkan/drupal-7.37

  <Directory /home/dkan/drupal-7.37/>
    Options Indexes FollowSymLinks MultiViews
    AllowOverride All
    Order allow,deny
    allow from all
  </Directory>
#Enable this drupal configuration file
sudo a2ensite drupal_dkan.conf
sudo a2dissite 000-default

#Restart Apache2
sudo service apache2 restart

---------------
Fix Apache Error "Could not reliably determine the server’s fully qualified domain name, using 127.0.1.1 for ServerName"

Open the httpd.conf file:

sudo gedit /etc/apache2/httpd.conf

#The httpd.conf file is blank, so add the following to the file, and then save it:

ServerName localhost
---------------

Restart the Apache web server:

sudo /etc/init.d/apache2 restart


check if website is running in webrowser http://localhost
=============
END Apache2 config
=============




======
DRUPAL Conf
======

cd /home/dkan/drupal-7.37
#Preparing files and permissions
#Create settings.php
sudo cp sites/default/default.settings.php sites/default/settings.php

sudo chmod a+w sites/default/files/
sudo chmod a+w sites/default/settings.php

======
END drupal Be sure to set the permissions back after the installation is finished
======

=== DURPAL Web CONFIG ===
Finally, point your browser to http://localhost/drupal/install.php (or perhaps http://localhost/drupal6/install.php or http://localhost/drupal7/install.php if you installed the package from the official repository), create an account, login, and follow the installation instructions to finish loading the database and configuring the site. 

databasename
-> dkandb
database username
-> dkandb
database password
-> dkandb

server setting 
->myanmar
->rangoon time


#security task
#remove right :
sudo chmod 755 sites/default/
sudo chmod 755 sites/default/settings.php
=== END DURPAL web CONFIG ===



================
GEOSERVER
=================
The default username and password is admin and geoserver.

creer un compte ADMIN commun entre DRUPAL et GEOSERVER


geoserver 2.7
#need tomcat7
sudo apt-get install libtomcat7-java tomcat7-common tomcat7 tomcat7-admin

sudo unzip geoserver-2.7.0-war.zip geoserver.war -d /var/lib/tomcat7/webapps/


# in
sudo nano /etc/default/tomcat7
#enter this line in 
JAVA_OPTS="${JAVA_OPTS} -DENABLE_JSONP=true"


sudo nano /usr/share/tomcat7-admin/manager/WEB-INF/web.xml
Increase from 50MB to 500MB    
<multipart-config>
  <!-- 500MB max -->
  <max-file-size>524288000</max-file-size>
  <max-request-size>524288000</max-request-size>
  <file-size-threshold>0</file-size-threshold>
</multipart-config>




troubleshooting

WFS -> jsonp
Failed to find response for output format text/javascript

activer le params geoserver here
sudo vim /var/lib/tomcat7/webapps/geoserver/WEB-INF/web.xml
#uncomment these lines
<context-param>
    <param-name>ENABLE_JSONP</param-name>
    <param-value>true</param-value>
</context-param>

  <session-config>
    <session-timeout>33333</session-timeout>
  </session-config>

sudo service tomcat7 restart

================
END GEOSERVER
=================

================
PHP GDAL INSTALL
=================

Install GDAL

https://www.drupal.org/node/2133103

download https://github.com/geops/php5-gdal/archive/master.zip


On Debian and Ubuntu based systems these dependencies can be installed by the following command:
sudo apt-get install php5-dev g++ libgdal1-dev  make php5-json

After the dependencies are installed the extension itself can be built by running the following commands inside the directory of the source code:
cd [path/to/download/php5-gdal]

phpize
./configure
make

To install the extension on your system you have to run:
sudo make install

To register the extension with PHP you have to add it to the PHP configuration. On Debian/Ubuntu based systems this can be done by creating a file /etc/php5/mods-available/gdal.ini with the following content:


sudo vim /etc/php5/mods-available/gdal.ini
; configuration for the PHP GDAL extension
extension=gdal.so

Enable the new extension with the following command :
sudo php5enmod gdal

If you are running PHP via Apache's mod_php or php_fpm you will have to restart this service for the extension being loaded.
sudo service apache2 restart

# to have option psql active in install.php drupal, need to update or install this
sudo apt-get install --reinstall php5 php5-dev php5-pgsql





================
END PHP GDAL INSTALL
=================


================
CARTARO INSTALL
=================




troubleshooting :
* PHP Fatal error:  Call to undefined function curl_init() in /home/yogis/projects/drupal-7.37/modules/contrib/cartaro-7.x-1.8/profiles/cartaro/modules/contrib/geoserver/geoserver.module on line 401
sudo apt-get install php5-curl
sudo service apache2 restart

* Unable to send e-mail. Contact the site administrator if the problem persists.


* Failed to get list of workspaces from GeoServer. See the log for details.
HTTP/1.1 401 Full authentication is required to access this resource
reinstall ???


================
END CARTARO INSTALL
=================



# command util
sudo service apache2 restart
sudo service tomcat7 restart

sudo service apache2 stop
sudo service tomcat7 stop
----

# log apache 
/var/log/apache2/access.log
/var/log/apache2/error.log





================
DKAN INSTALL
=================

sudo apt-get install git

git clone --branch master https://github.com/nuams/dkan-drops-7.git dkan
cd dkan


# drush install a default site unusable
drush site-install dkan --db-url="mysql://root:dkan@localhost/dkandb"
#somes errors about email admin@example

# install like drupal with a new mysqldb


#Troubleshooting


### imagemagick ###
#some trouble with generation of image (ERROR 500 from server), change GD image toolkit by imagemagik should resolved the issue
sudo apt-get install imagemagick
sudo apt-get install php5-imagick

sudo service apache2 restart

#download package for drupal put in modules folder in drupal site
#activated the module in drupal module
#and change configuration/media/image toolkit in drupal administration website
### END imagemagick ###


### Full HTML ###
https://www.drupal.org/node/778976

### End Full HTML ###

================
END DKAN INSTALL
=================

================
DKAN EXTENTION INSTALL
=================


https://github.com/NuCivic/data_workflow.git

https://github.com/NuCivic/dkan_datastore_cartodb.git
https://github.com/NuCivic/cartodbclient-php.git

 https://github.com/NuCivic/visualization_entity.git
 https://github.com/NuCivic/visualization_entity_cartodb_bundle.git
 https://github.com/NuCivic/geo_file_entity.git

================
END DKAN EXTENTION INSTALL
=================