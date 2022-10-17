#!/bin/sh
echo "NS2 installation script created by Adithya Manjunath"
sleep 5
sudo apt-get install -f nam -y
sudo apt-get install -f ns2 -y
REQUIRED_PKG="ns2"
PKG_OK=$(dpkg-query -W --showformat='${Status}\n' $REQUIRED_PKG|grep 
"install o>
if [""= "$PKG_OK"];then
  echo "Could not install NS2, check logs for more info."
else
  echo "NS2 has been installed successfully!"
fi

