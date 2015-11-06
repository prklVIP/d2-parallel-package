SRC=dealii

REV=`cd $SRC; git branch -v | grep \* | awk '{print $3}'`

if [ ! -d $SRC/build-pack ]; then
    mkdir $SRC/build-pack
fi

cd $SRC/build-pack
DST_INST=${OPT_INST/opt/}

cmake \
-GNinja \
-DDEAL_II_CPACK_EXTERNAL_LIBS_TREE:PATH=$OPT_INST \
-DCMAKE_INSTALL_PREFIX:PATH=$DST_INST \
-DDEAL_II_COMPONENT_PACKAGE:BOOL=ON \
..

ninja -j$NP package
# ninja -j$NP setup_tests
# ctest -j$NP -V -S ../tests/run_testsuite.cmake 