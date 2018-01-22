Mise à jour du RPI
==================

sudo apt-get update && sudo apt-get -y upgrade && sudo apt-get -y dist-upgrade

sudo apt-get update && sudo apt-get install -y alsa-utils

pour le wifi le bluetooth
-------------------------

sudo apt-get install firmware-brcm80211 pi-bluetooth wpasupplicant

https://raw.githubusercontent.com/snubbegbg/install\_raspi-config/master/install.sh

Pour installer rpi-update, tapez la ligne ci-dessous : sudo wget
http://goo.gl/1BOfJ -O /usr/bin/rpi-update && sudo chmod +x /usr/bin/rpi-update
