```src
mkvirtualenv djangotest17
workon djangotest17
cd ~/projects/


pip install django==1.7.4

mkdir testdjango17
cd testdjango17



django-admin.py startproject testnewsletter
cd testnewsletter/

python manage.py migrate

python manage.py createsuperuser
echo #username : 
admin
echo #email : 
hugoroussaffa@gmail.com
echo #mdp: 
aqwxsz
echo #mdp: 
aqwxsz

python manage.py runserver
```
