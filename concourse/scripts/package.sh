#!/bin/sh

echo "building jar binary"
source-code/mvnw -f pom.xml package -DskipTests

echo "copying jar binary to output directory"
cp source-code/target/*.jar ./output

echo "copying concourse scripts to output directory"
cp source-code/concourse/scripts/* ./output

echo "copying cf manifest file to output directory"
cp source-code/manifest.yml ./output