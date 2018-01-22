# Micmac on RPI 3 with docker (hypriotOS)

prerequied : 

flash hypriot on sd card



## create the micmac's container 



~~~shell
docker build -t geodatup/micmac git://github.com/geodatup/micmac-docker-rpi
~~~

will install Raspbian Os

~~~shell
Sending build context to Docker daemon 104.4 kB
Step 1/9 : FROM resin/rpi-raspbian:latest
latest: Pulling from resin/rpi-raspbian
75419788cca0: Downloading 23.33 MB/49.32 MB
a270c0806eb4: Download complete 
2a3c870a1902: Download complete 
b3d4c2f8bb93: Download complete 
fada51ac62da: Download complete 
ccaf95dfea4a: Download complete 
a62a109564e3: Download complete 
693c0685d05f: Download complete 
8ce104f7cdb9: Download complete 
Digest: sha256:18184791572fa865b3ed401dec2c09835720e810346378a393378b2973853b5d
Status: Downloaded newer image for resin/rpi-raspbian:latest
 ---> 0cc38b89307c
~~~

just for credit

~~~
Step 2/9 : MAINTAINER Roussaffa Hugo - GeoDatup.fr - contact@geodatup.fr
 ---> Running in 1fa4e969136d
 ---> f165b8803ed0
~~~

installing dependencies (569 MB)

~~~
Step 3/9 : RUN apt-get update && apt-get install -y --install-recommends x11proto-core-dev make cmake libx11-dev mercurial subversion imagemagick gcc g++ exiv2 libimage-exiftool-perl libgeo-proj4-perl mesa-common-dev libgl1-mesa-dev libglapi-mesa libglu1-mesa qt5-default doxygen opencl-headers
 ---> Running in 7d25aa8d4fc9
