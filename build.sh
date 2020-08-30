#/bin/bash

export VERSION="4.0.0-dev"

#echo "deb http://in.archive.ubuntu.com/ubuntu/ xenial main" | tee /etc/apt/sources.list.d/xenial.list
apt-get  update
#apt --yes install python-software-properties software-properties-common
#add-apt-repository ppa:jonathonf/ffmpeg-4 --yes
#add-apt-repository ppa:jonathonf/vlc-3 --yes
#apt-get install software-properties-common
#add-apt-repository ppa:cmatomic/source --yes
#add-apt-repository universe --yes
apt-get --yes dist-upgrade
apt-get --yes install curl build-essential pkg-config glslang idn wget  libusb-1.0-0-dev libsystemd-dev dbus libdbus-1-dev libgirepository1.0-dev libdbus-glib-1-dev libdbus-glib-1-2-dbg libdbus-glib-1-2   libltdl-dev yasm netsend pkgconf golang-golang-x-net-dev python3-pkgconfig clang python-pkgconfig  python-pip golang  libkrb5-dev autoconf cython zsync  rsync libpcsclite-dev  libbsd0 libvulkan-dev unzip  libdsme0-dev dh-autoreconf  autoconf libtool  meson ninja-build  python3-pip  python3-setuptools python3-dev libxcb-xkb-dev libpipeline1 libdrm-dev  libfaad-dev libmpcdec-dev libxcb-image0-dev libxcb-image0  libtool  patchelf libtasn1-6-dev libtasn1-3-bin libbsd-dev git automake cmake libgstreamer-plugins-base1.0-dev libopencv-dev autopoint bison  gettext flex libaa1-dev libarchive-dev  libasound2-dev libass-dev libavahi-client-dev libavc1394-dev libavcodec-dev libavformat-dev liblircclient-dev libavresample-dev libbluray-dev libcaca-dev libcairo2-dev libcddb2-dev libchromaprint-dev libdbus-1-dev libgtk2.0-dev libdc1394-22-dev libdca-dev libdvbpsi-dev libebml-dev libegl1-mesa-dev libfaad-dev libflac-dev libfluidsynth-dev libfreetype6-dev libfribidi-dev libgl1-mesa-dev libgles2-mesa-dev libgnutls28-dev libgnutls-dev libgtk-3-dev libharfbuzz-dev libidn11-dev libiso9660-dev  libjack-dev libkate-dev liblircclient-dev liblivemedia-dev liblua5.2-dev libmad0-dev libmatroska-dev libmpcdec-dev libmpeg2-4-dev libmpg123-dev libmtp-dev libncursesw5-dev libnfs-dev libnotify-dev libogg-dev libomxil-bellagio-dev libmodplug-dev libopus-dev libpng-dev libpostproc-dev libprotobuf-dev libpulse-dev libqt5svg5-dev libqt5x11extras5 libqt5x11extras5-dev libraw1394-dev libresid-builder-dev librsvg2-dev libsamplerate0-dev libsdl-image1.2-dev libsdl1.2-dev libsecret-1-dev libshine-dev libshout3-dev libsidplay2-dev libsmbclient-dev libsndio-dev libsoxr-dev  libspeex-dev libspeexdsp-dev libssh2-1-dev libswscale-dev libsystemd-dev libtag1-dev libtheora-dev libtwolame-dev libudev-dev libupnp-dev libv4l-dev libva-dev libvcdinfo-dev libvdpau-dev libvncserver-dev libvorbis-dev libx11-dev libx264-dev libx265-dev libxcb-composite0-dev libxcb-keysyms1-dev libxcb-randr0-dev libxcb-shm0-dev libxcb-xv0-dev libxcb1-dev libxext-dev libxi-dev libxinerama-dev libxml2-dev libxpm-dev libzvbi-dev lua5.2 oss4-dev protobuf-compiler python3:native qtbase5-dev qtbase5-private-dev wayland-protocols liba52-0.7.4-dev zlib1g-dev libfreerdp-dev libgme-dev libcrystalhd-dev libvpx-dev libaacs-dev libsrtp0-dev libprojectm-qt-dev libpangomm-1.4-dev libbitstream-dev libschroedinger-dev libminizip-dev valgrind libasm-dev libfluidsynth-dev libdsme0-dev libwayland-dev libfdk-aac-dev  libxcb-xinerama0-dev libgtk2.0-dev libssl-dev tclsh zsh
 # krb5-config krb5-user glslang libaribb24-dev libmicrodns-dev libplacebo-dev libspatialaudio-dev libaom-dev libopenmpt-dev


