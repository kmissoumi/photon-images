#!/bin/bash -e

saucectl run --config .sauce/config-wdio-webdriver-best-practices.yml & \
npm run --prefix demo-webdriverio/webdriver/best-practices test.saucelabs.v2 & \

docker run \
    --platform linux/amd64 --pull always \
    --env SAUCE_USERNAME=${SAUCE_USERNAME} \
    --env SAUCE_ACCESS_KEY=${SAUCE_ACCESS_KEY} \
    --env SAUCE_REGION=${SAUCE_REGION} \
    --env SAUCE_BUILD_TYPE="Docker" \
    docker.io/suncup/photon-js:latest \
    npm run --prefix demo-webdriverio/webdriver/best-practices test.saucelabs.v2 & \
    sleep 300 \
    



exit


 npx wdio test/configs/wdio.saucelabs.v2.conf.ts --logLevel debug

npm run --prefix demo-webdriverio/appium-app/best-practices test.saucelabs.android.emu & \
npm run --prefix demo-webdriverio/appium-app/best-practices test.saucelabs.android.rdc & \
npm run --prefix demo-webdriverio/appium-app/best-practices test.saucelabs.ios.sim & \
npm run --prefix demo-webdriverio/appium-app/best-practices test.saucelabs.ios.rdc &

saucectl run --config .sauce/config-wdio-appium-app-best-practices.yml


cd demo-webdriverio/appium-app/best-practices &&  npx wdio test/configs/wdio.android.sauce.emu.conf.ts --logLevel debug
"test.saucelabs.android.rdc": "RDC=true npx wdio test/configs/wdio.android.sauce.rdc.conf.ts",
"test.saucelabs.ios.sim": "npx wdio test/configs/wdio.ios.sauce.sim.conf.ts",
"test.saucelabs.ios.rdc": "RDC=true npx wdio test/configs/wdio.ios.sauce.rdc.conf.ts"





### yaml processing

https://martinheinz.dev/blog/51
https://blog.lazy-evaluation.net/posts/linux/jq-xq-yq.html



