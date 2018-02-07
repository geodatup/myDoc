~~~
sudo apt install php7.0 php7.0-fpm php7.0-mysql php7.0-curl php7.0-json php7.0-gd php7.0-mcrypt php7.0-msgpack php7.0-memcached php7.0-intl php7.0-sqlite3 php7.0-gmp php7.0-geoip php7.0-mbstring php7.0-xml php7.0-zip
~~~

~~~
sudo apt-get install php7.0-fpm php7.0-mysql php7.0-mcrypt php-mbstring php-gettext
sudo phpenmod mcrypt
sudo phpenmod mbstring
~~~

~~~
sudo nano /etc/php/7.0/fpm/php.ini
~~~

~~~
sudo apt-get install mariadb-client mariadb-server
sudo mysql_secure_installation
sudo apt-get install phpmyadmin
sudo ln -s /usr/share/phpmyadmin/ /var/www/webapps/
sudo service nginx restart
~~~

~~~
mysql -u root -p
~~~
~~~
CREATE USER 'yogis'@'jp.geodatup.fr' IDENTIFIED BY 'mcot9a9.u';
GRANT ALL PRIVILEGES ON *.* TO 'yogis'@'jp.geodatup.fr' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit
~~~

~~~
sudo apt-get install postfix
~~~

~~~
sudo touch /etc/nginx/sites-available/jpworldtour
sudo nano /etc/nginx/sites-available/jpworldtour
~~~

~~~
server {

    listen [::]:88 ;
    listen 80;
    listen 88 ;
    root /var/www/webapps/jpworldtour;
    index index.php index.html index.htm;
    server_name jpworldtour.geodatup.fr;
location / {
    try_files $uri/ /index.php?$args;
    }
location ~ \.php$ {
    try_files $uri =404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    fastcgi_index index.php;
    include fastcgi.conf;
    }
location ~* \.(js|css|png|jpg|jpeg|gif|ico|eot|otf|ttf|woff)$ {
    add_header Access-Control-Allow-Origin *;
    add_header Cache-Control "public, max-age=31536000, immutable";
    access_log off; log_not_found off;
    }
location = /robots.txt { access_log off; log_not_found off; }
location ~ /\. { deny all; access_log off; log_not_found off; }
}
~~~

~~~
sudo ln -s /etc/nginx/sites-available/jpworldtour /etc/nginx/sites-enabled/
~~~

~~~
sudo touch /etc/nginx/sites-available/phpmyadmin
sudo nano /etc/nginx/sites-available/phpmyadmin
~~~

~~~
server {
#J'utilise le port 8080 pour bien séparer le site internet de l'interface phpMyAdmin
       listen 81;
       listen [::]:81;

       server_name wp.geodatup.fr;

       root /usr/share/phpmyadmin;
       index index.php index.html;

       location / {
               try_files $uri $uri/ =404;
       }
       location ~ \.php$ {
                try_files $uri =404;
                fastcgi_index index.php;
                fastcgi_pass unix:/run/php/php7.0-fpm.sock;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                include /etc/nginx/fastcgi_params;
        }
}
~~~

~~~
sudo ln -s /etc/nginx/sites-available/phpmyadmin /etc/nginx/sites-enabled/phpmyadmin
~~~

~~~
sudo service nginx restart
sudo service php7.0-fpm restart
sudo service mysql restart
~~~

~~~
sudo chown -R www-data:www-data /var/www/webapps/jpworldtour/
~~~


#SSL

~~~
sudo apt-get update
sudo apt-get install -y git
sudo git clone https://github.com/certbot/certbot /opt/letsencrypt
~~~

~~~
sudo /etc/init.d/nginx stop
~~~

~~~
./letsencrypt-auto certonly -a standalone -d jp.geodatup.fr
~~~
~~~
nano /etc/nginx/site-available/jpworldtour
~~~
~~~
server {

    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name jp.geodatup.fr;

    access_log /var/log/nginx/jp-worldtour-access.log;
    error_log /var/log/nginx/jp-worldtour-error.log;


    ssl_certificate /etc/letsencrypt/live/jp.geodatup.fr/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/jp.geodatup.fr/privkey.pem;
    ssl_session_timeout 1d;
    ssl_session_cache shared:SSL:10m;
    
    ssl_protocols TLSv1.1 TLSv1.2;
    ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM    -SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-    SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-    SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-    AES256-SHA:DHE-RSA-AES256-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!3DES:!MD5:!PSK';
    ssl_prefer_server_ciphers on;
    
    add_header Strict-Transport-Security max-age=15768000;
    
    ssl_stapling on;
    ssl_stapling_verify on;
    
    ## verify chain of trust of OCSP response using Root CA and Intermediate certs
    ssl_trusted_certificate /etc/letsencrypt/live/jp.geodatup.fr/chain.pem;
    resolver 8.8.8.8 8.8.4.4 valid=86400;
    resolver_timeout 10;


    root /var/www/webapps/jpworldtour;

    index index.php index.html index.htm;
    server_name jp.geodatup.fr;
    client_max_body_size 20m;

location / {
    try_files $uri/ /index.php?$args;
    }
location ~ \.php$ {
    try_files $uri =404;
    fastcgi_split_path_info ^(.+\.php)(/.+)$;
    fastcgi_pass unix:/run/php/php7.0-fpm.sock;
    fastcgi_index index.php;
    include fastcgi.conf;
    }
location ~* \.(js|css|png|jpg|jpeg|gif|ico|eot|otf|ttf|woff)$ {
    add_header Access-Control-Allow-Origin *;
    add_header Cache-Control "public, max-age=31536000, immutable";
    access_log off; log_not_found off;
    }
location = /robots.txt { access_log off; log_not_found off; }
location ~ /\. { deny all; access_log off; log_not_found off; }
}


server {
    listen 80;
    listen [::]:80;
    server_name jp.geodatup.fr;

    return 301 https://jp.geodatup.fr$request_uri;
}

~~~

~~~
sudo /etc/init.d/nginx restart
~~~

#Newsletter

- installer MailPoet 2
- onglet envoyer par, choisir Tiers
  - adresse email d'envois et mot de passe
  - TSL -> port 587
- Dans Gmail activer le client IMAP et  autoriser les applications / client qui se connecte au compte (pour cela envoyer un mail de test puis attendre les mails d'erreurs ou de bloquage des matériels. Autoriser les ! )
