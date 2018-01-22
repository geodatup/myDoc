documentation source

http://www.pyimagesearch.com/2015/10/26/how-to-install-opencv-3-on-raspbian-jessie/

http://docs.opencv.org/3.1.0/d7/d9f/tutorial_linux_install.html#gsc.tab=0



sudo apt-get install build-essential 

sudo apt-get install  git cmake pkg-config 

sudo apt-get install libgtk2.0-dev pkg-config libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev

sudo apt-get install libjpeg-dev libtiff5-dev libjasper-dev libpng12-dev
sudo apt-get install libatlas-base-dev gfortran

sudo apt-get install python2.7-dev python3-dev


cd src
wget -o opencv_2.4.13.zip https://github.com/Itseez/opencv/archive/2.4.13.zip 
unzip opencv_2.4.13.zip

cd ~/opencv
mkdir build
cd build
cmake -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=/usr/local ..

make -4j
sudo make install
sudo ldconfig
