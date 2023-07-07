#!/bin/bash

# run charles/mitmproxy listen on port 8888
sc --config-file etc/config-proxy.yml &

# orchestrate for newman postman collection
BUILD_ID=$(date +"%Y-%m-%d_%H%M%S") saucectl run --config etc/config-newman.yml

# set the runID and pull the console output and uploaded artifacts
# https://docs.saucelabs.com/orchestrate/saucectl-configuration/#saucectl-commands
runID=""
saucectl imagerunner logs ${runID} --region ${SAUCE_REGION} 
saucectl imagerunner artifacts download ${runID} "*" --target-dir artifacts/${runID} --out json --region ${SAUCE_REGION}




# saucectl async for orchestrator
# orchestrator workloads visible in dashboard
#   https://opensource.saucelabs.com/sauce-togo/
#   webhook event stream
# imagerunner custom artifacts collection
#   should also include support for common reporters (junit)
#   and allow other compatible types, network.har, etc
# ipsec tunnel add additional vm tunnel hosts of v2alpha2 type


loop run

while true; BUILD_ID=$(date +"%Y-%m-%d_%H%M%S") saucectl run --config etc/config-newman.yml --verbose &; sleep 2; done


