``` yml
name: build

on:
  push:
    branches:
    - release/*

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v1

    # Install composer dependencies and create optimized autoloader file
    - name: GitHub Action for Composer
      uses: pxgamer/composer-action@v2.1.0
      with:
          command: install --optimize-autoloader --prefer-dist --no-dev

    # Create release archive from the source files
    - name: Archive
        uses: webkinder/github-actions/archive@v1.0.0        
```