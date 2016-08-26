#!/bin/sh

echo "building jar binary"
./mvnw -f pom.xml package -DskipTests

echo "copying jar binary to output directory"
cp ./target/*.jar ../output

echo "copying concourse scripts to output directory"
cp ./concourse/scripts/* ../output

echo "copying cf manifest file to output directory"
cp ./manifest.yml ../output