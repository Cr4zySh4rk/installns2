#!/bin/sh
echo "NS2 installation script created by Adithya Manjunath"
sleep 5
sudo apt update
sudo apt-get install -f nam -y
sudo apt-get install -f ns2 -y
dpkg-query -s ns2 > /dev/null 2>&1
case $? in
0)
    echo "ns2 has been installed successfully!";;
1)
    echo "ns2 has not been installed :(";;
2)
    echo "An error occurred";;
esac
