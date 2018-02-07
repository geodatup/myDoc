
##Lister les processus en cours.

`ps aux`


##rechercher un document

`find / -type d -name 'WEB-INF'`



changer de proprietaire
=======================

`sudo chown -R www-data:www-data [dossier]`

donner les droits d'écriture au groupe

`sudo chmod -R g+w [dossier]`

lister user groupe
==================

les utilisateurs

`cat /etc/passwd | awk -F: '{print $ 1}'`

les groupes

`cat /etc/group | awk -F: '{print $ 1}'`

 

verifier les groupes associés à un utilisateur

`groups [nom du user]`


ajouter un groupe

`sudo groupadd --system webapps`


Ajouter un user

`sudo useradd --system --gid webapps --shell /bin/bash --home /var/www/webapps/lampesCMS lampesCMS`


supprimer un user
`userdel userName`

liens symboliques
=================

`ln -s /src /dest`

 

 