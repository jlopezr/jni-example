#!/bin/bash
ARCH=`ssh root@192.168.2.2 << EOF
cm info|grep Device|cut -c 24-27
EOF`
echo $ARCH
case $ARCH in
	WP75)
	SYSROOT=$WP750X_SYSROOT
	;;
	WP76)
	SYSROOT=$WP76XX_SYSROOT
	;;
	WP77) 
	SYSROOT=$WP76XX_SYSROOT
	;;
	WP85) 
	SYSROOT=$WP85_SYSROOT
	;;
	*)
	echo "No crosscompiler found for arch $ARCH"
	exit
	;;
esac
SYSROOT=$WP76XX_SYSROOT
CROSSDIR=$SYSROOT/../x86_64-pokysdk-linux/usr/bin/arm-poky-linux
CC=$CROSSDIR/arm-poky-linux-gcc
CXX=$CROSSDIR/arm-poky-linux-g++

echo Compile...
$CXX --sysroot=$SYSROOT -I/usr/lib/jvm/java-8-openjdk-amd64/include -I/usr/lib/jvm/java-8-openjdk-amd64/include/linux -fPIC -c HelloNative.cpp

echo Link...
$CXX --sysroot=$SYSROOT -shared -o libHelloNative.so HelloNative.o
