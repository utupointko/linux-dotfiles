#!/bin/bash

# remove http:// etc
SUBSTRING=$(cut -d. -f2- <<<"$1")
# remove last slash if present
if [ "${SUBSTRING: -1}" = "/" ]; then
  SUBSTRING="${SUBSTRING%?}"
fi
# count subdirectories
NCUT=$(grep -o "/" <<<"$SUBSTRING" | wc -l)

wget -m -r -nH --cut-dirs="${NCUT-1}" -np -R index.html* -e robots=off "$1"
