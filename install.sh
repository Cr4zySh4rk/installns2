echo "NS2 installation script by Adithya Manjunath"
sleep 3
echo "Installing gcc-4.8 and g++-4.8"
sleep 1
sudo apt remove --purge nam ns2 -y
sudo apt install build-essential autoconf automake libxmu-dev -y
echo "deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu/ bionic main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
echo "deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu/ bionic-updates main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
echo "deb [arch=amd64,i386] http://us.archive.ubuntu.com/ubuntu/ bionic-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
echo "deb [arch=amd64,i386] http://security.ubuntu.com/ubuntu bionic-security main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
echo "deb [arch=arm64,armhf,ppc64el,s390x] http://ports.ubuntu.com/ubuntu-ports/ bionic main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
echo "deb [arch=arm64,armhf,ppc64el,s390x] http://ports.ubuntu.com/ubuntu-ports/ bionic-updates main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
echo "deb [arch=arm64,armhf,ppc64el,s390x] http://ports.ubuntu.com/ubuntu-ports/ bionic-backports main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
echo "deb [arch=arm64,armhf,ppc64el,s390x] http://ports.ubuntu.com/ubuntu-ports/ bionic-security main restricted universe multiverse" | sudo tee -a /etc/apt/sources.list > /dev/null
sudo apt update
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
sudo apt update
sudo apt-get install gcc-4.8 g++-4.8 -y
tar -xzvf ns-allinone-2.35.tar.gz -C ~/
echo "Patching installation files"
sleep 1
sed -i '46s|@CC@|gcc-4.8|g' ~/ns-allinone-2.35/nam-1.15/Makefile.in
sed -i '47s|@CXX@|g++-4.8|g' ~/ns-allinone-2.35/nam-1.15/Makefile.in
sed -i '36s|@CC@|gcc-4.8|g' ~/ns-allinone-2.35/ns-2.35/Makefile.in
sed -i '37s|@CXX@|g++-4.8|g' ~/ns-allinone-2.35/ns-2.35/Makefile.in
sed -i '137s|erase(baseMap::begin()|this->erase(baseMap::begin()|g' ~/ns-allinone-2.35/ns-2.35/linkstate/ls.h
sed -i '7s|@CC@|gcc-4.8|g' ~/ns-allinone-2.35/otcl-1.14/Makefile.in
sed -i '120s|@CC@|gcc-4.8|g' ~/ns-allinone-2.35/xgraph-12.2/Makefile.in
sed -i '123s|@CPP@|g++-4.8|g' ~/ns-allinone-2.35/xgraph-12.2/Makefile.in
echo "Installing NS2 and NAM"
sleep 1
cd ~/ns-allinone-2.35
bash install
ARCH=$(dpkg-architecture -q DEB_BUILD_ARCH)
if [ "$ARCH"="arm64" ]; then
  sed -i 's|./configure|./configure --build=aarch64-unknown-linux-gnu|g' ~/ns-allinone-2.35/install
elif [ "$ARCH"="amd64" ]; then
  sed -i 's|./configure|./configure --build=x86_64-unknown-linux-gnu|g' ~/ns-allinone-2.35/install
else
  sed -i 's|./configure|./configure --build=i386-unknown-linux-gnu|g' ~/ns-allinone-2.35/install
fi
cd ~/ns-allinone-2.35
bash install
sudo cp ~/.bashrc ~/.bashrc.old
NS=$(cd;pwd)
echo "Adding path to .bashrc"
sleep 1
sudo sed -i '4s|.*|export PATH=$PATH:|g' ~/.bashrc
sudo sed -i "4s|:|:$NS/ns-allinone-2.35/bin:$NS/ns-allinone-2.35/tcl8.5.10/unix:$NS/ns-allinone-2.35/tk8.5.10/unix|g" ~/.bashrc
sudo sed -i "10s|.*|export LD_LIBRARY_PATH=$NS/ns-allinone-2.35/otcl-1.14:$NS/ns-allinone-2.35/lib|g" ~/.bashrc
sudo sed -i "14s|.*|export TCL_LIBRARY=$NS/ns-allinone-2.35/tcl8.5.10/library|g" ~/.bashrc
echo "Run source ~/.bashrc"
echo "Test installation by typing in nam, if you get a console window, then everything installed properly!"
