echo "Signed artifacts"
cd dist/$1
cat ./artifacts.list | xargs -I {} bash -c "gpg --output {}.asc --sign {}"
find ./