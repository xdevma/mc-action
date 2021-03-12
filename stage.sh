echo "stage artifacts"
cd dist/$1
cp ../../start.xml start.xml
curl --fail -X POST -d @start.xml -H "Content-Type:application/xml" -H "Authorization:Basic $1" https://oss.sonatype.org/service/loca
rm start.xml
find . -type f | sed -E s'@./@@' > ../artifacts.list
staging_dir=$(echo $(awk -F '[<>]' '/stagedRepositoryId/{print $3}' ../finish.xml))
cat ../artifacts.list | xargs -I {} curl --fail  -H "Authorization:Basic $1" --upload-file {} https://oss.sonatype.org/service/local/staging/deployByRepositoryId/${staging_dir}/{}
cp ../finish.xml finish.xml
curl --fail -X POST -d @finish.xml -H "Content-Type:application/xml" -H "Authorization:Basic $1" -H "Content-Type:application/xml" https://oss.sonatype.org/service/local/staging/profiles/${2}/finish
echo https://oss.sonatype.org/content/repositories/${staging_dir}