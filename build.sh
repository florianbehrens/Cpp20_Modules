#!/bin/bash
set -e

export CC=/opt/gcc-snapshot/bin/gcc
export CXX=/opt/gcc-snapshot/bin/g++
export LD_LIBRARY_PATH=/opt/gcc-snapshot/lib64
${CXX} --version

PACKAGES="git binutils make ninja-build libssl-dev"
apt-get update -y
apt-get install -y ${PACKAGES}

# Download and build CMake
BUILDDIR=/tmp/CMake-build
mkdir ${BUILDDIR}
pushd ${BUILDDIR}
git clone --depth 1 https://github.com/Kitware/CMake.git .
./bootstrap || cat /CMake/Bootstrap.cmk/cmake_bootstrap.log
make -j$(nproc)
make install
popd
rm -rf ${BUILDDIR}

apt-get remove -y ${PACKAGES}
apt-get autoremove -y
apt-get clean -y
