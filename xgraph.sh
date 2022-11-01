#!/bin/bash
echo "XGraph installation"
sleep 3
ARCH=$(dpkg-architecture -q DEB_BUILD_ARCH)
if [ "$ARCH"="amd64" ]; then
  tar -xzvf xgraph_4.38_linux64.tar.gz -C ~/
  sudo mv ~/XGraph4.38_linux64 ~/XGraph
  echo "alias xgraph=$HOME/XGraph/bin/xgraph" | sudo tee -a ~/.bashrc > /dev/null
elif [ "$ARCH"="i386" ]; then
  tar -xzvf xgraph_4.38_linux32.tar.gz -C ~/
  sudo mv ~/XGraph4.38_linux32 ~/XGraph
  echo "alias xgraph=$HOME/XGraph/bin/xgraph" | sudo tee -a ~/.bashrc > /dev/null
else
  echo "Error: unkown architecture"
fi