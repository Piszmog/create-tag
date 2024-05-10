#!/bin/sh

version=$(jq -r .version package.json)

git pull
git checkout v"$version"
git tag -d v1
git push origin :refs/tags/v1
git tag v1
git push origin v1
git checkout main
