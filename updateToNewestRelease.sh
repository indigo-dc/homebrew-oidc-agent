#!/bin/bash

json=$(http https://api.github.com/repos/indigo-dc/oidc-agent/releases/latest)
tag=$(echo $json | jq -r '.tag_name')
version=${tag/#v/}

$(dirname $0)/updateToRelease.sh $version
