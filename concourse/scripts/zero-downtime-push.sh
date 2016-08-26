#!/bin/sh

cf login -a https://api.local2.pcfdev.io --skip-ssl-validation -u admin -p admin -o pcfdev-org -s pcfdev-space
cf zero-downtime-push attendees-citi -f output/manifest.yml -p output/pcf-ers-demo.jar