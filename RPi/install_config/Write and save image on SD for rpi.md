

 

Créer l’image sur la SD
=======================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
df -h
sudo diskutil umount /dev/diskN?
sudo dd bs=1m if=/path/to.img of=/dev/diskN?
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

exemple :

~~~
imac-de-zugi-r:~ R$ df -h
Filesystem                         Size   Used  Avail Capacity   iused    ifree %iused  Mounted on
/dev/disk0s2                      931Gi  844Gi   87Gi    91% 221187133 22793609   91%   /
devfs                             181Ki  181Ki    0Bi   100%       626        0  100%   /dev
map -hosts                          0Bi    0Bi    0Bi   100%         0        0  100%   /net
map auto_home                       0Bi    0Bi    0Bi   100%         0        0  100%   /home
//GUEST:@raspberrypi/media_store  7.2Gi  5.0Gi  2.2Gi    70%   5250634  2298448   70%   /Volumes/media_store
//GUEST:@mycartodroid/lizmap       15Gi  5.2Gi  9.4Gi    36%   5427106  9872604   35%   /Volumes/lizmap
/dev/disk1s1                      239Mi   28Mi  211Mi    12%         0        0  100%   /Volumes/Untitled

imac-de-zugi-r:~ R$ sudo diskutil umount /dev/disk1s1
Volume (null) on disk1s1 unmounted

sudo dd bs=1m if=/Users/R/Downloads/OSMC_TGT_rbp2_20170504.img of=/dev/disk1
~~~
> cette methode n'a pas fonctionné pour OSMC... obligé d'utiliser le module d'installation pour mac.

l'opération dure un certain temps sans afficher de message

### Troobleshooting :

~~~
dd: /dev/disk1s1: end of device
61+0 records in
60+1 records out
62918656 bytes transferred in 32.856938 secs (1914928 bytes/sec)
~~~

Le nom du disk ne doit pas contenir "s1"



Sauvegarde de l'OS sur carte SD
===============================

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
df -h
sudo diskutil umount /dev/disk1s1
sudo dd if=/dev/disk1s1 | gzip -9 > Desktop/hypriotRPI.img.gz
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

Installer Flash (hypriot tools)
-------------------------------

### prérequis Sous Macos


#### Install Brew
doc ici :
<https://coolestguidesontheplanet.com/installing-homebrew-os-x-yosemite-10-10-package-manager-unix-apps/>


#### Prérequis Xcode

<https://itunes.apple.com/au/app/xcode/id497799835?mt=12>

Lancer la commande dans le terminal et brew est installé

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#### Wget

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
brew install wget
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
wget https://raw.githubusercontent.com/hypriot/flash/master/$(uname -s)/flash
chmod +x flash
sudo mv flash /usr/local/bin/flash
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

### <https://github.com/hypriot/flash#install-dependencies>

### dépendances

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
brew install pv
brew install awscli
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

### Test

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
flash --help
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

 

 

### Flash Hypriot

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
flash --hostname datbox -s *** -p *** hypriotos-rpi-v0.8.0.img.zip
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

~~~
Filesystem      Size   Used  Avail Capacity   iused    ifree %iused  Mounted on

/dev/disk0s2   931Gi  816Gi  115Gi    88% 213844116 30136626   88%   /

devfs          180Ki  180Ki    0Bi   100%       623        0  100%   /dev

map -hosts       0Bi    0Bi    0Bi   100%         0        0  100%   /net

map auto_home    0Bi    0Bi    0Bi   100%         0        0  100%   /home

/dev/disk1s1    14Gi  2.4Mi   14Gi     1%         0        0  100%   /Volumes/NO NAME

Is /dev/disk1 correct? yes

~~~

~~~
Unmounting disk1 ...
Unmount of all volumes on disk1 was successful
Unmount of all volumes on disk1 was successful
Flashing hypriotos-rpi-v1.4.0.img to disk1 ...
Password: [password of your desktop not hypriot]
~~~

### Finished ?

~~~shell
1000MiB 0:01:14 [13.4MiB/s] [================================>] 100%            
0+16000 records in
0+16000 records out
1048576000 bytes transferred in 74.778893 secs (14022353 bytes/sec)
Set hostname=micmac
Set wlan0/ssid=***
Set wlan0/password=***
Unmounting and ejecting disk1 ...
Unmount of all volumes on disk1 was successful
Unmount of all volumes on disk1 was successful
Disk /dev/disk1 ejected
🍺  Finished.
~~~

yep ! take a beer



Open your box interface (livebox france: 192.168.1.1)

check the IP adress

run ssh

```ssh pirate@192.168.1.26```

~~~shell
pirate@192.168.1.26's password: 

HypriotOS (Debian GNU/Linux 8)

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
HypriotOS/armv7: pirate@micmac in ~
$
~~~












 