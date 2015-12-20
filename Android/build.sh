#!/bin/sh

export BUILD_MODULE=PopMovieTexture

echo "========================== Update "${BUILD_MODULE}" Project ==========================="
android update project -t android-19 -p . -s

if [ -z "$ANDROID_NDK" ]; then
  ANDROID_NDK=~/ndk
fi

#We never pass NDK_DEBUG=1 to vrlib as this generates a duplicate gdbserver
#instead the app using vrlib can set it 

if [ "$1" == "" ]; then
    echo "========================== Build "${BUILD_MODULE}" ==========================="
    $ANDROID_NDK/ndk-build -j16 NDK_DEBUG=0
	if [ $? -ne 0 ]; then { echo "ndk-build <> Failed." ; exit 1; } fi
fi

if [ "$1" == "debug" ]; then
    echo "========================== Build "${BUILD_MODULE} $1 " ==========================="
    $ANDROID_NDK/ndk-build -j16 NDK_DEBUG=0
	if [ $? -ne 0 ]; then { echo "ndk-build debug Failed." ; exit 1; } fi
fi

if [ "$1" == "release" ]; then
    echo "========================== Build "${BUILD_MODULE} $1 " ==========================="
    $ANDROID_NDK/ndk-build -j16 NDK_DEBUG=0
	if [ $? -ne 0 ]; then { echo "ndk-build release Failed." ; exit 1; } fi
fi

if [ "$1" == "clean" ]; then
    echo "========================== Build "${BUILD_MODULE} $1 " ==========================="
    $ANDROID_NDK/ndk-build clean NDK_DEBUG=1 
    $ANDROID_NDK/ndk-build clean NDK_DEBUG=0
    ant clean
	if [ $? -ne 0 ]; then { echo "ant clean Failed." ; exit 1; } fi
fi
