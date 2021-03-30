#!/usr/bin/env bash

set -oe pipefail

echo "Pull artifacts"
echo $GITHUB_EVENT_PATH 
jq .release.assets $GITHUB_EVENT_PATH

asset_id=$(jq ".release.assets | map(select(.name == \"maven-archive.tar.gz\"))[0].id" $GITHUB_EVENT_PATH)
if [ "$asset_id" = "null" ]; then
    asset_id=$(jq ".release.assets | .id" $GITHUB_EVENT_PATH)
    if [ "$asset_id" = "null" ]; then
        echo "no asset."
        exit 1
    fi;
fi;

ASSET_LINK="https://api.github.com/repos/${GITHUB_REPOSITORY}/releases/assets/${asset_id}"

curl -L -H  "Authorization: token $2" -H "Accept:application/octet-stream" -o "mavem-archive.tar.gz" ${ASSET_LINK}

mkdir .m2/
cd .m2/

tar xvf ../mavem-archive.tar.gz
find . -type f -name '._*' -delete # remove macos attribute artifacts, TODO remove when moving to packaging on linux 
find . -type f | grep -v "md5\|sha1$" | sed -E s'@./@@' > ../artifacts.list