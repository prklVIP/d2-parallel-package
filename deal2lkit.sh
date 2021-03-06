SRC=deal2lkit

REV=`cd $SRC; git show-ref --hash --abbrev HEAD`

if [ ! -d $SRC/build ]; then
    mkdir $SRC/build
fi

cd $SRC/build
DST_INST=$OPT_INST/$SRC-dev

cmake \
-DCMAKE_INSTALL_PREFIX:PATH=$DST_INST \
..

make -j$NP install
# ctest -j40 -V -S ../tests/run_testsuite.cmake 
