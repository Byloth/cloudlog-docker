$IMAGE = "byloth/cloudlog"
$VERSION = "latest"

docker build --tag ${IMAGE}:${VERSION} `
             --pull `
    `
    . # There's a `dot` on this line!
