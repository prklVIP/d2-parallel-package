SRC=oce

REV=`cd $SRC; git branch -v | head -n 1 | awk '{print $3}'`

if [ ! -d $SRC/build-$REV ]; then
    mkdir $SRC/build-$REV 
fi

cd $SRC/build-$REV 
DST_INST=$OPT_INST/$SRC-$REV

cmake \
    -GNinja \
    -DOCE_INSTALL_PREFIX=$DST_INST \
    -DOCE_BUILD_SHARED_LIB:BOOL=ON \
    -DOCE_BUILD_TYPE:STRING=Release \
    -DOCE_DATAEXCHANGE:BOOL=ON \
    -DOCE_DISABLE_X11:BOOL=ON \
    -DOCE_DRAW:BOOL=OFF \
    -DOCE_MODEL:BOOL=ON \
    -DOCE_MULTITHREAD_LIBRARY:STRING=NONE \
    -DOCE_OCAF:BOOL=ON \
    -DOCE_OSX_USE_COCOA:BOOL=ON \
    -DOCE_USE_TCL_TEST_FRAMEWORK:BOOL=OFF \
    -DOCE_VISUALISATION:BOOL=OFF \
    -DOCE_WITH_FREEIMAGE:BOOL=OFF \
    -DOCE_WITH_GL2PS:BOOL=OFF \
    -DOCE_WITH_OPENCL:BOOL=OFF \
    ..

ninja -j$NP install
