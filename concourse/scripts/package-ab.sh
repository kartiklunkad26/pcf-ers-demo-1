#!/bin/sh

cp pcf-ers-demo-a/concourse/scripts/* ./output || { echo 'error copying scripts to output directory' ; exit 1; }
cp pcf-ers-demo-a/manifest.yml ./output || { echo 'error manifest to output directory' ; exit 1; }

pcf-ers-demo-a/mvnw -f pcf-ers-demo-a/pom.xml package -DskipTests || { echo 'error building jar binary' ; exit 1; }
cp pcf-ers-demo-a/target/pcf-ers-demo.jar ./output/pcf-ers-demo-a.jar || { echo 'error copying jar to output directory' ; exit 1; }

pcf-ers-demo-b/mvnw -f pcf-ers-demo-b/pom.xml package -DskipTests || { echo 'error building jar binary' ; exit 1; }
cp pcf-ers-demo-a/target/pcf-ers-demo.jar ./output/pcf-ers-demo-b.jar || { echo 'error copying jar to output directory' ; exit 1; }

chmod 755 ./output/*