```sh

# Tested on macOS and Windows Linux Subsystem

# set the env
export SAUCE_USERNAME=""            # string, sauce labs username
export SAUCE_ACCESS_KEY=""          # string, sauce labs access key
export SAUCE_REGION=""              # string, "us-west-1" or "eu-central-1"

# check your env
env|grep SAUCE

# run via localhost
npm install --prefix webdriverio/webdriver/best-practices
npm run     --prefix webdriverio/webdriver/best-practices test.saucelabs

# run via localhost and debug
# cd webdriverio/webdriver/best-practices
# npx wdio test/configs/wdio.saucelabs.conf.ts --logLevel debug

# run via docker image
 docker run \
    --platform linux/amd64 --pull always \
    --env SAUCE_USERNAME=${SAUCE_USERNAME} \
    --env SAUCE_ACCESS_KEY=${SAUCE_ACCESS_KEY} \
    --env SAUCE_REGION=${SAUCE_REGION} \
    --env SAUCE_BUILD_TYPE="local-docker" \
    docker.io/suncup/photon-js:0.0.9 \
    npm run --prefix webdriverio/webdriver/best-practices test.saucelabs


# run via hosted orchestration, same docker image, same command, different local
# ACL message could mean your org is not authorized for the beta
saucectl run --config .sauce/config-webdriver-best-practices.yml

```






```
# example override github actions env variable
run: echo "SAUCE_REGION=us-west-1" >> $SAUCE_ENVIRONMENT
```