#!/bin/bash
SYSROOT=$WP76XX_SYSROOT
CROSSDIR='/opt/swi/y22-ext-wp76xx/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux'
CC=$CROSSDIR/arm-poky-linux-gcc
CXX=$CROSSDIR/arm-poky-linux-g++

echo Compile...
$CXX --sysroot=$SYSROOT -I/usr/lib/jvm/java-8-openjdk-amd64/include -I/usr/lib/jvm/java-8-openjdk-amd64/include/linux -fPIC -c HelloNative.cpp

echo Link...
$CXX --sysroot=$SYSROOT -shared -o libHelloNative.so HelloNative.o
