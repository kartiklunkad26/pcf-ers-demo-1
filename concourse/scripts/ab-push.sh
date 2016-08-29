#!/bin/sh

cf login -a https://api.local2.pcfdev.io --skip-ssl-validation -u admin -p admin -o pcfdev-org -s pcfdev-space

cf push attendees-a -f manifest.yml -p pcf-ers-demo-a.jar
cf map-route attendees-a local2.pcfdev.io --hostname attendees-ab

cf push attendees-b -f manifest.yml -p pcf-ers-demo-b.jar
cf map-route attendees-b local2.pcfdev.io --hostname attendees-ab