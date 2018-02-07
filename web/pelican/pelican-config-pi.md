## Pelican 

Créer un environnement virtuel pour Pelican

```
virtualenv ~/virtualenvs/pelican
cd ~/virtualenvs/pelican
source bin/activate
```


Obtenir les sources d'un blog
```
git clone https://github.com/yougis/blog.git
git clone git://github.com/yougis/pure-single-yo.git
git clone git://github.com/yougis/flickr.git
sudo mkdir pelican-plugins
cd pelican-plugins 
git clone git://github.com/La0/pelican-flickr.git
cd pelican-flickr
sudo python setup.py install
pip install markdown
```

## Configurer NGNIX pour acceder au blog
```
sudo nano /etc/nginx/sites-available/blog.com
sudo ln -s /etc/nginx/sites-available/blog.com /etc/nginx/sites-enabled/blog.com
```
