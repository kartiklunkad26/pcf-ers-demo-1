#!/bin/sh

cf login -a https://api.local2.pcfdev.io --skip-ssl-validation -u admin -p admin -o pcfdev-org -s pcfdev-space

cf push attendees-citi-a -f output/manifest.yml -p output/pcf-ers-demo-a.jar
cf map-route attendees-citi-a local2.pcfdev.io --hostname attendees-citi-ab
cf push attendees-citi-b -f output/manifest.yml -p output/pcf-ers-demo-b.jar
cf map-route attendees-citi-b local2.pcfdev.io --hostname attendees-citi-ab