#!/bin/bash

token=$(git config --global github.token)

tag="v$1"
version=${tag:1}
json=$(http https://api.github.com/repos/indigo-dc/oidc-agent/releases/tags/$tag "Authorization: Bearer ${token}")
tar_url=$(echo $json | jq -r '.tarball_url')
sha256=$(curl -L $tar_url 2>/dev/null| sha256sum | awk '{print $1}')

sed -i "s!url\ \".*\"!url\ \"${tar_url}\"!g" oidc-agent.rb
sed -i "s/version\ \".*\"/version\ \"${version}\"/g" oidc-agent.rb
sed -i "s/sha256\ \".*\"/sha256\ \"${sha256}\"/g" oidc-agent.rb

echo "Updated version to: ${version}"
echo "Updated url to: ${tar_url}"
echo "Updated sha256 to: ${sha256}"
