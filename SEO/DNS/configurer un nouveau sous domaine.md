# configurer un sous domaine

- NGINX 


server {
    listen [::]:84;
    listen   80;
    server_name lychee.geodatup.fr;
...
}

restart nginx


- OVH DNS

creer un sous domaine dans DynHost

avec tor, essayer de se connecter à l'adresse


- DYNDNS et crontab

ATTENTION assurer vous de définir dans le DYNHOST de OVH l'adresse IP actuelle (car le script n'est pas prévu pour verifier chaque sous domaine mais seulement le DNS principal)
Ajouter simplement au fichier dynhost_geodatup une nouvelle variable HOST

