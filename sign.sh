#!/usr/bin/env bash

set -oe pipefail

echo "Signed artifacts"
cd .m2/
cat ../artifacts.list | xargs -I {} bash -c "gpg --output {}.asc --sign {}"
find .