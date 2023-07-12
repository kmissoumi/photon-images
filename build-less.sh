#!/bin/sh -xv

cd /usr/build
tar xvkf za.tar

if printf '%s\n' "${1}" | grep -Fqe "webdriver"; then
    npm install --prefix ${1}
    npm run     --prefix ${1} ${2}
    exit $?
fi

if printf '%s\n' "${1}" | grep -Fqe "java"; then
    cd ${1}
    ${2}
    exit $?
fi
