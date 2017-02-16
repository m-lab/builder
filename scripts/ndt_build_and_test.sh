#!/bin/bash
set -x
set -e

# Use a clean directory, so that we can mount it from docker run and
# have access to the finished product, when required.
mkdir ~/ndt; cd ~/ndt; cp ~/builder/slice-tags.list .
DISABLE_APPLET_SIGNING=1 ~/builder/build.sh iupui_ndt

# Run basic unit tests that don't require web100.
LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
./iupui_ndt/ndt-3.7.0.1/src/web100_testoptions_unit_tests

LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
./iupui_ndt/ndt-3.7.0.1/src/web100_websocket_unit_tests

# This test doesn't currently work on travis because it requires
# web100 patched kernel.  When we no longer have disabled tests, we
# should just use "make check" to run all the tests.
# LD_LIBRARY_PATH=/home/iupui_ndt/build/lib NDT_HOSTNAME=localhost \
# ~/builder/iupui_ndt/ndt-3.7.0.1/src/web100srv_unit_tests
