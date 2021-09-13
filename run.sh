#!/usr/bin/env bash
#

set -e

readonly NAME="cloudlog"
readonly IMAGE="byloth/cloudlog"
readonly VERSION="latest"

docker run --rm -it \
           --name=${NAME} \
    \
    ${IMAGE}:${VERSION} ${@}
