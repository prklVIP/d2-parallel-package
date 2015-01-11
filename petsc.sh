unset PETSC_DIR
unset PETSC_ARCH
unset CC
unset CXX
unset F77
unset FC

export EXT=`pwd`/petsc-external
cd petsc
export PETSC_ARCH=uly
export REV=`git branch -v | grep \* | awk '{print $3}'`

./configure \
  --with-make-np=$NP \
  --with-debugging=0 \
  --prefix=$OPT_INST/petsc-$REV \
  --with-mpi-dir=$MPI_HOME \
  --with-shared-libraries \
  --with-external-packages-dir=$EXT \
  --download-parmetis \
  --download-metis \
  --download-hypre \
  --download-mumps \
  --download-scalapack \
  --download-sundials \
  --download-superlu \
  --download-superlu_dist \
  --download-hdf5

make PETSC_DIR=`pwd` PETSC_ARCH=uly all
make PETSC_DIR=`pwd` PETSC_ARCH=uly install
make PETSC_DIR=$OPT_INST/petsc-$REV PETSC_ARCH= test
# make PETSC_DIR=$OPT_INST/petsc-$REV PETSC_ARCH= streams NPMAX=$NP
