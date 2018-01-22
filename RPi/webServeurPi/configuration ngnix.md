
On modifie a config par Default du serveur nginx 

```
sudo nano /etc/nginx/sites-available/default
```

Tout mettre en commentaire et ajouter ceci à la fin du fichier
```
server {
        listen 80 default_server;
        return 444;
}
```





# Créer un serveur specifique
##pour djangocms ann

```
sudo nano /etc/nginx/sites-available/djangocms-ann
```
écrire ceci : cf contenu de ann app configuration nginx


## Pour pelican blog
```
server {

listen   80;
server_name  www.rouyre.ddns.net;
rewrite ^/(.*) http://rouyre.ddns.net/$1 permanent;
}

server {

listen   80;
server_name rouyre.ddns.net;

access_log /media/store/projets/www/logs/access.log;
error_log /media/store/projets/www/logs/error.log;

location / {

root   /media/store/projets/www/blog/output;
index  index.html;
}
}

```
# Créer le lien symbolique

```
sudo ln -s /etc/nginx/sites-available/djangocms-ann /etc/nginx/sites-enabled/
sudo ln -s /etc/nginx/sites-available/pelican-blog /etc/nginx/sites-enabled/
```


# redemarer NGINX
```
sudo /etc/init.d/nginx restart
```


Error log sont ici:
```
nano /var/log/nginx/error.log
```




