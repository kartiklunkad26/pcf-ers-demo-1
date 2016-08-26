#!/bin/sh

pcf-ers-demo/mvnw -f pcf-ers-demo/pom.xml package -DskipTests || { echo 'error building jar binary' ; exit 1; }
cp pcf-ers-demo/target/*.jar ./output || { echo 'error copying jar to output directory' ; exit 1; }
cp pcf-ers-demo/concourse/scripts/* ./output || { echo 'error copying scripts to output directory' ; exit 1; }
cp pcf-ers-demo/manifest.yml ./output || { echo 'error manifest to output directory' ; exit 1; }
chmod 755 ./output/*