#!/bin/bash -e

[[ -z ${imageBuild} ]] && imageBuild="0.1.0"

# sysctl -n hw.ncpu
# sw_vers -productVersion
#colima start --arch aarch64 --vm-type vz --vz-rosetta --cpu 8 --memory 16

# image registry
accountName="suncup"
projectName="demo-j2"

imageURI="${accountName}/${projectName}:${imageBuild}"

printf 'building %s\n' ${imageURI}
docker build \
    --file Dockerfile-J2 \
    --platform linux/amd64 \
    --build-arg SAUCE_USERNAME=${SAUCE_USERNAME} \
    --build-arg SAUCE_ACCESS_KEY=${SAUCE_ACCESS_KEY} \
    --build-arg SAUCE_REGION=${SAUCE_REGION} \
    --build-arg BUILD_NAME="photon-$(date +'%Y%m%d-%H%M%s')" \
    --tag ${imageURI} .



image_publish () {
    docker login
    docker push ${imageURI}
}

# skip publish if any arguments are passed
[[ -z ${1} ]] && image_publish


image_inspect () {
    docker run -it \
        --platform linux/amd64 \
        --env SAUCE_USERNAME=${SAUCE_USERNAME} \
        --env SAUCE_ACCESS_KEY=${SAUCE_ACCESS_KEY} \
        --env SAUCE_REGION=${SAUCE_REGION} \
        --env BUILD_NAME=photon-$(date +'%Y%m%d-%H%M%s') \
        $(docker images -q --format='{{.ID}}' | head -1) \
        bash
}

image_reset () {
    docker container prune --force
    docker image prune --all --force
    imageList=$(docker images -aq)
    [[ -z ${imageList} ]] || docker rmi ${imageList}
}




