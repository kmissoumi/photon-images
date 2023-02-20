FROM node:16-alpine AS builder


# requirements
RUN apk update && apk add curl bash && rm -rf /var/cache/apk/*

# install node-prune (https://github.com/tj/node-prune)
#RUN curl -sfL https://install.goreleaser.com/github.com/tj/node-prune.sh | bash -s -- -b /usr/local/bin

WORKDIR /usr/build
#ENV NPM_CONFIG_PREFIX=/home/node/.npm-global

# optionally if you want to run npm global bin without specifying path
#ENV PATH=$PATH:/home/node/.npm-global/bin

#USER node

WORKDIR /usr/build/webdriverio/webdriver/best-practices
COPY webdriverio/webdriver/best-practices/package.json .
RUN npm install

WORKDIR /usr/build/webdriverio/appium-app/best-practices
COPY webdriverio/appium-app/best-practices/package.json .
RUN npm install

#WORKDIR /usr/build/webdriverio/appium-web/best-practices
#COPY webdriverio/appium-web/best-practices/package.json .
#RUN npm install



FROM node:16-alpine

# requirements
RUN apk update && apk add curl bash && rm -rf /var/cache/apk/*

WORKDIR /usr/build

#COPY /webdriverio/appium-app/best-practices /usr/build/appium-app/best-practices
#COPY /webdriverio/appium-web/best-practices /usr/build/appium-web/best-practices
COPY /webdriverio/webdriver/best-practices  /usr/build/webdriver/best-practices

#COPY --from=builder /usr/build/webdriverio/appium-app/best-practices/node_modules /usr/build/appium-app/best-practices/node_modules
#COPY --from=builder /usr/build/webdriverio/appium-web/best-practices/node_modules /usr/build/appium-web/best-practices/node_modules
COPY --from=builder /usr/build/webdriverio/webdriver/best-practices/node_modules  /usr/build/webdriver/best-practices/node_modules

# remove development dependencies
#RUN npm prune --production

# run node prune
# RUN /usr/local/bin/node-prune

#ARG SAUCE_USERNAME
#ARG SAUCE_ACCESS_KEY
#ARG SAUCE_REGION
#ARG BUILD_NAME

#WORKDIR /demo-js/webdriverio/webdriver/examples/w3c
#RUN npm run test.saucelabs.eu