export PKG_CONFIG_PATH=/usr/lib/pkgconfig


(

 wget https://bootstrap.pypa.io/get-pip.py
 python3 get-pip.py
 python3 -m pip install setuptools --upgrade --user 
 git clone https://github.com/pyinstaller/pyinstaller
 cd pyinstaller
 git checkout v4.0
 cd bootloader
 python3 ./waf all
 cd ..
 python3 setup.py install
 pip3 install meson
 pip3 install ninja
 pip install gssapi
 
)

(

 wget http://pkgconfig.freedesktop.org/releases/pkg-config-0.29.2.tar.gz
 tar -vzxf pkg-config-0.29.2.tar.gz
 cd pkg-config-0.29.2
 ./configure
 make -j$(nproc)
 make -j$(nproc) install

)
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

(

 wget https://ftp.gnu.org/pub/gnu/gettext/gettext-0.21.tar.gz
 tar -vzxf gettext-0.21.tar.gz
 cd gettext-0.21
 ./configure
 make -j$(nproc)
 make -j$(nproc) install

)


(

wget  https://gitlab.freedesktop.org/dbus/dbus/-/archive/master/dbus-master.tar.bz2
tar -xvjf  dbus-master.tar.bz2
cd dbus-master
./autogen.sh
 ./configure --prefix=/usr
 make -j$(nproc)
 make -j$(nproc) install
 
)






(
 git clone https://github.com/KhronosGroup/SPIRV-Headers.git
 cd SPIRV-Headers
 mkdir build
 cd build
 cmake ..
 cmake --build . --target install
 
)

(

 git clone https://github.com/KhronosGroup/glslang.git
 cd glslang
 git clone https://github.com/google/googletest.git External/googletest
 ./update_glslang_sources.py
 mkdir -p BUILD_DIR
 cd BUILD_DIR
 cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX="$(pwd)/install" ../glslang
 make -j4 install
)
#(
#git clone https://github.com/google/shaderc $SOURCE_DIR
#cd $SOURCE_DIR
#./utils/git-sync-deps
#cd $SOURCE_DIR/
#cd $BUILD_DIR
#cmake -GNinja -DCMAKE_BUILD_TYPE={Debug|Release|RelWithDebInfo} $SOURCE_DIR
#ninja
#ninja install 
#)

(

wget https://github.com/intel/libva/releases/download/2.8.0/libva-2.8.0.tar.bz2
tar -xvjf libva-2.8.0.tar.bz2
cd libva-2.8.0
./autogen.sh
./configure --prefix=/usr --libdir=/usr/lib/x86_64-linux-gnu
 make -j$(nproc)
 make -j$(nproc) install

)

(

 wget https://github.com/haasn/libplacebo/archive/v2.72.0.tar.gz
 tar -vzxf v2.72.0.tar.gz
 cd libplacebo-2.72.0
 mkdir build && cd build
 meson
 ninja 
 ninja  install

)

(

 git clone http://code.qt.io/qt/qtstyleplugins.git
 cd qtstyleplugins
 qmake
 make -j$(nproc)
 make -j$(nproc) install

)

(
  git clone https://github.com/videolabs/libdsm.git
  cd libdsm
  ./bootstrap
  ./configure --prefix=/usr
  make -j$(nproc)
  make -j$(nproc) install
)

(
  git clone https://github.com/sahlberg/libnfs.git
  cd libnfs/
  cmake -DCMAKE_INSTALL_PREFIX=/usr .
  make -j$(nproc)
  make -j$(nproc) install
)

