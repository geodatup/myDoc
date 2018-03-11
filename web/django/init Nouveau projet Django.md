#Nouveau projet python Django from scratch

## Créer un env virtuel 

### Activer l'env
```
myenv/bin/activate
```

## installer django et les requierments (requirement.txt)


# Creer un repertoire
```
django-admin startproject geodatup
```
# configurer les fichiers settings.py base, local et de production

```
mkdir geodatup/geodatup/settings
mv geodatup/geodatup/settings.py geodatup/geodatup/settings/base.py
vi geodatup/geodatup/settings/__init__.py
```


si vous déplacez les fichiers dans un sous repertoire "settings" il faudra modifier le path DATA_DIR et BAS_DIR du fichier base.py 

```
BASE_DIR =os.path.dirname(os.path.realpath(os.path.dirname(__file__)+ "/.."))

```


Definir la variable d'environnement des settings Django
```
export DJANGO_SETTINGS_MODULE=ann.settings.local
```

