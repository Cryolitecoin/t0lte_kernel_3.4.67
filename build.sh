#!/bin/bash

export ARCH=arm && export SUBARCH=arm
export CROSS_COMPILE=$(pwd)/arm-linux-androideabi-8.x/bin/arm-linux-androideabi-

make clean
make mrproper
rm -rf output
mkdir output

make -C $(pwd) O=output lineageos_t0lte_defconfig 
  TIMESTAMP=$(date +%s)

  make -j2$(grep -c ^processor /proc/cpuinfo) -C$(pwd) O=output

  TIMESTAMP2=$(date +%s)

echo "compile time:" $(($TIMESTAMP2 - $TIMESTAMP)) "seconds"
mv output/arch/arm/boot/zImage /home/siz/zImage
rm -rf output
