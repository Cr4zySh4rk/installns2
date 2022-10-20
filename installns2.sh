#!/bin/sh
echo "NS2 installation script created by Adithya Manjunath"
sleep 5
sudo apt update
sudo apt-get install -f nam -y
sudo apt-get install -f ns2 -y
STATUS=$(dpkg-query -s ns2|grep -o "install ok installed")
if [ "$STATUS" = "install ok installed" ]; then
  echo "NS2 has been installed successfully!"
else
  echo "Error: Could not install NS2, check system logs for more info."
fi
