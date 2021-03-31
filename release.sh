#!/usr/bin/env bash
set -oe pipefail

echo "release artifacts $3"
curl --fail -v -H "Authorization:Basic $1" -X POST 'https://oss.sonatype.org/service/local/staging/bulk/promote' -H 'Accept: application/json,application/vnd.siesta-error-v1+json,application/vnd.siesta-validation-errors-v1+json' -H 'Content-Type: application/json' --data-raw '{"data":{"autoDropAfterRelease":true,"description":"Release","stagedRepositoryIds":["'"${3}"'"]}}'
#curl --fail -v -H "Authorization:Basic $1" -X POST'https://oss.sonatype.org/service/local/staging/bulk/promote' -H 'Accept: application/json,application/vnd.siesta-error-v1+json,application/vnd.siesta-validation-errors-v1+json' -H 'Content-Type: application/json' --data '{"data":{"autoDropAfterRelease":true,"description":"Release","stagedRepositoryIds":["macy-1026"]}}' 
#curl --fail -v  -H "Content-Type: application/json" -X POST --data '{"data":{"autoDropAfterRelease":true,"description":"Release","stagedRepositoryIds":["$3"]}}'  https://oss.sonatype.org/service/local/staging/bulk/promote

#echo "<promoteRequest>" > promote.xml
##echo "<data>" >> promote.xml
#echo "<stagedRepositoryId>content/repositories/$3</stagedRepositoryId>" >> promote.xml
#echo "<description>Release</description>" >> promote.xml
#echo "<targetRepositoryId>service/local/staging/deploy/maven2</targetRepositoryId>" >> promote.xml
#echo "</data>" >> promote.xml
#echo "</promoteRequest>" >> promote.xml

#cat promote.xml
#curl --fail -v -X POST -d @promote.xml -H "Content-Type:application/xml" -H "Authorization:Basic $1" -H "Content-Type:application/xml" https://oss.sonatype.org/service/local/staging/profiles/$2/promote
