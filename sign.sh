echo "Signed artifacts"
cat ../artifacts.list | xargs -I {} bash -c "gpg --output {}.asc --sign {}"
find ./