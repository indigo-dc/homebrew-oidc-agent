#!/bin/bash

set -e

token=$(git config --global github.token)
export token

version=$1
tag="v${version}"
formula=$2

git checkout -b "${version}"

tar_url=$(echo "https://github.com/indigo-dc/oidc-agent/archive/refs/tags/VTAG.tar.gz" | sed \"s/VTAG/"${tag}"/g\")
wget "${tar_url}" -O /tmp/prerel.tar.gz -q
sha256_output=$(sha256sum /tmp/prerel.tar.gz)
sha256=$(printf "%s" "${sha256_output}" | awk '{print $1}')

sed -i "s!^[[:space:]]*url\ \".*\"!  url\ \"${tar_url}\"!g" "${formula}"
sed -i "s/sha256\ \".*\"/sha256\ \"${sha256}\"/g" "${formula}"

echo "Updated url to: ${tar_url}"
echo "Updated sha256 to: ${sha256}"

git add "${formula}"
git commit -m \""${version}"\"

