<p align="center">
<a href="https://github.com/webkinder/github-actions"><img src="https://img.shields.io/github/license/webkinder/github-actions.svg" alt="Licence"></a>
<a href="https://github.com/webkinder/github-actions"><img src="https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square" alt="PRs"></a>
</p>


<center>
<a href="https://webkinder.ch">
<img src="https://raw.githubusercontent.com/webkinder/github-actions/master/webkinder-banner.png" alt="WebKinder" />
</a>
</center>

## Archive Action
Use this action to create a output zip of your plugin or theme.
You can add a .build_exclude file to your plugin or theme

## Example Usage

### Workflow
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
      id: archive
      uses: webkinder/github-actions/archive@v1.0.0
    
    - name: copy file via ssh password
      uses: appleboy/scp-action@master
      with:
         host: ${{ secrets.HOST }}
         username: ${{ secrets.USERNAME }}
         password: ${{ secrets.PASSWORD }}
         port: ${{ secrets.PORT }}
         source: ${{ steps.archive.outputs.upload_url }}
         target: "test"
       
```