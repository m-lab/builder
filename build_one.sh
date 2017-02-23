#!/bin/bash

export RPMBUILD=$PWD/build/slicebase-$(uname -i)
export TMPBUILD=$PWD/build/tmp
REPO=${1:?Usage: ./build_one.sh repo tag slice-name}
TAG=${2:?Usage: ./build_one.sh repo tag slice-name}
NAME=${3:?Usage: ./build_one.sh repo tag slice-name}

set -x
set -e

# NOTE: remove old slice dir, if present 
test -d $NAME && rm -rf $NAME

# NOTE: checkout repo
git clone --recursive $REPO $NAME

# NOTE: set slice-specific source & build dirs
export SOURCE_DIR=$PWD/$NAME
export BUILD_DIR=/home/$NAME

pushd $SOURCE_DIR
    # NOTE: checkout the specific slicetag
    git checkout --quiet $TAG

    # NOTE: perform build & pass 'export'd vars through environment
    ./package/slicebuild.sh $NAME
popd

