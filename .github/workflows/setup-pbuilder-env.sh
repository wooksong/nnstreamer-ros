#! /usr/bin/env bash
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key cada0f77901522b3
curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | sudo apt-key add -
cp -f .github/workflows/pbuilderrc-bionic.conf $HOME/.pbuilderrc
sudo apt update
sudo apt install pbuilder curl debootstrap devscripts -y
sudo pbuilder create
echo "apt install -y lsb-release debian-keyring ubuntu-keyring curl gnupg2 debhelper cmake" \
	> sudo pbuilder --login --save-after-exec
echo "dh --help" > sudo pbuilder --login --save-after-exec
sudo pdebuild
