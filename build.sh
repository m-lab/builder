#!/bin/bash

SLICE=${1:?Error: please provide name of slice to build, or 'all'}

set -x
set -e

# NOTE: for each non-comment line
grep -v "^#" slice-tags.list | \
while read slicetag repo slicename ; do
    if test x"$SLICE" != x"all" && test x"$SLICE" != x"$slicename" ; then
        continue
    fi

    # TODO - better way to locate build_one.sh
    ~/builder/build_one.sh $repo $slicetag $slicename
done

