#!/bin/bash -e


docker run \
    --platform linux/amd64 --pull always \
    --env SAUCE_USERNAME=${SAUCE_USERNAME} \
    --env SAUCE_ACCESS_KEY=${SAUCE_ACCESS_KEY} \
    --env SAUCE_REGION=${SAUCE_REGION} \
    --env SAUCE_BUILD_TYPE="Docker" \
    docker.io/suncup/photon-js:latest \
    npm run --prefix webdriverio/webdriver/best-practices test.saucelabs.v2

