#!/bin/bash
javac HelloNativeTest.java
javah HelloNative
g++ -c -fPIC -I$JAVA_HOME/include -I$JAVA_HOME/include/darwin HelloNative.cpp
g++ -shared -o libHelloNative.so HelloNative.o
mv libHelloNative.so libHelloNative.jnilib
