```sh

# Tested on macOS and Linux Subsystem for Windows

# set the env
export SAUCE_USERNAME=""            # string, sauce labs username
export SAUCE_ACCESS_KEY=""          # string, sauce labs access key
export SAUCE_REGION=""              # string, "us-west-1" or "eu-central-1"

# check your env
env|grep SAUCE

# run via localhost
npm install --prefix webdriverio/webdriver/best-practices
npm run     --prefix webdriverio/webdriver/best-practices test.saucelabs.v2

# run via localhost debug
# cd webdriverio/webdriver/best-practices && npm install
# npx wdio test/configs/wdio.saucelabs.v2.conf.ts --logLevel debug

# run via docker image
docker run \
    --platform linux/amd64 --pull always \
    --env SAUCE_USERNAME=${SAUCE_USERNAME} \
    --env SAUCE_ACCESS_KEY=${SAUCE_ACCESS_KEY} \
    --env SAUCE_REGION=${SAUCE_REGION} \
    --env SAUCE_BUILD_TYPE="Docker" \
    docker.io/suncup/photon-js:latest \
    npm run --prefix webdriverio/webdriver/best-practices test.saucelabs.v2


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