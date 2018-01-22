Installer l'image Debian :
https://www.raspberrypi.org/documentation/installation/installing-images/README.md

Configuer le Pi :

sudo raspi-config


Activer le wifi :
https://www.maker.io/en/blogs/raspberry-pi-3-how-to-configure-wi-fi-and-bluetooth/03fcd2a252914350938d8c5471cf3b63



Suivre la procédure du site :
http://www.framboise314.fr/premiere-image-de-la-camera/


Installer Motion :
sudo apt-get install -y libjpeg-dev libavformat56 libavformat-dev libavcodec56 libavcodec-dev libavutil54 libavutil-dev libc6-dev zlib1g-dev libmysqlclient18 libmysqlclient-dev libpq5 libpq-dev

wget https://www.dropbox.com/s/6ruqgv1h65zufr6/motion-mmal-lowflyerUK-20151114.tar.gz



sudo mv motion /usr/bin/motion
sudo mv motion-mmalcam-both.conf /etc/motion.conf


/usr/bin/motion -n -c motion-mmalcam.conf