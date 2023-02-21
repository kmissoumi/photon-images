FROM node:16-alpine AS builder

RUN apk update && apk add curl bash && rm -rf /var/cache/apk/*

ARG webdriverPath="webdriverio/webdriver/best-practices"
ARG appiumAppPath="webdriverio/appium-app/best-practices"
ARG appiumWebPath="webdriverio/appium-web/best-practices"
ARG basePath="/usr/build"

WORKDIR ${basePath}/${webdriverPath}
COPY ${webdriverPath}/package.json .
RUN npm install

WORKDIR ${basePath}/${appiumAppPath}
COPY ${appiumAppPath}/package.json .
RUN npm install

WORKDIR ${basePath}/${appiumWebPath}
COPY ${appiumWebPath}/package.json .
RUN npm install


# now with less build time
# install steps cached and kept separate from test code

FROM node:16-alpine

RUN apk update && apk add curl bash && rm -rf /var/cache/apk/*

ARG webdriverPath="webdriverio/webdriver/best-practices"
ARG appiumAppPath="webdriverio/appium-app/best-practices"
ARG appiumWebPath="webdriverio/appium-web/best-practices"
ARG basePath="/usr/build"

WORKDIR ${basePath}

COPY ${appiumAppPath} ${basePath}/${appiumAppPath}
COPY ${appiumWebPath} ${basePath}/${appiumWebPath}
COPY ${webdriverPath} ${basePath}/${webdriverPath}

COPY --from=builder ${basePath}/${appiumAppPath}/node_modules ${basePath}/${appiumAppPath}/node_modules
COPY --from=builder ${basePath}/${appiumWebPath}/node_modules ${basePath}/${appiumWebPath}/node_modules
COPY --from=builder ${basePath}/${webdriverPath}/node_modules ${basePath}/${webdriverPath}/node_modules