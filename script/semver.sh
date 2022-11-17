#!/usr/bin/env bash

## Prepare repository for a versioned release.

## Release version passed from arguments.
VERSION=$1

# Name and Git branch of the current project.
PROJECT=$(git rev-parse --show-toplevel)
LIBRARY=$(basename $PROJECT)

## Bump the __version__ of the python package.
sed -i "/^__version__\ =/s/=.*/=\ \"$VERSION\"/" $PROJECT/$LIBRARY/__init__.py
