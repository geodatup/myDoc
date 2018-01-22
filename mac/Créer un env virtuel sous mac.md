Créer un env virtuel sous mac avec Virtualenvs

~~~
cd Virtualenvs
virtualenv --python=python3.5 p3-env

source p3-env/bin/activate	


cd Projects/appli

cd 
pip install -r requirements.txt
~~~


MYSQL command
~~~
mysql -u root -p
~~~

lancer mysql sans verfication des password
~~~
mysqld --skip-grant-tables
~~~
~~~
update mysql.user SET authentication_string=PASSWORD('mcot') WHERE User='root';


FLUSH PRIVILEGES;
~~~

redemarer le serveur mysql puis
~~~
ALTER USER 'root'@'localhost' IDENTIFIED BY 'mcot'
~~~

creer la base et l'utilisateur 
~~~
create database quorelcms default character set utf8 default collate utf8_general_ci;

CREATE USER 'djangocms'@'localhost' IDENTIFIED BY 'mcot';
GRANT ALL PRIVILEGES ON quorelcms.* TO 'djangocms'@'localhost';
FLUSH PRIVILEGES;
~~~

d'autres commandes utiles
~~~
select * from mysql.user;
DROP USER 'djangocms'@'localhost'
~~~