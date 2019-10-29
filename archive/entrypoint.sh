#!/bin/sh

# Exit if any command fails
set -eu

# Create zip archive
echo "\n📦 Creating zip archive\n"

echo ${PWD##*/}

ls

zip -r "${PWD##*/}.zip" . -x@.build_exclude || { echo "\⛔️ Unable to create zip archive.\n"; exit 1;  }

echo "\n✔️ Successfully created release \n"