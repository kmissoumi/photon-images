# WebdriverIO Async Mode and TypeScript with Best Practices, including the use of Page Objects
This folder contains best practices for WebdriverIO in Async Mode with TypeScript, including the use of Page Objects.

## Install dependencies
You can install all dependencies by running the following command

    npm install

This will install all needed dependencies that are listed in the `package.json` file.

> NOTE: Make sure you are in the folder `webdriverio/webdriver/best-practices` when you execute this command

## Run tests locally
You can run the tests on your local machine, the only thing you need to have is Chrome. If you have it you can run this command

    npm run test.local

## Run tests on Sauce Labs
You can run your tests on Sauce Labs

    npm run test.saucelabs

It will spin up multiple browsers which you can find [here](test/configs/wdio.saucelabs.conf.ts).

> **Note:** It could be that a spec file fails, due to a webdriver error or something else. This setup uses a single
> retry for every test. If a test fails the first time on Sauce Labs but succeeds the seconds time the suite is marked
> as passed in WebdriverIO, but because the initial test failed in Sauce Labs, the total build is marked as failed.\
> To prevent a build from failing in Sauce Labs when all tests, also after a retry, succeed, a special `after`-hook has
> been created to update the failing tests. Please take a look at the
> [`wdio.saucelabs.conf.js`](./test/configs/wdio.saucelabs.conf.ts) file for more information.


