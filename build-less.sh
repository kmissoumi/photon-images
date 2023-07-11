#!/bin/sh

cd /usr/build
tar xvf za.tar
npm install --prefix ${1}
npm run     --prefix ${1} ${2}