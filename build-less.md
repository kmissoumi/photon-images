```sh

# clone me
git https://github.com/kmissoumi/photon-images.git && cd photon-images

# bundle the test as saucectl skips directories
tar --exclude='node_modules' -zcvf za.tar demo-webdriverio

# run your tests via orchestrate, no build, image, registry needed
saucectl run --config .sauce/config-wdio-webdriver-build-less.yml
```
