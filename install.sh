#!/bin/bash -e

echo "================================ Clean apt-get ================================="
apt-get clean
mv /var/lib/apt/lists /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "=============================== Cleaned apt-get ================================"

echo "=============================== Installing gcc 6 ==============================="
add-apt-repository ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install gcc-6 g++-6
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-6 50 --slave /usr/bin/g++ g++ /usr/bin/g++-6
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-6 50
gcc --version
echo "========================= Successfully Installed gcc 6 ========================="

echo "=============================== Installing gcovr ==============================="
pip install gcovr
gcovr --version
echo "========================= Successfully installed gcovr ========================="

echo "========================= Installing GNU ARM Embedded =========================="
. /u14_gnu_arm_embedded/gnu_arm_embedded/install.sh
echo "=================== Successfully Installed GNU ARM Embedded ===================="

echo "============================== Installing Doxygen =============================="
. /u14_gnu_arm_embedded/doxygen/install.sh
echo "======================== Successfully Installed Doxygen ========================"
