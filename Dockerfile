FROM node:16-alpine AS builder

RUN apk update && apk add curl bash && rm -rf /var/cache/apk/*

WORKDIR /usr/build

WORKDIR /usr/build/webdriverio/webdriver/best-practices
COPY webdriverio/webdriver/best-practices/package.json .
RUN npm install

WORKDIR /usr/build/webdriverio/appium-app/best-practices
COPY webdriverio/appium-app/best-practices/package.json .
RUN npm install

WORKDIR /usr/build/webdriverio/appium-web/best-practices
COPY webdriverio/appium-web/best-practices/package.json .
RUN npm install



FROM node:16-alpine

RUN apk update && apk add curl bash && rm -rf /var/cache/apk/*

WORKDIR /usr/build

COPY /webdriverio/appium-app/best-practices /usr/build/appium-app/best-practices
COPY /webdriverio/appium-web/best-practices /usr/build/appium-web/best-practices
COPY /webdriverio/webdriver/best-practices  /usr/build/webdriver/best-practices

COPY --from=builder /usr/build/webdriverio/appium-app/best-practices/node_modules /usr/build/appium-app/best-practices/node_modules
COPY --from=builder /usr/build/webdriverio/appium-web/best-practices/node_modules /usr/build/appium-web/best-practices/node_modules
COPY --from=builder /usr/build/webdriverio/webdriver/best-practices/node_modules  /usr/build/webdriver/best-practices/node_modules
