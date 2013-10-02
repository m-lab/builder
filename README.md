builder
=======

Simple build script and tag list for creating slice packages.

The slice-tags.list contains a list of triples: 

    (tag name, git repository url, slice name)

build.sh reads slice-tags.list and builds the package of each entry.

To build all packages, run:

    ./build.sh all

To build a single package, specifiy the name of the slice:

    ./build.sh iupui_ndt
