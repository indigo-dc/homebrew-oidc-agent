#!/bin/bash

json=$(http https://api.github.com/repos/indigo-dc/oidc-agent/releases/latest)
tag=$(echo $json | jq -r '.tag_name')
tar_url=$(echo $json | jq -r '.tarball_url')
tag=$(echo $json | jq -r '.tag_name')
version=${tag:1}
sha256=$(curl $tar_url 2>/dev/null| sha256sum)

sed -i "s!url\ \".*\"!url\ \"${tar_url}\"!g" oidc-agent.rb
sed -i "s/version\ \".*\"/version\ \"${version}\"/g" oidc-agent.rb
sed -i "s/sha256\ \".*\"/sha256\ \"${sha256}\"/g" oidc-agent.rb

echo "Updated version to: ${version}"
echo "Updated url to: ${tar_url}"
echo "Updated sha256 to: ${sha256}"
