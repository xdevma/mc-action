echo "release artifacts $3"
echo "<promoteRequest>" > promote.xml
echo "<data>" >> promote.xml
echo "<stagedRepositoryId>$3</stagedRepositoryId>" >> promote.xml
echo "<description>Release</description>" >> promote.xml
echo "<targetRepositoryId>maven2</targetRepositoryId>" >> promote.xml
echo "</data>" >> promote.xml
echo "</promoteRequest>" >> promote.xml

curl --fail -X POST -d @promote.xml -H "Content-Type:application/xml" -H "Authorization:Basic $1" -H "Content-Type:application/xml" https://oss.sonatype.org/service/local/staging/profiles/$2/promote
