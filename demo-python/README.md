# Hosted Test Orchestration Python Examples

This code shows you how to execute tests three different ways:hosted by Sauce Labs, remotely on Sauce Labs and locally.
* Hosted by Sauce Labs
* Remotely on Sauce Labs
* Locally

## Prerequisites

Please see the primary [README](../README.md) for the common prerequisites.

## Kick off tests from Github Actions

Please see the primary [README](../README.md) for the instructions on how to execute these tests on Github Actions.

## Kick off these tests from Local Machine

### Hosted by Sauce Labs
This is the exciting new way to run your tests on Sauce Labs.
The overall execution time should be less (the longer the tests the more performance improvements), but there
is going to be some overhead for the container to get loaded and the tests to start.

#### Build and Deploy Container
1. Login to Docker Hub
   ```shell
   docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
   ```
2. Temporarily define Docker image with tag (important: make sure you do not duplicate an existing tag):
    ```shell
    export DOCKER_IMAGE=$DOCKER_USERNAME/hto-demo-python:0.0.1
    ```
3. Build with tag
    ```shell
    docker build -t $DOCKER_IMAGE ./
    ```
4. Push to Docker Hub
    ```shell
    docker push $DOCKER_IMAGE
    ```

#### Run Saucectl
1. [Download saucectl](https://docs.saucelabs.com/dev/cli/saucectl/#installing-saucectl)
2. Execute (saucectl looks at details in `~/.sauce/config.yml` to know what to do):
    ```shell
    saucectl run
    ```

### Locally
This skips Sauce Labs all together and runs your tests on your local machine without parallel:

```shell
pytest --selenium local
```

### Remotely on Sauce Labs
This is the traditional way of running tests on Sauce Labs.

This repo uses pytest and pytest-xdist for running tests in parallel. Specify the amount of parallel execution with `-n`.
This will run all 15 tests in parallel:

```shell
pytest -n 15
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/saucelabs-training/hto.

## License

The code is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