Get:1 http://archive.raspbian.org jessie InRelease [14.9 kB]
Get:2 http://archive.raspberrypi.org jessie InRelease [22.9 kB]
Get:3 http://archive.raspbian.org jessie/main armhf Packages [13.3 MB]
Get:4 http://archive.raspberrypi.org jessie/main armhf Packages [163 kB]
Get:5 http://archive.raspbian.org jessie/contrib armhf Packages [49.5 kB]
Get:6 http://archive.raspbian.org jessie/non-free armhf Packages [101 kB]
Get:7 http://archive.raspbian.org jessie/rpi armhf Packages [1297 B]
Get:8 http://archive.raspbian.org jessie/firmware armhf Packages [1202 B]
Fetched 13.7 MB in 36s (371 kB/s)
Reading package lists...
Reading package lists...
Building dependency tree...
The following extra packages will be installed:
  binutils cmake-data cpp cpp-4.9 file fontconfig fontconfig-config
  fonts-dejavu-core fonts-droid g++-4.9 gcc-4.9 ghostscript gsfonts
  hicolor-icon-theme imagemagick-6.q16 imagemagick-common javascript-common
  libalgorithm-c3-perl libapr1 libaprutil1 libarchive-extract-perl
  libarchive-zip-perl libarchive13 libasan1 libatk1.0-0 libatk1.0-data
  libatomic1 libavahi-client3 libavahi-common-data libavahi-common3 libbsd0
  libc-dev-bin libc6-dev libcairo2 libcgi-fast-perl libcgi-pm-perl
  libclang1-3.5 libclass-c3-perl libclass-c3-xs-perl libcloog-isl4
  libcpan-meta-perl libcroco3 libcups2 libcupsfilters1 libcupsimage2
  libdata-optlist-perl libdata-section-perl libdatrie1 libdjvulibre-text
  libdjvulibre21 libdrm-amdgpu1 libdrm-dev libdrm-exynos1 libdrm-freedreno1
  libdrm-nouveau2 libdrm-omap1 libdrm-radeon1 libdrm-tegra0 libdrm2 libedit2
  libegl1-mesa libegl1-mesa-dev libelf1 libexiv2-13 libexpat1 libfcgi-perl
  libfftw3-double3 libfontconfig1 libfreetype6 libgbm1 libgcc-4.9-dev libgdbm3
  libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgl1-mesa-dri libgl1-mesa-glx
  libgles2-mesa libgles2-mesa-dev libglib2.0-0 libglib2.0-data libgomp1
  libgraphite2-3 libgs9 libgs9-common libgtk2.0-0 libgtk2.0-bin
  libgtk2.0-common libharfbuzz0b libice6 libicu52 libijs-0.35 libilmbase6
  libisl10 libjasper1 libjbig0 libjbig2dec0 libjpeg62-turbo libjpeg8
  libjs-excanvas libjsoncpp0 liblcms2-2 libllvm3.5 libllvm3.9
  liblog-message-perl liblog-message-simple-perl liblqr-1-0 libltdl7 liblzo2-2
  libmagic1 libmagickcore-6.q16-2 libmagickcore-6.q16-2-extra
  libmagickwand-6.q16-2 libmodule-build-perl libmodule-pluggable-perl
  libmodule-signature-perl libmpc3 libmpfr4 libmro-compat-perl libmtdev1
  libnetpbm10 libobjc-4.9-dev libobjc4 libopenexr6 libpackage-constants-perl
  libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 libpaper-utils
  libpaper1 libparams-util-perl libpixman-1-0 libpod-latex-perl
  libpod-readme-perl libproj0 libpthread-stubs0-dev libpython-stdlib
  libpython2.7-minimal libpython2.7-stdlib libqt5concurrent5 libqt5core5a
  libqt5dbus5 libqt5gui5 libqt5network5 libqt5opengl5 libqt5opengl5-dev
  libqt5printsupport5 libqt5sql5 libqt5sql5-sqlite libqt5test5 libqt5widgets5
  libqt5xml5 libregexp-common-perl librsvg2-2 librsvg2-common libserf-1-1
  libsm6 libsoftware-license-perl libsqlite3-0 libstdc++-4.9-dev
  libsub-exporter-perl libsub-install-perl libsvn1 libterm-ui-perl
  libtext-soundex-perl libtext-template-perl libthai-data libthai0 libtiff5
  libtxc-dxtn-s2tc0 libubsan0 libwayland-bin libwayland-client0
  libwayland-cursor0 libwayland-dev libwayland-egl1-mesa libwayland-server0
  libwmf0.2-7 libx11-6 libx11-data libx11-doc libx11-xcb-dev libx11-xcb1
  libxapian22 libxau-dev libxau6 libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0
  libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-icccm4 libxcb-image0
  libxcb-keysyms1 libxcb-present-dev libxcb-present0 libxcb-randr0
  libxcb-randr0-dev libxcb-render-util0 libxcb-render0 libxcb-render0-dev
  libxcb-shape0 libxcb-shape0-dev libxcb-shm0 libxcb-sync-dev libxcb-sync1
  libxcb-util0 libxcb-xfixes0 libxcb-xfixes0-dev libxcb-xkb1 libxcb1
  libxcb1-dev libxcomposite1 libxcursor1 libxdamage-dev libxdamage1
  libxdmcp-dev libxdmcp6 libxext-dev libxext6 libxfixes-dev libxfixes3 libxi6
  libxinerama1 libxkbcommon-x11-0 libxkbcommon0 libxml2 libxmuu1 libxrandr2
  libxrender1 libxshmfence-dev libxshmfence1 libxxf86vm-dev libxxf86vm1
  linux-libc-dev manpages manpages-dev mercurial-common mime-support netpbm
  openssh-client perl perl-modules poppler-data proj-data python
  python-minimal python2.7 python2.7-minimal qt5-qmake qtbase5-dev
  qtbase5-dev-tools qtchooser qttranslations5-l10n rename sgml-base
  shared-mime-info ucf x11-common x11proto-damage-dev x11proto-dri2-dev
  x11proto-fixes-dev x11proto-gl-dev x11proto-input-dev x11proto-kb-dev
  x11proto-xext-dev x11proto-xf86vidmode-dev xauth xdg-user-dirs xkb-data
  xml-core xorg-sgml-doctools xtrans-dev
