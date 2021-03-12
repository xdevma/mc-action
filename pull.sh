echo "Pull artifacts for $1"
cd dist/$1
find . -type f | grep -v "md5\|sha1$" | sed -E s'@./@@' > ../artifacts.list