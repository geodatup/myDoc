Environnement de dev sous mac

# install dev python env on macos

installer la version  de python souhaitée (avec pyenv):


## install pyenv
~~~
brew update
brew install pyenv
~~~

et son plugin pyenv-virtualenv
~~~
brew install pyenv-virtualenv
~~~

After installation, you'll still need to add
~~~
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
~~~


##install python

liste des version python disponible
~~~
pyenv install --list
~~~

definir la version de python dans une variable d'environnement . Ici 3.5.4
~~~
PYTHONVERSION=3.5.4
~~~

Lancer l'installation
~~~
pyenv install $PYTHONVERSION
~~~


Creér et activer l'environnement virtuel avec la version python défini dans $PYTHONVERSION

avec pyenv-virtualenv
~~~
pyenv virtualenv $PYTHONVERSION venv$PYTHONVERSION
~~~

activer l'env
~~~
source /Users/R/.pyenv/versions/venv$PYTHONVERSION/bin/activate
~~~

avec virtualenv
~~~
cd Virtualenvs
virtualenv --python=python$PYTHONVERSION p34-DJCMS
source p34-DJCMS/bin/activate	
~~~

Créer un fichier requierment.txt dans le dossier du projet django et inserer toutes les dépendances python nécessaire
~~~
djangocms-installer
~~~

Mettre à jour pip
~~~
pip install --upgrade pip
~~~
Se positionner dans le dossier du projet django et installer les requierments avec Pip
~~~
cd Projects/appli


pip install -r requirements.txt
~~~

Utilisation de djangocms-installer
~~~
NOMAPPLI=lampesVintages
djangocms -f -s -p . $NOMAPPLI
~~~

tester le serveur
~~~
python manage.py runserver
~~~


##upgrade de la version de python 


definir la version de python dans une variable d'environnement . Ici 3.6.0
~~~
PYTHONVERSION=3.6.0
~~~

~~~
brew update
brew upgrade pyenv
pyenv install $PYTHONVERSION
~~~