Suggested packages:
  binutils-doc codeblocks eclipse ninja-build cpp-doc gcc-4.9-locales
  doxygen-latex doxygen-doc doxygen-gui graphviz gcc-4.9-doc
  libstdc++6-4.9-dbg gcc-multilib autoconf automake libtool flex bison gdb
  gcc-doc libgcc1-dbg libgomp1-dbg libitm1-dbg libatomic1-dbg libasan1-dbg
  liblsan0-dbg libtsan0-dbg libubsan0-dbg libcilkrts5-dbg libquadmath-dbg
  ghostscript-x imagemagick-doc autotrace cups-bsd lpr lprng enscript ffmpeg
  gimp gnuplot grads groff-base hp2xx html2ps libwmf-bin mplayer povray
  radiance sane-utils texlive-base-bin transfig ufraw-batch xdg-utils apache2
  lighttpd httpd lrzip glibc-doc cups-common libfftw3-bin libfftw3-dev gvfs
  libjasper-runtime liblcms2-utils inkscape proj-bin librsvg2-bin
  libstdc++-4.9-doc xapian-tools libxcb-doc libxext-doc make-doc man-browser
  qct kdiff3 kdiff3-qt kompare meld tkcvs mgdiff wish python-mysqldb
  python-pygments python-openssl ssh-askpass libpam-ssh keychain monkeysphere
  perl-doc libterm-readline-gnu-perl libterm-readline-perl-perl libb-lint-perl
  libcpanplus-dist-build-perl libcpanplus-perl libfile-checktree-perl
  libobject-accessor-perl poppler-utils fonts-japanese-mincho
  fonts-ipafont-mincho fonts-japanese-gothic fonts-ipafont-gothic
  fonts-arphic-ukai fonts-arphic-uming fonts-nanum python-doc python-tk
  python2.7-doc binfmt-support firebird-dev libmysqlclient-dev libpq-dev
  libsqlite3-dev unixodbc-dev sgml-base-doc subversion-tools db5.3-util patch
  debhelper
Recommended packages:
  libarchive-tar-perl
