
#Configuration sur OVH
- acheter le nom de domaine

##Créer un identifiant DynHost

2 possibilités :

- depuis l'api
https://api.ovh.com/console/#/domain/zone/%7BzoneName%7D/dynHost/record#POST

- depuis l'interface de votre compte
aller dans votre domaine, onglet DDNS, ajouter un nouveau dynhost
cliquer sur créer un identifiant

~~~
Suffixe de l'identifiant : ident
Sous-domaine : *
mot de pass:
confirmation:
~~~
De nouveau cliquer sur ajouter un nouveau dynhost mais cette fois
Ajouter un sous domaine ```www```

#Configuration sur le serveur

##Créer un dossier dynhost

~~~
mkdir -p DYNDNS
cd DYNDNS
~~~

##Télécharger et décompresser Dyndns

~~~
wget http://framboisepi.fr/dynhost/dynhost.tar.gz
tar xvfz http://framboisepi.fr/dynhost/dynhost.tar.gz
cd dynhost
~~~

##Configurer le fichier dynhost

Grace au serveur et au programme php disponible à cette adresse :

[http://ardenne-informatique.com/remoteip.php](http://ardenne-informatique.com/remoteip.php)

Nous pouvons lire notre IP et l'envoyer à OVH

```
#! /bin/sh

# OVH - DynHost
#
# Permet de mettre à jour le champ DYNHOST
# pour votre nom de domaine.
# Utilise l'adresse de l'interface ppp0 de
# votre système Linux.
# Doc : http://guide.ovh.com/DynDns

# La mise à jour ne se fait que si l'adresse IP
# a effectivement changé.
# Fichier de log: dynhost.log
HOST=www.annauffray.fr
LOGIN=annauffray.fr-ident
PASSWORD=*****
OPTIONS="-i eth0 -a "


PATH_APP=/home/pi/DYNDNS/dynhost
PATH_LOG=$PATH_APP/log
PATH_FILE_OLD_IP=$PATH_APP/old_ip

getip() {
                IP=`curl --silent http://ardenne-informatique.com/remoteip.php`
                OLDIP=`cat PATH_FILE_OLD_IP`
}

echo ---------------------------------- >> $PATH_APP/dynhost.log
echo `date` >> $PATH_APP/dynhost.log
echo Démarrage de DynHost pour $HOST >> $PATH_APP/dynhost.log
getip

if [ "$IP" ]; then
        if [ "$OLDIP" != "$IP" ]; then
                echo -n "Ancienne IP: " >> $PATH_APP/dynhost.log
                echo $OLDIP >> $PATH_APP/dynhost.log
                echo -n "Nouvelle IP: " >> $PATH_APP/dynhost.log
                echo $IP >> $PATH_APP/dynhost.log
                echo "Mise a jour!" >> $PATH_APP/dynhost.log
                if [ "$OPTIONS" =  "" ]; then
                        OPTIONS="-a $IP"
                fi

                python ipcheck.py $OPTIONS $IP $LOGIN $PASSWORD $HOST >> $PATH_APP/dynhost.log
                echo -n "$IP" > $PATH_FILE_OLD_IP
        else
                echo IP Identique! Pas de mise � jour. >> $PATH_APP/dynhost.log
        fi
 else
        echo Panique � bord: Aucune IP Disponible!! >> $PATH_APP/dynhost.log
 fi
```

Créer autant de fichier dynhost que de domaine OVH.

## Puis lancer ce programme régulièrement
Créer un Crontab pou une maj toutes les 5 minutes des Dyndns

```
crontab -e
```
Indiquer  
```
*/5 * * * * /home/pi/DYNDNS/dynhost/dynhost.sh
```

Pour verifier les mails du serveur 

~~~
nano /var/mail/pi
~~~