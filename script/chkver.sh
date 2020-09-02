#!/usr/bin/env bash

## the developer must export their personal github token for semantic-release to
## have access to the repository.
[ -z "$GH_TOKEN" ] && echo "export GH_TOKEN=<personal github token>" && exit 1

TOPDIR=$(git rev-parse --show-toplevel)
BRANCH=$(git branch | grep \* | cut -d ' ' -f2)
NAME=$(python3 $TOPDIR/script/info.py name)

# grabs the current version from setup.py
CURRENT=$(python3 $TOPDIR/script/info.py version | tr -d \")

# does a dry run of semantic-release to anticipate the next version
EXPECTED=$(semantic-release --branch $BRANCH --dry-run \
    | grep '^#\ \|^##\ ' \
    | cut -d' ' -f2)

# if the current and expected versions don't match, fail, otherwise proceed.
if [ $CURRENT != $EXPECTED ]; then
    echo "$CURRENT != $EXPECTED"
    exit 1
else
    echo "$CURRENT == $EXPECTED"
    exit 0
fi
