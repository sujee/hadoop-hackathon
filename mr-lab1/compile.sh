#!/bin/bash

CLASS_DIR=classes2
mkdir -p $CLASS_DIR
rm -rf $CLASS_DIR/*


javac -d $CLASS_DIR  -sourcepath src -classpath lib/*  $(find src -name "*.java")


rm  -f a.jar
jar cf a.jar -C $CLASS_DIR .

rm -rf $CLASS_DIR
