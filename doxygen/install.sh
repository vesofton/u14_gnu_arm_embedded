#!/bin/bash -e

# Install Doxygen, including dependencies, and add it to the path.
#
# Name                          | Location
# ----------------------------- | ----------
# graphviz                      | default
# doxygen-1.8.15                | /usr/local
# ------------------------------------------
#
# Author   : Henrico Brom
# Date     : 03-05-2019, 19:58
# Version  : 1.0

doxygen_version=1.8.13

apt-get install -y \
  graphviz

wget -nv https://sourceforge.net/projects/doxygen/files/rel-$doxygen_version/doxygen-$doxygen_version.linux.bin.tar.gz
tar xf doxygen-$doxygen_version.linux.bin.tar.gz
rm doxygen-$doxygen_version.linux.bin.tar.gz
cp -R doxygen-$doxygen_version /usr/local/
rm -r doxygen-$doxygen_version

/usr/local/doxygen-$doxygen_version/bin/doxygen --version
dot -V
