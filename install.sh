echo "NS2 installation script by Adithya Manjunath"
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
sudo apt-key export C0B21F32 | sudo gpg --dearmour -o /usr/share/keyrings/pgdg.gpg
sudo apt update
sudo apt-get install gcc-4.8 g++-4.8 -y
tar -xvzf ns-allinone-2.35.tar.gz
sudo cp -r ns-allinone-2.35 ~/ns-allinone-2.35
sudo cp -r install ~/ns-allinone-2.35/install
sed -i '36s/.*/CC	= gcc-4.8/' ~/ns-allinone-2.35/ns-2.35/Makefile.in
sed -i '37s/.*/CPP       = g++-4.8/' ~/ns-allinone-2.35/ns-2.35/Makefile.in
sed -i '7s/.*/CC	= gcc-4.8/' ~/ns-allinone-2.35/otcl-1.14/Makefile.in
sed -i '46s/.*/CC	= gcc-4.8/' ~/ns-allinone-2.35/nam-1.15/Makefile.in
sed -i '47s/.*/CPP       = g++-4.8/' ~/ns-allinone-2.35/nam-1.15/Makefile.in
sed -i '120s/.*/CC = gcc-4.8/' ~/ns-allinone-2.35/xgraph-12.2/Makefile.in
sed -i '123s/.*/CPP = g++-4.8/' ~/ns-allinone-2.35/xgraph-12.2/Makefile.in
sed -i '137s/.*/	void eraseAll() { this->erase(baseMap::begin(), baseMap::end()); }/' ~/ns-allinone-2.35/ns-2.35/linkstate/ls.h
sudo ~/ns-allinone-2.35/install
sed -i '4s/.*/export PATH=$PATH:~/ns-allinone-2.35/bin:~/ns-allinone-2.35/tcl8.5.10/unix:~/ns-allinone-2.35/tk8.5.10/unix/' ~/.bashrc
sed -i '7s/.*/export LD_LIBRARY_PATH=~/ns-allinone-2.35/otcl-1.14:~/ns-allinone-2.35/lib/' ~/.bashrc
source ~/.bashrc
echo "Test installation by typing in nam, if you get a console window, then everything installed properly!"
