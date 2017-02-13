# MLAB slice building tools

## Docker based build environment
Docker file for creating mlab builder images.

### Building
To build the docker image and tag it as m-lab/builder

    docker build -t m-lab/builder .
OR
    docker build github.com/m-lab/builder

### Running the build environment interactively
    docker run -it m-lab/builder

### Compiling NDT slice in 'batch' mode
The builder includes scripts in the root directory for building and testing NDT.
If you need the build artifacts after the build is complete, use -v to mount a
volume on the host for either or both /root/ndt or /home/iupui_ndt.

    docker run -v `pwd`/ndt:/root/ndt m-lab/builder /root/ndt_build_and_test.sh

##builder.sh

Simple build script and tag list for creating slice packages.

The slice-tags.list contains a list of triples: 

    tag_name git_repository_url slice_name

build.sh reads slice-tags.list and builds the package of each entry.

To build all packages, run:

    ./build.sh all

To build a single package, specifiy the name of the slice:

    ./build.sh iupui_ndt

