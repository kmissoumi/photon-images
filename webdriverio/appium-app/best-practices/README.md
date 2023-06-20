# WebdriverIO Native App Best Practices

This folder contains best practices for WebdriverIO Native App testing:

- for Android Emulators/Real Devices and iOS Simulators/Real Devices
- Fully W3C compliant
- in Async Mode
- with TypeScript
- including the use of Page Objects.

It:

- provides a rich set of helpers for Gestures, deep linking and element interactions
- provides some best practices for handling the keyboard and scroll to elements
- and many more

## Install dependencies

You can install all dependencies by running the following command

    npm install

This will install all needed dependencies that are listed in the `package.json`-file

> NOTE: Make sure you are in the folder `webdriverio/appium-app/best-practices` when you execute this command

## Download / Upload Apps

You can download the used apps from [here](https://github.com/saucelabs/my-demo-app-rn/releases/). Make sure you rename the apps to:

- Android Emulators / Real Devices: `Android-MyDemoAppRN.*.*.*.build-***.apk` => `MyDemoAppRN.apk`
- iOS Real Devices: `iOS-Real-Device-MyRNDemoApp.*.*.*-*.ipa` => `MyRNDemoApp.ipa`
- iOS Simulators: `iOS-Simulator-MyRNDemoApp.*.*.*-*.zip` => `MyRNDemoApp.zip`

And manually upload them to the preferred Data Center, see [this](https://docs.saucelabs.com/mobile-apps/live-testing/live-mobile-app-testing/#uploading-an-app) for the instructions.

## Run tests on Sauce Labs

You can run your tests on Sauce Labs US DC with this command

    # Run Android Real Devices Tests
    npm run test.saucelabs.android.rdc.us
    # Run iOS Real Devices Tests
    npm run test.saucelabs.ios.rdc.us
    # Run Android Emulator Tests
    npm run test.saucelabs.android.emu.us
    # Run iOS Simulators Tests
    npm run test.saucelabs.ios.sim.us

You can run your tests on Sauce Labs EU DC with this command

    # Run Android Real Devices Tests
    npm run test.saucelabs.android.rdc.eu
    # Run iOS Real Devices Tests
    npm run test.saucelabs.ios.rdc.eu
    # Run Android Emulator Tests
    npm run test.saucelabs.android.emu.eu
    # Run iOS Simulators Tests
    npm run test.saucelabs.ios.sim.eu

It will spin up multiple real devices / Android Emulators / iOS simulators which you can find here:

- [Android Real Devices](test/configs/wdio.android.sauce.rdc.conf.ts)
- [iOS Real Devices](test/configs/wdio.ios.sauce.rdc.conf.ts)
- [Android Emulators](test/configs/wdio.android.sauce.emu.conf.ts)
- [iOS Simulators](test/configs/wdio.ios.sauce.sim.conf.ts)

<details>
    <summary>Click to expand and see logs from running this on Sauce Labs for Android Real Devices</summary>

