```sh
# set environment variables
export SAUCE_USERNAME=""
export SAUCE_ACCESS_KEY=""
export SAUCE_REGION="us-west-1"

# clone me
git clone https://github.com/kmissoumi/photon-images.git && cd photon-images

# bundle the tests
tar --exclude='node_modules' -zcvf za.tar demo-*

# run your tests via orchestrate — no build, no image, no registry
saucectl run --config .sauce/config-build-less.yml
```
