
#Connection à la base
```
mysql -u root -p
mysql -u yogis -p
```

# Editer my.cnf
Editez le fichier de configuration pour permettre l'accès à la base depuis un autre serveur:

```
sudo nano /etc/mysql/mariadb.conf.d/50-server.cnf
```
Par défaut, MySQL n'écoute que localhost. . Il faudra désactiver la ligne relative au bind-address dans le fichier de configuration mysql:
```
#bind-address = 127.0.0.1
```

##Redémarrer le serveur MySQL

```
sudo /etc/init.d/mysql restart
```