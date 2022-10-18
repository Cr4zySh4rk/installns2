#!/bin/sh
echo "NS2 installation script created by Adithya Manjunath"
sleep 5
sudo apt-get install -f wget -y
sudo apt-get install -f nam -y
wget https://github.com/weirdadithya/installns2/blob/main/ns-src-2.35.tar.gz
cd ns-allinone-2.35
sudo apt-get install build-essential autoconf automake libxmu-dev
sudo apt-get install -f build-essential libxt-dev libxt6 libsm-dev libsm6 
libice-dev libice6 libxmu-dev
sudo ./install
cd ..
sudo rm -rf ns-allinone-2.35*
dpkg-query -s ns2 > /dev/null 2>&1
case $? in
0)
    echo "ns2 has been installed successfully!";;
1)
    echo "ns2 has not been installed :(";;
2)
    echo "An error occurred";;
esac
