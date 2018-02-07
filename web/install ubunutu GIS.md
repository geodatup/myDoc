add-apt-repository ppa:ubuntugis/ubuntugis-unstable 
sudo apt-get update
sudo apt-get install qgis python-qgis qgis-plugin-grass libgdal-dev


----
#NodeJS
----
curl -sL https://deb.nodesource.com/setup | sudo bash -
sudo apt-get install -y nodejs

-----
#MapBox
----
#need nodjs
cd 
cd projects
mkdir mapbox
cd mapbox
git clone https://github.com/mapbox/mapbox-studio.git
cd mapbox-studio
npm install
npm start


----
#if error npm
---
rm -rf node_modules
npm install