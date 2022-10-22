echo "NS2 installation script by Adithya Manjunath"
sleep 5
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
sudo gpg -a --export 3B4FE6ACC0B21F32 | sudo apt-key add -
sudo apt-key export C0B21F32 | sudo gpg --dearmour -o /usr/share/keyrings/pgdg.gpg -y
sudo apt update
sudo apt-get install gcc-4.8 g++-4.8 -y
tar -xvzf ns-allinone-2.35.tar.gz
sudo cp -r ns-allinone-2.35 ~/ns-allinone-2.35
sudo sed -i 's/@CC@/gcc-4.8/g' ~/ns-allinone-2.35/ns-2.35/Makefile.in
sudo sed -i 's/@CPP@/g++-4.8/g' ~/ns-allinone-2.35/ns-2.35/Makefile.in
sudo sed -i 's/@CC@/gcc-4.8/g' ~/ns-allinone-2.35/otcl-1.14/Makefile.in
sudo sed -i 's/@CC@/gcc-4.8/g' ~/ns-allinone-2.35/nam-1.15/Makefile.in
sudo sed -i 's/@CPP@/g++-4.8/g' ~/ns-allinone-2.35/nam-1.15/Makefile.in
sudo sed -i 's/@CC@/gcc-4.8/g' ~/ns-allinone-2.35/xgraph-12.2/Makefile.in
sudo sed -i 's/@CPP@/g++-4.8/g' ~/ns-allinone-2.35/xgraph-12.2/Makefile.in
sudo sed -i 's/void eraseAll() { erase(baseMap::begin(), baseMap::end());/	void eraseAll() { this->erase(baseMap::begin(), baseMap::end()); }/g' ~/ns-allinone-2.35/ns-2.35/linkstate/ls.h
ARCH=$(dpkg-architecture -q DEB_BUILD_ARCH)
if [ "$ARCH"="arm64" ]; then
  sudo sed -i 's/./configure/./configure --build=aarch64-unknown-linux-gnu/g' ~/ns-allinone-2.35/install
fi
if [ "$ARCH"="amd64" ]; then
  sudo sed -i 's/./configure/./configure --build=x86_64-unknown-linux-gnu/g' ~/ns-allinone-2.35/install
fi
if [ "$ARCH"="i386" ]; then
  sudo sed -i 's/./configure/./configure --build=i386-unknown-linux-gnu' ~/ns-allinone-2.35/install
fi
sudo ~/ns-allinone-2.35/install
sudo sed -i '4s/.*/export PATH=$PATH:~/ns-allinone-2.35/bin:~/ns-allinone-2.35/tcl8.5.10/unix:~/ns-allinone-2.35/tk8.5.10/unix/' ~/.bashrc
sudo sed -i '7s/.*/export LD_LIBRARY_PATH=~/ns-allinone-2.35/otcl-1.14:~/ns-allinone-2.35/lib/' ~/.bashrc
sudo source ~/.bashrc
echo "Test installation by typing in nam, if you get a console window, then everything installed properly!"
