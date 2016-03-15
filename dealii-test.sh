SRC=dealii

REV=`cd $SRC; git show-ref --hash --abbrev HEAD`

if [ ! -d $SRC/build-$REV ]; then
    mkdir $SRC/build-$REV
fi

cd $SRC/build-test-$REV
DST_INST=$OPT_INST/$SRC-$REV

cmake \
-GNinja \
-DCMAKE_INSTALL_PREFIX:PATH=$DST_INST \
..

ctest -j$NP -V -S ../tests/run_testsuite.cmake 