(

 git clone https://github.com/Haivision/srt.git
 cd srt
 cmake -DCMAKE_INSTALL_PREFIX=/usr .
 make -j$(nproc)
 make -j$(nproc) install

)  

(

  LIBDVDREAD_VERSION="6.1.1"
  wget https://get.videolan.org/libdvdread/$LIBDVDREAD_VERSION/libdvdread-$LIBDVDREAD_VERSION.tar.bz2
  tar -xvjf  libdvdread-$LIBDVDREAD_VERSION.tar.bz2
  cd libdvdread-$LIBDVDREAD_VERSION
  ./configure  --prefix=/usr --docdir=/usr/share/doc/libdvdread-$LIBDVDREAD_VERSION --enable-static
  make -j$(nproc)
  make -j$(nproc) install
  
)

(

  LIBDVDNAV_VERSION="6.1.0"
  wget https://get.videolan.org/libdvdnav/$LIBDVDNAV_VERSION/libdvdnav-$LIBDVDNAV_VERSION.tar.bz2
  tar -xvjf  libdvdnav-$LIBDVDNAV_VERSION.tar.bz2
  cd libdvdnav-$LIBDVDNAV_VERSION
  ./configure  --prefix=/usr --docdir=/usr/share/doc/libdvdnav-doc --enable-static --disable-silent-rules
  make -j$(nproc)
  make -j$(nproc) install
  
)

(

  LIBDVDCSS_VERSION="1.4.2"
  wget https://download.videolan.org/pub/libdvdcss/last/libdvdcss-$LIBDVDCSS_VERSION.tar.bz2
  tar -xvjf libdvdcss-$LIBDVDCSS_VERSION.tar.bz2
  cd libdvdcss-$LIBDVDCSS_VERSION
  ./configure --prefix=/usr
  make -j$(nproc)
  make -j$(nproc) install
  
)

#(

 #git clone https://github.com/videolan/dav1d.git
 #cd dav1d
 #mkdir build && cd build
 #meson --prefix=/usr
 #ninja 
 #ninja  install
 
#)

(

 git clone http://git.videolan.org/git/x262.git
 cd x262 
 ./configure --prefix=/usr
  make -j$(nproc)
  make -j$(nproc) install

)

(

 git clone https://salsa.debian.org/rousseau/PCSC.git
 cd PCSC
 ./bootstrap
 ./configure
 make

)

(
  wget https://code.videolan.org/midchildan/aribb25/-/archive/master/aribb25-master.tar.bz2
  tar -xvjf aribb25-master.tar.bz2
  cd aribb25-master
  ./bootstrap
  ./configure --prefix=/usr
  make -j$(nproc)
  make -j$(nproc) install

)

(

 wget https://github.com/sahlberg/libsmb2/archive/v3.0.0.tar.gz
 tar -vzxf v3.0.0.tar.gz
 cd libsmb2-3.0.0
 export PKG_CONFIG=/usr/bin/pkg-config
 ./bootstrap
 ./configure --prefix=/usr
  make -j$(nproc)
  make -j$(nproc) install
 
)

(

 git clone https://git.videolan.org/git/ffmpeg/nv-codec-headers.git
 cd nv-codec-headers
 make
 make install

)

