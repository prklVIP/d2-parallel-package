SRC=trilinos

REV=`cd $SRC; git show-ref --hash --abbrev HEAD`

if [ ! -d $SRC/build-$REV ]; then
    mkdir $SRC/build-$REV 
fi

cd $SRC/build-$REV 
DST_INST=$OPT_INST/$SRC-$REV

cmake \
-D CMAKE_BUILD_TYPE:STRING=RELEASE \
-D TrilinosFramework_ENABLE_MPI:BOOL=ON \
-D TPL_ENABLE_MPI:BOOL=ON \
-D TPL_ENABLE_Netcdf:BOOL=OFF \
-D CMAKE_INSTALL_PREFIX:PATH=$DST_INST \
-D BLAS_LIBRARY_DIRS:FILEPATH="${MKLROOT}/lib/intel64" \
-D BLAS_LIBRARY_NAMES:STRING="mkl_rt" \
-D LAPACK_LIBRARY_DIRS:FILEPATH="${MKLROOT}/lib/intel64" \
-D LAPACK_LIBRARY_NAMES:STRING="mkl_rt" \
-D TPL_ENABLE_MKL:BOOL=ON \
-D MKL_LIBRARY_DIRS:FILEPATH="${MKLROOT}/lib/intel64" \
-D MKL_LIBRARY_NAMES:STRING="mkl_rt" \
-D MKL_INCLUDE_DIRS:FILEPATH="${MKLROOT}/include" \
-D Trilinos_ENABLE_OpenMP:BOOL=OFF \
-D BUILD_SHARED_LIBS:BOOL=ON \
-D Trilinos_ENABLE_Fortran:BOOL=ON \
-D Trilinos_WARNINGS_AS_ERRORS_FLAGS:STRING="" \
-D CMAKE_VERBOSE_MAKEFILE:BOOL=FALSE \
-D Trilinos_ASSERT_MISSING_PACKAGES:BOOL=OFF \
-D Trilinos_ENABLE_TESTS:BOOL=OFF \
-D Trilinos_ENABLE_ALL_PACKAGES:BOOL=OFF \
-D Trilinos_ENABLE_ALL_OPTIONAL_PACKAGES:BOOL=ON \
-D Trilinos_ENABLE_Epetra:BOOL=ON \
-D Trilinos_ENABLE_EpetraExt:BOOL=ON \
-D Trilinos_ENABLE_Tpetra:BOOL=ON \
-D Trilinos_ENABLE_Jpetra:BOOL=ON \
-D Trilinos_ENABLE_Kokkos:BOOL=ON \
-D Trilinos_ENABLE_Sacado:BOOL=ON \
-D Trilinos_ENABLE_Amesos:BOOL=ON \
-D Trilinos_ENABLE_AztecOO:BOOL=ON \
-D Trilinos_ENABLE_Ifpack:BOOL=ON \
-D Trilinos_ENABLE_Teuchos:BOOL=ON \
-D Trilinos_ENABLE_Rythmos:BOOL=ON \
-D Trilinos_ENABLE_Piro:BOOL=ON \
-D Trilinos_ENABLE_MOOCHO:BOOL=ON \
-D Trilinos_ENABLE_ML:BOOL=ON \
-D Trilinos_ENABLE_MueLu:BOOL=ON \
-D Trilinos_ENABLE_Komplex:BOOL=ON \
-D Trilinos_ENABLE_Thyra:BOOL=ON \
-D Trilinos_ENABLE_TrilinosCouplings:BOOL=ON \
..

make -j40 install
