# MLAB slice building tools

## Docker based build environment
Docker file for creating mlab builder images.

### Building
To build the docker image and tag it as m-lab/builder

    docker build -t m-lab/builder .

### Running the build environment

    docker run m-lab/builder


##builder.sh

Simple build script and tag list for creating slice packages.

The slice-tags.list contains a list of triples: 

    tag_name git_repository_url slice_name

build.sh reads slice-tags.list and builds the package of each entry.

To build all packages, run:

    ./build.sh all

To build a single package, specifiy the name of the slice:

    ./build.sh iupui_ndt

