#!/bin/sh

# Exit if any command fails
set -eu

# Create zip archive
echo "📦 Creating zip archive"

echo $1

zip -r $1 . -x@.build_exclude || { echo "⛔️ Unable to create zip archive."; exit 1;  }

echo "✔️ Successfully created release"

echo ::set-output name=file::$1