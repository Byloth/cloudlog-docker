$NAME = "cloudlog"
$IMAGE = "byloth/cloudlog"
$VERSION = "latest"

docker run --rm -it `
           --name=${NAME} `
    `
    ${IMAGE}:${VERSION} ${args}
