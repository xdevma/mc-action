echo "Pull artifacts for $1"
cd dist/$1
find . -type f | grep -v "md5\|sha1$" | sed -E s'@./@@' > ../artifacts.list
cat ../artifacts.list | xargs -I {} bash -c "gpg --output {}.asc --sign {}"
find ./
