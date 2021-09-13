#!/usr/bin/env bash
#

set -e

echo ""

readonly IMAGE="byloth/cloudlog"
readonly VERSION="latest"

echo "  Now building a brand-new image...  "
echo " ----------------------------------- "
echo ""

docker build --tag ${IMAGE}:${VERSION} \
             --pull \
    \
    . # There's a `dot` on this line!
