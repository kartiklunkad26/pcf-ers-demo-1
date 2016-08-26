#!/bin/sh

echo "building jar binary"
pcf-ers-demo/mvnw -f source-code/pom.xml package -DskipTests

echo "copying jar binary to output directory"
cp pcf-ers-demo/target/*.jar ./output

echo "copying concourse scripts to output directory"
cp pcf-ers-demo/concourse/scripts/* ./output

echo "copying cf manifest file to output directory"
cp pcf-ers-demo/manifest.yml ./output

echo "set script permissions"
chmod 755 ./output/*