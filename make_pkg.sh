#!/bin/bash

PKG_NAME=fmk
PKG_DIR=fmk

#macosx - gnutar, linux - tar
TAR=gnutar

mkdir package
rm package/$PK_NAME.gz
cd ..; $TAR cvfz $PKG_DIR/package/$PKG_NAME.gz --exclude="*/.gitignore" --exclude="*/package" --exclude="*.gz" --exclude="*/.git" $PKG_DIR
cd $PKG_DIR
echo "----- dobili smo: ------"
ls package/$PKG_NAME.gz
