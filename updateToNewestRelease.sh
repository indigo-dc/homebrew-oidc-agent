#!/bin/bash

token=$(git config --global github.token)

json=$(http https://api.github.com/repos/indigo-dc/oidc-agent/releases/latest "Authorization: Bearer ${token}")
tag=$(echo $json | jq -r '.tag_name')
version=${tag/#v/}

$(dirname $0)/updateToRelease.sh $version