(
  git clone https://github.com/videolan/vlc.git
  mv vlc  vlc-$VERSION
  cd vlc-$VERSION
   ./bootstrap
  ./configure --enable-debug --enable-dvdread --enable-chromecast=no --enable-a52 --enable-aa --enable-aom --enable-aribsub --enable-avahi --enable-bluray --enable-caca --enable-chromaprint  --enable-dbus --enable-dca --enable-dvbpsi --enable-dvdnav --enable-faad --enable-flac --enable-fluidsynth --enable-freetype --enable-fribidi --enable-gles2 --enable-gnutls --enable-harfbuzz --enable-jack --enable-kate --enable-libass --enable-libmpeg2 --enable-libxml2 --enable-lirc --enable-live555 --enable-mad --enable-matroska --enable-mod --enable-mpc --enable-mpg123 --enable-mtp --enable-ncurses --enable-notify --enable-ogg --enable-opus --enable-pulse --enable-qt --enable-realrtsp --enable-samplerate --enable-sdl-image --enable-sftp --enable-shine --enable-shout --enable-skins2 --enable-sndio --enable-soxr --enable-spatialaudio --enable-speex --enable-svg --enable-svgdec --enable-taglib --enable-theora --enable-twolame --enable-upnp --enable-vdpau --enable-vnc --enable-vorbis --enable-x264 --enable-x265 --enable-zvbi --enable-alsa  --enable-dc1394  --enable-dv1394 --enable-libplacebo --enable-linsys --enable-nfs --enable-omxil --enable-udev --enable-v4l2 --enable-wayland --enable-libva --enable-vcd --enable-smbclient --enable-debug --disable-crystalhd --disable-d3d11va --disable-decklink --disable-directx --disable-dxva2  --disable-fluidlite --disable-freerdp --disable-goom --disable-gst-decode --disable-libtar --disable-macosx --disable-macosx-avfoundation --disable-macosx-qtkit --disable-mfx --disable-opencv --disable-projectm --disable-schroedinger --disable-sparkle  --disable-telx --disable-vpx --disable-vsxu --disable-wasapi  --disable-srt --with-kde-solid=/usr/share/solid/actions/ --prefix=/usr
  make -j$(nproc)
  make -j$(nproc) DESTDIR=$(pwd)/build/ install
  chmod 755 -R ./vlc-$VERSION/build
  cd build
  cp ../../org.videolan.vlc.desktop ./
  cp ./usr/share/icons/hicolor/256x256/apps/vlc.png ./
  mkdir -p ./usr/plugins/iconengines/
  mkdir -p ./usr/plugins/platforms/
  mkdir -p ./usr/plugins/platformthemes/
  mkdir -p ./usr/plugins/styles/
  cp /usr/lib/x86_64-linux-gnu/qt5/plugins/iconengines/libqsvgicon.so  ./usr/plugins/iconengines/
  cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platforms/libqxcb.so        ./usr/plugins/platforms/
  cp /usr/lib/x86_64-linux-gnu/qt5/plugins/platformthemes/libqgtk2.so  ./usr/plugins/platformthemes/
  cp /usr/lib/x86_64-linux-gnu/qt5/plugins/styles/libqgtk2style.so     ./usr/plugins/styles/
  rm usr/lib/vlc/plugins/plugins.dat
  ./vlc-$VERSION/build/usr/lib/vlc/vlc-cache-gen ./vlc-$VERSION/build/usr/lib/vlc/plugins
)

find ./vlc-$VERSION/build/usr/lib/vlc/ -maxdepth 1 -name "lib*.so*" -exec patchelf --set-rpath '$ORIGIN/../' {} \;
find ./vlc-$VERSION/build/usr/lib/vlc/plugins/ -name "lib*.so*" -exec patchelf --set-rpath '$ORIGIN/../../:$ORIGIN/../../../' {} \;

wget "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x ./linuxdeployqt-continuous-x86_64.AppImage

mkdir -p release
LINUX_DEPLOY_QT_EXCLUDE_COPYRIGHTS=true appimage-wrapper linuxdeployqt-continuous-x86_64.AppImage vlc-$VERSION/build/org.videolan.vlc.desktop  -bundle-non-qt-libs -exclude-libs=libfreetype.so.6
LINUX_DEPLOY_QT_EXCLUDE_COPYRIGHTS=true ARCH=x86_64 appimage-wrapper linuxdeployqt-continuous-x86_64.AppImage  vlc-$VERSION/build/org.videolan.vlc.desktop   -updateinformation="gh-releases-zsync|cmatomic|AppimageDEVtest|continuous|VLC_media_player*.AppImage.zsync" -appimage
mkdir -p release

cp ./VLC_media_player*.zsync release/
cp ./VLC_media_player*.AppImage release/
md5sum ./VLC_media_player*.AppImage > release/VLC_media_player*.AppImage.md5.txt
