#!/bin/sh

cf login -a https://api.local2.pcfdev.io --skip-ssl-validation -u admin -p admin
cf zero-downtime-push attendees-citi -f output/manifest.yml