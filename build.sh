#!/usr/bin/env bash

if [ -z "$(which docker 2>/dev/null)" ]; then
  echo "You need to install Docker"
  exit 0
fi

IMAGE=jalle19/libreelec-xbmc-video-server
VERSION=$(cat xbmc-video-server/version.txt)
XBMC_VIDEO_SERVER_VERSION=https://github.com/Jalle19/xbmc-video-server/archive/1.8.6.zip

# Cleanup previous builds
rm -rf xbmc-video-server/build

# Download and unzip app
mkdir -p xbmc-video-server/build
wget ${XBMC_VIDEO_SERVER_VERSION} -O xbmc-video-server/build/xbmc-video-server.zip
unzip xbmc-video-server/build/xbmc-video-server.zip -d xbmc-video-server/build/

# Build
docker build --rm --no-cache --tag ${IMAGE} xbmc-video-server/
ID=$(docker images -q ${IMAGE} | head -n1)
docker tag ${ID} ${IMAGE}:${VERSION}
