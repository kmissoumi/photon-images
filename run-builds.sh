#!/bin/bash -ex


# TODO
# collect the runId
# saucectl version
# environment variables
# copy the yaml configuration used
# save off all the artifacts
# save API responses

# TODO Other
# docker image update
#   npm install -g npm@9.7.2

SAUCE_REGION="us-west-1"
protoHost="https://api.${SAUCE_REGION}.saucelabs.com"
userKey="${SAUCE_USERNAME}:${SAUCE_ACCESS_KEY}"
timeStamp=$(date +"%Y-%m-%d_%H%M%S_%s")


for i in {1..5}; do saucectl run --config .sauce/config-wdio-webdriver-best-practices.yml & sleep 300; done
for i in {1..5}; do ./run-docker.sh & sleep 300; done
for i in {1..5}; do npm run --prefix demo-webdriverio/webdriver/best-practices test.saucelabs.v2 & sleep 300; done


printf "\ncollecting logs...\n"
for build in $(curl --location "${protoHost}/v2/builds/vdc/" --user "${userKey}" |jq '.builds | sort_by(.start_time) | reverse[:15][] | .id' -cMr);
    do curl --location "${protoHost}/v2/builds/vdc/${build}/jobs/" --user "${userKey}" |jq '.jobs[].id' -cMr | while read jobId;
        do curl --location "${protoHost}/rest/v1/${SAUCE_USERNAME}/jobs/${jobId}" --user "${userKey}" |jq '.id + ";" + .build + ";" + (.passed | tostring) + ";" + .name + ";" + .browser + ";" + .browser_short_version + ";" + (.start_time | tostring) + ";" + (.end_time | tostring) + ";" + ((.end_time | tonumber) - (.start_time | tonumber) |tostring)' -cMr;
    done
done >> results-${timeStamp}.csv
