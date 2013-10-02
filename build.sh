#!/bin/bash


export RPMBUILD=$PWD/build/slicebase-$(uname -i)
export TMPBUILD=$PWD/build/tmp
SLICE=${1:?Error: please provide name of slice to build, or 'all'}

set -x
set -e

# NOTE: for each non-comment line
grep -v "^#" slice-tags.list | \
while read slicetag repo slicename ; do 

    if test x"$SLICE" != x"all" && test x"$SLICE" != x"$slicename" ; then
        continue
    fi

    # NOTE: remove old slice dir, if present 
    test -d $slicename && rm -rf $slicename

    # NOTE: checkout repo
    git clone --recursive $repo $slicename

    # NOTE: set slice-specific source & build dirs
    export SOURCE_DIR=$PWD/$slicename
    export BUILD_DIR=/home/$slicename

    pushd $SOURCE_DIR
        # NOTE: checkout the specific slicetag
        git checkout --quiet $slicetag

        # NOTE: perform build & pass 'export'd vars through environment
        ./package/slicebuild.sh $slicename
    popd
done

