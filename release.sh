#!/usr/bin/env bash
set -oe pipefail

echo "release artifacts $3"
echo "<promoteRequest>" > promote.xml
echo "<data>" >> promote.xml
echo "<stagedRepositoryId>$3</stagedRepositoryId>" >> promote.xml
echo "<description>Release</description>" >> promote.xml
echo "<targetRepositoryId>releases</targetRepositoryId>" >> promote.xml
echo "</data>" >> promote.xml
echo "</promoteRequest>" >> promote.xml
cat promote.xml
curl --fail -v -X POST -d @promote.xml -H "Content-Type:application/xml" -H "Authorization:Basic $1" -H "Content-Type:application/xml" https://oss.sonatype.org/service/local/staging/profiles/$2/promote
