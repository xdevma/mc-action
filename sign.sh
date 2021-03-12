echo "Signed artifacts"
cd ~
cat dist/artifacts.list | xargs -I {} bash -c "gpg --output {}.asc --sign {}"
find ./