# Changer l'IP en static
```
sudo nano /etc/network/inerfaces
```

# Mise à jour initiale
```
sudo apt-get update && apt-get upgrade && apt-get dist-upgrade
```

# Servir des fichiers*
## suport NTFS
```
sudo apt-get install ntfs-3g
```

## Montage des disques connectées
### Détecter les disques
```
sudo fdisk -l
```

### Créer les points de montage
```
sudo mkdir /media/Films
sudo mkdir /media/Photo
```

### Monter les disques
```
sudo mount -t auto /dev/sda1 /media/store
```

### installer Samba
```
sudo apt-get install samba samba-common-bin
```
modifier la config de samba 
D'abord on sauvegarde la config de base
```
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.bkp
```


# installation utils (pip, virtualenv, git)
Easy_install et pip
```
sudo apt-get install python-setuptools python-dev build-essential 
sudo easy_install pip 
sudo pip install --upgrade pip 
sudo pip install --upgrade virtualenv virtualenvwrapper
sudo apt-get install git
```

# Installation serveur Web http

## Nginx et php

```
sudo aptitude install nginx php5-fpm
```

Verifier l'accès au service sur le port 80.
Si depuis un autre poste la page affiché est l'accueil de la livebox essayer avec un accès externe.


Relancer le server
```
sudo /etc/init.d/nginx restart 
```



## Python
```
sudo apt-get install python3.4 python3-dev 
```

## Virtualenv

faire en sorte de localiser les environnements dans 
~/.virtualenvs




# hosts 

Il faut renseigner les noms d'hote accessible sur le reseau

dans /etc/

```

127.0.0.1       localhost rouyre.ddns.net
127.0.0.1       localhost geodatup.ddns.net
::1             localhost ip6-localhost ip6-loopback
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters

127.0.1.1       raspberrypi

```