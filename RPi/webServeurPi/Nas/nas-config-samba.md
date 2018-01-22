



lister les disques connectés

```
fdisk -l
```

voir uuid des equipement 

```
sudo blkid
```

donne

```
/dev/sde1: LABEL="Dawa" UUID="5673-5AF3" TYPE="exfat" PARTUUID="3965e626-01"

/dev/sdf1: LABEL="Manta" UUID="5676-7F24" TYPE="exfat" PARTUUID="fcd59ecc-01"
```

— 



Formater les disques si besoin:

On démonte la partition.

```
 umount /dev/sda1
```

Puis on formate en "ext4".

```
 mke2fs -t ext4 /dev/sda1
```



— 

modifier la conf fstab

~~~
sudo nano /etc/fstab
~~~

~~~
\####La_NASSE####

UUID=12d799d5-6e6d-43b9-ba7b-42d65e434558 /media/flotsam ext4 rw,auto 0 2

UUID=acd1eb0b-66fc-454c-ac78-d00b2add97cc /media/jetsam ext4 rw,auto 0 2

UUID=851532c4-adc5-4b78-a069-2215b763525e /media/store  ext3  rw,auto    0    2

UUID=5673-5AF3 /media/photo exfat rw,auto 0 2

UUID=5676-7F24 /media/films exfat rw,auto 0 2
~~~



créer les dossiers de montage

~~~
sudo mkdir /media/films && sudo mkdir /media/photo
~~~





Tout remonter

~~~ 
sudo mount -a 
~~~
configurer samba 



sudo nano /etc/samba/smb.conf



~~~

[global]
workgroup = WORKGROUP
server string = %h server
netbios name = LA-NASSE

security = user
log file = var/log/samba/log.%m
max log size = 1000
sylog = 0
map to guest = bad user
dns proxy = no
usershare allow guests = yes

#===== Share Definitions =====

[Monstro]
path = /media/store
comment = WD - 1.5 TO
guest ok = yes
read only = no
force user = pi

[Flotsam]
path=/media/flotsam
comment = qui sera backup - Toshiba 3 TO
read only = no
locking = no
guest ok = yes
force user = pi

[Jetsam]
path=/media/jetsam
read only = yes
comment = backup de flotsam - Toshiba 3 TO 

[Manta]
path=/media/films
comment = Films - 1 To
read only = no
locking = no
guest ok = yes
force user = pi


~~~
ls



~~~
sudo /etc/init.d/smb restart
~~~







