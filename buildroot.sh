#!/bin/zsh

unset SOURCE_DATE_EPOCH

ORIG_DIR="$(pwd)"

TARGET_DIR="$(pwd)/output/build/buildroot-fs/cpio/target"
cd $TARGET_DIR

VERSION=$(date +%Y.%m.%d)
BUILDID=$(date "+%g%mL%d_H%H%M")
CODENAME=Lavender

rm usr/lib/os-release
cat > usr/lib/os-release <<- EOM
NAME="Eclipse Linux"
PRETTY_NAME="Eclipse $(date +%Y.%m.%d)"
VERSION=$VERSION
VERSION_ID=$(date +%Y.%m)
ID=eclipse
BUILD_ID=$BUILDID
VERSION_CODENAME=$CODENAME
EOM

foreach DIR in $(ls $ORIG_DIR/image) 
do
	cp $ORIG_DIR/image/$DIR . -R
done
