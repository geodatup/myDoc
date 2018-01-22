

#My sql

~~~
CREATE DATABASE owncloud;
CREATE USER owncloud@localhost IDENTIFIED BY 'm****.*';
GRANT ALL PRIVILEGES ON owncloud.* TO owncloud@localhost;
flush privileges;
quit
~~~

# owncloud directory

~~~~
mkdir /media/store
chown www-data:www-data /media/store/owncloud
chmod 750 /media/store
~~~~

~~~
su -u www-data  php occ db:convert-type [options] type username hostname database
~~~

# redemarer PHP5

~~~
/etc/init.d/php5-fpm restart
~~~