The following NEW packages will be installed:
  binutils cmake cmake-data cpp cpp-4.9 doxygen exiv2 file fontconfig
  fontconfig-config fonts-dejavu-core fonts-droid g++ g++-4.9 gcc gcc-4.9
  ghostscript gsfonts hicolor-icon-theme imagemagick imagemagick-6.q16
  imagemagick-common javascript-common libalgorithm-c3-perl libapr1
  libaprutil1 libarchive-extract-perl libarchive-zip-perl libarchive13
  libasan1 libatk1.0-0 libatk1.0-data libatomic1 libavahi-client3
  libavahi-common-data libavahi-common3 libbsd0 libc-dev-bin libc6-dev
  libcairo2 libcgi-fast-perl libcgi-pm-perl libclang1-3.5 libclass-c3-perl
  libclass-c3-xs-perl libcloog-isl4 libcpan-meta-perl libcroco3 libcups2
  libcupsfilters1 libcupsimage2 libdata-optlist-perl libdata-section-perl
  libdatrie1 libdjvulibre-text libdjvulibre21 libdrm-amdgpu1 libdrm-dev
  libdrm-exynos1 libdrm-freedreno1 libdrm-nouveau2 libdrm-omap1 libdrm-radeon1
  libdrm-tegra0 libedit2 libegl1-mesa libegl1-mesa-dev libelf1 libexiv2-13
  libexpat1 libfcgi-perl libfftw3-double3 libfontconfig1 libfreetype6 libgbm1
  libgcc-4.9-dev libgdbm3 libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common
  libgeo-proj4-perl libgl1-mesa-dev libgl1-mesa-dri libgl1-mesa-glx
  libglapi-mesa libgles2-mesa libgles2-mesa-dev libglib2.0-0 libglib2.0-data
  libglu1-mesa libgomp1 libgraphite2-3 libgs9 libgs9-common libgtk2.0-0
  libgtk2.0-bin libgtk2.0-common libharfbuzz0b libice6 libicu52 libijs-0.35
  libilmbase6 libimage-exiftool-perl libisl10 libjasper1 libjbig0 libjbig2dec0
  libjpeg62-turbo libjpeg8 libjs-excanvas libjsoncpp0 liblcms2-2 libllvm3.5
  libllvm3.9 liblog-message-perl liblog-message-simple-perl liblqr-1-0
  libltdl7 liblzo2-2 libmagic1 libmagickcore-6.q16-2
  libmagickcore-6.q16-2-extra libmagickwand-6.q16-2 libmodule-build-perl
  libmodule-pluggable-perl libmodule-signature-perl libmpc3 libmpfr4
  libmro-compat-perl libmtdev1 libnetpbm10 libobjc-4.9-dev libobjc4
  libopenexr6 libpackage-constants-perl libpango-1.0-0 libpangocairo-1.0-0
  libpangoft2-1.0-0 libpaper-utils libpaper1 libparams-util-perl libpixman-1-0
  libpod-latex-perl libpod-readme-perl libproj0 libpthread-stubs0-dev
  libpython-stdlib libpython2.7-minimal libpython2.7-stdlib libqt5concurrent5
  libqt5core5a libqt5dbus5 libqt5gui5 libqt5network5 libqt5opengl5
  libqt5opengl5-dev libqt5printsupport5 libqt5sql5 libqt5sql5-sqlite
  libqt5test5 libqt5widgets5 libqt5xml5 libregexp-common-perl librsvg2-2
  librsvg2-common libserf-1-1 libsm6 libsoftware-license-perl libsqlite3-0
  libstdc++-4.9-dev libsub-exporter-perl libsub-install-perl libsvn1
  libterm-ui-perl libtext-soundex-perl libtext-template-perl libthai-data
  libthai0 libtiff5 libtxc-dxtn-s2tc0 libubsan0 libwayland-bin
  libwayland-client0 libwayland-cursor0 libwayland-dev libwayland-egl1-mesa
  libwayland-server0 libwmf0.2-7 libx11-6 libx11-data libx11-dev libx11-doc
  libx11-xcb-dev libx11-xcb1 libxapian22 libxau-dev libxau6 libxcb-dri2-0
  libxcb-dri2-0-dev libxcb-dri3-0 libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev
  libxcb-icccm4 libxcb-image0 libxcb-keysyms1 libxcb-present-dev
  libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-render-util0
  libxcb-render0 libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev
  libxcb-shm0 libxcb-sync-dev libxcb-sync1 libxcb-util0 libxcb-xfixes0
  libxcb-xfixes0-dev libxcb-xkb1 libxcb1 libxcb1-dev libxcomposite1
  libxcursor1 libxdamage-dev libxdamage1 libxdmcp-dev libxdmcp6 libxext-dev
  libxext6 libxfixes-dev libxfixes3 libxi6 libxinerama1 libxkbcommon-x11-0
  libxkbcommon0 libxml2 libxmuu1 libxrandr2 libxrender1 libxshmfence-dev
  libxshmfence1 libxxf86vm-dev libxxf86vm1 linux-libc-dev make manpages
  manpages-dev mercurial mercurial-common mesa-common-dev mime-support netpbm
  opencl-headers openssh-client perl perl-modules poppler-data proj-data
  python python-minimal python2.7 python2.7-minimal qt5-default qt5-qmake
  qtbase5-dev qtbase5-dev-tools qtchooser qttranslations5-l10n rename
  sgml-base shared-mime-info subversion ucf x11-common x11proto-core-dev
  x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev
  x11proto-input-dev x11proto-kb-dev x11proto-xext-dev
  x11proto-xf86vidmode-dev xauth xdg-user-dirs xkb-data xml-core
  xorg-sgml-doctools xtrans-dev
The following packages will be upgraded:
  libdrm2
1 upgraded, 291 newly installed, 0 to remove and 4 not upgraded.
Need to get 148 MB of archives.
After this operation, 569 MB of additional disk space will be used.
~~~



