```sh

# Tested on macOS and Linux Subsystem for Windows


# set the env
export SAUCE_USERNAME=""            # string, sauce labs username
export SAUCE_ACCESS_KEY=""          # string, sauce labs access key
export SAUCE_REGION=""              # string, "us-west-1" or "eu-central-1"

which sc saucectl jq curl && printf '\nBin check completed OK!\n' || printf '\nBin check NOTOK! Stop, install, and re-run.\n'

# check your env
env|grep SAUCE

# run via localhost
npm install --prefix demo-webdriverio/webdriver/best-practices
npm run     --prefix demo-webdriverio/webdriver/best-practices test.saucelabs.v2

# run via localhost debug
# cd demo-webdriverio/webdriver/best-practices && npm install
# npx wdio test/configs/wdio.saucelabs.v2.conf.ts --logLevel debug
# npm run --prefix demo-webdriverio/webdriver/best-practices test.saucelabs.v2 -- --logLevel "debug"

# run via docker image
docker run \
    --platform linux/amd64 --pull always \
    --env SAUCE_USERNAME=${SAUCE_USERNAME} \
    --env SAUCE_ACCESS_KEY=${SAUCE_ACCESS_KEY} \
    --env SAUCE_REGION=${SAUCE_REGION} \
    --env SAUCE_BUILD_TYPE="Docker" \
    docker.io/suncup/photon-js:latest \
    npm run --prefix demo-webdriverio/webdriver/best-practices test.saucelabs.v2


# run via hosted orchestration
# same docker image, same command, different execution location
#
# ACL error message could mean your org is not authorized to beta programme
#
saucectl run --config .sauce/config-wdio-webdriver-best-practices.yml
```






```
# example override github actions env variable
run: echo "SAUCE_REGION=us-west-1" >> $SAUCE_ENVIRONMENT
```

[looker-usage-report]: https://saucelabs.looker.com/looks/4708
[photon-with-sauce-connect]: https://gitlab.tools.saucelabs.net/the/docs/-/blob/main/docs/Proposals/Sauce%20Connect%20Support.md