# Ajout d'un utilisateur pour mon projet as ROOT 

```

```


Configurer le compte utilisateur

```
nano ~/.profile
```
Ajouter les parametres de la localisation du virtual

```
export WORKON_HOME=~/.virtualenvs
mkdir -p $WORKON_HOME
source `which virtualenvwrapper.sh`
```

activer les parametres pour la session

```
source .profile
```







créer un env virtuel dans ~/.virtualenvs

```
mkvirtualenv --python=python3.4 myven
```


## DjangoCMS

```
pip install Pillow djangocms-installer
```
initialiser django (installation des dépendance etc.) avec un projet vierge

```
mkdir tutorial-project
cd tutorial-project
djangocms -f -p . mysite
```

ou 

```
cd /media/store/projets/www/ann
pip install -r requirements/prod.txt
```

definir la variable d'environnement de django settings

``` 
export DJANGO_SETTINGS_MODULE=ann.settings.production
``` 

Collecter les fichiers statics pour le project

```
python manage.py collectstatic
```

Syncroniser la base avec le modèle
```
python manage.py syncdb
```

Charger les données DUMP
```
python manage.py loaddata data.json
```





## supervisor

```
sudo apt-get install supervisor
```
```
sudo nano /etc/supervisor/superisord.conf

```

ajouter

```
chown=*:supervisor 
```

modifier le fichier de config pour ann

```
sudo nano /etc/supervisor/conf.d/ann.conf

```



```
[program:ann]
environment=DJANGO_SETTINGS_MODULE='ann.settings.production'
directory=/media/store/projets/www/ann
command=/home/djangocms-ann/.virtualenvs/myvenv/bin/python manage.py run_gunico$
user=djangocms-ann
autostart=true
autorestart=true
stdout_logfile=/var/log/supervisor/ann.log
redirect_stderr=true

```


Créer un groupe "supervisor" et intégrer djangocms-ann dedans
```
sudo groupadd supervisor
sudo usermod -a -G  supervisor djangocms-ann
```



restart supervisor

```
sudo supervisorctl reread
sudo supervisorctl reload
```







## Database serveur

### Mysql
### Postgres postgis
